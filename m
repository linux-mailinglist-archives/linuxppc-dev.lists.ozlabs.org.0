Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDA39BDF1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 19:03:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxTcC2yNQz3bs8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 03:03:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxTbr04v0z2yX2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 03:03:01 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FxTbd6RyRz1qtQJ;
 Fri,  4 Jun 2021 19:02:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FxTbd5P6jz1qr4Q;
 Fri,  4 Jun 2021 19:02:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id z5k1day5XkLL; Fri,  4 Jun 2021 19:02:53 +0200 (CEST)
X-Auth-Info: aPveupBFrQC4TAiwyGiMQU+yY7PQfBpu7J/bpb4noQCrgLVLfIi6p90pzAqFn3vx
Received: from igel.home (ppp-46-244-187-150.dynamic.mnet-online.de
 [46.244.187.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  4 Jun 2021 19:02:52 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 807A12C3629; Fri,  4 Jun 2021 19:02:52 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 4/4] powerpc/32: Avoid #ifdef nested with FTR_SECTION on
 booke syscall entry
References: <5ab3a517bc883a2fc905fb2cb5ee9344f37b2cfa.1622818435.git.christophe.leroy@csgroup.eu>
 <33db61d5f85146262dbe26648f8f87eca3cae393.1622818435.git.christophe.leroy@csgroup.eu>
X-Yow: I want to kill everyone here with a cute colorful Hydrogen Bomb!!
Date: Fri, 04 Jun 2021 19:02:52 +0200
In-Reply-To: <33db61d5f85146262dbe26648f8f87eca3cae393.1622818435.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Fri, 4 Jun 2021 14:54:15 +0000 (UTC)")
Message-ID: <8735tx4l6r.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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

On Jun 04 2021, Christophe Leroy wrote:

> On booke, SYSCALL_ENTRY macro nests an FTR_SECTION with a

That sentence lacks an

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
