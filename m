Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8267161F1C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 12:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5TS62Pr0z3cTV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 22:25:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P3SUE17F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P3SUE17F;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5TR93p2cz3bym
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 22:24:51 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id g24so10787675plq.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 03:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkXHaDGtvuVhiN69GarlKgDdz00NM6Kt+0lKI4zsZLs=;
        b=P3SUE17FIdMrZVLaiOZj5XVS/b5P9DJZJufnSMg25v9pjcIDMZIQZ4ZR1H0Iz2XFGP
         370EBWXfcGso+1RQsk2HIwlD7yktCzn9piMj2JlEncapGvtB2/WTec7vNx4mjHmtzeWa
         OxoUk9/CEYAm55OESegTyYEG07BFgZka0y6MTFLLA6N0WLTIwRFg6bWdM0sFIBSdIMlF
         Ds0Gvz0G5k3zenG48gpAB51CRzNUzlJZ9qENz4ONaUuJ/1QlUi4/8aDzxE1mVVoUhIOR
         yd54smgQVa+DC4rFbqOEfIpJyRZzfGZcDVcAZj3SOfNtpkx2Xxl2Lo3g0Vl00d1UtejU
         lm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bkXHaDGtvuVhiN69GarlKgDdz00NM6Kt+0lKI4zsZLs=;
        b=lnpgzq4JNgFxmHmYJxvR2fafszy1mhNGcw8OZaX1tth3CcEyTG/TajA9ccECE4hHY+
         VBoyCy5dXk+zOT+1TlIJ/ac5mnKMTJBDkunxPIqIB0clgl5DJd1Tes3aPgrYlqpjCqln
         Wlyxr20E7s8l1pxpvYrvmpcmt/E4Q6bXAWvIowmlP00OPGa+O5gOPcDA5rZ8dKKatDY/
         6sNBdfzVTKh1peXFzHaZo6FSRX9bF3XUBj8vDQSqhrP+UR83ng4Qe/QcnbpiQTYmKbbC
         IHBN/k1fhDuXk90RVW+3reTX+pB9KoES3tt18mzIKW27uYHXvinoeggQ7UoYcmYlLd9H
         RXog==
X-Gm-Message-State: ACrzQf1nnQIvAqRUiBM93895GXtORPXACLqgPQ6JUVWBR/rkrhahg7h4
	hgxOIbgNJbqtrvdSFj5jus0=
X-Google-Smtp-Source: AMsMyM7KjokBcg5L0y/OxERq4lN5FFXKLnb6DW/ZfRn6ab/4EpD+J3ir8DKPrYMhPNVnSPTvm6iT4A==
X-Received: by 2002:a17:903:22c9:b0:187:29fe:bda8 with SMTP id y9-20020a17090322c900b0018729febda8mr39108409plg.40.1667820288365;
        Mon, 07 Nov 2022 03:24:48 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id z17-20020aa79e51000000b0053e62b6fd22sm4218231pfq.126.2022.11.07.03.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 03:24:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 21:24:42 +1000
Message-Id: <CO60Y4MBO8W7.1OSJEIWNIBAHH@bobo>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Subject: Re: [PATCH 0/5] powerpc/kprobes: preempt related changes and
 cleanups
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: linux-arch@vger.kernel.org, Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+linux-arch

FYI most preempt_enable_no_resched() calls outside of core scheduler
code come from kprobes copy-and-paste, and can possibly be fixed in
similar ways as this series. It's a bit of a footgun API that should
be banished from outside kernel/sched/, at least without an explicit
comment for each case that explains the need and how the missed
resched is resolved or not applicable.

Thanks,
Nick

On Fri Oct 21, 2022 at 3:28 AM AEST, Naveen N. Rao wrote:
> This series attempts to address some of the concerns raised in=20
> https://github.com/linuxppc/issues/issues/440
>
> The last two patches are minor cleanups in related kprobes code.
>
> - Naveen
>
>
> Naveen N. Rao (5):
>   powerpc/kprobes: Remove preempt disable around call to get_kprobe() in
>     arch_prepare_kprobe()
>   powerpc/kprobes: Have optimized_callback() use preempt_enable()
>   powerpc/kprobes: Use preempt_enable() rather than the no_resched
>     variant
>   powerpc/kprobes: Setup consistent pt_regs across kprobes, optprobes
>     and KPROBES_ON_FTRACE
>   powerpc/kprobes: Remove unnecessary headers from kprobes
>
>  arch/powerpc/kernel/kprobes-ftrace.c        |  4 ----
>  arch/powerpc/kernel/kprobes.c               | 16 ++++++----------
>  arch/powerpc/kernel/optprobes.c             |  2 +-
>  arch/powerpc/kernel/optprobes_head.S        |  5 +----
>  arch/powerpc/kernel/trace/ftrace_mprofile.S |  6 ++++++
>  5 files changed, 14 insertions(+), 19 deletions(-)
>
>
> base-commit: 7dc2a00fdd44a4d0c3bac9fd10558b3933586a0c
> --=20
> 2.38.0

