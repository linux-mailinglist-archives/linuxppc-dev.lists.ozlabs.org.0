Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD2DDE52
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 13:47:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wyg55yY9zDqss
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 22:47:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wycM6xpYzDqqY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 22:44:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46wycM3BgPz8tQJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 22:44:51 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46wycM1lsWz9sP7; Sun, 20 Oct 2019 22:44:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46wycK6sjwz9sCJ
 for <linuxppc-dev@ozlabs.org>; Sun, 20 Oct 2019 22:44:48 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iM9dW-00082p-0i; Sun, 20 Oct 2019 13:44:38 +0200
Date: Sun, 20 Oct 2019 13:44:37 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: passing NULL to clock_getres (VDSO): terminated by unexpected
 signal 11
In-Reply-To: <b64c367b-d1e5-bf26-d452-145c0be6e30a@c-s.fr>
Message-ID: <alpine.DEB.2.21.1910201243580.2090@nanos.tec.linutronix.de>
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 <87v9skcznp.fsf@igel.home> <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr>
 <87tv83zqt1.fsf@hase.home> <b64c367b-d1e5-bf26-d452-145c0be6e30a@c-s.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1023784424-1571571878=:2090"
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andreas Schwab <schwab@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1023784424-1571571878=:2090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 20 Oct 2019, Christophe Leroy wrote:
> Adding Thomas to the discussion as the commit is from him.
> 
> Le 20/10/2019 à 11:53, Andreas Schwab a écrit :
> > On Okt 20 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > 
> > > Le 19/10/2019 à 21:18, Andreas Schwab a écrit :
> > > > On Okt 19 2019, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > > > 
> > > > > Hi Nathan,
> > > > > 
> > > > > While trying to switch powerpc VDSO to C version of gettimeofday(),
> > > > > I'm
> > > > > getting the following kind of error with vdsotest:
> > > > > 
> > > > > passing NULL to clock_getres (VDSO): terminated by unexpected signal
> > > > > 11
> > > > > 
> > > > > Looking at commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL
> > > > > pointer checks"), it seems that signal 11 is expected when passing
> > > > > NULL
> > > > > pointer.
> > > > > 
> > > > > Any plan to fix vdsotest ?
> > > > 
> > > > Passing NULL to clock_getres is valid, and required to return
> > > > successfully if the clock id is valid.
> > > > 
> > > 
> > > Do you mean the following commit is wrong ?
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/lib/vdso?id=a9446a906f52292c52ecbd5be78eaa4d8395756c
> > 
> > If it causes a valid call to clock_getres to fail, then yes.

clock_getres(NULL) is hardly valid.

Fact is that 64bit did never check the pointer and unconditionally let the
NULL pointer dereference happen.

Also as documented in the change log, the vdso _cannot_ ever be fully
equivalent to the syscall.

The simple example:

    struct timespec *ts = (struct timespec *) 0xFF;

    clock_getres(clock, ts);

will fault in the VDSO, but not in the syscall.

VDSO can never ever guarantee that any of the clock_* functions will return
EFAULT if the provided pointer points outside of the accessible address
space, is mapped RO etc.

So special casing

    clock_getres(clock, NULL);

just to make a test case happy is a pointless exercise which does not make
any sense at all.

Thanks,

	tglx


--8323329-1023784424-1571571878=:2090--
