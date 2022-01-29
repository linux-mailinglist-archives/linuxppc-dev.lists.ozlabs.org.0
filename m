Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645254A2D8C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 10:58:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jm8sf1MZzz30jP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 20:58:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=Ytd+bRoJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=2a01:238:438b:c500:173d:9f52:ddab:ee01; helo=phobos.denx.de;
 envelope-from=agust@denx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=Ytd+bRoJ; 
 dkim-atps=neutral
X-Greylist: delayed 455 seconds by postgrey-1.36 at boromir;
 Sat, 29 Jan 2022 20:57:54 AEDT
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jm8ry1NWWz2yPq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 20:57:54 +1100 (AEDT)
Received: from crub (p508b6e90.dip0.t-ipconnect.de [80.139.110.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BD2D78210D;
 Sat, 29 Jan 2022 10:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643449808;
 bh=wcVkdXf9yFZ5R/QSWp9DJkR9pJYiKAivTu+9LpeeBSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ytd+bRoJLgNjHWWwFhyqm9CGOLMwNRGwOafo7NDZc5AmzDdttsgAIFY3xkIjrB4Ng
 2yFd7qr/HACHUWiU85gEFaTcYLue/uJf2SV/tqzNXaY59l8Is4x8uFCwyL23LzEYTr
 8UO1Tgtyr2jAe5yU3qYG1lQhQh4uV9POl+8TdBC7clfpgLomdxDW58mjttmtnYyWiy
 MnlZ/R0j6MZQw7MonX8QU2Vu0C9nSv0TQC973aDjuYXi/axZYReZoirZRwi19FKmwl
 d40aUvl1doehfxjKifA4qIX/wzhhnuTIREplC/9kniI3LRdEAcFEtbqG51ljS9K2rv
 lDosRuD3nOpIQ==
Date: Sat, 29 Jan 2022 10:50:07 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] powerpc: platforms: 52xx: Fix a resource leak in an
 error handling path
Message-ID: <20220129105007.6dfdea45@crub>
In-Reply-To: <dec1496d46ccd5311d0f6e9f9ca4238be11bf6a6.1643440531.git.christophe.jaillet@wanadoo.fr>
References: <dec1496d46ccd5311d0f6e9f9ca4238be11bf6a6.1643440531.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, John Bonesio <bones@secretlab.ca>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 29 Jan 2022 08:16:04 +0100
Christophe JAILLET christophe.jaillet@wanadoo.fr wrote:

>The error handling path of mpc52xx_lpbfifo_probe() and a request_irq() is
>not balanced by a corresponding free_irq().
>
>Add the missing call, as already done in the remove function.
>
>Fixes: 3c9059d79f5e ("powerpc/5200: add LocalPlus bus FIFO device driver")
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>---
>Another strange thing is that the remove function has:
>	/* Release the bestcomm transmit task */
>	free_irq(bcom_get_task_irq(lpbfifo.bcom_tx_task), &lpbfifo);
>but I've not been able to find a corresponding request_irq().

This driver does not request the tx task irq itself, but a fifo
client driver can request/free tx interrupts for submitted
fifo write tasks, like mpc5200 fec and pata drivers do, so
it is okay.

>Is it dead code? Is there something missing in the probe?

No.

--
Anatolij
