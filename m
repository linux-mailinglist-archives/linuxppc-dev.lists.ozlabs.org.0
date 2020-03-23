Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AC18F060
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 08:39:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m5q4709VzDr68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 18:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m2wZ0x4k; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m5nM5WPNzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 18:37:27 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id m15so5696402pje.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=MYoCOa75KDMm0Oj+C5PQ2Tksj5NTRguHM8xzS77p+DU=;
 b=m2wZ0x4kdCwUrwlvu+wq+3LFrKhDiaj72eEF6VhkFWbE4VR5prYFB8rWKVan55tBu+
 RRrNvG9Kmqf9QvatUWSClBUar/a6YLkVH+JHwJawOCiKVzsCWtoJjV02rX/2mgo5dy93
 BcjL5b8Zz3ygeZRXsnRIcJP/A+LeCzLyai0Y25bZ2OHZ2I9+xmpr3abbZ2dUtOAYFSMM
 Ym591CozslBJ06UPivgGMtfY4aWloijvkGxBLgBeLF/6srBtTxFJ62RyTOIePDgsreBb
 1GOjl2g7jDvk4T9XSZ6fjphJkO0TPym2QASaeO5a7gGhzXaY2SJI7CsECwX1a/FIVNXd
 LTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=MYoCOa75KDMm0Oj+C5PQ2Tksj5NTRguHM8xzS77p+DU=;
 b=JRxJulYKWB/JZqEcfLWyb+KV1TZH1R8Fmr7gEzuRTwTh/TpiI4p9Ka0qd3sWkF1XX+
 BjEAFfpUjc0XM5cp12Xau5lHrETmt01WymhVil3+O/PvCj2ARwwi1uB5rtCuuB51+CWq
 59QXweMDVs8/64MLWhqLAKttl7flDTdNZLy9UUi2vkPQactdsGVfB7QRyAIyZKhKURdQ
 Pm6QOUQVTDRFRQ87kZxoZFamf2n7SJGQe5+OobFNjOPI99+vD53PKmOlHDVR6DIsdvJM
 T32OaBaPARPdwYJrjK5hk5o5kcx50lT1Zc2CwOiVMF6WCG9O3Vm5D//7cXJluda9Z0Uk
 OQFA==
X-Gm-Message-State: ANhLgQ2NBBbkFqa5VGOgAUnzIYII8l1rgc56qKW7+LXW7KBc1qeYZfJe
 Tqg8PsUSIhZQQxkcfMDkE80=
X-Google-Smtp-Source: ADFU+vsGdGcE0LC3TJ9G8S9olBGuUkWW9xySESnkPzYuyOCBKvA1EiYp4EyUb8tBGOx9B1I59oBegQ==
X-Received: by 2002:a17:90a:2226:: with SMTP id
 c35mr24638211pje.2.1584949045357; 
 Mon, 23 Mar 2020 00:37:25 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id w15sm12457656pfj.28.2020.03.23.00.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 00:37:24 -0700 (PDT)
Date: Mon, 23 Mar 2020 17:33:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 14/16] powerpc64: Add prefixed instructions to
 instruction data type
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-15-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-15-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584947189.oay6araq0n.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 20, 2020 3:18 pm:
> For powerpc64, redefine the ppc_inst type so both word and prefixed
> instructions can be represented. On powerpc32 the type will remain the
> same.  Update places which had assumed instructions to be 4 bytes long.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> ---
>  arch/powerpc/include/asm/code-patching.h | 10 +--
>  arch/powerpc/include/asm/inst.h          | 90 ++++++++++++++++++++++++
>  arch/powerpc/include/asm/kprobes.h       |  2 +-
>  arch/powerpc/include/asm/sstep.h         |  4 ++
>  arch/powerpc/include/asm/uaccess.h       | 22 ++++++
>  arch/powerpc/include/asm/uprobes.h       |  2 +-
>  arch/powerpc/kernel/align.c              |  5 +-
>  arch/powerpc/kernel/hw_breakpoint.c      |  2 +-
>  arch/powerpc/kernel/kprobes.c            |  7 +-
>  arch/powerpc/kernel/optprobes.c          | 42 ++++++-----
>  arch/powerpc/kernel/optprobes_head.S     |  3 +
>  arch/powerpc/kernel/trace/ftrace.c       | 19 ++++-
>  arch/powerpc/kernel/uprobes.c            |  2 +-
>  arch/powerpc/lib/code-patching.c         | 22 ++++--
>  arch/powerpc/lib/sstep.c                 |  4 +-
>  arch/powerpc/xmon/xmon.c                 | 38 +++++++---
>  16 files changed, 221 insertions(+), 53 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/incl=
ude/asm/code-patching.h
> index 68bd9db334bd..bd41e1558707 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -25,11 +25,11 @@
>  bool is_offset_in_branch_range(long offset);
>  ppc_inst create_branch(const ppc_inst *addr,
>  			   unsigned long target, int flags);
> -unsigned int create_cond_branch(const ppc_inst *addr,
> +ppc_inst create_cond_branch(const void *addr,
>  				unsigned long target, int flags);
> -int patch_branch(ppc_inst *addr, unsigned long target, int flags);
> -int patch_instruction(ppc_inst *addr, ppc_inst instr);
> -int raw_patch_instruction(ppc_inst *addr, ppc_inst instr);
> +int patch_branch(void *addr, unsigned long target, int flags);
> +int patch_instruction(void *addr, ppc_inst instr);
> +int raw_patch_instruction(void *addr, ppc_inst instr);
> =20
>  static inline unsigned long patch_site_addr(s32 *site)
>  {
> @@ -60,7 +60,7 @@ static inline int modify_instruction_site(s32 *site, un=
signed int clr, unsigned
>  int instr_is_relative_branch(ppc_inst instr);
>  int instr_is_relative_link_branch(ppc_inst instr);
>  int instr_is_branch_to_addr(const ppc_inst *instr, unsigned long addr);
> -unsigned long branch_target(const ppc_inst *instr);
> +unsigned long branch_target(const void *instr);
>  ppc_inst translate_branch(const ppc_inst *dest,
>  			      const ppc_inst *src);
>  extern bool is_conditional_branch(ppc_inst instr);
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/i=
nst.h
> index 7c8596ee411e..1a40b0a71128 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -6,6 +6,95 @@
>   * Instruction data type for POWER
>   */
> =20
> +#ifdef __powerpc64__
> +
> +typedef struct ppc_inst {
> +	union {
> +		struct {
> +			u32 word;
> +			u32 pad;
> +		} __packed;
> +		struct {
> +			u32 prefix;
> +			u32 suffix;
> +		} __packed;
> +	};
> +} ppc_inst;
> +
> +#define PPC_INST(x) ((ppc_inst) { .word =3D (x), .pad =3D 0 })
> +#define PPC_INST_PREFIXED(x, y) ((ppc_inst) { .prefix =3D (x), .suffix =
=3D (y) })
> +
> +static inline int ppc_inst_opcode(ppc_inst x)
> +{
> +	return x.word >> 26;
> +}
> +
> +static inline bool ppc_inst_prefixed(ppc_inst x) {
> +	return ppc_inst_opcode(x) =3D=3D 1;
> +}
> +
> +static inline int ppc_inst_len(ppc_inst x)
> +{
> +	if (ppc_inst_prefixed(x))
> +		return 8;
> +	else
> +		return 4;
> +}
> +
> +static inline u32 ppc_inst_word(ppc_inst x)
> +{
> +	return x.word;
> +}

I guess a concern could be that code using ppc_inst_word could now get a=20
prefix unexpectedly and not handle it properly. The reason it should
generally be okay is that prefix won't match any existing valid
instruction words, so callers won't match or think it's an unknown
instruction. Am I right? Possibly a small comment?

> +
> +static inline u32 ppc_inst_prefix(ppc_inst x)
> +{
> +	return x.prefix;
> +}
> +
> +static inline u32 ppc_inst_suffix(ppc_inst x)
> +{
> +	return x.suffix;
> +}
> +
> +
> +static inline ppc_inst ppc_inst_read(const void *ptr)
> +{
> +	ppc_inst inst;
> +	inst.word =3D *(u32 *)ptr;
> +	if (ppc_inst_prefixed(inst))
> +		inst.suffix =3D *((u32 *)ptr + 1);
> +	else
> +		inst.pad =3D 0;

I'm a bit against using partially constructed opaque type for things=20
like this, even if it is in the code that knows about the type. We
could modify ppc_inst_prefixed() to assert that pad is equal to zero
(or some poisoned value) if it's not prefixed. Or do some validation
on the suffix if it is.


> +static inline bool ppc_inst_equal(ppc_inst x, ppc_inst y)
> +{
> +	return !memcmp(&x, &y, sizeof(struct ppc_inst));
> +}

I guess a variable length memcmp will make terrible code, so you're
requiring pad to equal 0 to match non-prefixed. Fine.

> +
> +static inline bool ppc_inst_null(ppc_inst x)
> +{
> +	return x.word =3D=3D 0 && x.pad =3D=3D 0;
> +}

In this case you shouldn't need x.pad =3D=3D 0. If x.word =3D=3D 0, then
WARN_ON_ONCE(x.pad !=3D 0) ?

>  	if ((regs->msr & MSR_LE) !=3D (MSR_KERNEL & MSR_LE)) {
>  		/* We don't handle PPC little-endian any more... */
>  		if (cpu_has_feature(CPU_FTR_PPC_LE))
>  			return -EIO;
> -		instr =3D PPC_INST(swab32(ppc_inst_word(instr)));
> +		instr =3D PPC_INST_PREFIXED(swab32(ppc_inst_word(instr)),
> +					  swab32(ppc_inst_suffix(instr)));

Ugly, don't suppose you'd bother to do a ppc_inst_bswap function for=20
this one case?

[snip probes stuff]

> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-pat=
ching.c
> index fa7f32adf029..3b8277a64b8f 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -24,17 +24,27 @@ static int __patch_instruction(ppc_inst *exec_addr, p=
pc_inst instr,
>  {
>  	int err =3D 0;
> =20
> -	__put_user_asm(instr, patch_addr, err, "stw");
> +	__put_user_asm(ppc_inst_word(instr), patch_addr, err, "stw");
>  	if (err)
>  		return err;
> =20
>  	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
>  							    "r" (exec_addr));
> =20
> +	if (!ppc_inst_prefixed(instr))
> +		return 0;
> +
> +	__put_user_asm(ppc_inst_suffix(instr), patch_addr + 4, err, "stw");
> +	if (err)
> +		return err;
> +
> +	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr + 4=
),
> +							    "r" (exec_addr + 4));

Although there's proably no real performance or atomicity issues here,
I'd be pleased if we could do a case for prefixed and a case for non
prefixed, and store the non-prefixed with "std". Just for the principle
of not having half-written instructions in the image.

You could skip the dcbst and icbi for the second address if you happen
to know this future CPU does not store prefix insns across a CL
boundary. But probably not necessary to make that assumption in non
perf critical code here, so I'd leave it as you have.

> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index ee084411f2f5..c5536e1a3356 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -110,7 +110,7 @@ struct bpt {
>  #define BP_DABR		4
> =20
>  #define NBPTS	256
> -#define BPT_WORDS	2
> +#define BPT_WORDS	4

(2 * sizeof(ppc_inst) / sizeof(u32)) ?

>  static struct bpt bpts[NBPTS];
>  static struct bpt dabr;
>  static struct bpt *iabr;
> @@ -118,12 +118,13 @@ static unsigned bpinstr =3D 0x7fe00008;	/* trap */
> =20
>  #define BP_NUM(bp)	((bp) - bpts + 1)
> =20
> -static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WOR=
DS];
> +static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS * BPT_WOR=
DS] __aligned(64);

Should have a define somewhere for this magical 64.

>  /* Prototypes */
>  static int cmds(struct pt_regs *);
>  static int mread(unsigned long, void *, int);
>  static int mwrite(unsigned long, void *, int);
> +static int mread_instr(unsigned long, ppc_inst *);

In some cases you've addd helpers like this as separate patches,
others you've bundled them together. NBD but I liked the prep patches
which then made the more important changes easier to see.

> @@ -759,8 +760,8 @@ static int xmon_bpt(struct pt_regs *regs)
> =20
>  	/* Are we at the trap at bp->instr[1] for some bp? */
>  	bp =3D in_breakpoint_table(regs->nip, &offset);
> -	if (bp !=3D NULL && offset =3D=3D 4) {
> -		regs->nip =3D bp->address + 4;
> +	if (bp !=3D NULL && (offset =3D=3D 4 || offset =3D=3D 8)) {
> +		regs->nip =3D bp->address + offset;
>  		atomic_dec(&bp->ref_count);
>  		return 1;
>  	}
> @@ -862,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned long =
nip, unsigned long *offp)
>  	if (off >=3D sizeof(bpt_table))
>  		return NULL;
>  	bp_off =3D off % (sizeof(unsigned int) * BPT_WORDS);
> -	if (bp_off !=3D 0 && bp_off !=3D 4)
> +	if (bp_off !=3D 0 && bp_off !=3D 4 && bp_off !=3D 8)
>  		return NULL;
>  	*offp =3D bp_off;
>  	return bpts + ((off - bp_off) / (sizeof(unsigned int) * BPT_WORDS));
> @@ -881,7 +882,6 @@ static struct bpt *new_breakpoint(unsigned long a)
>  		if (!bp->enabled && atomic_read(&bp->ref_count) =3D=3D 0) {
>  			bp->address =3D a;
>  			bp->instr =3D bpt_table + ((bp - bpts) * BPT_WORDS);
> -			patch_instruction(bp->instr + 1, PPC_INST(bpinstr));
>  			return bp;
>  		}
>  	}

Why is this okay to remove?

Thanks,
Nick

=
