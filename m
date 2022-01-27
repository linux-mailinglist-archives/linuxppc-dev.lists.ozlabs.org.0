Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889249E545
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 15:56:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl3Zt1pMMz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 01:56:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jl3ZS1fd9z30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 01:56:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B29CC113E;
 Thu, 27 Jan 2022 06:56:29 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.14.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73833F766;
 Thu, 27 Jan 2022 06:56:27 -0800 (PST)
Date: Thu, 27 Jan 2022 14:56:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <YfKyivFMMjio09Xy@FVFF77S0Q05N>
References: <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <yt9dy231gzae.fsf@linux.ibm.com> <YfKPmFJ2MGsem4VB@FVFF77S0Q05N>
 <20220127074601.41a3773d@rorschach.local.home>
 <YfKZXvB9vCN1bA1c@FVFF77S0Q05N> <yt9dsft9gvyo.fsf@linux.ibm.com>
 <YfKfDnbNGina2lKz@FVFF77S0Q05N>
 <20220127085543.200dd38e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127085543.200dd38e@gandalf.local.home>
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
Cc: keescook@chromium.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 08:55:43AM -0500, Steven Rostedt wrote:
> On Thu, 27 Jan 2022 13:33:02 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > I want to get the regression fixed ASAP, so can we take a simple patch for -rc2
> > which disables the build-time sort where it's currently broken (by limiting the
> > opt-in to arm and x86), then follow-up per-architecture to re-enable it if
> > desired/safe?
> 
> I'm going to retest my patch that makes it an opt in for just x86 and arm
> (32bit). I'll be pushing that hopefully later today. I have some other
> patches to test as well.

Great; thanks!

Let me know if you'd like me to give that a spin on arm or arm64.

Thanks,
Mark.
