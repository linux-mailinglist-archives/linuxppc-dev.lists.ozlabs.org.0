Return-Path: <linuxppc-dev+bounces-1284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81449766A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 12:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4D6v2j0sz2yMD;
	Thu, 12 Sep 2024 20:23:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726136615;
	cv=none; b=doNUzRCQcbYAJTZfkMxGflkTQaHXlQMoqRarC59psngSxZZ46ieMsej01wfaQ/Kt06yOS5VAQMb2j8K6pKYHk2YRRlh7NnVxWfNZ5LZXfU2sZopkDFLMkNR1vsUzlu+2VntDuq7NylMUdEYRYX4gdNj8dFOvbSmrKNxIduS/SyfHrGJCvbYXpV9EM3G1J9f3bNy+MeJ2OzHMrhxtGt2g6DsOexcjdmIR4GOajGKGfX9N0X79XztJPcZON+D7OF+4F+HQba/NTyp0QX/4aHzrzsoC25kPP3qLPILBGd4gdXH7i3D0/5U413PMnNapz+dfJTNEnSDX8Ikb2SHUNqm3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726136615; c=relaxed/relaxed;
	bh=2fOcueOUh46OnMdFJWNoqIiFEY0Sx1ax6qiWAnSkTVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C0n4R0WVGwjNrSj1qLCpoLOidguLkTcchpG0y5ng4vLsZaWneVGBnW14bIGzdfApK6KHep080uGLzQxN6FcfK4gMtlvxXT3t8dUkCGEtuglPZTBPGLdX2krS9pclUgSFteC7Q4HMnce52d2Dsm72epAyfV4BJP59G+UGNdUA8CjcY2doNvFtNjC673UEmtokwwchn0ZHgYOyvV7rRe3ch+wz+UGUfizEEDVllrF9rSnPgde/K8zojmQ2pbR4DdntzeaD/0WtL9HRwwVbrONGYQpHS1kdd/66sdoDGjmbG9sIOB2sTgIi5yKLGOc61D/xLIaYjJvW3fnR0KC72+Mn8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4D6v0Jctz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 20:23:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4D6n6zNsz9sxD;
	Thu, 12 Sep 2024 12:23:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmIkdEF43PU9; Thu, 12 Sep 2024 12:23:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4D6n61zsz9sxC;
	Thu, 12 Sep 2024 12:23:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B7BE88B776;
	Thu, 12 Sep 2024 12:23:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v96SPtwGdzRW; Thu, 12 Sep 2024 12:23:29 +0200 (CEST)
Received: from [192.168.233.25] (unknown [192.168.233.25])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 576418B766;
	Thu, 12 Sep 2024 12:23:29 +0200 (CEST)
Message-ID: <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
Date: Thu, 12 Sep 2024 12:23:29 +0200
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
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 jialong.yang@shingroup.cn, luming.yu@gmail.com
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/09/2024 à 10:24, Luming Yu a écrit :
> From: Yu Luming <luming.yu@gmail.com>
> 
> convert powerpc entry code in syscall and fault to use syscall_work
> and irqentry_state as well as common calls from generic entry infrastructure.
> 
> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> ---
>   arch/powerpc/Kconfig                   | 1 +
>   arch/powerpc/include/asm/hw_irq.h      | 5 +++++
>   arch/powerpc/include/asm/processor.h   | 6 ++++++
>   arch/powerpc/include/asm/syscall.h     | 5 +++++
>   arch/powerpc/include/asm/thread_info.h | 1 +
>   arch/powerpc/kernel/syscall.c          | 6 +++++-
>   arch/powerpc/mm/fault.c                | 5 +++++
>   7 files changed, 28 insertions(+), 1 deletion(-)

There is another build problem:

   CC      kernel/entry/common.o
kernel/entry/common.c: In function 'irqentry_exit':
kernel/entry/common.c:335:21: error: implicit declaration of function 
'regs_irqs_disabled'; did you mean 'raw_irqs_disabled'? 
[-Werror=implicit-function-declaration]
   335 |         } else if (!regs_irqs_disabled(regs)) {
       |                     ^~~~~~~~~~~~~~~~~~
       |                     raw_irqs_disabled


You have put regs_irqs_disabled() in a section dedicated to PPC64, so it 
fails on PPC32.


After fixing this problem and providing an empty asm/entry-common.h it 
is now possible to build the kernel. But that's not enough, the board is 
stuck after:

...
[    2.871391] Freeing unused kernel image (initmem) memory: 1228K
[    2.877990] Run /init as init process


Christophe

