Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D07F681FE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 00:46:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5PwP1Tmlz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 10:46:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ifmLcLYL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ifmLcLYL;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5PvT6CcSz30R6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 10:45:55 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id n6so10110127edo.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 15:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9VOT142oF1CR1Ax5dNwKVoSH2mYxiMG43ulowgTfdM=;
        b=ifmLcLYLQjQQls0ws954fkLlIyYomtftNUNRivmMHoFEjzo+JOMGe2dk1q9S/UWfNx
         amGL6PWdYFEnpHjeZHwfGrrJSQIK09s41CP1XPxSSrZ099s519ePBt1PZ8LwuGp7IFwV
         ctQ0QhaeWJzwwijBriFIrkaI0alDLmw/rTWOwmy50t+AFzdjz3Fe54L2638LKDJdTzvm
         +l6AZRXTh3JcmsM+HZr7bLe6ewZSiiNes0GXVT2ha7nu6d0PROs03px5MJlvGwIaKlne
         DIoQ4xB/hylrT0L2uhOq9D5eeOnfNJ3CJFYg0IlkecGTB/NpkTwdsJFjyGyhWMpeiwr3
         lmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9VOT142oF1CR1Ax5dNwKVoSH2mYxiMG43ulowgTfdM=;
        b=H/wAeao8sRvseIztaUzYRhTlB7tgWfHNuHew0VUjyKs1jvWHIneRavmS0IIycXWJuq
         ndqpBHfXZLzfMGeKJApMLwwHuTl/bgu2p9wegWYSSpC+lSsuAbrnirokiSNyZRNRoDd3
         H8TcDrarfbM7HKF2b6wcbu1ykLh07XTVpgcPkkW/mNxCIkGcI3+znERWSfhMpNKllkq8
         PAI1TOH/0kU73L84ChCuZvLb72HSOCwpUWQXMDJJ2q1tqYncDfBKyauUtYwEjfkIcuNm
         aNRnyz4d1vJ14r0mz0J13T9KyAvSYy1hO/g0+pt9GaFIuuQSZrAJS5R17Ib+Om5+7Ttx
         kUig==
X-Gm-Message-State: AFqh2kqhgxiUmeoWnutd5A5eaBGOqk8Z6kZnXP8o566tpjpU0ngoT6O0
	XUOwgCPTTlJkYcbk8w8MJqXWU/A2TSJVN5JQMMI=
X-Google-Smtp-Source: AMrXdXsMszPcJ+OGXCw+F0NthlgRQBnBUZoZJBZ1wp3U+BMzxLaDjnqsjok0Dp4PZDTCCsaTSihjgsHbokVoXVEJmIE=
X-Received: by 2002:a50:a44e:0:b0:49e:36d1:16e with SMTP id
 v14-20020a50a44e000000b0049e36d1016emr10053591edb.42.1675122351676; Mon, 30
 Jan 2023 15:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com> <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
In-Reply-To: <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 30 Jan 2023 15:45:40 -0800
Message-ID: <CAADnVQLV+BERfHNUeii=sZfU+z4WF-jsWUN8aMtzv0tYxh9Rcw@mail.gmail.com>
Subject: Re: [PATCH 00/34] selftests: Fix incorrect kernel headers search path
To: Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Networking <netdev@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 30, 2023 at 2:46 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 1/27/23 06:57, Mathieu Desnoyers wrote:
> > Hi,
> >
> > This series fixes incorrect kernel header search path in kernel
> > selftests.
> >
> > Near the end of the series, a few changes are not tagged as "Fixes"
> > because the current behavior is to rely on the kernel sources uapi files
> > rather than on the installed kernel header files. Nevertheless, those
> > are updated for consistency.
> >
> > There are situations where "../../../../include/" was added to -I search
> > path, which is bogus for userspace tests and caused issues with types.h.
> > Those are removed.
> >
> > Thanks,
> >
> > Mathieu
> >
> > Mathieu Desnoyers (34):
>
> The below patches are now applied to linux-kselftest next for Linux 6.3-rc1
>
> >    selftests: arm64: Fix incorrect kernel headers search path
> >    selftests: clone3: Fix incorrect kernel headers search path
> >    selftests: core: Fix incorrect kernel headers search path
> >    selftests: dma: Fix incorrect kernel headers search path
> >    selftests: dmabuf-heaps: Fix incorrect kernel headers search path
> >    selftests: drivers: Fix incorrect kernel headers search path
> >    selftests: filesystems: Fix incorrect kernel headers search path
> >    selftests: futex: Fix incorrect kernel headers search path
> >    selftests: gpio: Fix incorrect kernel headers search path
> >    selftests: ipc: Fix incorrect kernel headers search path
> >    selftests: kcmp: Fix incorrect kernel headers search path
> >    selftests: media_tests: Fix incorrect kernel headers search path
> >    selftests: membarrier: Fix incorrect kernel headers search path
> >    selftests: mount_setattr: Fix incorrect kernel headers search path
> >    selftests: move_mount_set_group: Fix incorrect kernel headers search
> >      path
> >    selftests: perf_events: Fix incorrect kernel headers search path
> >    selftests: pid_namespace: Fix incorrect kernel headers search path
> >    selftests: pidfd: Fix incorrect kernel headers search path
> >    selftests: ptp: Fix incorrect kernel headers search path
> >    selftests: rseq: Fix incorrect kernel headers search path
> >    selftests: sched: Fix incorrect kernel headers search path
> >    selftests: seccomp: Fix incorrect kernel headers search path
> >    selftests: sync: Fix incorrect kernel headers search path
> >    selftests: user_events: Fix incorrect kernel headers search path
> >    selftests: vm: Fix incorrect kernel headers search path
> >    selftests: x86: Fix incorrect kernel headers search path
> >    selftests: iommu: Use installed kernel headers search path
> >    selftests: memfd: Use installed kernel headers search path
> >    selftests: ptrace: Use installed kernel headers search path
> >    selftests: tdx: Use installed kernel headers search path
> >
>
> These will be applied by maintainers to their trees.

Not in this form. They break the build.

> >    selftests: bpf: Fix incorrect kernel headers search path # 02/34
> >    selftests: net: Fix incorrect kernel headers search path # 17/34
> >    selftests: powerpc: Fix incorrect kernel headers search path # 21/34
> >    selftests: bpf docs: Use installed kernel headers search path # 30/34
>
> thanks,
> -- Shuah
