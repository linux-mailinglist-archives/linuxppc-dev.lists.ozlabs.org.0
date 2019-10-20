Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2119DDE5E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 14:10:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wz9m6LHbzDqvp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 23:10:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wz786hLNzDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 23:08:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46wz782SQDz8tQW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 23:08:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46wz780Rfwz9sPK; Sun, 20 Oct 2019 23:08:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46wz763xtRz9sP7
 for <linuxppc-dev@ozlabs.org>; Sun, 20 Oct 2019 23:08:00 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46wz6y5qSjz1rGRS;
 Sun, 20 Oct 2019 14:07:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46wz6y5HKMz1qqkD;
 Sun, 20 Oct 2019 14:07:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id e1RWe-jGmSRW; Sun, 20 Oct 2019 14:07:53 +0200 (CEST)
X-Auth-Info: vbfd34LA5phTeQyoeNn5o/dQVAlPZYyxSlKCUmPX9a3BrxmTCpm0VDH/V4ju2vMy
Received: from igel.home (ppp-46-244-172-176.dynamic.mnet-online.de
 [46.244.172.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 20 Oct 2019 14:07:53 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 207DF2C01E5; Sun, 20 Oct 2019 14:07:53 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: passing NULL to clock_getres (VDSO): terminated by unexpected
 signal 11
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 <87v9skcznp.fsf@igel.home>
 <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr>
 <87tv83zqt1.fsf@hase.home>
 <b64c367b-d1e5-bf26-d452-145c0be6e30a@c-s.fr>
 <alpine.DEB.2.21.1910201243580.2090@nanos.tec.linutronix.de>
X-Yow: HELLO, everybody, I'm a HUMAN!!
Date: Sun, 20 Oct 2019 14:07:53 +0200
In-Reply-To: <alpine.DEB.2.21.1910201243580.2090@nanos.tec.linutronix.de>
 (Thomas Gleixner's message of "Sun, 20 Oct 2019 13:44:37 +0200
 (CEST)")
Message-ID: <875zkjipra.fsf@igel.home>
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Okt 20 2019, Thomas Gleixner <tglx@linutronix.de> wrote:

> clock_getres(NULL) is hardly valid.

Of course not, it lacks a parameter.

> So special casing
>
>     clock_getres(clock, NULL);
>
> just to make a test case happy is a pointless exercise which does not make
> any sense at all.

POSIX requires it to work.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
