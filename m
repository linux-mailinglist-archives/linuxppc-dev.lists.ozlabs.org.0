Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93601869D24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 18:07:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkkRx15WTz3d2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 04:07:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=u1u6=ke=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkkRS0FSzz3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 04:06:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5881060FB6;
	Tue, 27 Feb 2024 17:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC352C43390;
	Tue, 27 Feb 2024 17:06:40 +0000 (UTC)
Date: Tue, 27 Feb 2024 12:08:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace
 kernel selftests
Message-ID: <20240227120842.0d5ffb46@gandalf.local.home>
In-Reply-To: <20240227115614.3572872e@gandalf.local.home>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
	<20240226122208.344447f1@gandalf.local.home>
	<129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
	<20240227091858.7b66f8cc@gandalf.local.home>
	<1F8D4E65-4E23-49FD-B092-980BB1203E19@linux.ibm.com>
	<20240227112443.0bd9f4b8@gandalf.local.home>
	<4A3F2F8E-15D2-48F3-8D59-C11EB0BC7F14@linux.ibm.com>
	<20240227115614.3572872e@gandalf.local.home>
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

On Tue, 27 Feb 2024 11:56:14 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 27 Feb 2024 22:08:18 +0530
> Sachin Sant <sachinp@linux.ibm.com> wrote:
> 
> > > Can you apply this, and see if it triggers and if it does, print the line
> > > that has the max size?
> > >     
> > 
> > With this I see following trace
> > 
> > [   61.327138] ------------[ cut here ]------------
> > [   61.327159] MAX OUT OF RANGE 63492  
> 
> Well I guess there you have it ;-)
> 
> vsprintf() doesn't like a precision of 63492!
> 
> I'll look to see what the best way to deal with this is.

Does this fix it?

-- Steve

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index ff0b0a999171..e0840b94f1a2 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6882,7 +6882,9 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 /* Used in tracing_mark_raw_write() as well */
 #define FAULTED_STR "<faulted>"
 #define FAULTED_SIZE (sizeof(FAULTED_STR) - 1) /* '\0' is already accounted for */
-
+#ifndef SHORT_MAX
+#define SHORT_MAX	((1<<15) - 1)
+#endif
 	if (tracing_disabled)
 		return -EINVAL;
 
@@ -6900,6 +6902,16 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 	if (cnt < FAULTED_SIZE)
 		size += FAULTED_SIZE - cnt;
 
+	/*
+	 * trace_print_print() uses vsprintf() to determine the size via
+	 * the precision format "%*.s" which can not be greater than
+	 * a signed short.
+	 */
+	if (size > SHORT_MAX) {
+		cnt -= size - SHORT_MAX;
+		goto again;
+	}
+
 	if (size > TRACE_SEQ_BUFFER_SIZE) {
 		cnt -= size - TRACE_SEQ_BUFFER_SIZE;
 		goto again;

