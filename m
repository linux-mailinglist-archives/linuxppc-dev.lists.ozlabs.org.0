Return-Path: <linuxppc-dev+bounces-3686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3E9E0C52
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 20:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Ddp6dn6z2yw9;
	Tue,  3 Dec 2024 06:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733168414;
	cv=none; b=VAp/q/gLbmiRZ4yccmLZEe1NGBINE8QX2yuMuVsaLiY3Ho+lvcvcViLB+lGrhGxUxGjYgl8IDI69PRFBZz6rKrP56TUSZ1rebJgC6WrJu0eED8T2w+cQtNKdpEBA2E5cJZv0RKbnj8bru6N06fzyxea5u4UlYFOE8JNrCBtuOsiY4sL6/3kPK0bWwmAhRFFglMh5YCaZUcs9HmdU/r1eSs0xyjyOBOohKS+Uf3mzoS4LDfcjnc02w7Ouz0KCTCCsIz74hSkG5/USJiw7al1eZxorF2gOBuUskPBIWhXTGlMNao1FxxEYFkAG+rUM/GxgMFyXNjPh1lMwSJXQqBW/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733168414; c=relaxed/relaxed;
	bh=GxWx/ImMxijSEMW2+adxnLk8MtVXLFXdEHTKFu9A7Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JUlCkIEw/sa1Ngmarw1SDxcyHO5gR6H153w57QqZ+I7/TUS3EGrIYiHy6MMuhzOXvvRj1adCpgZINaieL7i91/2lP0mGgmX+1NfXKx4ydS0LTOIS6RT2+zmsB8xMmYDwsckfEgzHDmzcrvH79jlNtG8KfYNZBRyWmgJkaZXGCd9m0aq6qvvauo+Jn2TG/aCilDT0vhZU5JHPDdtxlt0wswv045g6u9IbGhxDH7wBHRXbpWlAnnJHEF+KiCvOD3oGipVr5FcsfG06SKPrWr+2W5SIkRxnWazYpLkO5DkCiZM1VbOAVmN1aUseQqDDLeU0E9H5XVYKlVIol5ZWfQUXoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=6pif=s3=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=6pif=s3=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Ddm26VZz2yw2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 06:40:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E0C15C67FC;
	Mon,  2 Dec 2024 19:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E62EC4CED1;
	Mon,  2 Dec 2024 19:40:07 +0000 (UTC)
Date: Mon, 2 Dec 2024 14:41:11 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, "Naveen N. Rao"
 <naveen@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/ftrace: adjust offset for kprobe syntax
 error test
Message-ID: <20241202144111.75d1bb3b@gandalf.local.home>
In-Reply-To: <20241129202621.721159-1-hbathini@linux.ibm.com>
References: <20241129202621.721159-1-hbathini@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 30 Nov 2024 01:56:21 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> In 'NOFENTRY_ARGS' test case for syntax check, any offset X of
> `vfs_read+X` except function entry offset (0) fits the criterion,
> even if that offset is not at instruction boundary, as the parser
> comes before probing. But with "ENDBR64" instruction on x86, offset
> 4 is treated as function entry. So, X can't be 4 as well. Thus, 8
> was used as offset for the test case. On 64-bit powerpc though, any
> offset <= 16 can be considered function entry depending on build
> configuration (see arch_kprobe_on_func_entry() for implementation
> details). So, use `vfs_read+20` to accommodate that scenario too.
> 
> Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Shuah,

Can you take this through your tree?

Thanks,

-- Steve

> ---
> 
> Changes in v2:
> * Use 20 as offset for all arches.
> 
> 
>  .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> index a16c6a6f6055..8f1c58f0c239 100644
> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> @@ -111,7 +111,7 @@ check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
>  if !grep -q 'kernel return probes support:' README; then
>  check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
>  fi
> -check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS
> +check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
>  check_error 'p vfs_read ^hoge'			# NO_BTFARG
>  check_error 'p kfree ^$arg10'			# NO_BTFARG (exceed the number of parameters)
>  check_error 'r kfree ^$retval'			# NO_RETVAL


