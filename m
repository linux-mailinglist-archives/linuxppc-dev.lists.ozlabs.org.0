Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9827450341
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 12:16:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht6894bzPz2yMs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 22:16:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WAFMSqmt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=WAFMSqmt; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht67T24lVz2y7H
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 22:15:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636974919;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Giit+j3Xh5ufhxBQPkxvfcH3PZ5jUDKgn+uF7kZx8YU=;
 b=WAFMSqmtx2RkViKC6mvAVwetiWdZBXWiJXYFoF5qX0oWi+H/q3nVQ5M7ZONT4AUicR
 s4RN1rFPqPdJP8ZAy/1C8v7dBgj9achCFdrqb0J+5nFktGgGCKJtst6nvo9PMGnZDxsD
 oB4R7zwryd6HnHX+0t9fpO/RqA89kpentQN6zPfZfOiS7LkF+bU3iRvFhbVAQTBACba8
 SkNQ7gNFuoSsxLyaqXdNrLlTFyayecjNqu7bCKEc5/UeqEKklkdQpvUzsK7/0N0+Usk+
 hNewIRM8GALimnvn6O+clQJFVreeBZBIreBgwGntQW4S1+Ls1rBEpn6R5JJPi198f5Xx
 87Gw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhULn41ofxiIeRCozj2DXHQY5mFDw=="
X-RZG-CLASS-ID: mo00
Received: from cc-build-machine.a-eon.tld
 by smtp.strato.de (RZmta 47.34.5 AUTH)
 with ESMTPSA id N03801xAFBFHoXX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 15 Nov 2021 12:15:17 +0100 (CET)
Subject: Re: [PATCH] powerpc/book3e: Fix TLBCAM preset at boot
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <d319f2a9367d4d08fd2154e506101bd5f100feeb.1636967119.git.christophe.leroy@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <9f920db0-73db-9113-83db-0dbecbe6bcc1@xenosoft.de>
Date: Mon, 15 Nov 2021 12:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d319f2a9367d4d08fd2154e506101bd5f100feeb.1636967119.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linux-kernel@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15 November 2021 at 10:05 am, Christophe Leroy wrote:
> Commit 52bda69ae8b5 ("powerpc/fsl_booke: Tell map_mem_in_cams() if
> init is done") was supposed to just add an additional parameter to
> map_mem_in_cams() and always set it to 'true' at that time.
>
> But a few call sites were messed up. Fix them.
>
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Fixes: 52bda69ae8b5 ("powerpc/fsl_booke: Tell map_mem_in_cams() if init is done")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/mm/nohash/kaslr_booke.c | 2 +-
>   arch/powerpc/mm/nohash/tlb.c         | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
> index 8fc49b1b4a91..6ec978967da0 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -314,7 +314,7 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
>   		pr_warn("KASLR: No safe seed for randomizing the kernel base.\n");
>   
>   	ram = min_t(phys_addr_t, __max_low_memory, size);
> -	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true, false);
> +	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true, true);
>   	linear_sz = min_t(unsigned long, ram, SZ_512M);
>   
>   	/* If the linear size is smaller than 64M, do not randmize */
> diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
> index 89353d4f5604..647bf454a0fa 100644
> --- a/arch/powerpc/mm/nohash/tlb.c
> +++ b/arch/powerpc/mm/nohash/tlb.c
> @@ -645,7 +645,7 @@ static void early_init_this_mmu(void)
>   
>   		if (map)
>   			linear_map_top = map_mem_in_cams(linear_map_top,
> -							 num_cams, true, true);
> +							 num_cams, false, true);
>   	}
>   #endif
>   
> @@ -766,7 +766,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>   		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
>   
>   		linear_sz = map_mem_in_cams(first_memblock_size, num_cams,
> -					    false, true);
> +					    true, true);
>   
>   		ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
>   	} else
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Thanks
