Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F373D704
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 06:55:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WJldk12p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqFs70K0pz3bX8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 14:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WJldk12p;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqFrB6Pwjz2ys3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 14:54:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QqFr65Yxkz4wb3;
	Mon, 26 Jun 2023 14:54:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687755271;
	bh=GI2Mk6KUVsUcdqRJ8WZo5YaqGj9JC4bMFc5bfakqFds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WJldk12pFgT/54nHo/XENJxwG4Wtzqa2PLodnI8Neh3pCiwFxQnfXKBlvEWGpcO8U
	 OwVJZ6yeYLm1C8NQJbv0dxgM/43Ts2tYYvvCltcnP4/cPpeKzA4GPcL4FaIbBU0ccF
	 EoUHQeqSce10Ei9oL+8tD3aT41wcC9ob/Uwm6D+P+0U4l040upLqMLV7vEvTA60zKb
	 yBxlIcYZv8Jqn0Sio1MW3G3nxJUWhht6d1d5iex6G1pvkFCc9mAksc3y89yTv3Jj4P
	 3NQKs5U74Wctu6veBcsw6eeauqNieBAw1J4OYz62gZOdNHLGdg/mYVCDh6VYzeXatn
	 /VzEwYvDSoulQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: TCEs are incorrectly manipulated with
 DLPAR add/remove of memory
In-Reply-To: <6c6de9d0-1d40-c1f6-2b9a-b00eb3673b44@linux.vnet.ibm.com>
References: <20230613171641.15641-1-gbatra@linux.vnet.ibm.com>
 <ee63bcc9-4e06-198b-b3a2-5519bc11a83c@linux.vnet.ibm.com>
 <6c6de9d0-1d40-c1f6-2b9a-b00eb3673b44@linux.vnet.ibm.com>
Date: Mon, 26 Jun 2023 14:54:23 +1000
Message-ID: <87pm5ihlhc.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> Hello Michael,
>
> Did you get a chance to look into this patch? I don't mean to rush you.=20
> Just wondering if there is anything I can do to help make the patch to=20
> Upstream.

I skimmed it and decided it wasn't a critical bug fix, and hoped someone
else would review it - silly me :D

But the patch looks simple enough, and the explanation is very good so I
think it looks good to merge.

I'll apply it for v6.5.

cheers

> On 6/13/23 12:17 PM, Gaurav Batra wrote:
>> Hello Michael,
>>
>> I found this bug while going though the code. This bug is exposed when=20
>> DDW is smaller than the max memory of the LPAR. This will result in=20
>> creating DDW which will have Dynamically mapped TCEs (no direct mapping).
>>
>> I would like to stress that this=C2=A0 bug is exposed only in Upstream=20
>> kernel. Current kernel level in Distros are not exposed to this since=20
>> they don't have the=C2=A0 concept of "dynamically mapped" DDW.
>>
>> I didn't have access to any of the P10 boxes with large amount of=20
>> memory to=C2=A0 re-create the scenario. On P10 we have 2MB TCEs, which=20
>> results in DDW large enough to be able to cover=C2=A0 max memory I could=
=20
>> have for the LPAR. As a result,=C2=A0 IO Bus Addresses generated were=20
>> always within DDW limits and no H_PARAMETER was returned by HCALL.
>>
>> So, I hacked the kernel to force the use of 64K TCEs. This resulted in=20
>> DDW smaller than max memory.
>>
>> When I tried to DLPAR ADD memory, it failed with error code of -4=20
>> (H_PARAMETER) from HCALL (H_PUT_TCE/H_PUT_TCE_INDIRECT), when=20
>> iommu_mem_notifier() invoked tce_setrange_multi_pSeriesLP().
>>
>> I didn't test the DLPAR REMOVE path, to verify if incorrect TCEs are=20
>> removed by tce_clearrange_multi_pSeriesLP(), since I would need to=20
>> hack kernel to force dynamically added TCEs to the high IO Bus=20
>> Addresses. But, the concept is=C2=A0 same.
>>
>> Thanks,
>>
>> Gaurav
>>
>> On 6/13/23 12:16 PM, Gaurav Batra wrote:
>>> When memory is dynamically added/removed, iommu_mem_notifier() is=20
>>> invoked. This
>>> routine traverses through all the DMA windows (DDW only, not default=20
>>> windows)
>>> to add/remove "direct" TCE mappings. The routines for this purpose are
>>> tce_clearrange_multi_pSeriesLP() and tce_clearrange_multi_pSeriesLP().
>>>
>>> Both these routines are designed for Direct mapped DMA windows only.
>>>
>>> The issue is that there could be some DMA windows in the list which=20
>>> are not
>>> "direct" mapped. Calling these routines will either,
>>>
>>> 1) remove some dynamically mapped TCEs, Or
>>> 2) try to add TCEs which are out of bounds and HCALL returns H_PARAMETER
>>>
>>> Here are the side affects when these routines are incorrectly invoked=20
>>> for
>>> "dynamically" mapped DMA windows.
>>>
>>> tce_setrange_multi_pSeriesLP()
>>>
>>> This adds direct mapped TCEs. Now, this could invoke HCALL to add=20
>>> TCEs with
>>> out-of-bound range. In this scenario, HCALL will return H_PARAMETER=20
>>> and DLAR
>>> ADD of memory will fail.
>>>
>>> tce_clearrange_multi_pSeriesLP()
>>>
>>> This will remove range of TCEs. The TCE range that is calculated,=20
>>> depending on
>>> the memory range being added, could infact be mapping some other memory
>>> address (for dynamic DMA window scenario). This will wipe out those=20
>>> TCEs.
>>>
>>> The solution is for iommu_mem_notifier() to only invoke these=20
>>> routines for
>>> "direct" mapped DMA windows.
>>>
>>> Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
>>> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
>>> ---
>>> =C2=A0 arch/powerpc/platforms/pseries/iommu.c | 17 +++++++++++++----
>>> =C2=A0 1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c=20
>>> b/arch/powerpc/platforms/pseries/iommu.c
>>> index 918f511837db..24dd61636400 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -363,6 +363,7 @@ struct dynamic_dma_window_prop {
>>> =C2=A0 struct dma_win {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_node *device;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct dynamic_dma_window_prop *pr=
op;
>>> +=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0 direct;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head list;
>>> =C2=A0 };
>>>
>>> @@ -1409,6 +1410,8 @@ static bool enable_ddw(struct pci_dev *dev,=20
>>> struct device_node *pdn)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_del_pro=
p;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (direct_mapping) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 window->direct =3D true;
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* DDW maps the =
whole partition, so enable direct DMA=20
>>> mapping */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D walk_sys=
tem_ram_range(0, memblock_end_of_DRAM() >>=20
>>> PAGE_SHIFT,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 win64->value,=20
>>> tce_setrange_multi_pSeriesLP_walk);
>>> @@ -1425,6 +1428,8 @@ static bool enable_ddw(struct pci_dev *dev,=20
>>> struct device_node *pdn)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long st=
art =3D 0, end =3D 0;
>>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 window->direct =3D false;
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i =
< ARRAY_SIZE(pci->phb->mem_resources); i++) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const unsigned long mask =3D IORESOURCE_MEM_64 |=20
>>> IORESOURCE_MEM;
>>>
>>> @@ -1587,8 +1592,10 @@ static int iommu_mem_notifier(struct=20
>>> notifier_block *nb, unsigned long action,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case MEM_GOING_ONLINE:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&dma_w=
in_list_lock);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_en=
try(window, &dma_win_list, list) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 |=3D tce_setrange_multi_pSeriesLP(arg->start_pfn,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg->nr_pages, window->prop);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(window->direct) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret |=3D tce_setrange_multi_pSeriesLP(arg->start_pfn,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg->=
nr_pages, window->prop);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* XXX log error */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&dma=
_win_list_lock);
>>> @@ -1597,8 +1604,10 @@ static int iommu_mem_notifier(struct=20
>>> notifier_block *nb, unsigned long action,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case MEM_OFFLINE:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&dma_w=
in_list_lock);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_en=
try(window, &dma_win_list, list) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 |=3D tce_clearrange_multi_pSeriesLP(arg->start_pfn,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg->nr_pages, window->prop);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(window->direct) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret |=3D tce_clearrange_multi_pSeriesLP(arg->start_pf=
n,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg->=
nr_pages, window->prop);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /* XXX log error */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&dma=
_win_list_lock);
