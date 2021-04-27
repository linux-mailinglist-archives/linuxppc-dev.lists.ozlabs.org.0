Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87936CA52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 19:26:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV7wh5wZrz2yyj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 03:26:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV7wM5vtgz2y8C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 03:26:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FV7wF0dZ0z9sdJ;
 Tue, 27 Apr 2021 19:26:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RF203awGUF1B; Tue, 27 Apr 2021 19:26:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FV7wC2Fy3z9sdH;
 Tue, 27 Apr 2021 19:26:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A4778B827;
 Tue, 27 Apr 2021 19:26:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mcoIQKn9ZpfE; Tue, 27 Apr 2021 19:26:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F5B28B80B;
 Tue, 27 Apr 2021 19:26:18 +0200 (CEST)
Subject: Re: PPC476 hangs during tlb flush after calling /init in crash kernel
 with linux 5.4+
To: Eddie James <eajames@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <b973fa4768140021719e7cc3123ee873d8b2a3f1.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a24e9e0d-1d4f-506b-9303-4b995815d3c4@csgroup.eu>
Date: Tue, 27 Apr 2021 19:26:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b973fa4768140021719e7cc3123ee873d8b2a3f1.camel@linux.ibm.com>
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
Cc: miltonm@us.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Eddies,

Le 27/04/2021 à 19:03, Eddie James a écrit :
> Hi all,
> 
> I'm having a problem in simulation and hardware where my PPC476
> processor stops executing instructions after callling /init. In my case
> this is a bash script. The code descends to flush the TLB, and
> somewhere in the loop in _tlbil_pid, the PC goes to
> InstructionTLBError47x but does not go any further. This only occurs in
> the crash kernel environment, which is using the same kernel,
> initramfs, and init script as the main kernel, which executed fine. I
> do not see this problem with linux 4.19 or 3.10. I do see it with 5.4
> and 5.10. I see a fair amount of refactoring in the PPC memory
> management area between 4.19 and 5.4. Can anyone point me in a
> direction to debug this further? My stack trace is below as I can run
> gdb in simulation.

Can you bisect to pin point the culprit commit ?

Assuming the problem is in arch/powerpc/ , you should get the result in approx 10 steps:

[root@po15610vm linux-powerpc]# git bisect start -- arch/powerpc/
[root@po15610vm linux-powerpc]# git bisect bad v5.4
[root@po15610vm linux-powerpc]# git bisect good v4.19
Bisecting: 964 revisions left to test after this (roughly 10 steps)


Christophe
