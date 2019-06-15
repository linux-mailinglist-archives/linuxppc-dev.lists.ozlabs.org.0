Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3547075
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 16:38:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45R0TL6VPdzDrhR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 00:38:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45R0R4358ZzDrgt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 00:36:30 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45R0Qp6Gd5z1rWTY;
 Sat, 15 Jun 2019 16:36:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45R0Qp5Wgzz1qqkh;
 Sat, 15 Jun 2019 16:36:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CV3ATwZ73GD7; Sat, 15 Jun 2019 16:36:17 +0200 (CEST)
X-Auth-Info: WeiuE3FkP22bpwRZXiPgSc5kxd0EGyhb2xJKE3Lx5DsQLNHL9KEEXkKT6N7vRlPZ
Received: from igel.home (ppp-46-244-181-62.dynamic.mnet-online.de
 [46.244.181.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 15 Jun 2019 16:36:17 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 98FE02C0C9A; Sat, 15 Jun 2019 16:36:15 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/mm/32s: only use MMU to mark initmem NX if
 STRICT_KERNEL_RWX
References: <cover.1550775950.git.christophe.leroy@c-s.fr>
 <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
 <8736kb9fry.fsf_-_@igel.home>
 <20190615152559.Horde.0lTFIZALxZ-RI75z94G3jA8@messagerie.si.c-s.fr>
X-Yow: I'm using my X-RAY VISION to obtain a rare glimpse of the
 INNER WORKINGS of this POTATO!!
Date: Sat, 15 Jun 2019 16:36:15 +0200
In-Reply-To: <20190615152559.Horde.0lTFIZALxZ-RI75z94G3jA8@messagerie.si.c-s.fr>
 (Christophe Leroy's message of "Sat, 15 Jun 2019 15:25:59 +0200")
Message-ID: <87pnne9aqo.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-kernel@vger.kernel.org, j.neuschaefer@gmx.net,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jun 15 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Andreas Schwab <schwab@linux-m68k.org> a écrit :
>
>> If STRICT_KERNEL_RWX is disabled, never use the MMU to mark initmen
>> nonexecutable.
>
> I dont understand, can you elaborate ?

It breaks suspend.

> This area is mapped with BATs so using change_page_attr() is pointless.

There must be a reason STRICT_KERNEL_RWX is not available with
HIBERNATE.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
