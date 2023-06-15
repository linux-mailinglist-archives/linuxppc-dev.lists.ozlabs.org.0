Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD184731D85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 18:12:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=TRCOnV9v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhnPd5dfFz3bP2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 02:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=TRCOnV9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 372 seconds by postgrey-1.37 at boromir; Fri, 16 Jun 2023 02:11:49 AEST
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhnNj1DC1z300q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 02:11:49 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C42558284ECA;
	Thu, 15 Jun 2023 11:05:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Hn_yqK1TZ49t; Thu, 15 Jun 2023 11:05:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 029168285373;
	Thu, 15 Jun 2023 11:05:33 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 029168285373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1686845133; bh=rFUIajOuH+FadwYEaFgNJ33Jl5ybknrMbERZj5HLtXE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=TRCOnV9vULN2EKIC6RkrYXQRMdSz224wIkjwnG2YD8ytSBUnnLhgLff59H382lPQy
	 a+9hfpBHgw739/WXMmokYNnU2Y0IwwNNv6aYKeiV9po84870EW47zK6Rn55XXLKcFX
	 HekRvKLI9PvKBbUbmOon3YXxTFtY52OUo0nGBfVo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mK9YZwHZNAQ0; Thu, 15 Jun 2023 11:05:32 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B273B8284ECA;
	Thu, 15 Jun 2023 11:05:32 -0500 (CDT)
Date: Thu, 15 Jun 2023 11:05:30 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <373175504.6295209.1686845130893.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <e2b46606-7ebc-c9a4-4f9a-873c0e71da5e@infradead.org>
References: <20230602140143.0af52cee@canb.auug.org.au> <2d188c87-ef34-3812-7330-a985f756d959@infradead.org> <87h6rogjok.fsf@mail.lhotse> <586983120.3136676.1685851048873.JavaMail.zimbra@raptorengineeringinc.com> <e2b46606-7ebc-c9a4-4f9a-873c0e71da5e@infradead.org>
Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC112 (Linux)/8.5.0_GA_3042)
Thread-Topic: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
Thread-Index: GvseGKdjg/1HXFjWDleWSYOY8qMIcw==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel <linux-kernel@vger.kernel.org>, Timothy Pearson <tpearson@raptorengineering.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Randy Dunlap" <rdunlap@infradead.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman" <mpe@ellerman.id.au>
> Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Linux Next Mailing List" <linux-next@vger.kernel.org>, "linux-kernel"
> <linux-kernel@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "Alexey Kardashevskiy" <aik@ozlabs.ru>
> Sent: Thursday, June 15, 2023 11:00:08 AM
> Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)

> Hi Timothy,
> 
> On 6/3/23 20:57, Timothy Pearson wrote:
>> 
>> 
>> ----- Original Message -----
>>> From: "Michael Ellerman" <mpe@ellerman.id.au>
>>> To: "Randy Dunlap" <rdunlap@infradead.org>, "Stephen Rothwell"
>>> <sfr@canb.auug.org.au>, "Linux Next Mailing List"
>>> <linux-next@vger.kernel.org>
>>> Cc: "linux-kernel" <linux-kernel@vger.kernel.org>, "linuxppc-dev"
>>> <linuxppc-dev@lists.ozlabs.org>, "Alexey
>>> Kardashevskiy" <aik@ozlabs.ru>, "Timothy Pearson"
>>> <tpearson@raptorengineering.com>
>>> Sent: Saturday, June 3, 2023 7:22:51 PM
>>> Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
>> 
>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>>> On 6/1/23 21:01, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20230601:
>>>>>
>>>>
>>>> On powerpc64, a randconfig failed with:
>>>>
>>>> In file included from ../include/linux/list.h:5,
>>>>                  from ../include/linux/preempt.h:11,
>>>>                  from ../include/linux/spinlock.h:56,
>>>>                  from ../include/linux/mmzone.h:8,
>>>>                  from ../include/linux/gfp.h:7,
>>>>                  from ../include/linux/slab.h:15,
>>>>                  from ../arch/powerpc/kernel/iommu.c:15:
>>>> ../arch/powerpc/kernel/iommu.c: In function
>>>> 'spapr_tce_setup_phb_iommus_initcall':
>>>> ../arch/powerpc/kernel/iommu.c:1391:36: error: 'hose_list' undeclared (first use
>>>> in this function); did you mean 'zonelist'?
>>>>  1391 |         list_for_each_entry(hose, &hose_list, list_node) {
>>>>       |                                    ^~~~~~~~~
>>> ...
>>>
>>> hose_list is in pci-common.c which is built when PCI=y.
>>>
>>> PSERIES and POWERNV force PCI=y.
>>>
>>> But this config has neither:
>>>
>>> # CONFIG_PPC_POWERNV is not set
>>> # CONFIG_PPC_PSERIES is not set
>>> CONFIG_HAVE_PCI=y
>>> # CONFIG_PCI is not set
>>> # CONFIG_COMMON_CLK_RS9_PCIE is not set
>>>
>>>
>>> Probably the spapr_tce code should be wrapped in an #ifdef that is only
>>> enabled when POWERNV || PSERIES is enabled.
>>>
>>> cheers
>> 
>> Sounds reasonable, I was going to look into this further over the weekend.  I
>> can put together a patch for Monday if that works?
> 
> Did you prepare a patch for this? I am still seeing this build error.
> 
> thanks.
> --
> ~Randy

Yes, it was sent in to the linuxppc-dev list some weeks ago.  Did it not arrive?
