Return-Path: <linuxppc-dev+bounces-1709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035F98BC01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 14:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHxtG6LXqz2xk7;
	Tue,  1 Oct 2024 22:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727785398;
	cv=none; b=nh42pQMKD639Nq5k//AO4Nv8tKuaXMhkmFFU5FqUZFRqyU0KNpVrANgrxprAyofZXz+ZjpHwGE/Bix7K9y59xB4urxroDBfeZuUgv7RbueKlbdBoCmTbvyg/BN8AHPgGdLIYYFLykcYkgOfD87lRASXQyB44RcSppz6+tlgSVQX8QP4KoTAEN7rg3s53zwEm26XfcgpW4BVNIMr+GwxOdjqSGOne6rwr7bTtncEXyXYcASit7A0oax+efbfjxp02oj9VB6N+e7nZOf3NJ9k+AodbUuheueorRZ61MTDp7g+fk2y8gM5wocThZQSMZQTAFbwUQAPyeKP3SSDTzBr0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727785398; c=relaxed/relaxed;
	bh=V7dwwNbGJ21ittVcOH5LrZfuIc6yQXKSS6hXpv+lj1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ohsnn0ZPE7i7ZCHgdj+zUVC5knBxAiqNKum3vZCXD1+YkUPyTmVOKpbO2A3z1zBUgSDOf8VblyDHHf+UwQG3FRDRwmQKSuZgmxnIZn/QypxJOjB+hVWk8StEdG7kFrTmedWZdDQcEELhendQtjy4ZD8NZ3Ck5QftBxZtRWzViRpLNu5J74ZHMdgx8LJE4EuVUtK6mZpQh1kyKLgdQW4LopeAHp/vBlJySMd78PhCo3hFGdibn06KMBix5Hz21wuWizdX3tQh/bsqzgsE26uU2f9OmrW/YCXnxutJzwo2EXw/1k9FFu1dzBmqx+0mtdzSgD0MBJwqf76ON17DuAJf+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHxtF5FTnz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 22:23:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XHxtB2HzKz9sPd;
	Tue,  1 Oct 2024 14:23:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhcUCBXCWWAb; Tue,  1 Oct 2024 14:23:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XHxtB1LSRz9rvV;
	Tue,  1 Oct 2024 14:23:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C5768B770;
	Tue,  1 Oct 2024 14:23:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id YSHztN62UvDx; Tue,  1 Oct 2024 14:23:14 +0200 (CEST)
Received: from [192.168.232.216] (unknown [192.168.232.216])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A41C68B766;
	Tue,  1 Oct 2024 14:23:13 +0200 (CEST)
Message-ID: <77d49375-8eac-45cf-83b7-c3334ed6d665@csgroup.eu>
Date: Tue, 1 Oct 2024 14:23:13 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
To: Hoi Pok Wu <wuhoipok@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
References: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
 <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
 <CANyH0kBnWZMZCG7K9vGt2a8Svr30U=PVOwrhwn-Q-CN9PZc=Sw@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CANyH0kBnWZMZCG7K9vGt2a8Svr30U=PVOwrhwn-Q-CN9PZc=Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi All,

Le 01/10/2024 à 14:09, Hoi Pok Wu a écrit :
> [Vous ne recevez pas souvent de courriers de wuhoipok@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Thomas,
> 
> Could you help on this issue?
> I do not have access to the hardware now.
> Thank you.

The OOPS is from function drm_dp_aux_register(), exactly here below:

static inline const char *dev_name(const struct device *dev)
{
	/* Use the init name until the kobject becomes available */
	if (dev->init_name)

     1ae0:	e8 89 00 50 	ld      r4,80(r9)


As you see in registers dump, r9 register is NULL. That's dev which is NULL:

GPR00: c0000000005b74f0 c0000000800daf10 c0000000015a3600 c00000008033f7ec
GPR04: 0000000000000000 c000000001908f18 c000000080460c80 ffffffffc0c0c0c0
GPR08: c000000080f74008 0000000000000000 0000000000000003 c000000080f74008
GPR12: 0000000048000828 c00000003fffeac0 0000000000000003 0000000001000000
GPR16: c0000000804eaeca 0000000000000013 0000000000003113 0000000000000000
GPR20: 0000000000000008 c0000000800db208 000000000000000a c0000000014d6868
GPR24: 0000000000000000 0000000000000001 c0000000800db29c c0000000800db250
GPR28: c000000080bd8040 0000000000000001 c000000080f74000 c00000008033f4a0

Full dump below:

0000000000001a5c <drm_dp_aux_register>:
{
     1a5c:	3c 4c 00 00 	addis   r2,r12,0
			1a5e: R_PPC64_REL16_HA	.TOC.+0x2
     1a60:	38 42 00 00 	addi    r2,r2,0
			1a62: R_PPC64_REL16_LO	.TOC.+0x6
     1a64:	7c 08 02 a6 	mflr    r0
     1a68:	fb e1 ff f8 	std     r31,-8(r1)
     1a6c:	f8 01 00 10 	std     r0,16(r1)
     1a70:	7c 7f 1b 78 	mr      r31,r3
     1a74:	f8 21 ff d1 	stdu    r1,-48(r1)
	WARN_ON_ONCE(!aux->drm_dev);
     1a78:	e9 23 03 38 	ld      r9,824(r3)
     1a7c:	2f a9 00 00 	cmpdi   cr7,r9,0
     1a80:	41 de 00 90 	beq-    cr7,1b10 <drm_dp_aux_register+0xb4>
	if (!aux->ddc.algo)
     1a84:	e9 3f 00 18 	ld      r9,24(r31)
     1a88:	2f a9 00 00 	cmpdi   cr7,r9,0
     1a8c:	41 de 00 74 	beq-    cr7,1b00 <drm_dp_aux_register+0xa4>
	strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
     1a90:	e8 9f 00 00 	ld      r4,0(r31)
	aux->ddc.owner = THIS_MODULE;
     1a94:	39 40 00 00 	li      r10,0
	aux->ddc.dev.parent = aux->dev;
     1a98:	e9 3f 03 30 	ld      r9,816(r31)
	strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
     1a9c:	38 7f 02 74 	addi    r3,r31,628
	aux->ddc.owner = THIS_MODULE;
     1aa0:	f9 5f 00 08 	std     r10,8(r31)
	strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
     1aa4:	2f a4 00 00 	cmpdi   cr7,r4,0
	aux->ddc.dev.parent = aux->dev;
     1aa8:	f9 3f 00 b8 	std     r9,184(r31)
	strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
     1aac:	41 de 00 34 	beq-    cr7,1ae0 <drm_dp_aux_register+0x84>
     1ab0:	38 a0 00 30 	li      r5,48
     1ab4:	48 00 00 01 	bl      1ab4 <drm_dp_aux_register+0x58>
			1ab4: R_PPC64_REL24	sized_strscpy
     1ab8:	60 00 00 00 	nop
	ret = i2c_add_adapter(&aux->ddc);
     1abc:	38 7f 00 08 	addi    r3,r31,8
     1ac0:	48 00 00 01 	bl      1ac0 <drm_dp_aux_register+0x64>
			1ac0: R_PPC64_REL24	i2c_add_adapter
     1ac4:	60 00 00 00 	nop
}
     1ac8:	38 21 00 30 	addi    r1,r1,48
     1acc:	e8 01 00 10 	ld      r0,16(r1)
     1ad0:	eb e1 ff f8 	ld      r31,-8(r1)
     1ad4:	7c 08 03 a6 	mtlr    r0
     1ad8:	4e 80 00 20 	blr
     1adc:	60 00 00 00 	nop
  * Return: The kobject name of the device, or its initial name if 
unavailable.
  */
static inline const char *dev_name(const struct device *dev)
{
	/* Use the init name until the kobject becomes available */
	if (dev->init_name)
     1ae0:	e8 89 00 50 	ld      r4,80(r9)
     1ae4:	2f a4 00 00 	cmpdi   cr7,r4,0
     1ae8:	40 fe ff c8 	bne+    cr7,1ab0 <drm_dp_aux_register+0x54>
		return dev->init_name;

	return kobject_name(&dev->kobj);
     1aec:	e8 89 00 00 	ld      r4,0(r9)
     1af0:	4b ff ff c0 	b       1ab0 <drm_dp_aux_register+0x54>
     1af4:	60 00 00 00 	nop
     1af8:	60 00 00 00 	nop
     1afc:	60 00 00 00 	nop
		drm_dp_aux_init(aux);
     1b00:	7f e3 fb 78 	mr      r3,r31
     1b04:	48 00 00 01 	bl      1b04 <drm_dp_aux_register+0xa8>
			1b04: R_PPC64_REL24	drm_dp_aux_init
     1b08:	4b ff ff 88 	b       1a90 <drm_dp_aux_register+0x34>
     1b0c:	60 00 00 00 	nop
	WARN_ON_ONCE(!aux->drm_dev);
     1b10:	0f e0 00 00 	twui    r0,0
     1b14:	4b ff ff 70 	b       1a84 <drm_dp_aux_register+0x28>



> 
> Regards,
> Wu Hoi Pok
> 
> 
> On Tue, Oct 1, 2024 at 12:26 PM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>
>> On 30 September 2024 3:27pm, Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> ﻿+ Wu Hoi Pok
>>
>> This is likely related to the drm device rework.
>>
>> Alex
>>
>> —————-
>>
>> Hi All,
>>
>> I was able to revert the drm-next-2024-09-19 updates for the RC1 of kernel 6.12.
>>
>> This kernel works on all machines without any problems.
>>
>> This means, the new Radeon DRM driver is unreliable after the DRM rework.
>>
>> Please fix this issue because we can’t deliver the kernels with the new Radeon DRM driver.
>>
>> Error log: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.xenosoft.de%2FPuTTY_P5040_U-Boot.log&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C9b40f906e2f2493cb25908dce211ee23%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638633814783011669%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C%7C&sdata=fgAj0osIOyJtNrzUKp%2Bpq0NN1sGW2bqGm8nXYj88Ne0%3D&reserved=0
>>
>> Thanks,
>> Christian

