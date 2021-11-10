Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6099D44CAB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 21:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqGq22VK8z30RH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 07:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=rvx3=p5=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqGpc5FXFz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 07:36:24 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E9636101C;
 Wed, 10 Nov 2021 20:36:20 +0000 (UTC)
Date: Wed, 10 Nov 2021 15:36:18 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 5/5] ftrace: Use preemption model accessors for trace
 header printout
Message-ID: <20211110153618.5a89eb91@gandalf.local.home>
In-Reply-To: <20211110202448.4054153-6-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-6-valentin.schneider@arm.com>
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
Cc: Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Nov 2021 20:24:48 +0000
Valentin Schneider <valentin.schneider@arm.com> wrote:

> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
> preemption model of the live kernel. Use the newly-introduced accessors
> instead.
> 
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> ---
>  kernel/trace/trace.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
