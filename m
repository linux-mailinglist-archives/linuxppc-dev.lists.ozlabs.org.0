Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EAF5C973
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:42:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dF6K3BXVzDqCb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:42:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cnxTqLSm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dDxc0ZjrzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 16:34:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45dDxS2gk0zB09Zq;
 Tue,  2 Jul 2019 08:34:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cnxTqLSm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3ZLBmI3WLA-0; Tue,  2 Jul 2019 08:34:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45dDxS1csQzB09Zl;
 Tue,  2 Jul 2019 08:34:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1562049292; bh=/sJsENqafwH6Ex3075vdC+N8rHq+X56rSQYLwIDpxbM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=cnxTqLSmk8Qpp0AX7p7yze3y2ozu6BInu74iYZ4w5dh+gbRf4eB6qgUUXPbGfiebQ
 DWNfePugj2074Pm0964un8f1vjgFV5Ia+xOBLAERDP68KpHtQ3AhjNYRKNrr9vLvWB
 zXlN51d+pxthnzfmHQM6AsSs07KOfYQGagmxpGb4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 03F448B7B3;
 Tue,  2 Jul 2019 08:34:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4Bjn7S8UzvuR; Tue,  2 Jul 2019 08:34:53 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C035C8B75B;
 Tue,  2 Jul 2019 08:34:53 +0200 (CEST)
Subject: Re: vmlinux.o(.text+0x40e): Section mismatch in reference from the
 variable start_here_multiplatform to the function
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3f67201a-ce23-834d-1e30-4e68bafe1261@xenosoft.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a8a2b2b0-6dfb-b921-9740-8eaf1315e458@c-s.fr>
Date: Tue, 2 Jul 2019 08:34:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3f67201a-ce23-834d-1e30-4e68bafe1261@xenosoft.de>
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



Le 02/07/2019 à 08:23, Christian Zigotzky a écrit :
> Hi All,
> 
> I get the following error messages after compiling the RC7 of kernel 5.2:
> 
> WARNING: vmlinux.o(.text+0x40e): Section mismatch in reference from the 
> variable start_here_multiplatform to the function .init.text:.early_setup()
> The function start_here_multiplatform() references
> the function __init .early_setup().
> This is often because start_here_multiplatform lacks a __init
> annotation or the annotation of .early_setup is wrong.

Harmless warning.

Fix at 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/powerpc/kernel/head_64.S?h=next-20190701&id=9c4e4c90ec24652921e31e9551fcaedc26eec86d

Will be cherry-picked by stable once merged into 4.3 I guess.

Christophe

> 
> FATAL: modpost: Section mismatches detected.
> Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
> scripts/Makefile.modpost:97: recipe for target 'vmlinux.o' failed
> make[1]: *** [vmlinux.o] Error 1
> Makefile:1052: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 2
> 
> Please find attached the kernel config.
> 
> Any hints?
> 
> Thanks,
> Christian
