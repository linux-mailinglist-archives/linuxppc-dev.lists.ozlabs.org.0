Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C82E06F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 17:03:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yGwk4fFQzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 02:03:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="mK/HGwOn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yGtY5FqDzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 02:01:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46yGtQ22Khz9txrH;
 Tue, 22 Oct 2019 17:01:34 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mK/HGwOn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tf9_UKd1APc8; Tue, 22 Oct 2019 17:01:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46yGtQ0nv7z9txrG;
 Tue, 22 Oct 2019 17:01:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571756494; bh=RrCvrC+vbahkBlayl4GBmKoqI4DdfySoV4Y+ZSWbKnA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mK/HGwOnLoc0UzzC2Hj9nOwww/MqzapZxeXlaUKpVxWnFhbxfDRXFXb5CDlTnoTgs
 9AyNCr83Wn15ibyk8SFSbl5DzaqDcNbqGL+1WezDjkz/ImYGcrCus6q2TJxSI9pWum
 li8+lPLyPP2YzaKBvB7+fF6Ap8VIpgTvQ/VgXZIY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 948CE8B93A;
 Tue, 22 Oct 2019 17:01:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GLTFSSb90FVT; Tue, 22 Oct 2019 17:01:35 +0200 (CEST)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CBED8B931;
 Tue, 22 Oct 2019 17:01:35 +0200 (CEST)
Subject: Re: [PATCH 3/7] soc: fsl: qe: avoid ppc-specific io accessors
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191018125234.21825-4-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6ee121cf-0e3d-4aa0-2593-fcb00995e429@c-s.fr>
Date: Tue, 22 Oct 2019 15:01:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20191018125234.21825-4-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/18/2019 12:52 PM, Rasmus Villemoes wrote:
> In preparation for allowing to build QE support for architectures
> other than PPC, replace the ppc-specific io accessors. Done via
> 

This patch is not transparent in terms of performance, functions get 
changed significantly.

Before the patch:

00000330 <ucc_fast_enable>:
  330:	81 43 00 04 	lwz     r10,4(r3)
  334:	7c 00 04 ac 	hwsync
  338:	81 2a 00 00 	lwz     r9,0(r10)
  33c:	0c 09 00 00 	twi     0,r9,0
  340:	4c 00 01 2c 	isync
  344:	70 88 00 02 	andi.   r8,r4,2
  348:	41 82 00 10 	beq     358 <ucc_fast_enable+0x28>
  34c:	39 00 00 01 	li      r8,1
  350:	91 03 00 10 	stw     r8,16(r3)
  354:	61 29 00 10 	ori     r9,r9,16
  358:	70 88 00 01 	andi.   r8,r4,1
  35c:	41 82 00 10 	beq     36c <ucc_fast_enable+0x3c>
  360:	39 00 00 01 	li      r8,1
  364:	91 03 00 14 	stw     r8,20(r3)
  368:	61 29 00 20 	ori     r9,r9,32
  36c:	7c 00 04 ac 	hwsync
  370:	91 2a 00 00 	stw     r9,0(r10)
  374:	4e 80 00 20 	blr

After the patch:

0000030c <ucc_fast_enable>:
  30c:	94 21 ff e0 	stwu    r1,-32(r1)
  310:	7c 08 02 a6 	mflr    r0
  314:	bf a1 00 14 	stmw    r29,20(r1)
  318:	7c 9f 23 78 	mr      r31,r4
  31c:	90 01 00 24 	stw     r0,36(r1)
  320:	7c 7e 1b 78 	mr      r30,r3
  324:	83 a3 00 04 	lwz     r29,4(r3)
  328:	7f a3 eb 78 	mr      r3,r29
  32c:	48 00 00 01 	bl      32c <ucc_fast_enable+0x20>
			32c: R_PPC_REL24	ioread32be
  330:	73 e9 00 02 	andi.   r9,r31,2
  334:	41 82 00 10 	beq     344 <ucc_fast_enable+0x38>
  338:	39 20 00 01 	li      r9,1
  33c:	91 3e 00 10 	stw     r9,16(r30)
  340:	60 63 00 10 	ori     r3,r3,16
  344:	73 e9 00 01 	andi.   r9,r31,1
  348:	41 82 00 10 	beq     358 <ucc_fast_enable+0x4c>
  34c:	39 20 00 01 	li      r9,1
  350:	91 3e 00 14 	stw     r9,20(r30)
  354:	60 63 00 20 	ori     r3,r3,32
  358:	80 01 00 24 	lwz     r0,36(r1)
  35c:	7f a4 eb 78 	mr      r4,r29
  360:	bb a1 00 14 	lmw     r29,20(r1)
  364:	7c 08 03 a6 	mtlr    r0
  368:	38 21 00 20 	addi    r1,r1,32
  36c:	48 00 00 00 	b       36c <ucc_fast_enable+0x60>
			36c: R_PPC_REL24	iowrite32be


Christophe
