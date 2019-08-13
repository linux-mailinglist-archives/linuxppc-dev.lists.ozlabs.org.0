Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 298048ADF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 06:43:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4670Tg4SbLzDqNt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 14:43:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="MJUg8Qcq"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4670RL333yzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 14:41:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4670RC2FPQz9v1VL;
 Tue, 13 Aug 2019 06:41:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MJUg8Qcq; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OYZtCG8COW2R; Tue, 13 Aug 2019 06:41:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4670RC0xVpz9v1SR;
 Tue, 13 Aug 2019 06:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565671287; bh=mFjr2W6KC5v33j9Skz0AXA+ozawGYVEx6VDe5ntf+O8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=MJUg8QcqtgZ9cJ9o2qzYPijV1PUjPCSlcGs/MNNWcjtzTqBJfacu3NAMosXPdzZU+
 aNIkfB9QryR1lXiaphxAjvDtth2yGRzKt4ewwsxtrXvL/stm23/EmvEYlWNul7nT4O
 XLxs0N7N++xJ4lZIW3eVvmZVIwG1vI6YlbPrfqtE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF2268B79D;
 Tue, 13 Aug 2019 06:41:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6tIsM8rWN2WH; Tue, 13 Aug 2019 06:41:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C108C8B79A;
 Tue, 13 Aug 2019 06:41:27 +0200 (CEST)
Subject: Re: Freeze on ppc32 MPC8248 board with 5.2 kernel
To: Doug Crawford <doug.crawford@intelight-its.com>,
 linuxppc-dev@lists.ozlabs.org
References: <CAESxVDiyXu+=6+YmLej3K=i55h3=Z9JLA8JgrDn3fEQGUuSq7Q@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b0fdb52f-7a30-dcc7-5ec3-e01dd9bd1d44@c-s.fr>
Date: Tue, 13 Aug 2019 06:41:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAESxVDiyXu+=6+YmLej3K=i55h3=Z9JLA8JgrDn3fEQGUuSq7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Doug,

Le 26/07/2019 à 00:30, Doug Crawford a écrit :
> We have a ppc32 MPC8248 board that is working perfectly with the 4.19 
> kernel.
> We have noticed two issues with the 5.2 kernel:

  Have you tried 5.0 and 5.1 ?

> 
> 1) If the new CONFIG_PPC_KUAP (kernel userspace access protection) is 
> enabled the kernel freezes right after initializing all the drivers and 
> just before starting /sbin/init.

Can you provide your .config ?

Can you also provide the output of the boot console ?

> 
> 2) If CONFIG_PPC_KUAP is disabled the system starts up, but any user 
> space program will hang indefinitely after calling the GCC atomic 
> "__sync_bool_compare_and_swap".  This happens when nginx starts.  The 
> same nginx binary works fine on a 4.19 kernel.

Can you provide 'dmesg' ?

What version of GCC do you use ?

Have you tried a simple program doing nothing else than 
__sync_bool_compare_and_swap() ?

Can you provide a disassembly of the function that uses 
__sync_bool_compare_and_swap() ?

Thanks
Christophe
