Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E130D028
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:10:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVhrs2KfJzDqNj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:10:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TrOKGSTx; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVGwT2HmzzDqC5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 18:41:44 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id i7so14335980pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 23:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IzPUl7ptPZW3dxIYjvG8dC+H5megpw+PVScTXHyk7Ko=;
 b=TrOKGSTxUSsg5bQHwPUm2hi2XTTwCS6De2i3hRhZ8Ynyj8sJNgfulNLdVwW5huoO/M
 Byep4eJ1LFImFTwFB+VDhHmVD731YRdQksWgC9Ja0Q/9QmqlAhsgifimUdLBwdbci89z
 8XKIIwWH7FqqK3n3pczhuhtpYxmmUcOcTmzK6FzjZ/VCVIKd6Y7mg38Br4r06B7sTWgi
 dolqjd00S+E+yFwgALbjIy6dA0L8jsLyvzusvJYB60WhMTKDLdRqE40D3oluqAzydx8p
 Pj43UB48Cs7L40adhAcALXIdZP0yszJFiVRxmpYwBrhzgVwIC9jjsOXUt4WgYP1dMQcq
 tlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IzPUl7ptPZW3dxIYjvG8dC+H5megpw+PVScTXHyk7Ko=;
 b=km79EFEPcD71fAYbZSENGhDTzeTNeYFODxtjZu2seUD6DPZen2uJQyrPWkGKt4cML8
 z3yIyIwZMmopnsVkxVUxKgaATCrnO+rGIQuAP1Nzbs5Krg19F0f8tfsPE/bVMzmbX1bM
 lCCUz2WZ4WIQaeTF+yjw8Qh6Ye57vulQHAJftKI2DLvPJ9upApBe3pGcsg15Cm28aong
 DLSyx8f+gLu/8MlbTU7ry2EGtbjVZYijZj+CxJJJKY9cgVir/cnECnevTsjdF8DdWlc8
 8NW6SSSYFS9si/gK+ScF2gHWd96LV6qwmplQrXK/du6gJHn3KK77YMJM64m/GZodWQZJ
 rirQ==
X-Gm-Message-State: AOAM532Vdmwv+TRNzimaRv+SvPELFexnW9d0m4GxIDQaOpW6uEbBFQbR
 a0xGw0g619XFRkUvXOSvrfJOKszgV+o=
X-Google-Smtp-Source: ABdhPJyH8REncl1bpmF1WzmwGZwmWZQiM3+HPWUq/VjRiHLcR12U7wC46ky25AqP0ewRw7WtJI2Tdw==
X-Received: by 2002:a63:4106:: with SMTP id o6mr8366807pga.427.1612251701120; 
 Mon, 01 Feb 2021 23:41:41 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id r5sm20289239pfl.165.2021.02.01.23.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 23:41:40 -0800 (PST)
Date: Tue, 02 Feb 2021 17:41:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64/signal: Fix regression in
 __kernel_sigtramp_rt64 semantics
To: linuxppc-dev@lists.ozlabs.org, Raoni Fassina Firmino <raoni@linux.ibm.com>
References: <20210201200505.iz46ubcizipnkcxe@work-tp>
In-Reply-To: <20210201200505.iz46ubcizipnkcxe@work-tp>
MIME-Version: 1.0
Message-Id: <1612251472.a7pzsfoixm.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Raoni Fassina Firmino's message of February 2, 2021 6:05 am:
> Tested on powerpc64 and powerpc64le, with a glibc build and running the
> affected glibc's testcase[2], inspected that glibc's backtrace() now give=
s
> the correct result and gdb backtrace also keeps working as before.
>=20
> I believe this should be backported to releases 5.9 and 5.10 as userspace
> is affected in this releases.
>=20
> ---- 8< ----

Thanks for this, I don't know the glibc code but the kernel change seems=20
okay to me.

Thanks,
Nick

>=20
> A Change[1] in __kernel_sigtramp_rt64 VDSO and trampoline code introduced=
 a
> regression in the way glibc's backtrace()[2] detects the signal-handler
> stack frame.  Apart from the practical implications, __kernel_sigtram_rt6=
4
> was a VDSO with the semantics that it is a function you can call from
> userspace to end a signal handling.  Now this semantics are no longer
> valid.
>=20
> I believe the aforementioned change affects all releases since 5.9.
>=20
> This patch tries to fix both the semantics and practical aspect of
> __kernel_sigtramp_rt64 returning it to the previous code, whilst keeping
> the intended behavior from[1] by adding a new symbol to serve as the jump
> target from the kernel to the trampoline. Now the trampoline has two part=
s,
> an new entry point and the old return point.
>=20
> [1] commit 0138ba5783ae0dcc799ad401a1e8ac8333790df9 ("powerpc/64/signal:
>     Balance return predictor stack in signal trampoline")
> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-January/223194.h=
tml
>=20
> Fixes: 0138ba5783ae ("powerpc/64/signal: Balance return predictor stack i=
n signal trampoline")
> Signed-off-by: Raoni Fassina Firmino <raoni@linux.ibm.com>
> ---
>  arch/powerpc/kernel/vdso64/sigtramp.S   | 9 ++++++++-
>  arch/powerpc/kernel/vdso64/vdso64.lds.S | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/=
vdso64/sigtramp.S
> index bbf68cd01088..f0fd8d2a9fc4 100644
> --- a/arch/powerpc/kernel/vdso64/sigtramp.S
> +++ b/arch/powerpc/kernel/vdso64/sigtramp.S
> @@ -15,11 +15,18 @@
> =20
>  	.text
> =20
> +/* __kernel_start_sigtramp_rt64 and __kernel_sigtramp_rt64 together
> +   are one function split in two parts. The kernel jumps to the former
> +   and the signal handler indirectly (by blr) returns to the latter.
> +   __kernel_sigtramp_rt64 needs to point to the return address so
> +   glibc can correctly identify the trampoline stack frame.  */

Are you planning to update glibc to cope with this as well? Any idea=20
about musl? If so, including version numbers would be good (not that
it's really a problem to carry this patch around).

I was just about to ask to turn the comment into kernel style, but the
whole file has this style so nevermind about that! :)

Thanks,
Nick

