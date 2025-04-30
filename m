Return-Path: <linuxppc-dev+bounces-8187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1DEAA4D4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 15:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znd955bTNz3bmc;
	Wed, 30 Apr 2025 23:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746019241;
	cv=none; b=K9/IK4MuSN9E2uXIy5yaInCAzmZHp6eoHmWtvNx9X856kgMEtl9WZdKLD35b4moUp/LtwxQqgT5a5b2QcvKPNjzTCmYTSUhDIF8AtTm7CASBMRkhCsBSNZtDIx/SGNDoDRmFozOz6DVQnQZJTBLelnGM2C7myRbzMJPYjprBcuPrnRBKvv263pNdMu+hMbFKBLSgq2wAGXxB1AEt49dDopRLint5yBxgBb+25DmU2R/TRUNpy1FOeNlPribPfBSliQCZn/LRZdDRDPecY8cNrphr6ePtWynZt0pPtq3QEJIW1wH0rWPLnHl8qoBxiORHqt0A7Wwj1ixqDb3J2VcXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746019241; c=relaxed/relaxed;
	bh=lap9juuf6M+H21OAhwncTzbUOlYri5ri3aKi052RfMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FphFsMpLAR3FwmAeKvm/HdfjzhsN6VbYhnPVY/XH7L8tUyS0YpnfwwzltYRsEuzy94KhimvXKP7kmHGz+IM2gPhWGyz5G1ZOLCp7i5ekCBeAxWz6cjf80RARfy7ub0kMls28oHh40sT2o2tJc1a8dOsyo+f+UfCgYwozXHV1Sk19D2dLTqxGe2u4qJfpVVSgVTvP2CUVfwSnyOZuqyUvVO/BG4aDYPgrY4H1CGdFnYDA4XX9ShpRGx+lQWwT2wpQkeEBZs8u7kJfRDw6k0Y3K790fqinRN9fefPYETJ2aWzt2lWS3j/ErpAchzSBdCFkJL1/xrO72p9tpf8fmRCtfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znd9521vxz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 23:20:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZncWW5wx6z9sB6;
	Wed, 30 Apr 2025 14:51:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Jn3jHRQJJXY; Wed, 30 Apr 2025 14:51:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZncWW58BXz9sB2;
	Wed, 30 Apr 2025 14:51:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ACE558B765;
	Wed, 30 Apr 2025 14:51:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nU_5OgwYsu31; Wed, 30 Apr 2025 14:51:35 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7227D8B763;
	Wed, 30 Apr 2025 14:51:35 +0200 (CEST)
Message-ID: <d8911b8a-94a4-4ede-8e58-8de3afeccf3f@csgroup.eu>
Date: Wed, 30 Apr 2025 14:51:35 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: segmentation fault when stepping multi-threaded application
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <DB9PR06MB7849819F8C6A43108E66C610C2812@DB9PR06MB7849.eurprd06.prod.outlook.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <DB9PR06MB7849819F8C6A43108E66C610C2812@DB9PR06MB7849.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 28/04/2025 à 13:16, Tomas Alvarez Vanoli a écrit :
> [Vous ne recevez pas souvent de courriers de tomas.alvarez-vanoli@hitachienergy.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hello, I am writing because I have a segmentation fault when remote-debugging a PPC 32-bit target with gdbserver.
> This is the same platform described in 'https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinuxppc-dev%2Fdc38afe9-6b78-f3f5-666b-986939e40fc6%40keymile.com%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C92fc720d78d3418625be08dd864ab6c1%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638814377658854956%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Vo%2BKA%2FAMnJajKrHxowApVvw1Rzp6bu3jDtC1sayJkQY%3D&reserved=0',
> although the bug does not seem to be the same and the position of the thread struct does not affect it.
> 
> The segmentation fault message is the following:
> 
> tomcli[135]: User access of kernel address (dffbdf10) - exploit attempt? (uid: 0)
> 
> 
> gdbserver is sometimes unresponsive, although sometimes I am able to kill it with CTRL+C.
> The code I use to reproduce this (tomcli) is the same as my colleague sent back in 2016:
> 
> 
> 
> This can be reproduced always by starting the debug session, stepping 5 times and then issuing a continue.
> Sometimes just a continue will do.
> This error is also happening sporadically when running our main application under gdbserver, we get a segmentation fault in dl_fixup.
> It never happens during normal runtime.
> 
> The address that the kernel complains about is coming from pt_regs->gpr[3]. This value is put in the register in a call to PTRACE_SINGLESTEP (value 9).
> 
> I poked around the ptrace code a bit, seeing if there were any possible overflows but I could not find anything, so maybe I'm barking up the wrong tree, although it does seem to be related to ptrace.
> 
> I also added a dump_stack before the "exploit attempt" message:
> 
> CPU: 3 PID: 135 Comm: tomcli Not tainted 6.1.133-00564-g0c302b26a2c4-dirty #0
> Hardware name: name,prodname e5500 0x80241021 CoreNet Generic

In the begining you say it is the same platform as the other report. 
When I follow the link I understand that platform is a 83xx.

Here it is a e5500.

Am I missing something ?

Christophe


