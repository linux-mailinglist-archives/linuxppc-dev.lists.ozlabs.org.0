Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A366C41F704
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:38:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLk4j3LB3z3bgl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 07:38:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jq+FdnYs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jq+FdnYs; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLk416BJTz2ypc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 07:37:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07B4E6124D
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 21:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633124266;
 bh=vcQeRWEapEyT1/e8F/h3cE5WKM07XmeoPqh8MV3qeZo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jq+FdnYs/Aj+EoiljpIjXvKTMh8FtEbrx1VhW65IAhU1kazJi78Rt7XQC+YX6Du4J
 6RQzZwEaTcLHOXowxai10JfK45D82JVSebL/o6PIRcJyIYdCFwo6FhI6hwaE0qcs1j
 mO2bmltWoyvRPYAOukSAs5b2YPW2ASefkhnOGwJbLDgInpmQcwc3xLLWL9YOrKgtdj
 vPmeSwdAJS2JD7hJCtKzncm0tyeAdy1rsmttk24IQTqK+6I63BrXrZBTxNjAf1pVKm
 fMZj11GAmUVyZs/oCIsAisG9uZhfD49r4izWibL6qPcVuN9dZDsyfwVBalB+KZS5PV
 NwgAsOg/tE9hA==
Received: by mail-lf1-f52.google.com with SMTP id z24so43812132lfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 14:37:45 -0700 (PDT)
X-Gm-Message-State: AOAM531IzWySLWZh82qE6rS0+ZqJmducMAeZZ5mk25ZOB/xX+7XujX9o
 0+FojHtNfIdtDhDn8UuEKl9+Cr41zIfNMGdPFlk=
X-Google-Smtp-Source: ABdhPJzvtMFVEU4AB8r6TnjJhPsxAc2V3o3VTYo8PsHuH249W0pmzCJDolYDvSuxNBFR+uarO7rO1nQmG91aihAcFhA=
X-Received: by 2002:a05:6512:708:: with SMTP id
 b8mr347641lfs.598.1633124264272; 
 Fri, 01 Oct 2021 14:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <f8d581e6a5d9555180c38e009f90d236f310f85e.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <f8d581e6a5d9555180c38e009f90d236f310f85e.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 1 Oct 2021 14:37:33 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4Qv5e=x6WMV1EYy+NUdu+i+i+kGY2E3WAhV66a115C=Q@mail.gmail.com>
Message-ID: <CAPhsuW4Qv5e=x6WMV1EYy+NUdu+i+i+kGY2E3WAhV66a115C=Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] powerpc/lib: Add helper to check if offset is within
 conditional branch range
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 2:16 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> Add a helper to check if a given offset is within the branch range for a
> powerpc conditional branch instruction, and update some sites to use the
> new helper.
>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Song Liu <songliubraving@fb.com>

With one nitpick:

> ---
>  arch/powerpc/include/asm/code-patching.h | 1 +
>  arch/powerpc/lib/code-patching.c         | 7 ++++++-
>  arch/powerpc/net/bpf_jit.h               | 7 +------
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> index a95f63788c6b14..4ba834599c4d4c 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -23,6 +23,7 @@
>  #define BRANCH_ABSOLUTE        0x2
>
>  bool is_offset_in_branch_range(long offset);
> +bool is_offset_in_cond_branch_range(long offset);
>  int create_branch(struct ppc_inst *instr, const u32 *addr,
>                   unsigned long target, int flags);
>  int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index f9a3019e37b43c..e2342b9a1ab9c9 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -228,6 +228,11 @@ bool is_offset_in_branch_range(long offset)
>         return (offset >= -0x2000000 && offset <= 0x1fffffc && !(offset & 0x3));
>  }
>
> +bool is_offset_in_cond_branch_range(long offset)
> +{
> +       return offset >= -0x8000 && offset <= 0x7FFF && !(offset & 0x3);
> +}

Why not inline this one?

> +
>  /*
>   * Helper to check if a given instruction is a conditional branch
>   * Derived from the conditional checks in analyse_instr()
> @@ -280,7 +285,7 @@ int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
>                 offset = offset - (unsigned long)addr;
>
>         /* Check we can represent the target in the instruction format */
> -       if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
> +       if (!is_offset_in_cond_branch_range(offset))
>                 return 1;
>
>         /* Mask out the flags and target, so they don't step on each other. */
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 99fad093f43ec1..935ea95b66359e 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -78,11 +78,6 @@
>  #define PPC_FUNC_ADDR(d,i) do { PPC_LI32(d, i); } while(0)
>  #endif
>
> -static inline bool is_nearbranch(int offset)
> -{
> -       return (offset < 32768) && (offset >= -32768);
> -}
> -
>  /*
>   * The fly in the ointment of code size changing from pass to pass is
>   * avoided by padding the short branch case with a NOP.         If code size differs
> @@ -91,7 +86,7 @@ static inline bool is_nearbranch(int offset)
>   * state.
>   */
>  #define PPC_BCC(cond, dest)    do {                                          \
> -               if (is_nearbranch((dest) - (ctx->idx * 4))) {                 \
> +               if (is_offset_in_cond_branch_range((long)(dest) - (ctx->idx * 4))) {    \
>                         PPC_BCC_SHORT(cond, dest);                            \
>                         EMIT(PPC_RAW_NOP());                                  \
>                 } else {                                                      \
> --
> 2.33.0
>
