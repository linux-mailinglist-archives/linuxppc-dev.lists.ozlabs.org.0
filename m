Return-Path: <linuxppc-dev+bounces-322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7895AEAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:16:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwq0Fgzz2ysf;
	Thu, 22 Aug 2024 17:14:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwn3rtVz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:48 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 52DA0227AAA; Thu, 22 Aug 2024 09:14:44 +0200 (CEST)
Date: Thu, 22 Aug 2024 09:14:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Stan Johnson <userm57@yahoo.com>,
	Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Message-ID: <20240822071443.GA6395@lst.de>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com> <20240822053238.GA2028@lst.de> <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Aug 22, 2024 at 06:39:33AM +0000, LEROY Christophe wrote:
> powerpc has a magic instruction 'dcbz' which clears a full cacheline in 
> one go. It is far more efficient than a loop to store zeros, and since 
> 2015 memset(0) has been implemented with that instruction (commit 
> 5b2a32e80634 ("powerpc/32: memset(0): use cacheable_memzero"))
> 
> But that instruction generates an alignment exception when used on 
> non-cached memory (whether it is RAM or not doesn't matter). It is then 
> emulated by the kernel but it of course leads to a serious performance 
> degradation, hence the warning added by commit cbe654c77961 ("powerpc: 
> warn on emulation of dcbz instruction in kernel mode"). Until now it 
> helped identify and fix use of memset() on IO memory.
> 
> But if memset() is expected to be used with non-cached RAM, then I don't 
> know what to do. Any suggestion ?

I'd suggest two things:

 1) remove the warning.  The use case is perfectly valid and everything
    using uncached memory is already slow, so people will just have to
    deal with it.  Maybe offer a trace point instead if people care about
    it.
 2) figure out a way to avoid this case in the dma-coherent allocator,
    which is probably the only case where it happens frequently
    (a few drivers also zero or re-zero coherent memory, but most of the
     time that is cargo cult programming and not actually needed)

For 2 I can think of two options:

 a) provide a arch hook for zeroing the dma memory that defaults to
    memset, but which powerpc can override
 a) figure out a way to clear the memory before marking it uncached
    if we can

a) it obviously easier to verify, but b) is probably going to give
   way better performance.

Below is an untested implementation of b) for dma-direct, I just need to
find out if there is any architecture that requires the memory to be
zeroed after it іt has been remapped.  The iommu drivers might also
need similar treatment.

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4480a3cd92e087..66e94b32ab0081 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -275,6 +275,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		if (force_dma_unencrypted(dev))
 			prot = pgprot_decrypted(prot);
 
+		if (!PageHighMem(page))
+			memset(page_address(page), 0, size);
+
 		/* remove any dirty cache lines on the kernel alias */
 		arch_dma_prep_coherent(page, size);
 
@@ -283,14 +286,15 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 				__builtin_return_address(0));
 		if (!ret)
 			goto out_free_pages;
+		if (PageHighMem(page))
+			memset(ret, 0, size);
 	} else {
 		ret = page_address(page);
 		if (dma_set_decrypted(dev, ret, size))
 			goto out_leak_pages;
+		memset(ret, 0, size);
 	}
 
-	memset(ret, 0, size);
-
 	if (set_uncached) {
 		arch_dma_prep_coherent(page, size);
 		ret = arch_dma_set_uncached(ret, size);

