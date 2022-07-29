Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36346584B95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 08:18:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvHPk0Dx6z300x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 16:18:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Tysz5VUr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvHP518Xlz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 16:17:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Tysz5VUr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvHP4295wz4x1K;
	Fri, 29 Jul 2022 16:17:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659075448;
	bh=zS+sIh8PqcW0UswVx6yqbrQBCsUpeSOZtzbxo8FtaV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tysz5VUryZJTUNqljuqSrqxx0DbPzp22hwvCdDgv5742BYqiW6qnp0QYf/PtbKpDR
	 Yzm3UWncW50NPFWOzMPlPmjk8kyh2kLHdZf5B/Av1U8v14IIpw/TQFxn6LeItkqgAl
	 ZlwS8GebrPFv+Rdz0ZssKy5P5WaYdrqEAClonpVU23bbac7X5Q1r9FJiXTykcd/6Do
	 6bBqo/co3ODI6kCFWDfyFTLEKHFzsHm97/KlKqU19rmxtlICgRsS1uc7CwDe0fhPbW
	 RNZiUB6SxGfisUYwgvVkgHUSOZ92s3cAGg2IrkNUD4jS6BA3RBd0MasJkNeGkuthMO
	 0oqkUc7h/RR8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.ibm.com>, linux-cxl@vger.kernel.org, Dan
 Williams <dan.j.williams@intel.com>
Subject: Re: [linux-next] Build failure drivers/cxl/cxl_pmem (powerpc)
In-Reply-To: <7FF6D18F-2F85-4FFC-96B8-D1B1E8D8D622@linux.ibm.com>
References: <7FF6D18F-2F85-4FFC-96B8-D1B1E8D8D622@linux.ibm.com>
Date: Fri, 29 Jul 2022 16:17:27 +1000
Message-ID: <87sfmkbfyg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:
> Linux-next (5.19.0-rc8-next-20220728) fails to build on powerpc with
> following error:
>
> ERROR: modpost: "memory_add_physaddr_to_nid" [drivers/cxl/cxl_pmem.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:128: modules-only.symvers] Error 1
>
> The code in question was last changed by following patch:
>
> commit 04ad63f086d1
>        cxl/region: Introduce cxl_pmem_region objects

This should fix it.

Dan, do you want to apply that on top of your tree to reduce the window
of breakage?

cheers


From 8ca5b098b6ff1048953be748dbffc987996e2605 Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 29 Jul 2022 16:13:55 +1000
Subject: [PATCH] powerpc/mm: Export memory_add_physaddr_to_nid() for modules

The cxl_pmem module wants to call memory_add_physaddr_to_nid(), so
export the symbol.

Fixes: 04ad63f086d1 ("cxl/region: Introduce cxl_pmem_region objects")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 7b0d286bf9ba..01772e79fd93 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -55,6 +55,7 @@ int memory_add_physaddr_to_nid(u64 start)
 {
 	return hot_add_scn_to_nid(start);
 }
+EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
 #endif
 
 int __weak create_section_mapping(unsigned long start, unsigned long end,
-- 
2.35.3

