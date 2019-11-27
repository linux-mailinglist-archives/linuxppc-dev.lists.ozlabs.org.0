Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6440B10B268
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 16:27:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NPln3X3gzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 02:27:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::1;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="AKIw8GJy"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NPVD2slnzDqvT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 02:15:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574867734;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rU6EJZnQMWHiAAMrDnvCSg5GJl/7kaL3qM/q2ihcwWc=;
 b=AKIw8GJyYbaypCFu1/R4Crvr46NrB5mMyCWXjinF5tVsyAjkF0GDi5OYwsd2+frC4p
 /GXVXZziexXQ16puOtMp9Atw0vaUYKUZAFXMo+qk14KGQu54a6LPJwwM1nkhTSw91MUQ
 H9RCzrN4Wrx/Rwzdtc/U/pMQW+EC0lxPGHK3FcVCy3JRYH0a7lndUKjPxH8KnjbAd3v2
 7gERdgYxDTJrYe88O/MtgtPrUqvoeVU5Aeo5dGPFCIS4Izjiq1NsPvpAoDkGhfarR/zR
 vSMdOMXbee3Kl653fyVfjb98rN2Dp1caI1rnG1DgVAg5B21DJztSB6BJvYRNLBRNtWNR
 HYqQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhUIxnPrrzntHiDgpTRUbNSOXek"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:7591:d54e:863:4581]
 by smtp.strato.de (RZmta 46.0.0 AUTH) with ESMTPSA id n05ae1vARFEh10O
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 27 Nov 2019 16:14:43 +0100 (CET)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
To: Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@lst.de>
References: <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
 <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
 <20191125073923.GA30168@lst.de>
 <4681f5fe-c095-15f5-9221-4b55e940bafc@xenosoft.de>
 <20191126164026.GA8026@lst.de> <20191127065624.GB16913@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <6a4289cf-d2b5-2357-f1ad-eeab44ab3b1e@xenosoft.de>
Date: Wed, 27 Nov 2019 16:14:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127065624.GB16913@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org,
 mad skateman <madskateman@gmail.com>, "contact@a-eon.com" <contact@a-eon.com>,
 Robin Murphy <robin.murphy@arm.com>, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27 November 2019 at 07:56 am, Mike Rapoport wrote:
>
> Maybe we'll simply force bottom up allocation before calling
> swiotlb_init()? Anyway, it's the last memblock allocation.
>
>
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 62f74b1b33bd..771e6cf7e2b9 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -286,14 +286,15 @@ void __init mem_init(void)
>   	/*
>   	 * book3s is limited to 16 page sizes due to encoding this in
>   	 * a 4-bit field for slices.
>   	 */
>   	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
>   
>   #ifdef CONFIG_SWIOTLB
> +	memblock_set_bottom_up(true);
>   	swiotlb_init(0);
>   #endif
>   
>   	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
>   	set_max_mapnr(max_pfn);
>   	memblock_free_all();
>   
>   
Hello Mike,

I tested the latest Git kernel with your new patch today. My PCI TV card 
works without any problems.

Thanks,
Christian
