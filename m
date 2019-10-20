Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E921FDDF40
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 17:47:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46x40b5gnhzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 02:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46x3yg5rvpzDq6q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 02:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46x3yg2qbvz8tSM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 02:46:03 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46x3yg2LZKz9sPL; Mon, 21 Oct 2019 02:46:03 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 46x3yf1ntVz9sPK
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Oct 2019 02:46:01 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iMDOu-0001W9-Ad; Sun, 20 Oct 2019 17:45:48 +0200
Date: Sun, 20 Oct 2019 17:45:45 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: passing NULL to clock_getres (VDSO): terminated by unexpected
 signal 11
In-Reply-To: <875zkjipra.fsf@igel.home>
Message-ID: <alpine.DEB.2.21.1910201731070.2090@nanos.tec.linutronix.de>
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 <87v9skcznp.fsf@igel.home> <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr>
 <87tv83zqt1.fsf@hase.home> <b64c367b-d1e5-bf26-d452-145c0be6e30a@c-s.fr>
 <alpine.DEB.2.21.1910201243580.2090@nanos.tec.linutronix.de>
 <875zkjipra.fsf@igel.home>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 20 Oct 2019, Andreas Schwab wrote:

> On Okt 20 2019, Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > clock_getres(NULL) is hardly valid.
> 
> Of course not, it lacks a parameter.

You know exactly what I mean.
 
> > So special casing
> >
> >     clock_getres(clock, NULL);
> >
> > just to make a test case happy is a pointless exercise which does not make
> > any sense at all.
> 
> POSIX requires it to work.

POSIX does not mention anything about the validity of the pointer handed to
clock_getres().

https://pubs.opengroup.org/onlinepubs/9699919799/

 "The clock_getres(), clock_gettime(), and clock_settime() functions shall fail if:

   [EINVAL]
     The clock_id argument does not specify a known clock."

EINVAL is the only documented error code for clock_getres(). 

Again. The VDSO is not a syscall and therefore neither address space
validation of the supplied pointer nor catching an invalid access works
like it does in a syscall.

The only invalid pointer it can catch is NULL, but that's ONE case out of a
gazillion. So what's the value of catching NULL and only NULL?

If you can come up with a solution to handle invalid pointers in the VDSO
gracefully, then I'm surely all ears.

If not then can you please explain why VDSO usage worked without pointer
validation since the time VDSO was invented more than a decade ago and just
now requires full invalid pointer handling?

Thanks,

	tglx
