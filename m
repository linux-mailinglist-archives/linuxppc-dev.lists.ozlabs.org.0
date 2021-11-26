Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3133045E791
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 06:49:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0kMP0JX4z3cRg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 16:49:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0kLy4WRJz2xv5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 16:48:40 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0kLs32pFz9sSM;
 Fri, 26 Nov 2021 06:48:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxVCKAO1sD1d; Fri, 26 Nov 2021 06:48:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0kLs1yldz9sSL;
 Fri, 26 Nov 2021 06:48:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D1C38B768;
 Fri, 26 Nov 2021 06:48:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Wdy7xI6fAQoi; Fri, 26 Nov 2021 06:48:37 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2E018B763;
 Fri, 26 Nov 2021 06:48:36 +0100 (CET)
Message-ID: <0dc1af93-3b5f-6147-359a-33980591c73f@csgroup.eu>
Date: Fri, 26 Nov 2021 06:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: linux-next: runtime warnings from qemu run
Content-Language: fr-FR
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20211126161747.1f7795b0@canb.auug.org.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211126161747.1f7795b0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2021 à 06:17, Stephen Rothwell a écrit :
> Hi all,
> 
> My qemu boot test (pseries_le_defconfig) produces these new messages:
> 
> code-patching: test failed at line 444
> code-patching: test failed at line 447
> code-patching: test failed at line 450
> code-patching: test failed at line 453
> code-patching: test failed at line 456
> code-patching: test failed at line 461
> code-patching: test failed at line 466
> code-patching: test failed at line 471
> code-patching: test failed at line 476
> code-patching: test failed at line 493
> code-patching: test failed at line 533
> code-patching: test failed at line 536
> code-patching: test failed at line 539
> code-patching: test failed at line 542
> code-patching: test failed at line 545
> code-patching: test failed at line 553
> code-patching: test failed at line 558
> code-patching: test failed at line 563
> code-patching: test failed at line 568
> code-patching: test failed at line 585
> code-patching: test failed at line 605
> code-patching: test failed at line 609
> code-patching: test failed at line 618
> code-patching: test failed at line 619
> code-patching: test failed at line 620
> code-patching: test failed at line 629
> code-patching: test failed at line 630
> code-patching: test failed at line 631
> code-patching: test failed at line 640
> code-patching: test failed at line 641
> code-patching: test failed at line 650
> code-patching: test failed at line 651
> code-patching: test failed at line 661
> code-patching: test failed at line 665
> code-patching: test failed at line 675
> code-patching: test failed at line 676
> code-patching: test failed at line 677
> code-patching: test failed at line 687
> code-patching: test failed at line 688
> code-patching: test failed at line 689
> code-patching: test failed at line 699
> code-patching: test failed at line 700
> code-patching: test failed at line 710
> code-patching: test failed at line 711
> 
> Maybe caused by commit
> 
>    8b8a8f0ab3f5 ("powerpc/code-patching: Improve verification of patchability")

Yes, Nic proposed a series to fix that: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211126032249.1652080-1-npiggin@gmail.com/


> 
> As an presumably unrelated aside, we seem to be using a bit more stack
> space as well
> 
> - mount (54) used greatest stack depth: 12512 bytes left
> - mount (55) used greatest stack depth: 12032 bytes left
> + mount (54) used greatest stack depth: 10608 bytes left
> 
