Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6241FE64
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 00:13:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMLpk6rX6z305p
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 09:13:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=qmd1BRa3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=anyfinetworks.com (client-ip=2607:f8b0:4864:20::b32;
 helo=mail-yb1-xb32.google.com; envelope-from=johan.almbladh@anyfinetworks.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com
 header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=qmd1BRa3; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMDmY2S44z2ynd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Oct 2021 04:41:15 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id u32so27656554ybd.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Oct 2021 10:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I7Hroc3+MqrMFWaFTtvs4lVC7qwTcLSuDkGBDKTRL4M=;
 b=qmd1BRa3xHYlbttAXTQl3xBy6oSR6ELKU6YgN3veTdQnJk0C1mDR4mKnnSEPbawD15
 PjMdRrgskRfBN9znmYvzI6PwvS6lg14+4aQOHoNKruMp6lXW32SQMWqPI6KgISX8qCTb
 uGRDP2BfatcNvc3FvRuWboiD/moItnuVkwJyh7yKqFulfPs7SUHaEZfwvChEEtz025IO
 1/4HcwZYV6XkF7jQUd2jyuNgU4Hlyyu1/dCx84ofE7kThvti4iMWu0KQZIX3xo9RWbbD
 +PkMgIxWOEN/VAo10cfC5hk6aOBdhHhSCIdk4RvBc9s+k5PDQ2u6rfJXEpd2U1oY7vuB
 hCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I7Hroc3+MqrMFWaFTtvs4lVC7qwTcLSuDkGBDKTRL4M=;
 b=bOJSUaHfGRR6Vc1z8B9WY7ad0jsaw3+VR84u1s6SqmaInKo9cc2NoH0n8mZzLBzJAe
 pT5aatIAqaxKLfx5tSpIrAlYUz6sNx/dVz/SJPN2S94O7Y9XSBXnjUDnm3dOLwlN17Zk
 pn0Lg2q1cj4vnPaz330w2grlf4SSmBymVmpPnK0nOioeL0u+3zs9MG7beqnQHCZKvi3l
 gUPIVvTpRlz5KT86bI5EN+pFn6kB1QSVs5U6X9gpr84CY7O9hDVrykSO6UGLjJXUazW5
 D7dt1PlNJaoKj2mWUQxzgTb09z2ta1NEcJ6r4MQmTiBEIyFx6nsQclXBepB4ntgDbjYT
 xWKA==
X-Gm-Message-State: AOAM531TNwikLtG2uBl3w7Kfs3aqP79ZnUBzS/zxMLKtizJBbFXmzpHJ
 3fkzihX+svO0qWMjKmupfP6egQ2CT6kixCVLr8ycbg==
X-Google-Smtp-Source: ABdhPJyCWFlSgCPm3tiOkXw8RyMZA2XUHUQ2nuy9q7bK2YZ7il0HNSEsa1GgxTJFTHLnMFKwubuHxe0di5cKSenyiJ8=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr5110823ybg.306.1633196472613; 
 Sat, 02 Oct 2021 10:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Sat, 2 Oct 2021 19:41:01 +0200
Message-ID: <CAM1=_QSrOZBk+_h224cdxrZw7djqUqO9jytYNV--9V-KTJmt9Q@mail.gmail.com>
Subject: Re: [PATCH 0/9] powerpc/bpf: Various fixes
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 03 Oct 2021 09:09:12 +1100
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Nicholas Piggin <npiggin@gmail.com>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 11:15 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> Various fixes to the eBPF JIT for powerpc, thanks to some new tests
> added by Johan. This series fixes all failures in test_bpf on powerpc64.
> There are still some failures on powerpc32 to be looked into.

Great work! I have tested it on powerpc64 in QEMU, which is the same
setup that previously triggered an illegal instruction, and all tests
pass now. On powerpc32 there are still some issues left as you say.

Thanks!
Johan


>
> - Naveen
>
>
> Naveen N. Rao (8):
>   powerpc/lib: Add helper to check if offset is within conditional
>     branch range
>   powerpc/bpf: Validate branch ranges
>   powerpc/bpf: Handle large branch ranges with BPF_EXIT
>   powerpc/bpf: Fix BPF_MOD when imm == 1
>   powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
>   powerpc/bpf: Limit 'ldbrx' to processors compliant with ISA v2.06
>   powerpc/security: Add a helper to query stf_barrier type
>   powerpc/bpf: Emit stf barrier instruction sequences for BPF_NOSPEC
>
> Ravi Bangoria (1):
>   powerpc/bpf: Remove unused SEEN_STACK
>
>  arch/powerpc/include/asm/code-patching.h     |   1 +
>  arch/powerpc/include/asm/ppc-opcode.h        |   1 +
>  arch/powerpc/include/asm/security_features.h |   5 +
>  arch/powerpc/kernel/security.c               |   5 +
>  arch/powerpc/lib/code-patching.c             |   7 +-
>  arch/powerpc/net/bpf_jit.h                   |  39 ++++---
>  arch/powerpc/net/bpf_jit64.h                 |   8 +-
>  arch/powerpc/net/bpf_jit_comp.c              |  28 ++++-
>  arch/powerpc/net/bpf_jit_comp32.c            |  10 +-
>  arch/powerpc/net/bpf_jit_comp64.c            | 113 ++++++++++++++-----
>  10 files changed, 167 insertions(+), 50 deletions(-)
>
>
> base-commit: 044c2d99d9f43c6d6fde8bed00672517dd9a5a57
> --
> 2.33.0
>
