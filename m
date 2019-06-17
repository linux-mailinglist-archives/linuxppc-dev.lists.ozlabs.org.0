Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B866A48963
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 18:55:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SHQx1l4nzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 02:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SHNn13XGzDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 02:53:57 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45SHNb67bfz1rXhF;
 Mon, 17 Jun 2019 18:53:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45SHNb4mhtz1qqkL;
 Mon, 17 Jun 2019 18:53:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EduzkY92MSM3; Mon, 17 Jun 2019 18:53:50 +0200 (CEST)
X-Auth-Info: YMFv82YrYRNRm64KwnvzFGkYeEExd5AQ+BFIz1DoP27GE4T0WOvh/3I1eDuV+NJX
Received: from igel.home (ppp-46-244-166-202.dynamic.mnet-online.de
 [46.244.166.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 17 Jun 2019 18:53:50 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 260DA2C1101; Mon, 17 Jun 2019 18:53:47 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32s: fix suspend/resume when IBATs 4-7 are used
References: <4291e0dd36aafff58bec429ac5355d10206c72d6.1560751738.git.christophe.leroy@c-s.fr>
X-Yow: Okay..  I'm going home to write the ``I HATE RUBIK's CUBE
 HANDBOOK FOR DEAD CAT LOVERS''..
Date: Mon, 17 Jun 2019 18:53:47 +0200
In-Reply-To: <4291e0dd36aafff58bec429ac5355d10206c72d6.1560751738.git.christophe.leroy@c-s.fr>
 (Christophe Leroy's message of "Mon, 17 Jun 2019 06:10:22 +0000
 (UTC)")
Message-ID: <87y32040h0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  AS      arch/powerpc/kernel/swsusp_32.o
arch/powerpc/kernel/swsusp_32.S: Assembler messages:
arch/powerpc/kernel/swsusp_32.S:109: Error: invalid bat number
arch/powerpc/kernel/swsusp_32.S:111: Error: invalid bat number
arch/powerpc/kernel/swsusp_32.S:113: Error: invalid bat number
arch/powerpc/kernel/swsusp_32.S:115: Error: invalid bat number
arch/powerpc/kernel/swsusp_32.S:117: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:119: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:121: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:123: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:143: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:145: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:147: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:149: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:151: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:153: Error: invalid bat number                  
arch/powerpc/kernel/swsusp_32.S:155: Error: invalid bat number
arch/powerpc/kernel/swsusp_32.S:157: Error: invalid bat number
make[3]: *** [arch/powerpc/kernel/swsusp_32.o] Error 1

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
