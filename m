Return-Path: <linuxppc-dev+bounces-12664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35596BB8A2A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 04 Oct 2025 08:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdx4Y18MPz2yDr;
	Sat,  4 Oct 2025 16:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759560636;
	cv=none; b=fRWrd66TpcavEMLJ5nXOHXkFP4vX6fHF+2yb23SjXMVTm15rbFHXjn7DEx+Uh1VLLhh0/Mn4YJPtrlxzkfBulTV2H7fkOOMIS+abvzbgdRiy1pikrg4cg/0vRF4/Yhs7tfgUMtS3Ng2PffVFeCCR2RuXSyeT9JLiWzXpauYtbfCYya8+rCLD4pymf8cmpAJgqb2+5ouHB5SCzrGY2mjGP6k90jeO54PX+la1o7tjZLtw+z78ZQ29j0yZ7vXbP+fvWr4iNFkvhlSOvzNdGw/Up9TWZGGfrChiDXGMPm/84Jk4/w1RUiYg2Ba5FM7o5D92fja/PqylgSYU5M0vEP0xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759560636; c=relaxed/relaxed;
	bh=1tnF933Jx1hmrl8lVELR7y7lzB8FWfbUnCESX8w1k8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gT70ivFmcnYMzu0yPs80MHxHSb5AfhUzNryYK4QzrVF6cvpStm6tS3RsRm3GZaJTRFHeajS580rwsZT5E2KrpiNl+DfBGjwRfgCTf1XiR6mszIxqSt2uATdIIDyUbp3Ay8u9lKQvTRBX9EOxPtgJETJh4WuFV3Fbpd5xOyDezRCe2saBx7g846MHSrDUOf9DHNElTYrVSOyJyCwxMAYd4jnMe7cATKLZv01aofHNyutflr7xFqKpi89L5vCvcF8nbe37Nax0UIdjW6TGT2zvrmZ9SO5RW35fzEk3hOBmINwTZa3K5A392SZI1xegQauhhS/qT3xz2mfQJA7UNhtmEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdx4X0PMCz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 16:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cdwNt1QHbz9sS7;
	Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_idirMR5ok8; Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cdwNt0Pvmz9sRy;
	Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E8E218B768;
	Sat,  4 Oct 2025 08:19:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FGXi2r7cLeL7; Sat,  4 Oct 2025 08:19:41 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A40F08B766;
	Sat,  4 Oct 2025 08:19:40 +0200 (CEST)
Message-ID: <909c5ab3-b3d3-4b5b-bc64-8b30c220ac92@csgroup.eu>
Date: Sat, 4 Oct 2025 08:19:40 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] powerpc: Convert to physical address DMA mapping
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leonro@nvidia.com>, Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Geoff Levand <geoff@infradead.org>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 Magnus Lindholm <linmag7@gmail.com>
References: <cover.1759071169.git.leon@kernel.org>
 <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
 <20251003163505.GI3360665@nvidia.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251003163505.GI3360665@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 03/10/2025 à 18:35, Jason Gunthorpe a écrit :
> On Sun, Sep 28, 2025 at 06:02:24PM +0300, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> Adapt PowerPC DMA to use physical addresses in order to prepare code
>> to removal .map_page and .unmap_page.
>>
>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> ---
>>   arch/powerpc/include/asm/iommu.h         |  8 +++---
>>   arch/powerpc/kernel/dma-iommu.c          | 22 +++++++---------
>>   arch/powerpc/kernel/iommu.c              | 14 +++++-----
>>   arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++----------
>>   arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++-----
>>   arch/powerpc/platforms/pseries/vio.c     | 21 ++++++++-------
>>   6 files changed, 60 insertions(+), 53 deletions(-)
> 
> I think this is good enough for PPC anything more looks quite hard

Can you tell what you have in mind ? What more would be interesting to 
do but looks hard ? Maybe it can be a follow-up change ?

Christophe

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason
> 


