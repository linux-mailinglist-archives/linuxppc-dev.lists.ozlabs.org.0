Return-Path: <linuxppc-dev+bounces-2863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F59BC81C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 09:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjMD06pYCz2xWT;
	Tue,  5 Nov 2024 19:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730795872;
	cv=none; b=i4xauJqiutOb/JaqtUDWUOhlszJErlu7uBEjUQJMU2kU0BSyP4F3zfV64l6ob3tyQSzyzqfkt+PTZ9EhnyfObJp/ljzIkE2XyYBsJ+XCnYZFx6wOgu/nCqxWa8iYlQd8vgw0adF5F320JpewgS6DsE0mczW7YClyZfmEkjjY+xCRiNNwsaPYg89X7io/iGAhUoiJSaz4vBnYyTl7B8IANi875p7ca+I0N+B+ODZhi8XKDDhEFKSDHkKSHkzbK3oYi7ZGkBw48gPIilYmgk88cFNAUP7/cH9Zites9vA5cTzTpd3BoufwTSxVr8pWjXx/97NSRQa4VluiWE9Euv3ztw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730795872; c=relaxed/relaxed;
	bh=d2c3AXkWw4v9+N/ruxxYVV0xxIQ3l0PeaEGP9ab8QDY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nLeum4CEG0++UQVLvwx5lYZtI17QlD8vfRCHpi1xvElALI0zAkUMEwx0SPqvj1rAM8yNYRRgoe8dlwyObE+7dUfmAsx6Ig9xUiUVTaaW7ZaOqR6IXUuqoOXFBBtvHfK6tEWh297VE4567PKK+P0d9ZHigo+SyOL5D4rbuZzjCU68rOEtmvisbi1Qon/Z+FbgGYTL8h7+4IsFqAtpPoEJf11ZbfyaQxM1znaSXRvWbRNp0FiFs5GUU39xblnDzBOapjWcMhQp0cC/d5C7vFg4ZqdbX5I50QgEreRZPGLEsTAgwVYuQ8TUNm+WOKZJtl3c7jXnM6Vzl/5aW9nU4ZrY9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XDOSZjmW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XDOSZjmW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjMCz45wgz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 19:37:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E634F5C3E4F;
	Tue,  5 Nov 2024 08:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CA8C4CECF;
	Tue,  5 Nov 2024 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730795866;
	bh=1VWejZRpiUp2jc8Rw/SnJEMp+oAMfk5UApT35ACHDlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XDOSZjmWLsp8fibcytie6dbuQqmukvL7/6vlUPnMPiRGsdfIeO5pjg57MyQlsqJOv
	 Ujq2Rs5s21VqWJN3BDGTsCYAozy63rgkR4zTpqt8BbgFphB9cBdIqs2ibXw0SrxU73
	 0qIErEpKPqfcceoua6DpSo3R1d7zcknYkl2A5ca5bOpQW/0Cx90HRSoUylNVzJzfbY
	 mkUOw0UL5psPYluHoVa2BnNwLiF0uz4aqOi2FUxu81FZs7qJftl2+mzVQulzYa6za6
	 xfiitHB1tdQc+SYSEn838k8p+YNrKEZI0B+TQtwoIQc7RR7RSA4cJQBSDr/0yd4HU1
	 Tk4L0JoMP3LJg==
Date: Tue, 5 Nov 2024 17:37:43 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, Steven
 Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, "Naveen N. Rao"
 <naveen@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] selftests/ftrace: update kprobe syntax error test for
 ppc64le
Message-Id: <20241105173743.a5ae78484e850448f1d20526@kernel.org>
In-Reply-To: <d10f4a96-944f-42c4-9886-05dfe831e8fd@linux.ibm.com>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com>
	<20241103135758.5a5f8f0870a139ab1a5bc7b8@kernel.org>
	<d10f4a96-944f-42c4-9886-05dfe831e8fd@linux.ibm.com>
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
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 4 Nov 2024 15:02:12 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> 
> 
> On 03/11/24 10:27 am, Masami Hiramatsu (Google) wrote:
> > On Sat,  2 Nov 2024 00:49:25 +0530
> > Hari Bathini <hbathini@linux.ibm.com> wrote:
> > 
> >> For ppc64le, depending on the kernel configuration used, offset 16
> >> from function start address can also be considered function entry.
> >> Update the test case to accommodate such configurations.
> >>
> > 
> > Hi Hari, so have you met any error on this test case?
> 
> Hi Masami,
> 
> vfs_read+8 is function entry on powerpc. So, the test case bails out at:
>    "check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS"
> 
> as it allows setting kprobe "vfs_read+8 $arg*"
> 
> > Can you share the error result too?
> 
> 
> End of the log file for reference:
> 
> "
> Test command: p vfs_read $arg* $arg*
> [2661828.483436] trace_kprobe: error: $arg* can be used only once in the 
> parameters
>    Command: p vfs_read $arg* $arg*
>                              ^
> Test command: p vfs_read+8 $arg*
> "

Ah, OK. so it should fail but passed. (and test failure)

Thank you,

> 
> Thanks
> Hari
> 
> > 
> > Thank you,
> > 
> >> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> >> ---
> >>   .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc    | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> >> index a16c6a6f6055..c03b94cc5784 100644
> >> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> >> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
> >> @@ -111,7 +111,11 @@ check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
> >>   if !grep -q 'kernel return probes support:' README; then
> >>   check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
> >>   fi
> >> +if [ "$(uname -m)" = "ppc64le" ]; then
> >> +check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
> >> +else
> >>   check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS
> >> +fi
> >>   check_error 'p vfs_read ^hoge'			# NO_BTFARG
> >>   check_error 'p kfree ^$arg10'			# NO_BTFARG (exceed the number of parameters)
> >>   check_error 'r kfree ^$retval'			# NO_RETVAL
> >> -- 
> >> 2.47.0
> >>
> > 
> > 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

