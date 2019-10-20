Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E66EDDDD89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 11:55:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ww9b66PVzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 20:54:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ww7r3SCwzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 20:53:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46ww7r2Nsgz8tTB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 20:53:28 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46ww7r1cPzz9sP7; Sun, 20 Oct 2019 20:53:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1;
 helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 52491 seconds by postgrey-1.36 at bilbo;
 Sun, 20 Oct 2019 20:53:26 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46ww7p6Vryz9sP6
 for <linuxppc-dev@ozlabs.org>; Sun, 20 Oct 2019 20:53:24 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46ww7d59PGz1rGRY;
 Sun, 20 Oct 2019 11:53:17 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46ww7d4lpwz1qqkD;
 Sun, 20 Oct 2019 11:53:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id QZWUZscCGTum; Sun, 20 Oct 2019 11:53:15 +0200 (CEST)
X-Auth-Info: Xo55V8iLHzsDUT5EpbrGymWMyF1ucxXSmwqxZAwXzcCrz+Asi3F5h54tZNVZm141
Received: from hase.home (ppp-46-244-172-176.dynamic.mnet-online.de
 [46.244.172.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 20 Oct 2019 11:53:15 +0200 (CEST)
Received: by hase.home (Postfix, from userid 1000)
 id CA1F1101F92; Sun, 20 Oct 2019 11:53:14 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: passing NULL to clock_getres (VDSO): terminated by unexpected
 signal 11
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 <87v9skcznp.fsf@igel.home>
 <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr>
X-Yow: Talking Pinhead Blues:
 Oh, I LOST my ``HELLO KITTY'' DOLL and I get BAD reception on
 channel TWENTY-SIX!!
 Th'HOSTESS FACTORY is closin' down and I just heard ZASU PITTS
 has been DEAD for YEARS..  (sniff)
 My PLATFORM SHOE collection was CHEWED up by th'dog, ALEXANDER
 HAIG won't let me take a SHOWER 'til Easter.. (snurf)
 So I went to the kitchen, but WALNUT PANELING whup me
 upside mah HAID!! (on no, no, no..  Heh, heh)
Date: Sun, 20 Oct 2019 11:53:14 +0200
In-Reply-To: <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr> (Christophe Leroy's
 message of "Sun, 20 Oct 2019 11:20:00 +0200")
Message-ID: <87tv83zqt1.fsf@hase.home>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Okt 20 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Le 19/10/2019 à 21:18, Andreas Schwab a écrit :
>> On Okt 19 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>>> Hi Nathan,
>>>
>>> While trying to switch powerpc VDSO to C version of gettimeofday(), I'm
>>> getting the following kind of error with vdsotest:
>>>
>>> passing NULL to clock_getres (VDSO): terminated by unexpected signal 11
>>>
>>> Looking at commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL
>>> pointer checks"), it seems that signal 11 is expected when passing NULL
>>> pointer.
>>>
>>> Any plan to fix vdsotest ?
>>
>> Passing NULL to clock_getres is valid, and required to return
>> successfully if the clock id is valid.
>>
>
> Do you mean the following commit is wrong ?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/lib/vdso?id=a9446a906f52292c52ecbd5be78eaa4d8395756c

If it causes a valid call to clock_getres to fail, then yes.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
