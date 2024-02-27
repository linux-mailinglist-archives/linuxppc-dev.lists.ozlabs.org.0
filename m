Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEBD869700
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 15:17:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkfh14q1wz3vdH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 01:17:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=u1u6=ke=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkfgb2C7Cz3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 01:16:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 697D261241;
	Tue, 27 Feb 2024 14:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC338C433F1;
	Tue, 27 Feb 2024 14:16:56 +0000 (UTC)
Date: Tue, 27 Feb 2024 09:18:58 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace
 kernel selftests
Message-ID: <20240227091858.7b66f8cc@gandalf.local.home>
In-Reply-To: <129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
	<20240226122208.344447f1@gandalf.local.home>
	<129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
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

On Tue, 27 Feb 2024 15:06:18 +0530
Sachin Sant <sachinp@linux.ibm.com> wrote:

> I used this setup to again run bisect between 6.7.0 and 6.8-rc1.
> Bisect points to following patch 
> 
> commit 8ec90be7f15fac42992ea821be929d3b06cd0fd9
>     tracing: Allow for max buffer data size trace_marker writes

Thanks, that was what I was looking for. Hmm, can you send me your config.
One thing that powerpc architecture has different is that the page size can
be much larger, and the calculations are based off of that.

Can you try this patch and see if it triggers?

Thanks,

-- Steve

diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index 3e7fa44dc2b2..c3dba537f342 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -1589,6 +1589,9 @@ static enum print_line_t trace_print_print(struct trace_iterator *iter,
 	struct trace_seq *s = &iter->seq;
 	int max = iter->ent_size - offsetof(struct print_entry, buf);
 
+	if (WARN_ON_ONCE(max < 0))
+		return TRACE_TYPE_UNHANDLED;
+
 	trace_assign_type(field, iter->ent);
 
 	seq_print_ip_sym(s, field->ip, flags);
