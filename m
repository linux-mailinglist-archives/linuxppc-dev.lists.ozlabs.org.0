Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F6A2C7A0A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 17:42:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkZ096Zv3zDrMD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 03:42:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.184.201;
 helo=sonic301-32.consmr.mail.ne1.yahoo.com; envelope-from=userm57@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=BIr7ex17; dkim-atps=neutral
Received: from sonic301-32.consmr.mail.ne1.yahoo.com
 (sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkYy310yqzDrKV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 03:40:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1606668016; bh=QyDg3djG6pXQy+KXCQcA4kQ94YOu5LYOM+5zcOSHuzU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
 b=BIr7ex17smGzuHxjS8yQ8aLnbiXdJaylu7yEtDyytU6upaSimRYqaN5x9B4aMHIr32goI1Jyb13CMzPkgbPSG5WMiX5reUkNJvckYJfLBrqZbTypVEkcT7umocCp+X2N9QCalnn64fRjLyyxmXBW+eKFGvbhOAeVx31vRmP0lN4C8K66f98B0Q7btNHWz0AzjuOeUhYt4aOLWvnak6+sFle/RZgEdva+tnzXDSbIvqCPdQec3UMa6k7fmTMNJ6z27elJowWat8vjuR9hrRkhnSl/W8KhpxExUD83SPJr7KBwjoTB2sa0v605ZFY/pzGP0D+NmxxrRR0Sii54WnvTeg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1606668016; bh=Z6DdgSImzMIJ3yVELOW6GY3WFQomv0KNy1a26jou1bW=;
 h=Subject:To:From:Date:From:Subject;
 b=UXp9vQyR15+dT+sX3PUrYaNraCfWHuvNbvnXoYFy6rTzGWJgRm0lWCxAednDghq/ee5N2a7cX6NArvmJzYmQONWCLbOkM8V3JQ5Qwi+M1bqHxlVj0UlZLv0IQOHPK5vy3cGVGEwJ1HBMmf41wSkMW1qaiC6zpUxE+sF/TGApcg8XeCsTUZSqjZybeKNebly+fWSuXy37dnViRWPhVpOcRWlzNucpc9SSI6zbVKzJgMeKg9T5KfU7i5QMy8VxvvSia/vpoN8nDtwWo1l6p+DA1RlRUd3WaOUJQbmAA4Z4BN+lMMk13Hp740FrrtbprBY+S7gWbXgzW0ifXmY1O+yIvw==
X-YMail-OSG: X11BJm0VM1k_ZNGy6JwUWjOx8zwI_E8RFMU2UP81XF8POMhvYRUVW3q5UxANcmj
 YaZhuNCcFfxzwCHzv3X6zkwXDevG9awqk5yZu4IduxZKhRhrm0tpiI7fu2FJqi.61dAXQQK6rDeu
 7opuPtc6_T8wH._X6K74m9gtxYPypH2aVORib_9z1VUzZYPPapPFRgDXhsP4dfbOs0sxccS39Hzo
 f0xtAUHJzFXkW5RGTCBlk1yUkIJ6o60jcKEVXPevSWIuNbXx_yAeKqX7XEwttKonKzvZ27e6ElYN
 t3Khma0GK1ntJem23P4k4yhk7wrVbdRd6.o7_sdrWiLs_dB55iU650konyPY8LKQ5dM1sH3bue_t
 _isPQNEfL0P_EKn_8GslYJEdBnwSlY0EnArmw4vQZD8mCqgI0.HxcKDq6_XfkpQvt1zdBO4QVD9V
 gXXHR0A4f6PIbGmxyISQ6wckWxgKs0Z7g0wNqoQFo9bkU9cSCgvUYyv19RiPpAajP43Wwg2h9y9E
 tOFSOMyaDKYCJj1xKfWFDXEQkFZwPJ0i9Gl7zUc2KEu9nYuKv6ubbPtIbmkuH6455cwgEOGs1g.q
 Ecsq0jJXRtdt27Cuf69OhHJwc6uQ0fIghpxOouRfo1vOZtsfvAOs4I2zKve7r4_x5l5YoSHhVCXS
 BmMGhRLR3h.6mDL2IQV1jmrFNq4lhSzdfvcAvNTdU_7y0hP3wqR6WZ2jxDOYjs5dx8EX_hfF9_qY
 G6G.D2jVPf0CLKGQVDxLaCRyrXOuRXPSPfPSFtoNR.rST_pDsqBtw0Nr7ZvZCfni2Bv0GNXJcXzf
 xPSlFOUZH8aPGD_iZ1yD20zoDxyJyxQyK.Mfn7gi_n3.GvPfDHaQtRWhwjeRtQGn1_Aao0WqmiNn
 0MFeHoYMTct1DAnJpARxvBFXJGSHossZhRiWTxajooi.ilVxLYvoukvrYUOFm_zAxSzvWOnIZL8w
 xpM0IRA6hIXwc8MopIvP9.wgS0VxHaL9aammDkYPgHLRvOOs0CZv57R7311RRZtgpkQEzEwFCpgx
 34IrsN0hD3TAZezFCAtlmv9jGF1Jsr1Du5F9JJadOmiDkHGkMA5OSK9K2XBipji5iRJX6uupNv2t
 DsGh4FJ1TM3cupeAjRTopRt15lbIUPZfL6sRT8Exr5KTxrfgl_gRBb0Imoc8fYTIffFa4G9AXNA5
 ElRiYv53uRgYKPwuXs2MNcNNr5NNQwzpmV.5SzTjRKa6DxjntesZTFuB_KxFfg6ad7lAyEHdjSsu
 yP12cOA7J.q5INvVEba03Re3qrjx7yDqQNx.e.5UK_mOIAxI7ApLFExQYXgPC4lNpUyoE24ry.vK
 j9weGbw0pSTQTr7xUixaXHAom9JGdIJvLFepmoFu0PM3QjMKBiRnq_4crnOmy941BP9J0dPEgCh7
 356tgyV1RQEY.x7j4OKNbV0844tR0sovY_I1JvD.VjPif4crV2I6muVPKUcvvQl332IJRvFT1tTr
 lvgphXfowD_Z2rSJQDwyuXSAoQWRSLp1XwqV84Q7BBrfbIgatrZjQ17Oqj_OAp_NEx.P4kD..DyB
 0OlXmslknKzVLM38Eu0MBTv09PnzzlWPNDXIRMnstkFdJTIopuEouZCQfGXDBSAhH4hHh7ViQhT9
 Ge6AuPY40l14g_QeEe7gToft1vItrwpNv3_ejE_UJTFOkiejQv4cZh3kdpzbuWdG4QPNEyXXN1AJ
 w_mEcGXxZsyjScEMvUzWkG7i30Hr5ckVRmzLDgH2pP4uLImj_9_9qLffe66_u9Sc0lYPO0V.BDUW
 XcWjtRiDg_y20xJHwAdLS.3zubOHfDvGEPFv8PjU.j3jCM7mPspdQ9XSPK.Oo1M5Obxnb7rEC4.i
 yGArFRg0pgPWUTyqixz26zBqYdwzUTDrtgWQyvo7SeHy2OH1UzMaaQnB50hAND.sOPulTxN.cRca
 fqZFZ0J2fpAM11.SqpCfaYjVeXFeValiSvcFxX1a6ulFEqHnlLRXxuuoziNmKbf51f3PHxfL6XQg
 mYFy2WdO5yT4qaPo9OBZ5kwzwYPbm85.pAHOa1d1fO5t2GJ3j5bCjUr_77bA7DAt6m_h_dF_T5Wc
 MXxYtJnySaUAAHglpP6ezfuorYxgLI.9uHfPomN2yVMfADI3F5tdPICEOobFpAwtF3P9_nAKBJZ3
 FhXUd5uOeepSZ815.bt.c_hm8WTZJTA64PDo3sf02ep1gf9ZZAqulMHMpkUuqGuCudSFXRIU3OYU
 0D2nL6ZSyP5ICMW1719nfPiVJ4E_EacqHztzECK0L_nGIP7w3iTqWbiaImnLG9WXDYp.r8AqStrr
 DJK54Q0S6MbzEsaeIH4IfthajnzqttWEFDKxgmTKt6CbK7DRCdSTEcC_.Uyihnq_1EzjTzZ35U0V
 jynuyJxTWsZoycvLRdBCrp_GpC_6IgrwPzce3rjmGx_4mjL7JER1KhCij_JMtuqAUGsy1XBmjzxG
 Me1H_MpuIK1rAigkJnYPOEW0fQacJO8B4aYFewlXJWT8mTqQLgo47nP7EuQ5wXWroQVpWgBhn1Lh
 XZvN0CuPmaT2r0FjaSE89QNI6XMU6HCTf0C6nxZPqlaO9Rd9a.Kv2yv7iJD5M.IVTiBrPDVdjAXR
 .rHIpZKjrLax7EMbI5vLTrSI2ivMomdVX96Je4WHkF0c_x451Qg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ne1.yahoo.com with HTTP; Sun, 29 Nov 2020 16:40:16 +0000
Received: by smtp411.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID e2b74cd191aff7bb20713f81105e1b4c; 
 Sun, 29 Nov 2020 16:40:13 +0000 (UTC)
Subject: Re: Kernel 5.10-rc4 doesn't boot
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20201125114030.2s3lbfxd4yvfc3zx@aragorn.home.lxtec.de>
 <88e539d3-22ed-3672-53d1-b3a217a08cc0@physik.fu-berlin.de>
 <20201125125216.lmid2m2tcdkxpioq@toy.home.lxtec.de>
 <740918d5-8ea3-4078-3bf0-7a627cd9777d@yahoo.com>
 <228955cd-e014-b533-b3bb-4d4e04baa9de@yahoo.com>
 <79a8734e-da7f-6563-2730-b1014ccb35c7@csgroup.eu>
 <20201129122727.42zbknbaz26dedcg@toy.home.lxtec.de>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <766b11d8-ec58-af11-b4c8-9498ee53bcdf@yahoo.com>
Date: Sun, 29 Nov 2020 09:40:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20201129122727.42zbknbaz26dedcg@toy.home.lxtec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.17111
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.8)
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
Cc: debian-powerpc@lists.debian.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I can confirm that applying the patch to 5.10-rc5 also fixes the boot
problem on the Wallstreet and Lombard PowerBooks.

thanks

-Stan

-----

On 11/29/20 5:27 AM, Elimar Riesebieter wrote:
> Hi all,
>
> * Christophe Leroy <christophe.leroy@csgroup.eu> [2020-11-29 08:37 +0100]:
>
> [...]
>
>> Try following commit: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=01776f070ffcbf336be3bf1672bd3c589548d6c4
> I can confirm that this commit patched at 5.10-rc5 made the kernel
> boot again :-)
>
> Thanks for bisecting and providing the patch!
>
> Elimar

