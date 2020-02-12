Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D17915AB5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 15:52:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HjKQ5pljzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 01:52:10 +1100 (AEDT)
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
 header.s=mail header.b=YTdEmJUk; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HjHC1HZWzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 01:50:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48HjH61MtRz9tyGJ;
 Wed, 12 Feb 2020 15:50:10 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YTdEmJUk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5RjadGcG7HrB; Wed, 12 Feb 2020 15:50:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48HjH604Q1z9tyGH;
 Wed, 12 Feb 2020 15:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581519010; bh=LBWMl894vJ7EAcT3mNEJhOk9WBnw1O2BGFy/5mVsvQI=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=YTdEmJUkUYPjOWKfvbihiULUY/+lpmDckGhtcE2vkeGLUDUqkzK+jEQuQRd1TAS6s
 7+0PAN2X58D7x8ODTQ1zXc16Kcf3PxXEN1WQgXiihVdoT8z0aNI/GVwlcFFKGKr6eJ
 bZjG/zfT90wiZp7ReSx9vwD5DUC0NjlQGPgX3Wfk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DD528B81A;
 Wed, 12 Feb 2020 15:50:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BMQgy6qvhP4D; Wed, 12 Feb 2020 15:50:11 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02CC68B80D;
 Wed, 12 Feb 2020 15:50:10 +0100 (CET)
Subject: Re: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
 boot anymore
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Li Yang
 <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
Message-ID: <aee10440-c244-7c93-d3bb-fd29d8a83be4@c-s.fr>
Date: Wed, 12 Feb 2020 14:50:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
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



On 02/12/2020 02:24 PM, Christophe Leroy wrote:
> Hi Rasmus,
> 
> Kernel 5.6-rc1 silently fails on boot.
> 
> I bisected the problem to commit b6231ea2b3c6 ("soc: fsl: qe: drop 
> broken lazy call of cpm_muram_init()")
> 
> I get a bad_page_fault() for an access at address 8 in 
> cpm_muram_alloc_common(), called from cpm_uart_console_setup() via 
> cpm_uart_allocbuf()
> 
> Reverting the guilty commit on top of 5.6-rc1 is not trivial.
> 
> In your commit text you explain that cpm_muram_init() is called via 
> subsys_initcall. But console init is done before that, so it cannot work.
> 
> Do you have a fix for that ?
> 

The following patch allows powerpc 8xx to boot again. Don't know if 
that's the good place and way to do the fix though.

---
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c 
b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index 4cabded8390b..341d682ec6eb 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -1351,6 +1351,7 @@ static int __init cpm_uart_console_setup(struct 
console *co, char *options)
  		clrbits32(&pinfo->sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
  	}

+	cpm_muram_init();
  	ret = cpm_uart_allocbuf(pinfo, 1);

  	if (ret)

---
Christophe
