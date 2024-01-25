Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF183BC27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 09:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLDjV0rlmz3cWt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 19:37:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLDj31nr3z2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 19:37:26 +1100 (AEDT)
X-UUID: 0b9114c47c944f3395e17bb8743a5543-20240125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:70a3d77d-bc90-44e0-b09b-26ae8d961c29,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:70a3d77d-bc90-44e0-b09b-26ae8d961c29,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:f443a58e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:240124210134Y4FPAFV7,BulkQuantity:5,Recheck:0,SF:66|38|24|17|19|44|6
	4|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 0b9114c47c944f3395e17bb8743a5543-20240125
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 392365939; Thu, 25 Jan 2024 16:36:17 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 96B42E000EB9;
	Thu, 25 Jan 2024 16:36:17 +0800 (CST)
X-ns-mid: postfix-65B21D81-548321494
Received: from [172.20.15.234] (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id 080AFE000EBA;
	Thu, 25 Jan 2024 16:36:16 +0800 (CST)
Message-ID: <fa62f595-6e83-4084-b6ae-b776f3cc504b@kylinos.cn>
Date: Thu, 25 Jan 2024 16:36:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: PPC: code cleanup for kvmppc_book3s_irqprio_deliver
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
References: <20240124093647.479176-1-chentao@kylinos.cn>
 <91bfb613-222b-41ea-a049-d4252b655176@csgroup.eu>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <91bfb613-222b-41ea-a049-d4252b655176@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024/1/24 21:01, Christophe Leroy wrote:
>=20
>=20
> Le 24/01/2024 =C3=A0 10:36, Kunwu Chan a =C3=A9crit=C2=A0:
>> This part was commented from commit 2f4cf5e42d13 ("Add book3s.c")
>> in about 14 years before.
>> If there are no plans to enable this part code in the future,
>> we can remove this dead code.
>>
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> ---
>>    arch/powerpc/kvm/book3s.c | 3 ---
>>    1 file changed, 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
>> index 8acec144120e..c2f50e04eec8 100644
>> --- a/arch/powerpc/kvm/book3s.c
>> +++ b/arch/powerpc/kvm/book3s.c
>> @@ -360,9 +360,6 @@ static int kvmppc_book3s_irqprio_deliver(struct kv=
m_vcpu *vcpu,
>>    		break;
>>    	}
>>   =20
>> -#if 0
>> -	printk(KERN_INFO "Deliver interrupt 0x%x? %x\n", vec, deliver);
>> -#endif
>=20
> Please also remove one of the two blank lines.
Thanks for your reply. I've send the v2 patch:
https://lore.kernel.org/all/20240125082637.532826-1-chentao@kylinos.cn/
https://lore.kernel.org/all/20240125083348.533883-1-chentao@kylinos.cn/
>>   =20
>>    	if (deliver)
>>    		kvmppc_inject_interrupt(vcpu, vec, 0);
--=20
Thanks,
   Kunwu

