Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34065C31E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 16:38:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmcMl0Z25z3cFT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 02:38:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
X-Greylist: delayed 342 seconds by postgrey-1.36 at boromir; Wed, 04 Jan 2023 02:38:14 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmcMB4pMnz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 02:38:14 +1100 (AEDT)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4NmcDP17jqz1s949;
	Tue,  3 Jan 2023 16:32:19 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4NmcDM1qs5z1qqlR;
	Tue,  3 Jan 2023 16:32:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id Dv2lDKDmanx1; Tue,  3 Jan 2023 16:32:18 +0100 (CET)
X-Auth-Info: /F+EuFmgr7aU0+FD4YuS2yj3yclsQzbVJIAlzLokXeN++rSCIBqoz2a63SYZVCfT
Received: from igel.home (aftr-62-216-205-97.dynamic.mnet-online.de [62.216.205.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  3 Jan 2023 16:32:18 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 498742C1555; Tue,  3 Jan 2023 16:32:18 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Fix a wrong version calculation issue in
 ld_version
References: <20230103095740.916038-1-ojaswin__39223.4750370093$1672743051$gmane$org@linux.ibm.com>
X-Yow: FIRST, I'm covering you with OLIVE OIL and PRUNE WHIP!!
Date: Tue, 03 Jan 2023 16:32:18 +0100
In-Reply-To: <20230103095740.916038-1-ojaswin__39223.4750370093$1672743051$gmane$org@linux.ibm.com>
	(Ojaswin Mujoo's message of "Tue, 3 Jan 2023 15:27:40 +0530")
Message-ID: <875ydneirh.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jan 03 2023, Ojaswin Mujoo wrote:

> If version is of the form x.y.z and length(z) == 8, then most probably
> it is a date [yyyymmdd]. As an approximation, discard the dd and yyyy
> parts and keep the mm part in the version.

I don't think any part of the date should be mixed into the computed
version.  It just means that it's a snapshot from after the 2.37
release, so it should be treated like 2.37 (no further releases has been
made from this branch).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
