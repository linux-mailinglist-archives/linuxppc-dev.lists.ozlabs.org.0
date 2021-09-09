Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA8404530
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 07:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4p5x6zTpz2yJs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 15:51:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CmWrpGJW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=andrii.nakryiko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CmWrpGJW; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4p5J0f4hz2xrM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 15:50:43 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id c206so1564100ybb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Sep 2021 22:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbAwJn7fFiGfPLrVocqe11Q3q7IsLXBF5Gxx03pmlXE=;
 b=CmWrpGJWf7JI1pP0j0mp45iHU8XkQe2EqAUzjV7ZmD/9FcnGbJAjU+KHRVJytckonC
 vujUXfoq2DKOdHDooun6rux/zPb5UUNw6F0/rYYiG63z0gXl5FRo9mM4D/ZHlcjFEoT5
 TSsPsN+5dKnBSLAhkl0Su9JKaQpr90RBEm4Bp9T0uBXdLr0wrGO5QAHwK8IFJ0/Bufj4
 1xgY7VRPTUjHu9eIZWZuoV3u6fgcauS7FWhKhnxCRypxO896NpcBImOjOFxkiiobXx1x
 j7DRcXdP4TINM1IE+y5xZAS4KExdFRwogWOejAehtF6YEY4uO6oaSr2HYcGFJo7eD5l9
 eReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbAwJn7fFiGfPLrVocqe11Q3q7IsLXBF5Gxx03pmlXE=;
 b=uIN/XMlgn21nfN6XHSUM+DBSAPtOCH+FCT+0RdKzzv35Ytlf/upN1HO10AOBUUak8/
 hvQW44z3QTOJQ9qNVGcHTKpsu3Qu5BBB+r6sBBi2Tp6T601+PLR/YkhtNEfmymvPWVFp
 Bg7/N1ohp8JEKBTXu5fjkjfQqc7yyKaMO+FhfL1uH25pQLdpfCIU0QifmksyYm2MP4QJ
 +apcvVOtxq3564OYrnJZ2uF+SCKYeYBJxGqKgOgNBM5CAMshB2mrApHfW7U6Lfjx/pYo
 84vOsApgFVFd19IkzNyUeNAgp1tBkC5dDF/U8ZDVjBQuMf9GNkcb8MHJ5YxlZdgqS10W
 kGYg==
X-Gm-Message-State: AOAM531e6xC+k643Q8It+Pug/s09E7Et6HneOkm1sCOMhBOYoQLE/7rJ
 HkyTOn+UYJ+ftqZ8c/GLuXTrSyCs51CQze8wjjY=
X-Google-Smtp-Source: ABdhPJxt1xA0uM8Q0oqALtqvGBUDGndJ4a+HcDFgyDfaBTs5y9qs8UNRpk1kp/Lb9NyUROynnQ45aqXim7JNzY/Zqj0=
X-Received: by 2002:a5b:702:: with SMTP id g2mr1597430ybq.307.1631166635450;
 Wed, 08 Sep 2021 22:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <1631158350-3661-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1631158350-3661-1-git-send-email-yangtiezhu@loongson.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 8 Sep 2021 22:50:24 -0700
Message-ID: <CAEf4BzZqoVZ7keWCLmC=A5oPPwj_xMNRWDkJUcjWn9yE_z1gSg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: Change value of MAX_TAIL_CALL_CNT from 32
 to 33
To: Tiezhu Yang <yangtiezhu@loongson.cn>
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
Cc: Song Liu <songliubraving@fb.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Shubham Bansal <illusionist.neo@gmail.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Paul Burton <paulburton@kernel.org>, Paul Chaignon <paul@cilium.io>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 naveen.n.rao@linux.ibm.com, Yonghong Song <yhs@fb.com>,
 linux-mips@vger.kernel.org, Xi Wang <xi.wang@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Luke Nelson <luke.r.nels@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Borkmann <daniel@iogearbox.net>, Networking <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 8, 2021 at 8:33 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> In the current code, the actual max tail call count is 33 which is greater
> than MAX_TAIL_CALL_CNT (defined as 32), the actual limit is not consistent
> with the meaning of MAX_TAIL_CALL_CNT, there is some confusion and need to
> spend some time to think the reason at the first glance.

think *about* the reason

>
> We can see the historical evolution from commit 04fd61ab36ec ("bpf: allow
> bpf programs to tail-call other bpf programs") and commit f9dabe016b63
> ("bpf: Undo off-by-one in interpreter tail call count limit").
>
> In order to avoid changing existing behavior, the actual limit is 33 now,
> this is resonable.

typo: reasonable

>
> After commit 874be05f525e ("bpf, tests: Add tail call test suite"), we can
> see there exists failed testcase.
>
> On all archs when CONFIG_BPF_JIT_ALWAYS_ON is not set:
>  # echo 0 > /proc/sys/net/core/bpf_jit_enable
>  # modprobe test_bpf
>  # dmesg | grep -w FAIL
>  Tail call error path, max count reached jited:0 ret 34 != 33 FAIL
>
> On some archs:
>  # echo 1 > /proc/sys/net/core/bpf_jit_enable
>  # modprobe test_bpf
>  # dmesg | grep -w FAIL
>  Tail call error path, max count reached jited:1 ret 34 != 33 FAIL
>
> So it is necessary to change the value of MAX_TAIL_CALL_CNT from 32 to 33,
> then do some small changes of the related code.
>
> With this patch, it does not change the current limit, MAX_TAIL_CALL_CNT
> can reflect the actual max tail call count, and the above failed testcase
> can be fixed.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

This change breaks selftests ([0]), please fix them at the same time
as you are changing the kernel behavior:

  test_tailcall_2:PASS:tailcall 128 nsec
  test_tailcall_2:PASS:tailcall 128 nsec
  test_tailcall_2:FAIL:tailcall err 0 errno 2 retval 4
  #135/2 tailcalls/tailcall_2:FAIL
  test_tailcall_3:PASS:tailcall 128 nsec
  test_tailcall_3:FAIL:tailcall count err 0 errno 2 count 34
  test_tailcall_3:PASS:tailcall 128 nsec
  #135/3 tailcalls/tailcall_3:FAIL
  #135/4 tailcalls/tailcall_4:OK
  #135/5 tailcalls/tailcall_5:OK
  #135/6 tailcalls/tailcall_bpf2bpf_1:OK
  test_tailcall_bpf2bpf_2:PASS:tailcall 128 nsec
  test_tailcall_bpf2bpf_2:FAIL:tailcall count err 0 errno 2 count 34
  test_tailcall_bpf2bpf_2:PASS:tailcall 128 nsec
  #135/7 tailcalls/tailcall_bpf2bpf_2:FAIL
  #135/8 tailcalls/tailcall_bpf2bpf_3:OK
  test_tailcall_bpf2bpf_4:PASS:tailcall 54 nsec
  test_tailcall_bpf2bpf_4:FAIL:tailcall count err 0 errno 2 count 32
  #135/9 tailcalls/tailcall_bpf2bpf_4:FAIL
  test_tailcall_bpf2bpf_4:PASS:tailcall 54 nsec
  test_tailcall_bpf2bpf_4:FAIL:tailcall count err 0 errno 2 count 32
  #135/10 tailcalls/tailcall_bpf2bpf_5:FAIL
  #135 tailcalls:FAIL


  [0] https://github.com/kernel-patches/bpf/pull/1747/checks?check_run_id=3552002906

>  arch/arm/net/bpf_jit_32.c         | 11 ++++++-----
>  arch/arm64/net/bpf_jit_comp.c     |  7 ++++---
>  arch/mips/net/ebpf_jit.c          |  4 ++--
>  arch/powerpc/net/bpf_jit_comp32.c |  4 ++--
>  arch/powerpc/net/bpf_jit_comp64.c | 12 ++++++------
>  arch/riscv/net/bpf_jit_comp32.c   |  4 ++--
>  arch/riscv/net/bpf_jit_comp64.c   |  4 ++--
>  arch/sparc/net/bpf_jit_comp_64.c  |  8 ++++----
>  include/linux/bpf.h               |  2 +-
>  kernel/bpf/core.c                 |  4 ++--
>  10 files changed, 31 insertions(+), 29 deletions(-)
>

[...]
