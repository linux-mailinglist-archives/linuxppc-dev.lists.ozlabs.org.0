Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFCE51529F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 19:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqg0X6JHXz3cLq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 03:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NQuHjq75;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=jcmvbkbc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NQuHjq75; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kqckv0n0xz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 02:04:53 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id 12so8934222oix.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQcZ21ZXrJjtfh7JWVyd82OFreqrUf57vyzG9uXB95s=;
 b=NQuHjq75yTcETqoe5MFxchlZ/6p7R23s4Uh/eK6M8cjCLKjgK4aZLK94enM9k42z9z
 9olN5ZP+vAQmeXTs3TpSIt0NzvMdqABegG4qz96TEt/HS/xzZxrOdtT3s38HXa8rxQCC
 //y1nGWR49pl0bI4BXJikvhyEOuRN9x7yyhQG6wmlGrFanhXAWznrpMOX2TZU06+jYUn
 nIWU94QXvKkXMgCPv2tcj5gD6bKy2psqRCjrFUOKa8Bl/tDHLN4JOX0rshY1mFgS6Dj8
 yb9QNW2JBzYk707yzx4X/QadG8x7UesXEXLRQ21ibqXwVr/gFDYqh338pCxNErks0fTt
 i5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQcZ21ZXrJjtfh7JWVyd82OFreqrUf57vyzG9uXB95s=;
 b=C1v7B9jfBWyJyYt7wcwO0QNWW2TisoF5ZH8qqO7dpf+Yre/Zor0J5Bccp6RDBEOyGo
 34HlW7A0iDblmgLm80WYIBlFUHHtzsYWSV1eDcbaktbXwBrs5WuJOA3moBqGHI04F6U6
 eHcv0d/bkkp+NF8YvOlpu4HVsDJxD5z7V5kesiJSnEJv7xOVoaM6JGJrPa2nDiZSEPAe
 BB7YIaeFnawWZqRvWrBXLGdtBfniPp7hzV1TvKUjj0inSeUkkzUDm2JNUAIm6MXLY24o
 ZJ9608UqMkQPA3VLQ/AJYZ9ocMJ+cxmI/m99qBMW5gF8H8pHnd06r23OWruf2RaYwUXL
 lTAQ==
X-Gm-Message-State: AOAM532JRePQO1aJ+xavv6rE+jnEVvW3EsL4wElIsG73UNP19y3/4YKL
 KlG4aWN9fjA+oT7fy/Y4Rvhve10F+ZyBjYhbw8E=
X-Google-Smtp-Source: ABdhPJysHLlZfOKGv6xFakU0zwsYHpphdLaC+QwvkTPAsD1DKrMZHBdjgWt7xXjXQ23jsIbpf+qT2AhQ4uRAgVD8DGA=
X-Received: by 2002:a05:6808:1202:b0:2f9:c7b4:fd56 with SMTP id
 a2-20020a056808120200b002f9c7b4fd56mr15139oil.55.1651248290317; Fri, 29 Apr
 2022 09:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
In-Reply-To: <20220427224924.592546-22-gpiccoli@igalia.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 29 Apr 2022 09:04:39 -0700
Message-ID: <CAMo8BfKzA+oy-Qun9-aO3xCr4Jy_rfdjYqMX=W9xONCSX8O51Q@mail.gmail.com>
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 30 Apr 2022 03:44:36 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 stern@rowland.harvard.edu, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Petr Mladek <pmladek@suse.com>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Andrew Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, d.hatayama@jp.fujitsu.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-hyperv@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 Helge Deller <deller@gmx.de>, vgoyal@redhat.com,
 Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 john.ogness@linutronix.de, coresight@lists.linaro.org,
 hidehiro.kawai.ez@hitachi.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 James Morse <james.morse@arm.com>, kernel-dev@igalia.com,
 fabiomirmar@gmail.com, halves@canonical.com, alejandro.j.jimenez@oracle.com,
 feng.tang@intel.com, Will Deacon <will@kernel.org>, bhe@redhat.com,
 Jonathan Corbet <corbet@lwn.net>, Dexuan Cui <decui@microsoft.com>,
 bcm-kernel-feedback-list@broadcom.com, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-remoteproc@vger.kernel.org,
 mikelley@microsoft.com, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-leds@vger.kernel.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Weinberger <richard@nod.at>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, dyoung@redhat.com, paulmck@kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev <netdev@vger.kernel.org>, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 3:55 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> This patch renames the panic_notifier_list to panic_pre_reboot_list;
> the idea is that a subsequent patch will refactor the panic path
> in order to better split the notifiers, running some of them very
> early, some of them not so early [but still before kmsg_dump()] and
> finally, the rest should execute late, after kdump. The latter ones
> are now in the panic pre-reboot list - the name comes from the idea
> that these notifiers execute before panic() attempts rebooting the
> machine (if that option is set).
>
> We also took the opportunity to clean-up useless header inclusions,
> improve some notifier block declarations (e.g. in ibmasm/heartbeat.c)
> and more important, change some priorities - we hereby set 2 notifiers
> to run late in the list [iss_panic_event() and the IPMI panic_event()]
> due to the risks they offer (may not return, for example).
> Proper documentation is going to be provided in a subsequent patch,
> that effectively refactors the panic path.

[...]

>  arch/xtensa/platforms/iss/setup.c     |  4 ++--For xtensa:

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
