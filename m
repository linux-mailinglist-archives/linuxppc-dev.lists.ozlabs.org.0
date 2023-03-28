Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 779386CB7D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm1FH2c5dz3fTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 18:16:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pgti5pX6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pgti5pX6;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm1DK3jGfz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 18:15:28 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id y2so7291359pfw.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679987727;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiQMQ2XCzDmv/eu0m0m2aUXUlJzPfX9pnKmES6IuxC4=;
        b=pgti5pX68H00wcMydHaWgi7FtBwV+bsuhgq+7Ahks1PJ/jNKmVYvtsP58fyN37/u2O
         KnTTE7TnpG4YChbx6pcHwKf09/zf32YGEgymoKroRHaoRspOjnEk0VKBMGpfv87YwnBP
         jpOpPVbqrj/UoXxWLquQ4OABVnN2SWOgFfc/PzW0TNiiYMsBST3xdY1qeJwhsdh1efa1
         a5ygjCAV6JXTH1flLjrsaYezygdBqTxqja1pvZC6Y9DIyGqKJzIBLoP4C/jmMVjP5qUq
         PlqqdEAP/W+lQKjzSomDL/BxLEsXBOAKYFNzkJt3Fv0xAdYCtND/ci93YvPU0+UPSa7u
         xBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679987727;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SiQMQ2XCzDmv/eu0m0m2aUXUlJzPfX9pnKmES6IuxC4=;
        b=OcjMnUIs9+HvxR4zfsO71baXXn7Z+7vruD+SnNdaU8zEgYk2ACQXFDZtIr/R8MT6q5
         7+HlPRRz7ZuLzIqum2UsFs8R6lzJmvn8j3JI2FffhjnquDHPr2ys7eWkgOO4CX5zdSFS
         ySZPpqRtiu9czYsw6HE6HM2mIVmiH8xajM+etxIUr1VXhQx4Lws6PLiU8LnzdxgrB5MD
         K7B6CtGYquKPhmYAU8WaLHtRBbPoeY/D0/tzCt6n768BvKjejiZ56yMcAXVurprpKMId
         9RMxUpp01GR84XZuVRwxZgPNScX8XTN/NY386FiLhIBzPZlfxBgbcISEIC5jXIEFFaeT
         MlCA==
X-Gm-Message-State: AAQBX9fRd4PsROe0CmxbRKjyXPPx/UnIuY+33JtUJ/7i+w9Mho8xnqYi
	2tikQrgzi0k5vGH+WZZCfbE=
X-Google-Smtp-Source: AKy350bM7EyA8ugscjz3rbNrkZy7EsBR3kG3B18yj0jYJMbnWE440HLAe0kwKxeh4j6JL20VMbQeKQ==
X-Received: by 2002:a05:6a00:4e:b0:626:cc72:51ac with SMTP id i14-20020a056a00004e00b00626cc7251acmr14222944pfk.30.1679987726736;
        Tue, 28 Mar 2023 00:15:26 -0700 (PDT)
Received: from localhost (118-211-28-230.tpgi.com.au. [118.211.28.230])
        by smtp.gmail.com with ESMTPSA id i10-20020aa78d8a000000b006281bc04392sm12616676pfr.191.2023.03.28.00.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:15:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Mar 2023 17:15:21 +1000
Message-Id: <CRHTY0VSZ8LW.18YSL5NHOOO2A@bobo>
Subject: Re: [kvm-unit-tests v3 00/13] powerpc: updates, P10, PNV support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <bdc241df-d9b8-a742-982b-21a5b4feb2a4@kaod.org>
In-Reply-To: <bdc241df-d9b8-a742-982b-21a5b4feb2a4@kaod.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 28, 2023 at 2:09 AM AEST, C=C3=A9dric Le Goater wrote:
> On 3/27/23 14:45, Nicholas Piggin wrote:
> > This series is growing a bit I'm sorry. v2 series added extra interrupt
> > vectors support which was actually wrong because interrupt handling
> > code can only cope with 0x100-size vectors and new ones are 0x80 and
> > 0x20. It managed to work because those alias to the 0x100 boundary, but
> > if more than one handler were installed in the same 0x100-aligned
> > block it would crash. So a couple of patches added to cope with that.
> >=20
>
> I gave them a try on P9 box

Thanks!

>
> $ ./run_tests.sh
> PASS selftest-setup (2 tests)
> PASS spapr_hcall (9 tests, 1 skipped)
> PASS spapr_vpa (13 tests)
> PASS rtas-get-time-of-day (10 tests)
> PASS rtas-get-time-of-day-base (10 tests)
> PASS rtas-set-time-of-day (5 tests)
> PASS emulator (4 tests)
> PASS h_cede_tm (2 tests)
> FAIL sprs (75 tests, 1 unexpected failures)

Oh you have a SPR failure too? I'll check that on a P9.

> FAIL sprs-migration (75 tests, 5 unexpected failures)
>
> And with TCG:
>
> $ ACCEL=3Dtcg ./run_tests.sh
> PASS selftest-setup (2 tests)
> PASS spapr_hcall (9 tests, 1 skipped)
> FAIL spapr_vpa (13 tests, 1 unexpected failures)
>
> The dispatch count seems bogus after unregister

Yeah, that dispatch count after unregister test may be bogus actually.
PAPR doesn't specify what should happen in that case. It was working
here for me though so interesting it's different for you. I'll
investigate it and maybe just remove that test for now.

>
> PASS rtas-get-time-of-day (10 tests)
> PASS rtas-get-time-of-day-base (10 tests)
> PASS rtas-set-time-of-day (5 tests)
> PASS emulator (4 tests)
> SKIP h_cede_tm (qemu-system-ppc64: TCG cannot support more than 1 thread/=
core on a pseries machine)
> FAIL sprs (75 tests, 16 unexpected failures)

These should be TCG errors. I have it passing them all with patches
posted to qemu lists. Very simple but effective way to catch a few
classes of errors.

Thanks,
Nick
