Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E990522302
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 19:40:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyQLS37Z0z3cK0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 03:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=uvqw=vs=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyQL20qPGz3bpB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 03:40:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AC4FB81EB9;
 Tue, 10 May 2022 17:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749E5C385C2;
 Tue, 10 May 2022 17:40:16 +0000 (UTC)
Date: Tue, 10 May 2022 13:40:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 23/30] printk: kmsg_dump: Introduce helper to inform
 number of dumpers
Message-ID: <20220510134014.3923ccba@gandalf.local.home>
In-Reply-To: <20220427224924.592546-24-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-24-gpiccoli@igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, pmladek@suse.com,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rcu@vger.kernel.org, gregkh@linuxfoundation.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 vkuznets@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Apr 2022 19:49:17 -0300
"Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:

> Currently we don't have a way to check if there are dumpers set,
> except counting the list members maybe. This patch introduces a very
> simple helper to provide this information, by just keeping track of
> registered/unregistered kmsg dumpers. It's going to be used on the
> panic path in the subsequent patch.

FYI, it is considered "bad form" to reference in the change log "this
patch". We know this is a patch. The change log should just talk about what
is being done. So can you reword your change logs (you do this is almost
every patch). Here's what I would reword the above to be:

 Currently we don't have a way to check if there are dumpers set, except
 perhaps by counting the list members. Introduce a very simple helper to
 provide this information, by just keeping track of registered/unregistered
 kmsg dumpers. This will simplify the refactoring of the panic path.


-- Steve
