Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3868515AAF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 15:27:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HhmL2JdTzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 01:26:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=E4jQh+u/; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hhjm4VhkzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 01:24:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Hhjc2VPgz9txMl;
 Wed, 12 Feb 2020 15:24:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=E4jQh+u/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vgRppl4aZR85; Wed, 12 Feb 2020 15:24:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Hhjc1JJvz9txMj;
 Wed, 12 Feb 2020 15:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581517476; bh=igqAQ6RyNRhDBT/cqa7dKxQJPcmonCFpfGNLvOYs5Ag=;
 h=From:Subject:To:Cc:Date:From;
 b=E4jQh+u/E2Y2/69w0EdD7SYH455XnezpEG1HAgq2DEV4PDSPitdhFI8oyHoI9VzBy
 R0F1q3WUTgldY3k0NYDh6shv/9PlBFzYD/EvuYk0rvwInhtsnxW251BU6mjk0MGU63
 2Dz00a7ahBfUa8gYFCt53SmqAN0Sk6MQjMjZ8bEc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66A498B81A;
 Wed, 12 Feb 2020 15:24:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j91gDLBU-b-L; Wed, 12 Feb 2020 15:24:37 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D1F38B80D;
 Wed, 12 Feb 2020 15:24:37 +0100 (CET)
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't boot
 anymore
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Li Yang
 <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
Date: Wed, 12 Feb 2020 14:24:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rasmus,

Kernel 5.6-rc1 silently fails on boot.

I bisected the problem to commit b6231ea2b3c6 ("soc: fsl: qe: drop 
broken lazy call of cpm_muram_init()")

I get a bad_page_fault() for an access at address 8 in 
cpm_muram_alloc_common(), called from cpm_uart_console_setup() via 
cpm_uart_allocbuf()

Reverting the guilty commit on top of 5.6-rc1 is not trivial.

In your commit text you explain that cpm_muram_init() is called via 
subsys_initcall. But console init is done before that, so it cannot work.

Do you have a fix for that ?

Thanks
Christophe

NB: Next time, can you please copy powerpc mailing list when changing 
such core parts of powerpc CPUs ?
