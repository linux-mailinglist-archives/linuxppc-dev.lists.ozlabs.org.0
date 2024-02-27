Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39D869BF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 17:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkjT61NW1z3vZB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 03:23:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=u1u6=ke=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkjSh5VHyz30GC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 03:22:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92E3061216;
	Tue, 27 Feb 2024 16:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9D6C433F1;
	Tue, 27 Feb 2024 16:22:41 +0000 (UTC)
Date: Tue, 27 Feb 2024 11:24:43 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace
 kernel selftests
Message-ID: <20240227112443.0bd9f4b8@gandalf.local.home>
In-Reply-To: <1F8D4E65-4E23-49FD-B092-980BB1203E19@linux.ibm.com>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
	<20240226122208.344447f1@gandalf.local.home>
	<129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
	<20240227091858.7b66f8cc@gandalf.local.home>
	<1F8D4E65-4E23-49FD-B092-980BB1203E19@linux.ibm.com>
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

On Tue, 27 Feb 2024 21:38:57 +0530
Sachin Sant <sachinp@linux.ibm.com> wrote:

> This warning was not triggered.

Interesting.

> 
> I have attached .config

This is what I was looking for:

> # CONFIG_PPC_4K_PAGES is not set
> CONFIG_PPC_64K_PAGES=y
> CONFIG_PAGE_SIZE_64KB=y
> CONFIG_PPC_PAGE_SHIFT=16

So the pages are 64K in size. I wonder if this is causing an issue.

Can you apply this, and see if it triggers and if it does, print the line
that has the max size?

-- Steve

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 3e7fa44dc2b2..43e270bf8d78 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -1589,6 +1589,9 @@ static enum print_line_t trace_print_print(struct trace_iterator *iter,
 	struct trace_seq *s = &iter->seq;
 	int max = iter->ent_size - offsetof(struct print_entry, buf);
 
+	if (WARN_ONCE(max < 0 || max > 2000, "MAX OUT OF RANGE %d", max))
+		return TRACE_TYPE_UNHANDLED;
+
 	trace_assign_type(field, iter->ent);
 
 	seq_print_ip_sym(s, field->ip, flags);
