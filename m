Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84D329814
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 10:35:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqX6n2N0rz3d3S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 20:35:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Gdg7LlV9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=glider@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Gdg7LlV9; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqWpS4hKjz30Mb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 20:21:18 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id gi9so9567053qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 01:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vwRL+zg0sY1QI/aDS9tQBo/9/k6q6jsJr21NnguWVBI=;
 b=Gdg7LlV9KTMCHNPEerej0NoU4fufDpYllG9eP8gSI0Y59DAync1sFK8G8dRPBqhLcu
 n/Neic57sVkPsdrKtFEWL/DhdlMG8bIvqFPb/Oto0y7wA6Np/nFdBehh/7/2WYXiaW9/
 PUWgCXdI893sti3BPKa0u3WEivJzBWOBz65gJ0cHl8Tqq/anY/kXvtaJXHeB/ONDKDDF
 tpfnKWPZV55J8diU/JQpIkQXORqbpEFuAd5qWqJJw0StaGBcrmHdOv/lI7AYDkYorFuM
 3rP9xZ98HT3e3b1BVG+gRYRqxVBvHJAQfO9xHKnpx+YGSUudDn9U2OZaIyGaCusWpVZI
 vIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vwRL+zg0sY1QI/aDS9tQBo/9/k6q6jsJr21NnguWVBI=;
 b=f4AC0grBfnOQ3t/wTQLNSDASCpa52sxpDFFFRuzcFQ8SuIU99eA20mHWLQyGyKXqiM
 SX3yQJONCGKeezdzWX6RYJ9u+MqeDd1+exU+PA5I9h9yNwSzE0Uovx+nMBL+qK/c5YyN
 U/aJI4tymaW+//MjEpdXEerVxuMSvQLfxivSaWw6i9vKMZSLXsxpVaSbXvG6HYJh+RUo
 1Pd2CY1q0ZyZdnJzMCvyamI5HTqubM6Rb2zObbtDQMifzUjVdqIAlYm2vSJeWX6wGkeq
 dElfWIYodLOjdI8M7iQV318KJXUPmN7KGqpLpcIMW1ebTeMsxEIxq+H/phWQuZN4+Znn
 lB0w==
X-Gm-Message-State: AOAM5321RtJjwdEa3aZDqnXcRLHA/D0zGJWkvZhVR+XXUIIxZPR2T5iS
 wVN/teql2QpiOlqPcYqPaIN7etEXJtdw36M4p9g/qg==
X-Google-Smtp-Source: ABdhPJyHK6+xXF6lJrMdstX68u8D/GfsYLqjaCK/7e5wYKfaW5WYj/VJmdv8pUTr7VMur6NN61/WYCIvcECXjtHKruw=
X-Received: by 2002:a0c:9a04:: with SMTP id p4mr2656029qvd.38.1614676874297;
 Tue, 02 Mar 2021 01:21:14 -0800 (PST)
MIME-Version: 1.0
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
In-Reply-To: <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 2 Mar 2021 10:21:02 +0100
Message-ID: <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 02 Mar 2021 20:35:08 +1100
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
Cc: Marco Elver <elver@google.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> [   14.998426] BUG: KFENCE: invalid read in finish_task_switch.isra.0+0x54/0x23c
> [   14.998426]
> [   15.007061] Invalid read at 0x(ptrval):
> [   15.010906]  finish_task_switch.isra.0+0x54/0x23c
> [   15.015633]  kunit_try_run_case+0x5c/0xd0
> [   15.019682]  kunit_generic_run_threadfn_adapter+0x24/0x30
> [   15.025099]  kthread+0x15c/0x174
> [   15.028359]  ret_from_kernel_thread+0x14/0x1c
> [   15.032747]
> [   15.034251] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
> [   15.045811] ==================================================================
> [   15.053324]     # test_invalid_access: EXPECTATION FAILED at mm/kfence/kfence_test.c:636
> [   15.053324]     Expected report_matches(&expect) to be true, but is false
> [   15.068359]     not ok 21 - test_invalid_access

The test expects the function name to be test_invalid_access, i. e.
the first line should be "BUG: KFENCE: invalid read in
test_invalid_access".
The error reporting function unwinds the stack, skips a couple of
"uninteresting" frames
(https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L43)
and uses the first "interesting" one frame to print the report header
(https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L226).

It's strange that test_invalid_access is missing altogether from the
stack trace - is that expected?
Can you try printing the whole stacktrace without skipping any frames
to see if that function is there?
