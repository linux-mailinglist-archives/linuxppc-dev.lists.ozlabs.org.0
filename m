Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089F2DE502
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:40:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBNc24f4zDqbr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBGw4X4JzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:19 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M2wCi-1kmxPC1v92-003Pjz; Fri, 18 Dec 2020 15:31:38 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: cleanup handling of bad IRQs
Date: Fri, 18 Dec 2020 15:30:59 +0100
Message-Id: <20201218143122.19459-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:GCc9gbsI9eyOCfdNmRX4o9bXX1pOCTy0AyznDchDYs0oM1Puh0V
 HaUshqI/aGp8nZ32pIa3W6umlwkDU/2qcylknjRG07xPj3Phd4Hi7sPh0w6jCYT7br8wP9r
 fsQ6guhbrEZJsPZNI8LuMeU1nvpg4pLhQC4hxQMx4DspP5teK6wAXTnJgWzY/Mk0t7irqLX
 kur37BKvbPWU7xvonpMrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/sbNIRVafqs=:7E0S8ysTyADzbE8lkSM6eP
 3TWEq16dIlocEj3ixPEv4zX+3uTZPLFNfZxuuLVDe5vQethUoPCGbLrF+TJzqQS6i9ZiPDOWV
 +MEyUwQsMabb9a7q9A0f4yZPbmnRvOUDPtXYvFQYiaQf8++meO3+CL9+AQCaHZpZU5Lu4zk3h
 DHvOcIL0N3IkgsS8EOQdWctpP0notp1p3/QtKqWrA0uwnQO8udkYh4oSleqescXu70z7m0miq
 aQx+1M87gYUAFYOUnCysSU1ZhyZRm3NivHaA+X1Bi0lbdEx0v1kCrv+PamjVlz+r4tOy1m2VO
 7GBJGicMrEiBxqRit0qr0sJg1PjhIfT/u0Up/KxPuvMs/TGlnv05ySaqY98K0u1+80NKHB60f
 iftFYU5etid5UzRqKbNb+YFzN9b3C5t5lHQzh4h/GALhKjmHZEoAm9bm1bb//
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com,
 linus.walleij@linaro.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org,
 gerg@linux-m68k.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, ysato@users.sourceforge.jp, jolsa@redhat.com,
 deller@gmx.de, x86@kernel.org, bgolaszewski@baylibre.com, tony@atomide.com,
 geert@linux-m68k.org, catalin.marinas@arm.com, linux-alpha@vger.kernel.org,
 arnd@arndb.de, msalter@redhat.com, jacquiot.aurelien@gmail.com,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de,
 namhyung@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, maz@kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello friends,


here's a patch queue for cleaning up the IRQ handling. Inspired by a
discussion we had on a previous patch of mine:

    "arch: fix 'unexpected IRQ trap at vector' warnings"
    https://www.spinics.net/lists/kernel/msg3763137.html

Turned out that the whole message, as it is right now, doesn't make much
sense at at all - not just incorrect wording, but also not quite useful
information. And the whole ack_bad_irq() thing deserves a cleanup anyways.

So, I've had a closer look and came to these conclusions:

1. The warning message doesn't need to be duplicated in the per architecture
   ack_bad_irq() functions. All, but one callers already do their own warning.
   Thus just adding a pr_warn() call there, printing out more useful data
   like the hardware IRQ number, and dropping all warnings from all the
   ack_bad_irq() functions.

2. Many of the ack_bad_irq()'s count up the spurious interrupts - lots of
   duplications over the various archs. Some of them using atomic_t, some
   just plain ints. Consolidating this by introducing a global counter
   with inline'd accessors and doing the upcounting in the (currently 3)
   call sites of ack_bad_irq(). After that, step by step changing all
   archs to use the new counter.

3. For all but one arch (x86), ack_bad_irq() became a no-op.

   On x86, it's just a call to ack_APIC_irq(), in order to prevent lockups
   when IRQs missed to be ack'ed on the APIC. Could we perhaps do this in
   some better place ? In that case, ack_bad_irq() could easily be removed
   entirely.

have fun,

--mtx


