Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531C6B5488
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 23:36:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYLW46wTkz3f88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 09:36:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pH2oR/Lo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pH2oR/Lo;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYLVB1h07z3bck
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 09:35:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F3B761D77
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 22:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792C0C4339E
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678487727;
	bh=usvplWCLhQjy8vPe9zko5TmX1jgzJrG8K0axsFi3i6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pH2oR/LoStb9DOpSs9hwzrk2Dtup0SdtxFj9Vn2QZrODW0bQZcPTZsOMRKa0WUT/s
	 eVNxygZ5dK7aJzOptbc85r1Z8aP0cBHAPf842rW2FVmVJHGKihvmfzw12VcF3PF8Pd
	 yxDKQDdrWe2MuHIS2h22nrMdMIlOSF5QIKiIzsYwI+83m5497gEUiNIIQQlofKnIck
	 OHdp3AYBkosZ0RD9Dx7qOe97gQYgTYTjBmZXHwSTHo8CnK1UXNNrTFVIKjAJRztMr5
	 wkKuSMqOBg6HtscdSchA+nlT3UGSqJx8i+Sxk4q3LAdKjHmXb4R4HCRW0MejRaWgRx
	 Ys3P1tU1OqJwQ==
Received: by mail-lf1-f53.google.com with SMTP id d36so8569450lfv.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 14:35:27 -0800 (PST)
X-Gm-Message-State: AO0yUKWam+gMb7kW4zh5WY/D9Zyl8/KrP/vxb4PfpowxUi1+ELODgxcQ
	PNRDQxcFa9iM0L9t1uzDDVBYVCyYqsZ4kh/pXOI=
X-Google-Smtp-Source: AK7set+2gV8Y7Iqu2I0fKF9/RF1+QhuGz7Oe+KTlnvu6nEkG6OGIndksZJ42XN3PUKHnF/5a+cygx4+eHEwHU72Zro0=
X-Received: by 2002:a05:6512:68:b0:4dd:a4e1:4861 with SMTP id
 i8-20020a056512006800b004dda4e14861mr8380313lfo.3.1678487725397; Fri, 10 Mar
 2023 14:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20230309180213.180263-1-hbathini@linux.ibm.com> <20230309180213.180263-5-hbathini@linux.ibm.com>
In-Reply-To: <20230309180213.180263-5-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 10 Mar 2023 14:35:12 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6FvOwXU6m8rPRqGEgV2P=CGN6AYNHsarO1iRmmAjmEMQ@mail.gmail.com>
Message-ID: <CAPhsuW6FvOwXU6m8rPRqGEgV2P=CGN6AYNHsarO1iRmmAjmEMQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
To: Hari Bathini <hbathini@linux.ibm.com>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 9, 2023 at 10:03=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
> Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
> writes the program to the rw buffer. When the jit is done, the program
> is copied to the final location with bpf_jit_binary_pack_finalize.
> With multiple jit_subprogs, bpf_jit_free is called on some subprograms
> that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
> bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
> not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
> if necessary. While here, correct the misnomer powerpc64_jit_data to
> powerpc_jit_data as it is meant for both ppc32 and ppc64.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/net/bpf_jit.h        |   7 +-
>  arch/powerpc/net/bpf_jit_comp.c   | 104 +++++++++++++++++++++---------
>  arch/powerpc/net/bpf_jit_comp32.c |   4 +-
>  arch/powerpc/net/bpf_jit_comp64.c |   6 +-
>  4 files changed, 83 insertions(+), 38 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index d767e39d5645..a8b7480c4d43 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -168,15 +168,16 @@ static inline void bpf_clear_seen_register(struct c=
odegen_context *ctx, int i)
>
>  void bpf_jit_init_reg_mapping(struct codegen_context *ctx);
>  int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, =
u64 func);
> -int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_c=
ontext *ctx,
> +int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, str=
uct codegen_context *ctx,
>                        u32 *addrs, int pass, bool extra_pass);
>  void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
>  void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
>  void bpf_jit_realloc_regs(struct codegen_context *ctx);
>  int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int =
tmp_reg, long exit_addr);
>
> -int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, str=
uct codegen_context *ctx,
> -                         int insn_idx, int jmp_off, int dst_reg);
> +int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, =
int pass,
> +                         struct codegen_context *ctx, int insn_idx,
> +                         int jmp_off, int dst_reg);
>
>  #endif
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index d1794d9f0154..ece75c829499 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -42,10 +42,11 @@ int bpf_jit_emit_exit_insn(u32 *image, struct codegen=
_context *ctx, int tmp_reg,
>         return 0;
>  }
>
> -struct powerpc64_jit_data {
> -       struct bpf_binary_header *header;
> +struct powerpc_jit_data {
> +       struct bpf_binary_header *hdr;
> +       struct bpf_binary_header *fhdr;
>         u32 *addrs;
> -       u8 *image;
> +       u8 *fimage;
>         u32 proglen;
>         struct codegen_context ctx;
>  };

Some comments about the f- prefix will be helpful. (Yes, I should have done
better job adding comments for the x86 counterpart..)

> @@ -62,15 +63,18 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>         u8 *image =3D NULL;
>         u32 *code_base;
>         u32 *addrs;
> -       struct powerpc64_jit_data *jit_data;
> +       struct powerpc_jit_data *jit_data;
>         struct codegen_context cgctx;
>         int pass;
>         int flen;
> -       struct bpf_binary_header *bpf_hdr;
> +       struct bpf_binary_header *fhdr =3D NULL;
> +       struct bpf_binary_header *hdr =3D NULL;
>         struct bpf_prog *org_fp =3D fp;
>         struct bpf_prog *tmp_fp;
>         bool bpf_blinded =3D false;
>         bool extra_pass =3D false;
> +       u8 *fimage =3D NULL;
> +       u32 *fcode_base;
>         u32 extable_len;
>         u32 fixup_len;
>
> @@ -100,9 +104,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog=
 *fp)
>         addrs =3D jit_data->addrs;
>         if (addrs) {
>                 cgctx =3D jit_data->ctx;
> -               image =3D jit_data->image;
> -               bpf_hdr =3D jit_data->header;
> +               fimage =3D jit_data->fimage;
> +               fhdr =3D jit_data->fhdr;
>                 proglen =3D jit_data->proglen;
> +               hdr =3D jit_data->hdr;
> +               image =3D (void *)hdr + ((void *)fimage - (void *)fhdr);
>                 extra_pass =3D true;
>                 goto skip_init_ctx;
>         }
> @@ -120,7 +126,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>         cgctx.stack_size =3D round_up(fp->aux->stack_depth, 16);
>
>         /* Scouting faux-generate pass 0 */
> -       if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
> +       if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) =
{
>                 /* We hit something illegal or unsupported. */
>                 fp =3D org_fp;
>                 goto out_addrs;
> @@ -135,7 +141,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>          */
>         if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((lon=
g)cgctx.idx * 4)) {
>                 cgctx.idx =3D 0;
> -               if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
> +               if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, =
false)) {
>                         fp =3D org_fp;
>                         goto out_addrs;
>                 }
> @@ -157,17 +163,19 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>         proglen =3D cgctx.idx * 4;
>         alloclen =3D proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_=
len;
>
> -       bpf_hdr =3D bpf_jit_binary_alloc(alloclen, &image, 4, bpf_jit_fil=
l_ill_insns);
> -       if (!bpf_hdr) {
> +       fhdr =3D bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &i=
mage,
> +                                             bpf_jit_fill_ill_insns);
> +       if (!fhdr) {
>                 fp =3D org_fp;
>                 goto out_addrs;
>         }
>
>         if (extable_len)
> -               fp->aux->extable =3D (void *)image + FUNCTION_DESCR_SIZE =
+ proglen + fixup_len;
> +               fp->aux->extable =3D (void *)fimage + FUNCTION_DESCR_SIZE=
 + proglen + fixup_len;
>
>  skip_init_ctx:
>         code_base =3D (u32 *)(image + FUNCTION_DESCR_SIZE);
> +       fcode_base =3D (u32 *)(fimage + FUNCTION_DESCR_SIZE);
>
>         /* Code generation passes 1-2 */
>         for (pass =3D 1; pass < 3; pass++) {
> @@ -175,8 +183,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>                 cgctx.idx =3D 0;
>                 cgctx.alt_exit_addr =3D 0;
>                 bpf_jit_build_prologue(code_base, &cgctx);
> -               if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, pass=
, extra_pass)) {
> -                       bpf_jit_binary_free(bpf_hdr);
> +               if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx,=
 addrs, pass, extra_pass)) {
> +                       bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeo=
f(hdr->size));
> +                       bpf_jit_binary_pack_free(fhdr, hdr);
>                         fp =3D org_fp;
>                         goto out_addrs;
>                 }
> @@ -192,21 +201,23 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>                  * Note that we output the base address of the code_base
>                  * rather than image, since opcodes are in code_base.
>                  */
Maybe update the comment above with fcode_base to avoid
confusion.

> -               bpf_jit_dump(flen, proglen, pass, code_base);
> +               bpf_jit_dump(flen, proglen, pass, fcode_base);
>
>  #ifdef CONFIG_PPC64_ELF_ABI_V1
>         /* Function descriptor nastiness: Address + TOC */
> -       ((u64 *)image)[0] =3D (u64)code_base;
> +       ((u64 *)image)[0] =3D (u64)fcode_base;
>         ((u64 *)image)[1] =3D local_paca->kernel_toc;
>  #endif
>
> -       fp->bpf_func =3D (void *)image;
> +       fp->bpf_func =3D (void *)fimage;
>         fp->jited =3D 1;
>         fp->jited_len =3D proglen + FUNCTION_DESCR_SIZE;
>
> -       bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + bpf_hdr->size);
>         if (!fp->is_func || extra_pass) {
> -               bpf_jit_binary_lock_ro(bpf_hdr);
> +               if (bpf_jit_binary_pack_finalize(fp, fhdr, hdr)) {
> +                       fp =3D org_fp;
> +                       goto out_addrs;
> +               }
>                 bpf_prog_fill_jited_linfo(fp, addrs);
>  out_addrs:
>                 kfree(addrs);
> @@ -216,8 +227,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog =
*fp)
>                 jit_data->addrs =3D addrs;
>                 jit_data->ctx =3D cgctx;
>                 jit_data->proglen =3D proglen;
> -               jit_data->image =3D image;
> -               jit_data->header =3D bpf_hdr;
> +               jit_data->fimage =3D fimage;
> +               jit_data->fhdr =3D fhdr;
> +               jit_data->hdr =3D hdr;
>         }
>
>  out:
> @@ -231,12 +243,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
>   * The caller should check for (BPF_MODE(code) =3D=3D BPF_PROBE_MEM) bef=
ore calling
>   * this function, as this only applies to BPF_PROBE_MEM, for now.
>   */
> -int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, str=
uct codegen_context *ctx,
> -                         int insn_idx, int jmp_off, int dst_reg)
> +int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, =
int pass,
> +                         struct codegen_context *ctx, int insn_idx, int =
jmp_off,
> +                         int dst_reg)
>  {
>         off_t offset;
>         unsigned long pc;
> -       struct exception_table_entry *ex;
> +       struct exception_table_entry *ex, *ex_entry;
>         u32 *fixup;
>
>         /* Populate extable entries only in the last pass */
> @@ -247,9 +260,16 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *=
image, int pass, struct code
>             WARN_ON_ONCE(ctx->exentry_idx >=3D fp->aux->num_exentries))
>                 return -EINVAL;
>
> +       /*
> +        * Program is firt written to image before copying to the
s/firt/first/

> +        * final location (fimage). Accordingly, update in the image firs=
t.
> +        * As all offsets used are relative, copying as is to the
> +        * final location should be alright.
> +        */
>         pc =3D (unsigned long)&image[insn_idx];
> +       ex =3D (void *)fp->aux->extable - (void *)fimage + (void *)image;
>
> -       fixup =3D (void *)fp->aux->extable -
> +       fixup =3D (void *)ex -
>                 (fp->aux->num_exentries * BPF_FIXUP_LEN * 4) +
>                 (ctx->exentry_idx * BPF_FIXUP_LEN * 4);
>
> @@ -260,17 +280,17 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 =
*image, int pass, struct code
>         fixup[BPF_FIXUP_LEN - 1] =3D
>                 PPC_RAW_BRANCH((long)(pc + jmp_off) - (long)&fixup[BPF_FI=
XUP_LEN - 1]);
>
> -       ex =3D &fp->aux->extable[ctx->exentry_idx];
> +       ex_entry =3D &ex[ctx->exentry_idx];
>
> -       offset =3D pc - (long)&ex->insn;
> +       offset =3D pc - (long)&ex_entry->insn;
>         if (WARN_ON_ONCE(offset >=3D 0 || offset < INT_MIN))
>                 return -ERANGE;
> -       ex->insn =3D offset;
> +       ex_entry->insn =3D offset;
>
> -       offset =3D (long)fixup - (long)&ex->fixup;
> +       offset =3D (long)fixup - (long)&ex_entry->fixup;
>         if (WARN_ON_ONCE(offset >=3D 0 || offset < INT_MIN))
>                 return -ERANGE;
> -       ex->fixup =3D offset;
> +       ex_entry->fixup =3D offset;
>
>         ctx->exentry_idx++;
>         return 0;
> @@ -308,3 +328,27 @@ int bpf_arch_text_invalidate(void *dst, size_t len)
>
>         return ret;
>  }
> +
> +void bpf_jit_free(struct bpf_prog *fp)
> +{
> +       if (fp->jited) {
> +               struct powerpc_jit_data *jit_data =3D fp->aux->jit_data;
> +               struct bpf_binary_header *hdr;
> +
> +               /*
> +                * If we fail the final pass of JIT (from jit_subprogs),
> +                * the program may not be finalized yet. Call finalize he=
re
> +                * before freeing it.
> +                */
> +               if (jit_data) {
> +                       bpf_jit_binary_pack_finalize(fp, jit_data->fhdr, =
jit_data->hdr);

I just realized x86 is the same. But I think we only need the following
here?

bpf_arch_text_copy(&jit_data->fhdr->size, &jit_data->hdr->size,
sizeof(jit_data->hdr->size));

Right?

Thanks,
Song
