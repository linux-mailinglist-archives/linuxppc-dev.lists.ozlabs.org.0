Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F2869CE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 17:54:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkk9X4BcQz3vb2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 03:54:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=u1u6=ke=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkk963sB5z3cQj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 03:54:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F27ECE1987;
	Tue, 27 Feb 2024 16:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F4BC43390;
	Tue, 27 Feb 2024 16:54:12 +0000 (UTC)
Date: Tue, 27 Feb 2024 11:56:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace
 kernel selftests
Message-ID: <20240227115614.3572872e@gandalf.local.home>
In-Reply-To: <4A3F2F8E-15D2-48F3-8D59-C11EB0BC7F14@linux.ibm.com>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
	<20240226122208.344447f1@gandalf.local.home>
	<129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
	<20240227091858.7b66f8cc@gandalf.local.home>
	<1F8D4E65-4E23-49FD-B092-980BB1203E19@linux.ibm.com>
	<20240227112443.0bd9f4b8@gandalf.local.home>
	<4A3F2F8E-15D2-48F3-8D59-C11EB0BC7F14@linux.ibm.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Feb 2024 22:08:18 +0530
Sachin Sant <sachinp@linux.ibm.com> wrote:

> > Can you apply this, and see if it triggers and if it does, print the line
> > that has the max size?
> >   
> 
> With this I see following trace
> 
> [   61.327138] ------------[ cut here ]------------
> [   61.327159] MAX OUT OF RANGE 63492

Well I guess there you have it ;-)

vsprintf() doesn't like a precision of 63492!

I'll look to see what the best way to deal with this is.

-- Steve
