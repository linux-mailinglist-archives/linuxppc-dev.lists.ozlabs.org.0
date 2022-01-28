Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB84A0303
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 22:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlrTw4pDsz3bck
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 08:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=ovfh=sm=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlrTS6l29z2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 08:39:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92EB5B82700;
 Fri, 28 Jan 2022 21:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2412AC340E7;
 Fri, 28 Jan 2022 21:39:50 +0000 (UTC)
Date: Fri, 28 Jan 2022 16:39:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH] ftrace: Have architectures opt-in for mcount build time
 sorting
Message-ID: <20220128163948.721c8b12@gandalf.local.home>
In-Reply-To: <YfRcC/ggq90jw7Uc@redhat.com>
References: <20220127114249.03b1b52b@gandalf.local.home>
 <YfRcC/ggq90jw7Uc@redhat.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Sachin Sant <sachinp@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jan 2022 16:11:39 -0500
Joe Lawrence <joe.lawrence@redhat.com> wrote:

> The bisect finally landed on:
> 
>   72b3942a173c387b27860ba1069636726e208777 is the first bad commit
>   commit 72b3942a173c387b27860ba1069636726e208777
>   Author: Yinan Liu <yinan@linux.alibaba.com>
>   Date:   Sun Dec 12 19:33:58 2021 +0800
> 
>       scripts: ftrace - move the sort-processing in ftrace_init
> 
> and I can confirm that your updates today in "[for-linus][PATCH 00/10]
> tracing: Fixes for 5.17-rc1" fix or avoid the issue.  I just wanted to
> add my report in case this adds any future complications for mcount
> build time sorting.  Let me know if any additional tests would be
> helpful.

Thanks for letting me know. That patch set has already landed in Linus's
tree.


-- Steve
