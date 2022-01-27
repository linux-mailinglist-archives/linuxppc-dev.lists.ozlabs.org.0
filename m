Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE649E2CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 13:46:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl0hT7355z3cQp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 23:46:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=3nbw=sl=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl0h30jhlz30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 23:46:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DFF24B82229;
 Thu, 27 Jan 2022 12:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E47C340E4;
 Thu, 27 Jan 2022 12:46:02 +0000 (UTC)
Date: Thu, 27 Jan 2022 07:46:01 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <20220127074601.41a3773d@rorschach.local.home>
In-Reply-To: <YfKPmFJ2MGsem4VB@FVFF77S0Q05N>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <yt9dy231gzae.fsf@linux.ibm.com> <YfKPmFJ2MGsem4VB@FVFF77S0Q05N>
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jan 2022 12:27:04 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> Ah, so those non-ELF relocations for the mcount_loc table just mean "apply the
> KASLR offset here", which is equivalent for all entries.
> 
> That makes sense, thanks!

And this is why we were having such a hard time understanding each other ;-)

I started a new project called "shelf", which is a shell interface to
read ELF files (Shelf on a ELF!).

It uses my ccli library:

   https://github.com/rostedt/libccli

and can be found here:

   https://github.com/rostedt/shelf

Build and install the latest libccli and then build this with just
"make".

  $ shelf vmlinux

and then you can see what is stored in the mcount location:

  shelf> dump symbol __start_mcount_loc - __stop_mcount_loc

I plan on adding more to include the REL and RELA sections and show how
they affect symbols and such.

Feel free to contribute too ;-)

-- Steve
