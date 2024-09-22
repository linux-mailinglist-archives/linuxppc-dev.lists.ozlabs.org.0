Return-Path: <linuxppc-dev+bounces-1511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20E97E06B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 09:11:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBHNK3QlPz2xdR;
	Sun, 22 Sep 2024 17:11:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726989072;
	cv=pass; b=M/iW41S6eNCp8l/h5pCWvKXDkRzrL2EjaQ5uBHcUQRW9ydXilE87pB8H/KNKKh94yNXISqsACR6VWE7fyaY/x7DGKfURttRZrxhIRs5llFwcBA8xvGlrXRNTh07rhVI+FYNwxZqPdgBEqw/MBy8ZYoXoMaN6eSs3or0jnlOucdCqVMU8Bez4vE1GdXXUP+xSU7lCzoIMpnca1iUvhA2KG4dyTESaJB6OTQTO9dY6WL+rpnLtovFk8Zn6jkRCOCRNO1GAyPyL8t6jF0X8bCO/X7OGKHqw/BYkYV5yU7IojBxpDphqVci5mx920x/vEV5f+3a8qgT8lBCXEI6GCmoCtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726989072; c=relaxed/relaxed;
	bh=XT2btQo2l2+uW+7fLGuafe13KGjmlesHpzO33/mJsnw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CjY0cdaXT3zlssmhlT+MU2h8hlpJzsDQ6ecDWWv+krB/nRm/GUhghRjTKgAxKVKM2BsYG/fRNE3lapKVRlpiVomcCh9gGRs7vRxCgTelS3Z8f07vE4Fm87/fKj55NwWnaRJOf05w2pDvlZ4Xc6O1Df+/5VebQlmRULR5GZOXIJeuYvnYQPsXpQ2v1ud6A7cUuEP9hRe/+7y9brvB6itNxKN7fIwmJ3Tuv64ukv4geduak+3ds4MsZpnvvelBdOEeYLU5fVcI4rA3v2c/MAlX7TLZYTsQLwwYmWFgbMklAltDjmKCICxSHNfx5DZblsZgKdHwVicVg9Qb5WAL5IqC4g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dHRjowmc; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=6o0N9nOr; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dHRjowmc;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=6o0N9nOr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBHNF6R7Dz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 17:11:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1726989038; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LwkzdSEPnPZgkpeJCgnVcpyf2T7P+D8skDgfU9PiGAZnMgMVi/TnGso+OmrPeE+tiZ
    bZ9cTx1/snAZoXWgZ3usUjz2SoIfxhlKRziBlfZemr13oY5JRyE18k3xEqLhnaz1A1FV
    5GjbL5lHWv2+t0ax9PN3LlaFN5d3m+4m9V58Jjtigs+KmVQMFuGtlq+BBV2snurvrsaj
    vDoY0E73lD84KpIV9v5AkV+IMphLT35RTClD1ru60vA244wAAoNuK1eowTmYCyafedVR
    PWRRuF+FK0eTBZ8P1zlMQllEI7y5dQt0bY5zlbVmvrt85s9pZ+eTTP5Hv87k73fWjrjQ
    W1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726989038;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=XT2btQo2l2+uW+7fLGuafe13KGjmlesHpzO33/mJsnw=;
    b=Ft69fqukilDJ/i6RVShemo3vhQLQL4/mQKNHCiSoCqV+Iun2KC7GiQXhgLz/G+CVd4
    NMxpxhMfQm3kv9oy1UXcWP5cxPsAnqWXlUCurWVpoTp0WIdy1VZzt4gjR7lLtshatgCg
    GBbMiyLmP2UheI7S0FPZIpzsr4/X27l9etk5nbO6v444U0c1ZzwlIRm0byD5qeKMP3qP
    SYr5er5hR2TJHcDWC+3prh8V5/6jDx5nVLud2rInfmSVWzriYCjxrDMf2BUujipR/yxc
    gheBKbQLKXk8q369NZGebDclJk97f5VfcF+2bAX07zRueJy0MGEQQBziLvcftCuo5vmU
    Yiew==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726989038;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=XT2btQo2l2+uW+7fLGuafe13KGjmlesHpzO33/mJsnw=;
    b=dHRjowmcfLwXH9Hh7gZtcEA9vIMPSv6+stlbXeEozDHSPen/23O03A3pGLXEN/Ho2m
    6DxiOInek296UgwIXz7VKGc0EHTS/oOpkNQNMeIDbcCxlzb5niV9xSqY7cGgQWElJrhn
    YbdCe8HWewkLh3jo005wmpDSJTp7BZulXr6OgzL3mFuFWUjG8PMfCDTm7uuROhuOJqEa
    r2ik0ImKGIwxBiJ8HkcLMz8Lwqlzf1bGs9zf8GBsrele1v56LgeTdco30VnOD6LmFveB
    omo9Lm2o2gTciV60irxwLF2HhuXdf9T53rFXRbltK1Jj511UCChhFBB2vCdaoA2c4s28
    ZFvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726989038;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=XT2btQo2l2+uW+7fLGuafe13KGjmlesHpzO33/mJsnw=;
    b=6o0N9nOreYK/jIEFOTJitb3kmAFnjiJCd2xSN+ylMcq4wUCvz8PD2qOFenSQwcZqKW
    31efDkINeEXEVlWZ3QBA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz46lpM="
Received: from [192.168.178.134]
    by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
    with ESMTPSA id e0da1a08M7Aa2TW
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 22 Sep 2024 09:10:36 +0200 (CEST)
Message-ID: <7525c876-4dff-4f63-b96d-98435c24dee8@xenosoft.de>
Date: Sun, 22 Sep 2024 09:10:35 +0200
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
Subject: [PPC] Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au
References: <f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de>
 <ac6ced8f-d063-433a-8660-73ced7d18dd4@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <ac6ced8f-d063-433a-8660-73ced7d18dd4@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22 September 2024 at 08:48 am, Christian Zigotzky wrote:
> On 21 September 2024 at 06:15 am, Christian Zigotzky wrote:
>> Hi All,
>>
>> The lastest Git kernel doesn't boot anymore after the latest DRM 
>> updates (drm-next-2024-09-19). [1]
>>
>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD 
>> Radeon HD 5870 (Cypress XT).
>>
>> I reverted the DRM updates and after that the kernel boots without 
>> any problems.
>>
>> Please note: Due to a lack of time, I can't do a bisect.
>>
>> Please check the latest DRM updates.
>>
>> Thanks,
>> Christian
>>
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=de848da12f752170c2ebe114804a985314fd5a6a
>>
>>
>>
> I replaced the new Radeon DRM driver from the Git kernel with the 
> Radeon DRM driver from the kernel 6.11. (cp -R 
> linux-6.11/drivers/gpu/drm/radeon a/drivers/gpu/drm/)
>
> It compiles without any problems but unfortunately the kernel doesn't 
> boot either.
>
> Have you tested the new Radeon DRM driver with AMD Radeon graphics cards?
Maybe this is the issue (included in the latest DRM updates - 
drm-next-2024-09-19): 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/arch/powerpc/kernel/nvram_64.c?id=de848da12f752170c2ebe114804a985314fd5a6a

+ linuxppc-dev
+ Christophe Leroy
+ Michael Ellerman

