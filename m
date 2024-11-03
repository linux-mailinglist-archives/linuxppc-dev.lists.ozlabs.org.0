Return-Path: <linuxppc-dev+bounces-2776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCA39BA400
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 05:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xh2RM2mbjz2xWS;
	Sun,  3 Nov 2024 15:58:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730609887;
	cv=none; b=SXKpY8+y6ZByamrBg55s6twSVnq6mxHUuKZRIKMDU5j+ZgY2sa6U4u8eiDacohdm5rOtHa2eXCAcWFucycV8qxzdX33QixfLB25il9sF/Gl0f3eXlUCtJKEkkN4EDTmE86dyi+06LOBG2tr5UAhU72JPAki0WXeCZ0mm4UkvLY848eCoD1auS8VkJLT4ZBC+iGhqmwu8ZZ3C4QZfDCOi+BES08ia3+WVwM4BYy9eAYi+SP+3T50LXUFeWV/E+HTGIuC44WBtCEoH4DXKVCYyzBjYbNdabivGOJ7i9OnkADviwHAbfFUSPUAhB5bnYKOgAN4qBtQOPaHDA+8dnDJzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730609887; c=relaxed/relaxed;
	bh=cQE7DsjRyojip2AXdwKUXctyA1XD9oXIiw/AI5rchkc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fKG7PuoPcfO910UgOzjvWUZfuOmoIHgw5i6nWz+dL5RTU1te3Gbr0aIW6oS7np05ZuCR3CJ91wsn6Z3r/7gROOWNCGBAhK2dluJxe1TpDWsT8pti3tZunyc7GZlY21avbPV9upzgABl38zerANoE0CMZw6tmPIzGeENiWHAEKIQSjn29Vhy8ngLqEKP4E4QZRlgMxgBBaa6RWsoxg7F0ARAWAcG097NNHDVntsDmwfBfWauDylV9Le5KQbuUGP3M9wa5TRbxiA0fZjhLQTBrCsyHApnYLeLLNNFsXkzNLk5miCXSLT/jc+o1Fgs0E2gz8DS22LX+RlyrpVIsvY1b3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hbJvURL9; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hbJvURL9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xh2RL1lvWz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Nov 2024 15:58:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA9185C0305;
	Sun,  3 Nov 2024 04:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651A2C4CECD;
	Sun,  3 Nov 2024 04:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730609882;
	bh=0tNRT0xSX7XmwNmCgdyMhAikThf/p4Wje8UYd8Iov6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hbJvURL9eRPIU/g6T+sEX6cu3/Dyz7PJDR7coQCxz43K21RWvdqsaRUcphAQZORl2
	 lc9iBejRtHGX98dTNtGBHSn3FEfCnn9hbwSzBY0DoBTTBmveSR1wRMEfWjPMWtYRLo
	 uRlnuS5DjaU1k9Bs3WnHyXzjIMvepaTZygovC70cxHYfvAnJ8vm79BCnJe5ayaJQJn
	 p8QIjT+73h7qQddW8Ysi/NLk2SOg+h8Ml08beoP5MzOU5DJQX18y6QeARV6fjG4DQl
	 uXl9QyPzsC4fadu2wArDrz2uPr5/UB7BI9aFOIlqBq4NngzYmUwKjAY6YgfhEyRoN8
	 p3RND3mWwDvIA==
Date: Sun, 3 Nov 2024 13:57:58 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, "Naveen N. Rao" <naveen@kernel.org>, lkml
 <linux-kernel@vger.kernel.org>, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] selftests/ftrace: update kprobe syntax error test for
 ppc64le
Message-Id: <20241103135758.5a5f8f0870a139ab1a5bc7b8@kernel.org>
In-Reply-To: <20241101191925.1550493-1-hbathini@linux.ibm.com>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat,  2 Nov 2024 00:49:25 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> For ppc64le, depending on the kernel configuration used, offset 16
> from function start address can also be considered function entry.
> Update the test case to accommodate such configurations.
> 

Hi Hari, so have you met any error on this test case?
Can you share the error result too?

Thank you,

> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> index a16c6a6f6055..c03b94cc5784 100644
> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> @@ -111,7 +111,11 @@ check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
>  if !grep -q 'kernel return probes support:' README; then
>  check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
>  fi
> +if [ "$(uname -m)" = "ppc64le" ]; then
> +check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
> +else
>  check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS
> +fi
>  check_error 'p vfs_read ^hoge'			# NO_BTFARG
>  check_error 'p kfree ^$arg10'			# NO_BTFARG (exceed the number of parameters)
>  check_error 'r kfree ^$retval'			# NO_RETVAL
> -- 
> 2.47.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

