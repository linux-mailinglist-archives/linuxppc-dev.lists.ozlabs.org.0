Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A73AFE5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 09:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8JTq0Nqxz3bsm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 17:50:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jQZNEO1A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jQZNEO1A; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8JT95xxTz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 17:49:47 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id k8so28634519lja.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wOPEtWORSkQBvaG3lQj4bBkhxW56uNEUy6C8BsqWuFQ=;
 b=jQZNEO1AwlhsUqEwo5PX+i4dyZjplXX1aoREJE01/pbr6tgKwdX9vOhpB3bNGf461m
 GFwkwAn4ZRPfmaB+uRJrVP/ET3Mo7/zGwUX+fGIzNmMg/mzRYV9NlXNgrbey8ib7x2N8
 eueFb7yKfUGrw+DcR1xU8kI66tzeIBg9t3NLIYLkVGhZkum1Yus6UdP5mFI2OuGjZ9qy
 e/7rZa+Q/VZIOnBijMjF9p2zT9ar4aRvcireDYv/AXbNXCjm7TVrBxFwF82MNH9J3KZu
 BXHGmotkTJOpKmmubVRoVTZck6XYvmnARVBUraI31tdy+gjiEfgpLs2ADIDqnMI/WvEE
 1CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wOPEtWORSkQBvaG3lQj4bBkhxW56uNEUy6C8BsqWuFQ=;
 b=bJfDuuty/ZCeCFypl2mHYNpVT7283oSC4y8jTdy8jemXID1GelYUte/la+X1sZvXQo
 1Hxrfdfj4fMmSjQuoJySVe96XVdX4Hw+lf8RFlx7v3pNt3a8gi9YcYbs/GZlYaBNEpPM
 N5hrpmn939mPGyf+OEKrZ1gBqX0r24mSAG6L/OXjBzr0W6FoJREUVAz+1O7vB1Ue7RqO
 5oF7+UDKLhpuYZDlTobNWPsFEA0LmW7KZcx1DImmfo6KYmsaXa+mZAaX5l3GBnoGJ6vt
 OYpfN6uTOa4mCPWu04o9m74Uyh2Jea+5XtJGpyAolSHuOUdX07AHpl6PRNMpCsqacutH
 NjQA==
X-Gm-Message-State: AOAM533e41TDvW2Wsd/bU6NHeKNMRQcXJMa2dLLsher77+DWudrnKEhp
 UAAOnqv/eFmuNdaXaFaLIF2NBUbXXlrVajo7vDEsZw==
X-Google-Smtp-Source: ABdhPJxZpIePfRvFDfeRql605aaJ6XXRsf7f2DOLTSExXnQTQxy9TXBz1HGS1e1QHH77+oPwqd6H6VwgHjvE1GpGCRc=
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr2013324ljg.299.1624348182997; 
 Tue, 22 Jun 2021 00:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
In-Reply-To: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 22 Jun 2021 09:49:31 +0200
Message-ID: <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
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
Cc: Odin Ugedal <odin@uged.al>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sachin,

On Tue, 22 Jun 2021 at 09:39, Sachin Sant <sachinp@linux.vnet.ibm.com> wrot=
e:
>
> While booting 5.13.0-rc7-next-20210621 on a PowerVM LPAR following warnin=
g
> is seen
>
> [   30.922154] ------------[ cut here ]------------
> [   30.922201] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg || cfs_rq->av=
g.runnable_avg
> [   30.922219] WARNING: CPU: 6 PID: 762 at kernel/sched/fair.c:3277 updat=
e_blocked_averages+0x758/0x780
> [   30.922259] Modules linked in: pseries_rng xts vmx_crypto uio_pdrv_gen=
irq uio sch_fq_codel ip_tables sd_mod t10_pi sg fuse
> [   30.922309] CPU: 6 PID: 762 Comm: augenrules Not tainted 5.13.0-rc7-ne=
xt-20210621 #1
> [   30.922329] NIP:  c0000000001b27e8 LR: c0000000001b27e4 CTR: c00000000=
07cfda0
> [   30.922344] REGS: c000000023fcb660 TRAP: 0700   Not tainted  (5.13.0-r=
c7-next-20210621)
> [   30.922359] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 4848822=
4  XER: 00000005
> [   30.922394] CFAR: c00000000014d120 IRQMASK: 1
>                GPR00: c0000000001b27e4 c000000023fcb900 c000000002a08400 =
0000000000000048
>                GPR04: 00000000ffff7fff c000000023fcb5c0 0000000000000027 =
c000000f6fdd7e18
>                GPR08: 0000000000000023 0000000000000001 0000000000000027 =
c0000000028a6650
>                GPR12: 0000000000008000 c000000f6fff7680 c000000f6fe62600 =
0000000000000032
>                GPR16: 00000007331a989a c000000f6fe62600 c0000000238a6800 =
0000000000000001
>                GPR20: 0000000000000000 c000000002a4dfe0 0000000000000000 =
0000000000000006
>                GPR24: 0000000000000000 c000000f6fe63010 0000000000000001 =
c000000f6fe62680
>                GPR28: 0000000000000006 c0000000238a69c0 0000000000000000 =
c000000f6fe62600
> [   30.922569] NIP [c0000000001b27e8] update_blocked_averages+0x758/0x780
> [   30.922599] LR [c0000000001b27e4] update_blocked_averages+0x754/0x780
> [   30.922624] Call Trace:
> [   30.922631] [c000000023fcb900] [c0000000001b27e4] update_blocked_avera=
ges+0x754/0x780 (unreliable)
> [   30.922653] [c000000023fcba20] [c0000000001bd668] newidle_balance+0x25=
8/0x5c0
> [   30.922674] [c000000023fcbab0] [c0000000001bdaac] pick_next_task_fair+=
0x7c/0x4d0
> [   30.922692] [c000000023fcbb10] [c000000000dcd31c] __schedule+0x15c/0x1=
780
> [   30.922708] [c000000023fcbc50] [c0000000001a5a04] do_task_dead+0x64/0x=
70
> [   30.922726] [c000000023fcbc80] [c000000000156338] do_exit+0x848/0xcc0
> [   30.922743] [c000000023fcbd50] [c000000000156884] do_group_exit+0x64/0=
xe0
> [   30.922758] [c000000023fcbd90] [c000000000156924] sys_exit_group+0x24/=
0x30
> [   30.922774] [c000000023fcbdb0] [c0000000000310c0] system_call_exceptio=
n+0x150/0x2d0
> [   30.922792] [c000000023fcbe10] [c00000000000cc5c] system_call_common+0=
xec/0x278
> [   30.922808] --- interrupt: c00 at 0x7fffb3acddcc
> [   30.922821] NIP:  00007fffb3acddcc LR: 00007fffb3a27f04 CTR: 000000000=
0000000
> [   30.922833] REGS: c000000023fcbe80 TRAP: 0c00   Not tainted  (5.13.0-r=
c7-next-20210621)
> [   30.922847] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE=
>  CR: 28444202  XER: 00000000
> [   30.922882] IRQMASK: 0
>                GPR00: 00000000000000ea 00007fffc8f21780 00007fffb3bf7100 =
0000000000000000
>                GPR04: 0000000000000000 0000000155f142f0 0000000000000000 =
00007fffb3d23740
>                GPR08: fffffffffbad2a87 0000000000000000 0000000000000000 =
0000000000000000
>                GPR12: 0000000000000000 00007fffb3d2aeb0 0000000116be95e0 =
0000000000000032
>                GPR16: 0000000000000000 00007fffc8f21cd8 000000000000002d =
0000000000000024
>                GPR20: 00007fffc8f21cd4 00007fffb3bf4f98 0000000000000001 =
0000000000000001
>                GPR24: 00007fffb3bf0950 0000000000000000 0000000000000000 =
0000000000000001
>                GPR28: 0000000000000000 0000000000000000 00007fffb3d23ec0 =
0000000000000000
> [   30.923023] NIP [00007fffb3acddcc] 0x7fffb3acddcc
> [   30.923035] LR [00007fffb3a27f04] 0x7fffb3a27f04
> [   30.923045] --- interrupt: c00
> [   30.923052] Instruction dump:
> [   30.923061] 3863be48 9be97ae6 4bf9a8f9 60000000 0fe00000 4bfff980 e921=
0070 e8610088
> [   30.923088] 39400001 99490003 4bf9a8d9 60000000 <0fe00000> 4bfffc24 3d=
22fff5 89297ae3
> [   30.923113] ---[ end trace ed07974d2149c499 ]=E2=80=94
>
> This warning was introduced with commit 9e077b52d86a
> sched/pelt: Check that *_avg are null when *_sum are

Yes. That was exactly the purpose of the patch. There is one last
remaining part which could generate this. I'm going to prepare a patch

Thanks

>
> next-20210618 was good.
>
> Thanks
> -Sachin
