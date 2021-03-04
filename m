Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2760A32D1D3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 12:32:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrpcR0rqNz3d3L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:32:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=FvLMEup3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FvLMEup3; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drpc04SGLz30Mt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:31:43 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id s73so3927192oie.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 03:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j0Anx46LrA/DH7upo2qHDfKBBW2EhpUPPJfiwAkE4e4=;
 b=FvLMEup3DhFI/E25fGKPvQa9fJ15dCqSKwz1YCyGtCJd9f16CUVmdAuligKBm/GEGh
 DtNpee5+c7ufCbWgz9LKV/SphHORc73KeXacqtr48nQFHlQuG073Um2uzMKYxsx3p9zW
 i8nLLZoanU6vBUBfpjYjGzcRNJ8r7y6pYCwO9tT4skeFF6VfuxCXKc3YDUmTrSEPUXyY
 kj9sY9uuq04Z9yfEiAN/XJwyOOWHpSdBe974Rjk6aBGwHhJ76aU0satfHRwX2OlGBNPj
 aB5Vac2b2ThLa1sgD0QCOIWaZJDLkfJTxqiWVzNVdM9a5wlJZLI4S9ZIL8GdENpcn9yC
 s+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j0Anx46LrA/DH7upo2qHDfKBBW2EhpUPPJfiwAkE4e4=;
 b=HYF/GgRunmQ2nBsCqL72OfpPs2ywM1HTgHfnoj80//DOpBkAaSj8Y5QKaA6/sc170K
 df5ZiiNa5SGQTcn5qmuA/opcf/wmLN7HH1QrxB4o6Ss3W3zSB9/UUkIgDT0qcMYyb6Te
 izt5PZBu6HAhMtExyibPq79ovJyVeCKR8Z/NflEOyBfTyyHA4QzohztcZbd1vezmi7aG
 +M3crKLxkUWL+O9byY8zspx+iJg1qiggWwWG3OxZtXzTyMAOiH51Etj3meIf47e7HRqN
 lbBm4DJaPsqJf2AUay8lNPO1ovN1h9xwFNT26QnUxGSzFAA8dV8jRqO0/T7OREaiGmUv
 VV3Q==
X-Gm-Message-State: AOAM531v6k8f7T+BWsPEEGTK9yPYdCjOaTZoAoVuQypl3+CNkWGsUW6V
 lL24o87x8F+cr+QpinovM8UK7Qip2BB1PUNN24VJxA==
X-Google-Smtp-Source: ABdhPJyC3mvSeSseP10oItrCI9EeNvVQ57SVpuXq2xWvCMPDxzJTIVcB8XRko5MVy0EC4y2PZJW9zDxDvIzyF/S294w=
X-Received: by 2002:a05:6808:10d3:: with SMTP id
 s19mr2682857ois.70.1614857499889; 
 Thu, 04 Mar 2021 03:31:39 -0800 (PST)
MIME-Version: 1.0
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
In-Reply-To: <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Thu, 4 Mar 2021 12:31:27 +0100
Message-ID: <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Mar 2021 at 12:23, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 03/03/2021 =C3=A0 11:56, Marco Elver a =C3=A9crit :
> >
> > Somewhat tangentially, I also note that e.g. show_regs(regs) (which
> > was printed along the KFENCE report above) didn't include the top
> > frame in the "Call Trace", so this assumption is definitely not
> > isolated to KFENCE.
> >
>
> Now, I have tested PPC64 (with the patch I sent yesterday to modify save_=
stack_trace_regs()
> applied), and I get many failures. Any idea ?
>
> [   17.653751][   T58] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   17.654379][   T58] BUG: KFENCE: invalid free in .kfence_guarded_free+=
0x2e4/0x530
> [   17.654379][   T58]
> [   17.654831][   T58] Invalid free of 0xc00000003c9c0000 (in kfence-#77)=
:
> [   17.655358][   T58]  .kfence_guarded_free+0x2e4/0x530
> [   17.655775][   T58]  .__slab_free+0x320/0x5a0
> [   17.656039][   T58]  .test_double_free+0xe0/0x198
> [   17.656308][   T58]  .kunit_try_run_case+0x80/0x110
> [   17.656523][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
> [   17.657161][   T58]  .kthread+0x18c/0x1a0
> [   17.659148][   T58]  .ret_from_kernel_thread+0x58/0x70
> [   17.659869][   T58]
> [   17.663954][   T58] kfence-#77 [0xc00000003c9c0000-0xc00000003c9c001f,=
 size=3D32, cache=3Dkmalloc-32]
> allocated by task 58:
> [   17.666113][   T58]  .__kfence_alloc+0x1bc/0x510
> [   17.667069][   T58]  .__kmalloc+0x280/0x4f0
> [   17.667452][   T58]  .test_alloc+0x19c/0x430
> [   17.667732][   T58]  .test_double_free+0x88/0x198
> [   17.667971][   T58]  .kunit_try_run_case+0x80/0x110
> [   17.668283][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
> [   17.668553][   T58]  .kthread+0x18c/0x1a0
> [   17.669315][   T58]  .ret_from_kernel_thread+0x58/0x70
> [   17.669711][   T58]
> [   17.669711][   T58] freed by task 58:
> [   17.670116][   T58]  .kfence_guarded_free+0x3d0/0x530
> [   17.670421][   T58]  .__slab_free+0x320/0x5a0
> [   17.670603][   T58]  .test_double_free+0xb4/0x198
> [   17.670827][   T58]  .kunit_try_run_case+0x80/0x110
> [   17.671073][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
> [   17.671410][   T58]  .kthread+0x18c/0x1a0
> [   17.671618][   T58]  .ret_from_kernel_thread+0x58/0x70
> [   17.671972][   T58]
> [   17.672638][   T58] CPU: 0 PID: 58 Comm: kunit_try_catch Tainted: G   =
 B
> 5.12.0-rc1-01540-g0783285cc1b8-dirty #4685
> [   17.673768][   T58] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   17.677031][   T58]     # test_double_free: EXPECTATION FAILED at mm/k=
fence/kfence_test.c:380
> [   17.677031][   T58]     Expected report_matches(&expect) to be true, b=
ut is false
> [   17.684397][    T1]     not ok 7 - test_double_free
> [   17.686463][   T59]     # test_double_free-memcache: setup_test_cache:=
 size=3D32, ctor=3D0x0
> [   17.688403][   T59]     # test_double_free-memcache: test_alloc: size=
=3D32, gfp=3Dcc0, policy=3Dany,
> cache=3D1

Looks like something is prepending '.' to function names. We expect
the function name to appear as-is, e.g. "kfence_guarded_free",
"test_double_free", etc.

Is there something special on ppc64, where the '.' is some convention?

Thanks,
-- Marco
