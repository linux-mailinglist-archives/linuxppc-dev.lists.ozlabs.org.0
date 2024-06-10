Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4485D9029AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 22:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyjWD2H4Rz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 06:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=wnj5=nm=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyjVr5Y54z30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 06:06:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3B379CE181F;
	Mon, 10 Jun 2024 20:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924D5C2BBFC;
	Mon, 10 Jun 2024 20:06:18 +0000 (UTC)
Date: Mon, 10 Jun 2024 16:06:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH v2 3/5] powerpc/ftrace: Unify 32-bit and 64-bit
 ftrace entry code
Message-ID: <20240610160632.089b6c04@gandalf.local.home>
In-Reply-To: <dde8c1e55cfb4c878860f47308a52b273e96ae67.1718008093.git.naveen@kernel.org>
References: <cover.1718008093.git.naveen@kernel.org>
	<dde8c1e55cfb4c878860f47308a52b273e96ae67.1718008093.git.naveen@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Jun 2024 14:08:16 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> On 32-bit powerpc, gcc generates a three instruction sequence for
> function profiling:
> 	mflr	r0
> 	stw	r0, 4(r1)
> 	bl	_mcount
> 
> On kernel boot, the call to _mcount() is nop-ed out, to be patched back
> in when ftrace is actually enabled. The 'stw' instruction therefore is
> not necessary unless ftrace is enabled. Nop it out during ftrace init.
> 
> When ftrace is enabled, we want the 'stw' so that stack unwinding works
> properly. Perform the same within the ftrace handler, similar to 64-bit
> powerpc.
> 
> For 64-bit powerpc, early versions of gcc used to emit a three
> instruction sequence for function profiling (with -mprofile-kernel) with
> a 'std' instruction to mimic the 'stw' above. Address that scenario also
> by nop-ing out the 'std' instruction during ftrace init.
> 
> Signed-off-by: Naveen N Rao <naveen@kernel.org>

Isn't there still the race that there's a preemption between the:

	stw	r0, 4(r1)
and
	bl	_mcount

And if this breaks stack unwinding, couldn't this cause an issue for live
kernel patching?

I know it's very unlikely, but in theory, I think the race exists.

-- Steve
