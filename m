Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D933E234
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 00:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0V4J6xjqz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 10:34:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZBpkHA3y;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qBoEY0L4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=ZBpkHA3y; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=qBoEY0L4; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0V3M4gSvz30Bw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 10:33:35 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1615937607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F3yikjHBX3sE+vqVOAg0c4FbXVC7h/jsk7NB+UTl4pY=;
 b=ZBpkHA3yMsvjOMDQlQDKG/f2JwzyuZ+1kB+44ZuV4SbBS3JtyxSQaVXoT2trt3YilG9rDs
 L6h8pSjhEe1rzGdGxiJmp3/4WU53keFtoCa68VJYNVnPIbT3x5cOUKKdCN951p9YrzIwJI
 rbN+scLS88zfxi97ZeQK664T7hhUXrVKfCCKA0sSpKL6al6e2jW7ewe1ZH7680qsr05ZJA
 U9NI/Wei9c18v8sEnTDwNKjUZEzd7oZ+1SICWdHGblcKh7IYZqqswcrWNoF2iWzul6IM0+
 2IRQcdXQfgCkqVvLW+4eE/Eu/Eu9QYGmhuIrgWek4uzb63fMPAU5VKCBqXLdtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1615937607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F3yikjHBX3sE+vqVOAg0c4FbXVC7h/jsk7NB+UTl4pY=;
 b=qBoEY0L4Ynny3Z3D6ukRFXsT63ZYZeUutsYPyIJtoUFiA0tC+gFvfCvGeVj8Lgk1jz+F4a
 9SujFVU6K+engkBQ==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v1 0/3] printk: remove safe buffers
Date: Wed, 17 Mar 2021 00:33:23 +0100
Message-Id: <20210316233326.10778-1-john.ogness@linutronix.de>
MIME-Version: 1.0
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Here is v1 of a series to remove the safe buffers. They are no
longer needed because messages can be stored directly into the
log buffer from any context.

However, the safe buffers also provided a form of recursion
protection. For that reason, explicit recursion protection is
also implemented for this series.

This series falls in line with the printk-rework plan as
presented [0] at Linux Plumbers in Lisbon 2019.

This series is based on next-20210316.

John Ogness

[0] https://linuxplumbersconf.org/event/4/contributions/290/attachments/276/463/lpc2019_jogness_printk.pdf (slide 23)

John Ogness (3):
  printk: track/limit recursion
  printk: remove safe buffers
  printk: convert @syslog_lock to spin_lock

 arch/powerpc/kernel/traps.c    |   1 -
 arch/powerpc/kernel/watchdog.c |   5 -
 include/linux/printk.h         |  10 -
 kernel/kexec_core.c            |   1 -
 kernel/panic.c                 |   3 -
 kernel/printk/internal.h       |   2 -
 kernel/printk/printk.c         | 171 +++++++++--------
 kernel/printk/printk_safe.c    | 332 +--------------------------------
 lib/nmi_backtrace.c            |   6 -
 9 files changed, 100 insertions(+), 431 deletions(-)

-- 
2.20.1

