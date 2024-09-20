Return-Path: <linuxppc-dev+bounces-1483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F197D0A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 06:39:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X906b5Lz2z2xmS;
	Fri, 20 Sep 2024 14:39:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726807191;
	cv=none; b=VgKzbVJSNT7b5legcJrdr0BRzodEZLEsHje4cNNyX+1Wl4uUT3Z8cacZ24OQr+MhX9Pl7lPjlNxi6nU+Q1FDIokhVIMKTsWAB/g2o9XKTxlGGH31ecQb9t64uQxAwWJ9dzDMEVQr2+pTaGl91akpIhKSfo1tvj07jCUi/EikfjjQ6Qyuih9gQ/1PoHijwx9LC4UGcKPQ6Mxwd7AUKQu+KifqXS3oaWT909orFGWC0BT7JeML8nAUfzgc/SoCP3esIjLPh8vRItk6a+ZuU2EE9xtVE0hVsSukmZviNyIL/XAMtu8YBTJ0RL/M6g2FzT/4Qvc9oKdXUQP2xVYIUvK5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726807191; c=relaxed/relaxed;
	bh=k9I7vIfurpu3x+iGoxOGf41hy1jUkYZYbEg6iWRhuos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNU9pGtBt980iwasmzw8ntpT5ch+qXhMZWsx8RHCP2tUBgF2hME/swT5M5t44NA7PMmgZQIqcGVrg4PpPmdxbaxYg+qKvTYPlLkL8PCsYTYNb+trL87Y7MG/jiVpBFrnseGdtVaGiGk/mmQemE1Nxs4RSBTnZNLO5FQ5S8khAcuKBW5FrJVE+XaYosyWvH+OCPCsFpwRFVtwmvOkSeAwYBNbhoShs1L8ERRFn+t3I+3HVmOQKj6bmQLRgtvGET8wUdQ2IpB9TKHZGHomY3tC3I5fu/UXwLpyjxgs+Eaz7K0J1+XCEjezB37jE+fbyRneUUTeW493Iiew+T697EmnvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X906b30dxz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 14:39:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X906V0fmwz9tQt;
	Fri, 20 Sep 2024 06:39:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ymi_91jrfNxu; Fri, 20 Sep 2024 06:39:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X906T6xlbz9tQs;
	Fri, 20 Sep 2024 06:39:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA5DC8B77E;
	Fri, 20 Sep 2024 06:39:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kx9Rv68JWcBg; Fri, 20 Sep 2024 06:39:45 +0200 (CEST)
Received: from [192.168.232.48] (unknown [192.168.232.48])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 835818B77D;
	Fri, 20 Sep 2024 06:39:45 +0200 (CEST)
Message-ID: <43c154fc-163d-4741-9b43-0947ea83e54d@csgroup.eu>
Date: Fri, 20 Sep 2024 06:39:44 +0200
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
Subject: Re: [FSL P50x0] [GIT KERNEL] [VDSO] compiling issue
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Trevor Dickinson <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>
References: <de2d1e74-52e5-4d74-8228-4aaea61cad51@xenosoft.de>
 <0C6E937D-A322-4B76-96E8-2C239241F049@xenosoft.de>
 <874j6bndz3.fsf@mail.lhotse>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <874j6bndz3.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 20/09/2024 à 06:30, Michael Ellerman a écrit :
> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>> Hi All,
>>
>> The compiling of the latest Git kernel doesn’t work anymore for our FSL P5020/P5040 boards [1] since the random-6.12-rc1 updates [2].
>>
>> Error messages:
>>
>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>>
>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75: arch/powerpc/kernel/vdso/vdso32.so.dbg]
>>
>> Reverting of the vdso updates has solved the compiing issue.
>>
>> Could you please check the random-6.12-rc1 updates? [2]
>>
>> Thanks,
>> Christian
>>
>> [1] https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwiki.amiga.org%2Findex.php%3Ftitle%3DX5000&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ce6f19b86406f4cd847f508dcd92d0a13%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638624034682015871%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=VyrTeeljcPlZqFqPSu2unkEoxrEB9%2FCCDdOnIr7CvG4%3D&reserved=0
>>
>> [2] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3D4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ce6f19b86406f4cd847f508dcd92d0a13%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638624034682033680%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=EU8R%2BOEIQUWivXDhkcdwvyUfGqR13%2FOAlm3VUntSblk%3D&reserved=0
>>
>> + Kernel config
>>
>> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fchzigotzky%2Fkernels%2Frefs%2Fheads%2Fmain%2Fconfigs%2Fx5000_defconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ce6f19b86406f4cd847f508dcd92d0a13%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638624034682046602%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=r9CQKH74EJx%2B74Yniufx%2BFgvPSJVlGgFrvMma1K9Uaw%3D&reserved=0
> 
> Your config has:
> 
>    # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
>    CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> 
> But all our defconfigs use CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE. Which
> explains why we didn't catch this in build testing. I've added a build
> with OPTIMIZE_FOR_SIZE=y so hopefully we'll catch any similar errors in
> future.
> 

And I sent a patch to fix it:

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/aded2b257018fe654db759fdfa4ab1a0b5426b1b.1726772140.git.christophe.leroy@csgroup.eu/

Christophe

