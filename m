Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32736721A72
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 23:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZ9YT5jqKz3f5p
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 07:56:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1jblcwa+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZ9XX32dtz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 07:55:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NUSwhZy1/res6awhW/S7wR5GlEYRXerBv2gBnZJoqgk=; b=1jblcwa+kVG/RLLzLxxruy/Dha
	6cqd8127kzAxwgpGf4/0eSSSt0dHgm2fYBCy22Tva4wwOT2WSwohRSAjJ7H5zOa/fxrK/KbvYVaKP
	AU1JeZsf5RZVLizwWmoaceBBxeXysK+vH4FTFESUwMkIwZFlHSG9CjlMuaFXCZg9CK1yLPYmI3T6f
	6odvsfZoixeHSfS1AT7OsbgC4BP/JkxAuwFrIXCZFxJIct0XPxmhooUnNCZa73+w9Z5WgnsOsL5Cx
	qJtAAEBAYtZ+YWk3iCKJS5nOsC5UTbJGR+JVEw7mVyCEL/BgGF6ga7KbwH1JGzrfeQb4zWrqRAN0M
	2VskWFPQ==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q5vhF-00DGFK-09;
	Sun, 04 Jun 2023 21:55:33 +0000
Message-ID: <daa8c49e-a585-4c1d-9161-808633610850@infradead.org>
Date: Sun, 4 Jun 2023 14:55:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20230602140143.0af52cee@canb.auug.org.au>
 <2d188c87-ef34-3812-7330-a985f756d959@infradead.org>
 <87h6rogjok.fsf@mail.lhotse>
 <586983120.3136676.1685851048873.JavaMail.zimbra@raptorengineeringinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <586983120.3136676.1685851048873.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/3/23 20:57, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Michael Ellerman" <mpe@ellerman.id.au>
>> To: "Randy Dunlap" <rdunlap@infradead.org>, "Stephen Rothwell" <sfr@canb.auug.org.au>, "Linux Next Mailing List"
>> <linux-next@vger.kernel.org>
>> Cc: "linux-kernel" <linux-kernel@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "Alexey
>> Kardashevskiy" <aik@ozlabs.ru>, "Timothy Pearson" <tpearson@raptorengineering.com>
>> Sent: Saturday, June 3, 2023 7:22:51 PM
>> Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
> 
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>> On 6/1/23 21:01, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20230601:
>>>>
>>>
>>> On powerpc64, a randconfig failed with:
>>>
>>> In file included from ../include/linux/list.h:5,
>>>                  from ../include/linux/preempt.h:11,
>>>                  from ../include/linux/spinlock.h:56,
>>>                  from ../include/linux/mmzone.h:8,
>>>                  from ../include/linux/gfp.h:7,
>>>                  from ../include/linux/slab.h:15,
>>>                  from ../arch/powerpc/kernel/iommu.c:15:
>>> ../arch/powerpc/kernel/iommu.c: In function
>>> 'spapr_tce_setup_phb_iommus_initcall':
>>> ../arch/powerpc/kernel/iommu.c:1391:36: error: 'hose_list' undeclared (first use
>>> in this function); did you mean 'zonelist'?
>>>  1391 |         list_for_each_entry(hose, &hose_list, list_node) {
>>>       |                                    ^~~~~~~~~
>> ...
>>
>> hose_list is in pci-common.c which is built when PCI=y.
>>
>> PSERIES and POWERNV force PCI=y.
>>
>> But this config has neither:
>>
>> # CONFIG_PPC_POWERNV is not set
>> # CONFIG_PPC_PSERIES is not set
>> CONFIG_HAVE_PCI=y
>> # CONFIG_PCI is not set
>> # CONFIG_COMMON_CLK_RS9_PCIE is not set
>>
>>
>> Probably the spapr_tce code should be wrapped in an #ifdef that is only
>> enabled when POWERNV || PSERIES is enabled.
>>
>> cheers
> 
> Sounds reasonable, I was going to look into this further over the weekend.  I can put together a patch for Monday if that works?

Works for me. Go for it.
Thanks.

-- 
~Randy
