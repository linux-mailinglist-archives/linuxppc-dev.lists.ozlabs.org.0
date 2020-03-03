Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E85E51782DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 20:09:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X65H6Bz0zDqXP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 06:09:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Mar 2020 06:08:06 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48X63V2hlJzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 06:08:05 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48X5rF3kTjz1rfpm;
 Tue,  3 Mar 2020 19:58:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48X5rF2LHZz1qyDy;
 Tue,  3 Mar 2020 19:58:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id I6yz9QSyHTDe; Tue,  3 Mar 2020 19:58:20 +0100 (CET)
X-Auth-Info: mMuh2NPXrbgpI9l5wSYLd6DyQqtKQ/cYVQr5g6TtkvmnFblEHT0brLheGgEhEqwg
Received: from igel.home (ppp-46-244-184-188.dynamic.mnet-online.de
 [46.244.184.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  3 Mar 2020 19:58:20 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id DFB642C0FF3; Tue,  3 Mar 2020 19:58:19 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
References: <20200303125046.5157-1-wsa@the-dreams.de>
X-Yow: ..  Do you like ``TENDER VITTLES?''?
Date: Tue, 03 Mar 2020 19:58:19 +0100
In-Reply-To: <20200303125046.5157-1-wsa@the-dreams.de> (Wolfram Sang's message
 of "Tue, 3 Mar 2020 13:50:46 +0100")
Message-ID: <87d09tw9is.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Mathieu Malaterre <malat@debian.org>,
 debian-powerpc@lists.debian.org, linux-i2c@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mär 03 2020, Wolfram Sang wrote:

> sound/aoa/codecs/onyx.c
> sound/aoa/codecs/tas.c

These are loaded explicitly via request_module (as snd-aoa-codec-%s).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
