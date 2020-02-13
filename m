Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB815BD3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 12:01:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JD8l0bZdzDqRF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 22:01:27 +1100 (AEDT)
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
 header.s=mail header.b=izYpHgtw; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JD6k30qSzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 21:59:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48JD6d5y5kz9vBn1;
 Thu, 13 Feb 2020 11:59:37 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=izYpHgtw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uMT8b6FJS4mJ; Thu, 13 Feb 2020 11:59:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48JD6d4jyPz9vBn0;
 Thu, 13 Feb 2020 11:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581591577; bh=9MA4+/F5Rc+khF9eIgEqNW6jSVgDMFjfGzMXEAy8e0s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=izYpHgtwWwogvPcn9IwvaMmDsHwTyaynTNUvpD2q8ThzbV3WnssHY162X+t0bNlim
 ei8nSpZ5MUfVRK5MeDSwnq2uP+HOWXlS3V8wG3pf4LA3KTXFGN+IJQKFgv2V7PZnGm
 bU5b3Dqw8U878kQaYVBCDuCC1R4CCRkAJNVURAzI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F03AA8B83F;
 Thu, 13 Feb 2020 11:59:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pNKMcJE7jnwh; Thu, 13 Feb 2020 11:59:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DD7D8B83E;
 Thu, 13 Feb 2020 11:59:36 +0100 (CET)
Subject: Re: [PATCH 10/18] powerpc: Replace setup_irq() by request_irq()
To: afzal mohammed <afzal.mohd.ma@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <303393f75ede6d36241d41f501d9ad2a23897c3f.1581478324.git.afzal.mohd.ma@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a4f2ad65-0634-f825-b0b7-7e4cd2dc697f@c-s.fr>
Date: Thu, 13 Feb 2020 11:59:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <303393f75ede6d36241d41f501d9ad2a23897c3f.1581478324.git.afzal.mohd.ma@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/02/2020 à 09:04, afzal mohammed a écrit :
> request_irq() is preferred over setup_irq(). Existing callers of
> setup_irq() reached mostly via 'init_IRQ()' & 'time_init()', while
> memory allocators are ready by 'mm_init()'.
> 
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
> 
> Hence replace setup_irq() by request_irq().
> 
> Seldom remove_irq() usage has been observed coupled with setup_irq(),
> wherever that has been found, it too has been replaced by free_irq().
> 
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> 
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

Tested-by: Christophe Leroy <christophe.leroy@c-s.fr> # for the 8xx parts

> ---
> 
> Since cc'ing cover letter to all maintainers/reviewers would be too
> many, refer for cover letter,
>   https://lkml.kernel.org/r/cover.1581478323.git.afzal.mohd.ma@gmail.com
> 
>   arch/powerpc/platforms/85xx/mpc85xx_cds.c | 10 +++-----
>   arch/powerpc/platforms/8xx/cpm1.c         |  9 ++-----
>   arch/powerpc/platforms/8xx/m8xx_setup.c   |  9 ++-----
>   arch/powerpc/platforms/chrp/setup.c       | 14 ++++------
>   arch/powerpc/platforms/powermac/pic.c     | 31 ++++++++++-------------
>   arch/powerpc/platforms/powermac/smp.c     |  9 ++-----
>   6 files changed, 27 insertions(+), 55 deletions(-)
> 


