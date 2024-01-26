Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F883D254
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 03:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLgrP3Ls9z3cWd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 13:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLgqy1545z2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 12:59:57 +1100 (AEDT)
X-UUID: 29d0227cf7674799979a27c4c69f84df-20240126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:0dbccd0c-3038-4c0e-8405-6260a5b46f78,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:0dbccd0c-3038-4c0e-8405-6260a5b46f78,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:3be429fe-c16b-4159-a099-3b9d0558e447,B
	ulkID:240125184215QKR6JD97,BulkQuantity:5,Recheck:0,SF:19|44|64|66|38|24|1
	7|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 29d0227cf7674799979a27c4c69f84df-20240126
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 956405128; Fri, 26 Jan 2024 09:58:48 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id E873DE000EB9;
	Fri, 26 Jan 2024 09:58:47 +0800 (CST)
X-ns-mid: postfix-65B311D7-876639436
Received: from [172.20.15.234] (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id 78E3DE000EB9;
	Fri, 26 Jan 2024 09:58:38 +0800 (CST)
Message-ID: <13890cb8-c454-49d6-af55-c274fa2ef025@kylinos.cn>
Date: Fri, 26 Jan 2024 09:58:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/cell: Code cleanup for spufs_mfc_flush
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "jk@ozlabs.org" <jk@ozlabs.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
References: <20240125100854.540964-1-chentao@kylinos.cn>
 <c34968b8-f6bf-4ee1-8767-ef463637d866@csgroup.eu>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <c34968b8-f6bf-4ee1-8767-ef463637d866@csgroup.eu>
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

On 2024/1/25 18:41, Christophe Leroy wrote:
>=20
>=20
> Le 25/01/2024 =C3=A0 11:08, Kunwu Chan a =C3=A9crit=C2=A0:
>> This part was commented from commit a33a7d7309d7
>> ("[PATCH] spufs: implement mfc access for PPE-side DMA")
>> in about 18 years before.
>>
>> If there are no plans to enable this part code in the future,
>> we can remove this dead code.
>>
>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>> ---
>>    arch/powerpc/platforms/cell/spufs/file.c | 12 ------------
>>    1 file changed, 12 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/p=
latforms/cell/spufs/file.c
>> index 02a8158c469d..d5e1af483601 100644
>> --- a/arch/powerpc/platforms/cell/spufs/file.c
>> +++ b/arch/powerpc/platforms/cell/spufs/file.c
>> @@ -1705,19 +1705,7 @@ static int spufs_mfc_flush(struct file *file, f=
l_owner_t id)
>>    	ret =3D spu_acquire(ctx);
>>    	if (ret)
>>    		goto out;
>> -#if 0
>> -/* this currently hangs */
>> -	ret =3D spufs_wait(ctx->mfc_wq,
>> -			 ctx->ops->set_mfc_query(ctx, ctx->tagwait, 2));
>> -	if (ret)
>> -		goto out;
>> -	ret =3D spufs_wait(ctx->mfc_wq,
>> -			 ctx->ops->read_mfc_tagstatus(ctx) =3D=3D ctx->tagwait);
>> -	if (ret)
>> -		goto out;
>> -#else
>>    	ret =3D 0;
>=20
Thanks for your reply.
> If you arrived here, it means ret is already 0, otherwise you would hav=
e
> jumped to label out:, so you can also remove that ret =3D 0 setting.
>=20
I'm patronizing the removal of useless code, it's my bad.
> And while you are at it, there is no point in a goto to just a return,
> just return instead of the goto, and then you can return 0 directly,
> something like:
>=20
> 	ret =3D spu_acquire(ctx);
> 	if (ret)
> 		return ret;
>=20
> 	spu_release(ctx);
>=20
> 	return 0;
>=20
>=20
> That would be a better cleanup.
Thanks for your suggestions,i'll update in v2 and add a 'Suggested-by:'.
>=20
>> -#endif
>>    	spu_release(ctx);
>>    out:
>>    	return ret;
--=20
Thanks,
   Kunwu

