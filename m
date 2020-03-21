Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B318E140
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:38:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l0Y44ThBzDrhc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:38:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kzvN1CkSzDrTg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 23:08:48 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jFcvN-00035h-He; Sat, 21 Mar 2020 13:08:21 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id E1F47FFC8D; Sat, 21 Mar 2020 13:08:20 +0100 (CET)
To: Guo Ren <guoren@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 2/5] csky: Remove mm.h from asm/uaccess.h
In-Reply-To: <CAJF2gTQDvmSdJB3R0By0Q6d9ganVBV1FBm3urL8Jf1fyiEi+1A@mail.gmail.com>
References: <20200318204408.010461877@linutronix.de>
 <20200320094856.3453859-1-bigeasy@linutronix.de>
 <20200320094856.3453859-3-bigeasy@linutronix.de>
 <CAJF2gTQDvmSdJB3R0By0Q6d9ganVBV1FBm3urL8Jf1fyiEi+1A@mail.gmail.com>
 From: Thomas Gleixner <tglx@linutronix.de>
From: Thomas Gleixner <tglx@linutronix.de>
Date: Sat, 21 Mar 2020 13:08:20 +0100
Message-ID: <87zhc9rjuz.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 joel@joelfernandes.org, Will Deacon <will@kernel.org>, mingo@kernel.org,
 dave@stgolabs.net, Arnd Bergmann <arnd@arndb.de>, linux-csky@vger.kernel.org,
 torvalds@linux-foundation.org, paulmck@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 bhelgaas@google.com, kurt.schwemmer@microsemi.com, kvalo@codeaurora.org,
 kbuild test robot <lkp@intel.com>, balbi@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, oleg@redhat.com, netdev@vger.kernel.org,
 logang@deltatee.com, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guo Ren <guoren@kernel.org> writes:

> Tested and Acked by me.
>
> Queued for next pull request, thx

Can we please route that with the rcuwait changes to avoid breakage
unless you ship it to Linus right away?

Thanks,

        tglx
