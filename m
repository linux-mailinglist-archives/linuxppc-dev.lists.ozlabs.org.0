Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3002478DEAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 21:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbZf930R9z3c9r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 05:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbZdb2HmWz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 05:50:11 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4RbZdC575gz1sCHT;
	Wed, 30 Aug 2023 21:49:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4RbZd83ty8z1qqlb;
	Wed, 30 Aug 2023 21:49:48 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id PaI3XmDZtnS9; Wed, 30 Aug 2023 21:49:47 +0200 (CEST)
X-Auth-Info: Pbpxk8dOWlbPEEBN/noqaoWZixAIgLuZJUPRLWT+r811XAsiT63LvvaA3kzBJABK
Received: from igel.home (aftr-62-216-205-244.dynamic.mnet-online.de [62.216.205.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 30 Aug 2023 21:49:47 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 3018C2C0D30; Wed, 30 Aug 2023 21:49:47 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v2 1/2] maple_tree: Disable mas_wr_append() when other
 readers are possible
In-Reply-To: <20230819004356.1454718-2-Liam.Howlett@oracle.com> (Liam
	R. Howlett's message of "Fri, 18 Aug 2023 20:43:55 -0400")
References: <20230819004356.1454718-1-Liam.Howlett@oracle.com>
	<20230819004356.1454718-2-Liam.Howlett@oracle.com>
X-Yow: Hmmm..  a CRIPPLED ACCOUNTANT with a FALAFEL sandwich is HIT
 by a TROLLEY-CAR..
Date: Wed, 30 Aug 2023 21:49:47 +0200
Message-ID: <87bkeotin8.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, maple-tree@lists.infradead.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This breaks booting on ppc32:

Kernel attemptd to writ user page (1ff0) - exploit attempt? (uid: 0)
BUG: Unable to handle kernel data access on write at 0x00001ff0
Faulting instruction address: 0xc0009554
Vector: 300 (Data Access) at [c0b09d10]
    pc: c0009554: do_softirq_own_stack+0x18/0x30
    lr: c004f480: __irq_exit_rcu+0x70/0xc0
    sp: c0b09dd0
   msr: 1032
   dar: 1ff0
 dsisr: 42000000
  current = 0xc0a08360
    pid   = 0, comm = swapper
Linux version 6.5.0 ...
enter ? for help
[c0b09de0] c00ff480 __irq_exit_rcu+0x70/0xc0
[c0b09df0] c0005a98 Decrementer_virt+0x108/0x10c
--- Exception: 900 (Decrementer) at c06cfa0c __schedule+0x4fc/0x510
[c0b09ec0] c06cf75c __schedule+0x1cc/0x510 (unreliable)
[c0b09ef0] c06cfc90 __cond_resched+0x2c/0x54
[c0b09f00] c06d07f8 mutex_lock_killable+0x18/0x5c
[c0b09f10] c013c404 pcpu_alloc+0x110/0x4dc
[c0b09f70] c000cc34 alloc_descr.isra.18+0x48/0x144
[c0b09f90] c0988aa0 early_irq_init+0x64/0x8c
[c0b09fa0] c097a5a4 start_kernel+0x5b4/0x7b0
[c0b09ff0] 00003dc0
mon>

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
