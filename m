Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83B2DE659
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:17:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCCX3hvrzDqyk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBs56t2XzDr0l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:28 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5FtF-1k7Hmp0Rxl-0118Hm; Fri, 18 Dec 2020 15:58:02 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: (repost) cleaning up handling of bad IRQs
Date: Fri, 18 Dec 2020 15:57:23 +0100
Message-Id: <20201218145746.24205-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:kDy23KicY6yANCRUU/uS27W+PiA6W2GQEJc1w+ZgwWxEjEL6wp+
 O8q9sjFQjB+V0eXbRSVHReMrDSfLKWhKYaglZe/mGoKnGo+tKe78BIINCtGjVGRkQlVCPRT
 E0zs050IDCFNASTif7ntcdtcNCuqqIz4boa/lWXOWWv6+2VsptoinSFPTn2gbyoldCF3WLk
 LPxaYtQibJh05k9ukhkIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WqNj1TBcidE=:gp0GmOgW/MpqQGs+zxKh6i
 I0088aGoSzOIfC95i/SEDZNYBUDmgwLa8n4SXmJkOmu/GGWNmsBGg/Xf8yNQt9k/hZG1GWXPN
 xEBtNhEWsGOydmRhKc+SGqkOJt1MGEphhCucm67oCLQxZfaAVCyV1LE8fm4EHrJROazGyYjEq
 lH16F/3XvcljV+pCYiqIoRjM6+oypx0etdtwnLgAZmNyA9S6WTF37Yqa3INS1S7FwBDy3Kbkw
 IcBnm6E0VHQ4OPHXxABvAk2oIndJOeCt+tf9gc9//r1GcOSb4BYRCbTjQKkvol7Zx++hrz8D9
 ayJibSTe5nhuLcL+SN4HlKtWfuz6RmVjv6c/fDlR3j/qL/eB03XvQh9FCZg3jiwKfX5w6bpnL
 fTy0MG7FyqXlq0+laGULoIs9JiSUAXz4NDEYbZiUPQeKZN9i2edp69JRiVoBK
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

 << reposting, since first queue didn't go through completely, due to mailer problem >>

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



