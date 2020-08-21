Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6954424D153
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 11:21:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXwxR325lzDr7P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 19:21:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXwvT0Bk5zDr6Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 19:19:30 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BXwvK4SfGz1qs0H;
 Fri, 21 Aug 2020 11:19:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BXwvK3qgKz1qy63;
 Fri, 21 Aug 2020 11:19:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id F0_dCBk9PgC1; Fri, 21 Aug 2020 11:19:24 +0200 (CEST)
X-Auth-Info: xzm2TsjnGK9QJrldEjTYj5rRu9jtvPfdYQZy6A0x9whwb0PqbRObjNI3MuMTzqpI
Received: from igel.home (ppp-46-244-185-194.dynamic.mnet-online.de
 [46.244.185.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 21 Aug 2020 11:19:24 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id EAD032C0765; Fri, 21 Aug 2020 11:19:23 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix module loading failure when
 VMALLOC_END is over 0xf0000000
References: <09fc73fe9c7423c6b4cf93f93df9bb0ed8eefab5.1597994047.git.christophe.leroy@csgroup.eu>
X-Yow: HERE!!  Put THIS on!!  I'm in CHARGE!!
Date: Fri, 21 Aug 2020 11:19:23 +0200
In-Reply-To: <09fc73fe9c7423c6b4cf93f93df9bb0ed8eefab5.1597994047.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Fri, 21 Aug 2020 07:15:25 +0000
 (UTC)")
Message-ID: <874kowwe3o.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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

On Aug 21 2020, Christophe Leroy wrote:

> In is_module_segment(), when VMALLOC_END is over 0xf0000000,
> ALIGN(VMALLOC_END, SZ_256M) has value 0.
>
> In that case, addr >= ALIGN(VMALLOC_END, SZ_256M) is always
> true then is_module_segment() always returns false.
>
> Use (ALIGN(VMALLOC_END, SZ_256M) - 1) which will have
> value 0xffffffff and will be suitable for the comparison.
>
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Fixes: c49643319715 ("powerpc/32s: Only leave NX unset on segments used for modules")

Thanks, that fixes the crash.

Tested-by: Andreas Schwab <schwab@linux-m68k.org>

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
