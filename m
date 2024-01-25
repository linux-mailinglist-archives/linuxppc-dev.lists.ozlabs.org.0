Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23583BBC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 09:22:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLDNH08QPz3cXr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 19:22:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLDMl4gw2z3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 19:22:26 +1100 (AEDT)
X-UUID: 28377b4fc3ba46d69d1bdf08664895d9-20240125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:24c280cf-efdb-45d6-a95a-bb7bb1f1d273,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-INFO: VERSION:1.1.35,REQID:24c280cf-efdb-45d6-a95a-bb7bb1f1d273,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-META: VersionHash:5d391d7,CLOUDID:6237be7f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:240125144931KQV0B0BI,BulkQuantity:5,Recheck:0,SF:38|24|17|19|44|64|6
	6|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 28377b4fc3ba46d69d1bdf08664895d9-20240125
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1000393714; Thu, 25 Jan 2024 16:21:10 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 4B2DDE000EB9;
	Thu, 25 Jan 2024 16:21:10 +0800 (CST)
X-ns-mid: postfix-65B219F6-201682428
Received: from [172.20.15.234] (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id 1C8C5E000EB9;
	Thu, 25 Jan 2024 16:21:00 +0800 (CST)
Message-ID: <0cc62f04-ce60-42ed-89c9-ce8b1ce26ce7@kylinos.cn>
Date: Thu, 25 Jan 2024 16:20:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/iommu: Code cleanup for cell/iommu.c
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "arnd@arndb.de" <arnd@arndb.de>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
References: <20240125024633.512513-1-chentao@kylinos.cn>
 <7cdfcfc3-fc9e-433d-8992-7782d641cb94@csgroup.eu>
Content-Language: en-US
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <7cdfcfc3-fc9e-433d-8992-7782d641cb94@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024/1/25 14:49, Christophe Leroy wrote:
>=20
>=20
> Le 25/01/2024 =C3=A0 03:46, Kunwu Chan a =C3=A9crit=C2=A0:
>> This part was commented from commit 165785e5c0be ("[POWERPC] Cell
>> iommu support") in about 17 years before.
>>
>> If there are no plans to enable this part code in the future,
>> we can remove this dead code.
>>
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> ---
>>    arch/powerpc/platforms/cell/iommu.c | 16 ----------------
>>    1 file changed, 16 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platfo=
rms/cell/iommu.c
>> index 1202a69b0a20..afce9e64a443 100644
>> --- a/arch/powerpc/platforms/cell/iommu.c
>> +++ b/arch/powerpc/platforms/cell/iommu.c
>> @@ -424,22 +424,6 @@ static void __init cell_iommu_setup_hardware(stru=
ct cbe_iommu *iommu,
>>    	cell_iommu_enable_hardware(iommu);
>>    }
>>   =20
>> -#if 0/* Unused for now */
>> -static struct iommu_window *find_window(struct cbe_iommu *iommu,
>> -		unsigned long offset, unsigned long size)
>> -{
>> -	struct iommu_window *window;
>> -
>> -	/* todo: check for overlapping (but not equal) windows) */
>> -
>> -	list_for_each_entry(window, &(iommu->windows), list) {
>> -		if (window->offset =3D=3D offset && window->size =3D=3D size)
>> -			return window;
>> -	}
>> -
>> -	return NULL;
>> -}
>> -#endif
>=20
> Same as the other one, please remove the second blank line, don't leave
> two blank lines between the remaining functions.
Thanks for your reply.

I'll check my patches and update in v2.

>=20
>>   =20
>>    static inline u32 cell_iommu_get_ioid(struct device_node *np)
>>    {
--=20
Thanks,
   Kunwu

