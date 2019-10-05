Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9175DCCCAB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 22:28:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lyxy6xXWzDqWm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2019 07:28:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sholland.org
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=samuel@sholland.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sholland.org header.i=@sholland.org header.b="0lEs3tZb";
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Nefmyww7"; dkim-atps=neutral
X-Greylist: delayed 584 seconds by postgrey-1.36 at bilbo;
 Sun, 06 Oct 2019 07:25:54 AEDT
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lytV4ns0zDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Oct 2019 07:25:54 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 18E6037A;
 Sat,  5 Oct 2019 16:16:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 05 Oct 2019 16:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=a
 dd4qr8s7Rzs2iFplupf8G+pO7WNXGfrTbiJhl4yk10=; b=0lEs3tZbzEFCNgbaU
 W/CLK+6Ge4MerlWV74eydXxewXq8zt4S1QkFaEcjb1L/2QC/zirYcofJSUVcd48E
 miyI4unFq7rS9+H0DVet1Uhia9yPFMVs6N6YvRuyJvdNap1+pbl+zEHA9QwHjX6D
 EGPsT1wtOUmsLpzbIF2ctXpA1NO6+2xZ3H2bFkwLnFlfMhVp19lgpDGAzN+r1N5N
 mB1ItikqDcWgL7DHKd44MhNF4yY2t1uF0zZLw7mKXBZwYSd1f8W88070M7t6IIIl
 AqK/9/Qz+ujglQVZV9pHUAxah9+eWPFBnbLOoUZYI0sTdIP4nLZTSiqOBgq8svjj
 mGdwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=add4qr8s7Rzs2iFplupf8G+pO7WNXGfrTbiJhl4yk
 10=; b=Nefmyww7ypl/5I42UsvUCppO82Yu5TCy0tmJF0mQf55DL8yvM2QRrOSqa
 Oai0XjOGKMmuAcH/5e69QeucqEncQn7y0d4JRgtN2cQrs5cMxgOv/DfM1/+3C2x3
 X6HNpIXggrgg/ryTVor3nkbCCIOY7mjZtarrsDcAqqqb7f48qH+PleSs1i3WbDfs
 u3susPpNnA3TEGGLt0WYA1inTGyIwPVT6/Irtv8z7xgOQ6j898I8k6qKtysAlZum
 KnCJqZDoJDlqiszezQMHAR0FiAdRGFeKPoSPhzlufoiFSQYwoD96/F6+Lo7R06RB
 9YZ4XU/277uxHcajUMzFJVa8B7e/w==
X-ME-Sender: <xms:BPqYXUlvHjEf0NQGlJZt3aeMps2IFpDyzter1u8BaIUEnuOYHOTtPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheefgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukf
 hppedutdejrdejjedrudejvddrledunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghm
 uhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:BPqYXaz5zyD7uOkFpzETIVDXuYJAYlwpFMVwKrKk2apW-kcErwd37w>
 <xmx:BPqYXZGBLrGhyuwt8xGgw5RE1MzXXRILNZKQxq6gYuEy24y08GK4Qg>
 <xmx:BPqYXfF5VKqkPDq6iz0LmHYJZn-LJ76fzT10FKZ97UEnH1sYRuOT4g>
 <xmx:BfqYXTnyeLy7kAwh1h2pHiNzU7D-Q4Nfm8GkOsS7vPvkEgEJ_S7SAA>
Received: from [192.168.43.79] (mobile-107-77-172-91.mobile.att.net
 [107.77.172.91])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE70DD6005A;
 Sat,  5 Oct 2019 16:16:01 -0400 (EDT)
Subject: Re: [PATCH 1/3] powerpc/book3s64/hash/4k: 4k supports only 16TB
 linear mapping
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
References: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <7dc4aacd-ebe1-07d6-1869-e404c3c22d2e@sholland.org>
Date: Sat, 5 Oct 2019 15:15:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Cameron Berkenpas <cam@neo-zeon.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 9/17/19 9:57 AM, Aneesh Kumar K.V wrote:
> With commit: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the
> same 0xc range"), we now split the 64TB address range into 4 contexts each of
> 16TB. That implies we can do only 16TB linear mapping. Make sure we don't
> add physical memory above 16TB if that is present in the system.
> 
> Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in thesame 0xc range")
> Reported-by: Cameron Berkenpas <cam@neo-zeon.de>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index bb3deb76c951..86cce8189240 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -35,12 +35,16 @@ extern struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
>   * memory requirements with large number of sections.
>   * 51 bits is the max physical real address on POWER9
>   */
> -#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME) &&  \
> -	defined(CONFIG_PPC_64K_PAGES)
> +
> +#if defined(CONFIG_PPC_64K_PAGES)
> +#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME)

This prevents accessing physical memory over 16TB with 4k pages and radix MMU as
well. Was this intentional?

>  #define MAX_PHYSMEM_BITS 51
>  #else
>  #define MAX_PHYSMEM_BITS 46
>  #endif
> +#else /* CONFIG_PPC_64K_PAGES */
> +#define MAX_PHYSMEM_BITS 44
> +#endif
>  
>  /* 64-bit classic hash table MMU */
>  #include <asm/book3s/64/mmu-hash.h>
> 
Cheers,
Samuel
