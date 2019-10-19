Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90720DDAB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 21:29:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wXzF4sygzDqjG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 06:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wXxL1Z2ZzDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 06:28:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46wXxK5WRPz8tvc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 06:28:05 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46wXxK4yXFz9sP4; Sun, 20 Oct 2019 06:28:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at bilbo;
 Sun, 20 Oct 2019 06:28:04 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46wXxJ2qJfz9sNx
 for <linuxppc-dev@ozlabs.org>; Sun, 20 Oct 2019 06:28:03 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46wXk356Xgz1rGS0;
 Sat, 19 Oct 2019 21:18:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46wXk34XqGz1qqkB;
 Sat, 19 Oct 2019 21:18:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SWd3PWV9uDlx; Sat, 19 Oct 2019 21:18:18 +0200 (CEST)
X-Auth-Info: shh5XOmH4/ifr6d6EL9Nc9aBZC34jcMT38nvH1HcpIDzXO4KVodVJvAkeqdmMBP2
Received: from igel.home (ppp-46-244-177-0.dynamic.mnet-online.de
 [46.244.177.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 19 Oct 2019 21:18:18 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 1A8FA2C01AB; Sat, 19 Oct 2019 21:18:18 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: passing NULL to clock_getres (VDSO): terminated by unexpected
 signal 11
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
X-Yow: I want a WESSON OIL lease!!
Date: Sat, 19 Oct 2019 21:18:18 +0200
In-Reply-To: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 (Christophe Leroy's message of "Sat, 19 Oct 2019 18:46:58 +0200")
Message-ID: <87v9skcznp.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Okt 19 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Hi Nathan,
>
> While trying to switch powerpc VDSO to C version of gettimeofday(), I'm
> getting the following kind of error with vdsotest:
>
> passing NULL to clock_getres (VDSO): terminated by unexpected signal 11
>
> Looking at commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL
> pointer checks"), it seems that signal 11 is expected when passing NULL
> pointer.
>
> Any plan to fix vdsotest ?

Passing NULL to clock_getres is valid, and required to return
successfully if the clock id is valid.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
