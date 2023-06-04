Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC972148C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 06:06:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYjpK63Nsz3dxd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 14:06:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=mvhxQwPr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=mvhxQwPr;
	dkim-atps=neutral
X-Greylist: delayed 457 seconds by postgrey-1.36 at boromir; Sun, 04 Jun 2023 14:05:13 AEST
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYjnP3ZbSz3c4w
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 14:05:13 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 32E518284E45;
	Sat,  3 Jun 2023 22:57:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 16z4nBhDYE8N; Sat,  3 Jun 2023 22:57:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 21E1C8284F94;
	Sat,  3 Jun 2023 22:57:31 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 21E1C8284F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1685851051; bh=pp9YQ8oFCEzUqouZstn/GGVcB6betN1RFKBrWGUP9Fs=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=mvhxQwPrWgfdt3u2ilB9ZnV4r7xUJBgie8mHoIpjdvKaaDwFXjCPHqor+GTRcRMIS
	 EIcAvtbutXewQm0EAaoVySG89ZaSutTUKean2lOoUB8+9Ywt94CjBc0h6YhH1b7ToN
	 14mcLB8iw/PNs6Etd0hWWGjROJAxcpMg9F/vQbww=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SGdpJceVXicU; Sat,  3 Jun 2023 22:57:30 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id CD7728284E45;
	Sat,  3 Jun 2023 22:57:30 -0500 (CDT)
Date: Sat, 3 Jun 2023 22:57:28 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <586983120.3136676.1685851048873.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <87h6rogjok.fsf@mail.lhotse>
References: <20230602140143.0af52cee@canb.auug.org.au> <2d188c87-ef34-3812-7330-a985f756d959@infradead.org> <87h6rogjok.fsf@mail.lhotse>
Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC114 (Linux)/8.5.0_GA_3042)
Thread-Topic: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
Thread-Index: RTvjy9BIecQ79Qf7Chi/J96e/nXceg==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Kardashevskiy <aik@ozlabs.ru>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> To: "Randy Dunlap" <rdunlap@infradead.org>, "Stephen Rothwell" <sfr@canb.auug.org.au>, "Linux Next Mailing List"
> <linux-next@vger.kernel.org>
> Cc: "linux-kernel" <linux-kernel@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "Alexey
> Kardashevskiy" <aik@ozlabs.ru>, "Timothy Pearson" <tpearson@raptorengineering.com>
> Sent: Saturday, June 3, 2023 7:22:51 PM
> Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)

> Randy Dunlap <rdunlap@infradead.org> writes:
>> On 6/1/23 21:01, Stephen Rothwell wrote:
>>> Hi all,
>>> 
>>> Changes since 20230601:
>>> 
>>
>> On powerpc64, a randconfig failed with:
>>
>> In file included from ../include/linux/list.h:5,
>>                  from ../include/linux/preempt.h:11,
>>                  from ../include/linux/spinlock.h:56,
>>                  from ../include/linux/mmzone.h:8,
>>                  from ../include/linux/gfp.h:7,
>>                  from ../include/linux/slab.h:15,
>>                  from ../arch/powerpc/kernel/iommu.c:15:
>> ../arch/powerpc/kernel/iommu.c: In function
>> 'spapr_tce_setup_phb_iommus_initcall':
>> ../arch/powerpc/kernel/iommu.c:1391:36: error: 'hose_list' undeclared (first use
>> in this function); did you mean 'zonelist'?
>>  1391 |         list_for_each_entry(hose, &hose_list, list_node) {
>>       |                                    ^~~~~~~~~
> ...
> 
> hose_list is in pci-common.c which is built when PCI=y.
> 
> PSERIES and POWERNV force PCI=y.
> 
> But this config has neither:
> 
> # CONFIG_PPC_POWERNV is not set
> # CONFIG_PPC_PSERIES is not set
> CONFIG_HAVE_PCI=y
> # CONFIG_PCI is not set
> # CONFIG_COMMON_CLK_RS9_PCIE is not set
> 
> 
> Probably the spapr_tce code should be wrapped in an #ifdef that is only
> enabled when POWERNV || PSERIES is enabled.
> 
> cheers

Sounds reasonable, I was going to look into this further over the weekend.  I can put together a patch for Monday if that works?
