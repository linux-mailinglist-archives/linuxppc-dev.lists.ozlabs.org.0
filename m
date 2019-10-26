Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15BE5DFC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 17:55:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470lty3k1lzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 02:55:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470lrx0DSXzDqmd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 02:53:52 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iOONj-0005yK-PO; Sat, 26 Oct 2019 17:53:35 +0200
Date: Sat, 26 Oct 2019 17:53:34 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
In-Reply-To: <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
Message-ID: <alpine.DEB.2.21.1910261751140.10190@nanos.tec.linutronix.de>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
 <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
 <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-537953535-1572105215=:10190"
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-537953535-1572105215=:10190
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 22 Oct 2019, Christophe Leroy wrote:
> Le 22/10/2019 à 11:01, Christophe Leroy a écrit :
> > Le 21/10/2019 à 23:29, Thomas Gleixner a écrit :
> > > On Mon, 21 Oct 2019, Christophe Leroy wrote:
> > > 
> > > > This is a tentative to switch powerpc/32 vdso to generic C
> > > > implementation.
> > > > It will likely not work on 64 bits or even build properly at the moment.
> > > > 
> > > > powerpc is a bit special for VDSO as well as system calls in the
> > > > way that it requires setting CR SO bit which cannot be done in C.
> > > > Therefore, entry/exit and fallback needs to be performed in ASM.
> > > > 
> > > > To allow that, C fallbacks just return -1 and the ASM entry point
> > > > performs the system call when the C function returns -1.
> > > > 
> > > > The performance is rather disappoiting. That's most likely all
> > > > calculation in the C implementation are based on 64 bits math and
> > > > converted to 32 bits at the very end. I guess C implementation should
> > > > use 32 bits math like the assembly VDSO does as of today.
> > > 
> > > > gettimeofday:    vdso: 750 nsec/call
> > > > 
> > > > gettimeofday:    vdso: 1533 nsec/call
> > 
> > Small improvement (3%) with the proposed change:
> > 
> > gettimeofday:    vdso: 1485 nsec/call
> 
> By inlining do_hres() I get the following:
> 
> gettimeofday:    vdso: 1072 nsec/call

What's the effect for clock_gettime()?

gettimeofday() is suboptimal vs. the PPC ASM variant due to an extra
division, but clock_gettime() should be 1:1 comparable.

Thanks,

	tglx
--8323329-537953535-1572105215=:10190--
