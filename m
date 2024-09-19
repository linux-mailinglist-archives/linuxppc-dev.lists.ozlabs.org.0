Return-Path: <linuxppc-dev+bounces-1466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC86997CB83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 17:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8fH75SMGz2yF1;
	Fri, 20 Sep 2024 01:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726758963;
	cv=none; b=hGrBqc3I96f1Af4XeeH37zFxg6c2jZqNgzNdZ3cO8MwPdLZCsK0EY0oIYCHDqpL409FRKrrKlnkZl4eR85oDkE8UzF0qaMJI6SGZ4eLUy66E3Cs9PxFmdohshACgm8Ol414xhLcNUX5c7PxCwDWsCfX7lqpLTpA9/zUWQjyNrfdw8tLocWN5zIHTevXOTe7j1K9miz1jdFyGwYULxuYMq0ZECmE9k2z97xUgiraEHzHX5iA1eObUpBWYdY1iIAu5KJ5moh/Ywa3CklBbBlzC/CpA5QjaKsmAL9jK447j/DhPQ+1+z1FtvDUuw9IDwMNncXld6ZkaZYdqH+dBIlGXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726758963; c=relaxed/relaxed;
	bh=/64YFQLg5dWd0QHaRS3LIYALMVRLqGIcnTDOEMnNc4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1mFEOgyYHE71S47kyEhlI+ugWlSkBaLQznZ+2LHDntuuc87Ew4DL0A9iSkHxmxA3LZfUMa6p5wqnONY9icBThRMS5tvmlIU8pdb3zLzUx3uFIGI2FWzvLPQNeRkVTHMYqlE/8NH7ZqO7erKzq+tACkLTojdPHPb9BSlQdespSyJ+PldhRrG2H7nJngQ4LVcYexbSwGjxeEQLM2+a8msEXEt/BblUhlGea5TBWxcGjH/m/o3DiojAr4tNEMpip9MFzScAaa2DwHOBygqwq3A0GRnmgPjzAW+fmKiMFZf70D3+/uq6OJoLz32cVka5M8gqdcOIZRGhohmGcW4XNFIFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8fH735njz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 01:16:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X8fH00lMfz9tQx;
	Thu, 19 Sep 2024 17:15:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rdjj_y7Skjiu; Thu, 19 Sep 2024 17:15:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X8fH001bzz9tQw;
	Thu, 19 Sep 2024 17:15:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E25878B77E;
	Thu, 19 Sep 2024 17:15:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id IRwUsOkm0OKo; Thu, 19 Sep 2024 17:15:55 +0200 (CEST)
Received: from [192.168.234.38] (unknown [192.168.234.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EC568B77D;
	Thu, 19 Sep 2024 17:15:55 +0200 (CEST)
Message-ID: <047b7503-af0c-4bb0-b12a-2f6b1e461752@csgroup.eu>
Date: Thu, 19 Sep 2024 17:15:55 +0200
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
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Trevor Dickinson <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>
References: <de2d1e74-52e5-4d74-8228-4aaea61cad51@xenosoft.de>
 <0C6E937D-A322-4B76-96E8-2C239241F049@xenosoft.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0C6E937D-A322-4B76-96E8-2C239241F049@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

Le 19/09/2024 à 17:02, Christian Zigotzky a écrit :
> Hi All,
> 
> The compiling of the latest Git kernel doesn’t work anymore for our FSL P5020/P5040 boards [1] since the random-6.12-rc1 updates [2].
> 
> Error messages:
> 
> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
> 
> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75: arch/powerpc/kernel/vdso/vdso32.so.dbg]
> 
> Reverting of the vdso updates has solved the compiing issue.
> 
> Could you please check the random-6.12-rc1 updates? [2]
> 
> Thanks,
> Christian
> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwiki.amiga.org%2Findex.php%3Ftitle%3DX5000&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b327823a8d843f5dc8d08dcd8bc2600%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638623549830455660%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=xtne08CcJdt0jF0eir8q%2F5CeMcCv6JN4Uj4LDKqUiog%3D&reserved=0
> 
> [2] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3D4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b327823a8d843f5dc8d08dcd8bc2600%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638623549830472839%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=sVQ9FhoXe9YDrqFrwb4a1rmMlN7Kegg7z1yMQ4uAFvo%3D&reserved=0
> 
> + Kernel config
> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fchzigotzky%2Fkernels%2Frefs%2Fheads%2Fmain%2Fconfigs%2Fx5000_defconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b327823a8d843f5dc8d08dcd8bc2600%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638623549830486185%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=SQi%2B9R4TM59QB8Msxq3KuKPvvJEBMVUdyOhoY6ndzVU%3D&reserved=0
> 
> + Christophe Leroy
> + Michael Ellerman

Can you try with the following change:

diff --git a/arch/powerpc/lib/crtsavres.S b/arch/powerpc/lib/crtsavres.S
index 7e5e1c28e56a..8967903c15e9 100644
--- a/arch/powerpc/lib/crtsavres.S
+++ b/arch/powerpc/lib/crtsavres.S
@@ -46,7 +46,7 @@

  	.section ".text"

-#ifndef CONFIG_PPC64
+#ifndef __powerpc64__

  /* Routines for saving integer registers, called by the compiler.  */
  /* Called with r11 pointing to the stack header word of the caller of 
the */

