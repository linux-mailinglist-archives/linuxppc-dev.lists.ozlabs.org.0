Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B962D8BFDE9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:03:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VRkJfiJf;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4GTCzv/Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZFhC2LD6z3cXH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:03:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VRkJfiJf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4GTCzv/Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZFgT1syQz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:03:01 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715173375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=9VFXYNnmWVAd3Sn8DKCZ8yiqWzSwEdQ+Pabjj2q4hB0=;
	b=VRkJfiJfWZ6AookMVOKv9e9HzbGtO1L0xsXLM+GqeVg04zUbQMgxteMJClaRvAfOdTALkg
	O9e4scpjuaBKPVzCRsySOt2lcD/606KGBScnWIFENihZmILKnD8lPngsC4/1t7lLE3EQtQ
	WqCSYCpDoVPzPxiwh7uI/C2lO0S/rW6cs0YHp0w/d1kqCl/FWExNg8YEtVfO5e6ojMBhcg
	Yh/9LNILDkGQV9e8JyAZH3hTuwDmYPp5+7K8FYP17a9Sp/Qkc5sxOc1Plgtp+ZAvkpERQa
	fj3HGUhWKvZhW6RRYmpeTusXkOdHJgvak/KrTiZacBCE3zHNRbq0UyyEQ0DxRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715173375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=9VFXYNnmWVAd3Sn8DKCZ8yiqWzSwEdQ+Pabjj2q4hB0=;
	b=4GTCzv/ZQ4stwae37N//lUQMPYDxwL6kuSxLgbdpRlqjBvrmic4aq21mLw+5OMsTsGEaq/
	AXZPI3MF3nY9IhDw==
To: Vignesh Balasubramanian <vigbalas@amd.com>,
 linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
In-Reply-To: <20240507095330.2674-2-vigbalas@amd.com>
Date: Wed, 08 May 2024 15:02:55 +0200
Message-ID: <87wmo4o3r4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 07 2024 at 15:23, Vignesh Balasubramanian wrote:
> +struct xfeat_component {
> +	u32 xfeat_type;
> +	u32 xfeat_sz;
> +	u32 xfeat_off;
> +	u32 xfeat_flags;
> +} __packed;

Why repeating xfeat_ for all member names?

    u32       type;
    u32       size;
    u32       offset;
    u32       flags;

is sufficient and obvious, no?

> +enum custom_feature {
> +	FEATURE_XSAVE_FP = 0,
> +	FEATURE_XSAVE_SSE = 1,
> +	FEATURE_XSAVE_YMM = 2,
> +	FEATURE_XSAVE_BNDREGS = 3,
> +	FEATURE_XSAVE_BNDCSR = 4,
> +	FEATURE_XSAVE_OPMASK = 5,
> +	FEATURE_XSAVE_ZMM_Hi256 = 6,
> +	FEATURE_XSAVE_Hi16_ZMM = 7,
> +	FEATURE_XSAVE_PT = 8,
> +	FEATURE_XSAVE_PKRU = 9,
> +	FEATURE_XSAVE_PASID = 10,
> +	FEATURE_XSAVE_CET_USER = 11,
> +	FEATURE_XSAVE_CET_SHADOW_STACK = 12,
> +	FEATURE_XSAVE_HDC = 13,
> +	FEATURE_XSAVE_UINTR = 14,
> +	FEATURE_XSAVE_LBR = 15,
> +	FEATURE_XSAVE_HWP = 16,
> +	FEATURE_XSAVE_XTILE_CFG = 17,
> +	FEATURE_XSAVE_XTILE_DATA = 18,
> +	FEATURE_MAX,
> +	FEATURE_XSAVE_EXTENDED_START = FEATURE_XSAVE_YMM,
> +	FEATURE_XSAVE_EXTENDED_END = FEATURE_XSAVE_XTILE_DATA,
> +};

Why can't this use the existing 'enum xfeature' which is providing
exactly the same information already?

> +#ifdef CONFIG_COREDUMP
> +static int get_sub_leaf(int custom_xfeat)
> +{
> +	switch (custom_xfeat) {
> +	case FEATURE_XSAVE_YMM:			return XFEATURE_YMM;
> +	case FEATURE_XSAVE_BNDREGS:		return XFEATURE_BNDREGS;
> +	case FEATURE_XSAVE_BNDCSR:		return XFEATURE_BNDCSR;
> +	case FEATURE_XSAVE_OPMASK:		return XFEATURE_OPMASK;
> +	case FEATURE_XSAVE_ZMM_Hi256:		return XFEATURE_ZMM_Hi256;
> +	case FEATURE_XSAVE_Hi16_ZMM:		return XFEATURE_Hi16_ZMM;
> +	case FEATURE_XSAVE_PT:			return XFEATURE_PT_UNIMPLEMENTED_SO_FAR;
> +	case FEATURE_XSAVE_PKRU:		return XFEATURE_PKRU;
> +	case FEATURE_XSAVE_PASID:		return XFEATURE_PASID;
> +	case FEATURE_XSAVE_CET_USER:		return XFEATURE_CET_USER;
> +	case FEATURE_XSAVE_CET_SHADOW_STACK:	return XFEATURE_CET_KERNEL_UNUSED;
> +	case FEATURE_XSAVE_HDC:			return XFEATURE_RSRVD_COMP_13;
> +	case FEATURE_XSAVE_UINTR:		return XFEATURE_RSRVD_COMP_14;
> +	case FEATURE_XSAVE_LBR:			return XFEATURE_LBR;
> +	case FEATURE_XSAVE_HWP:			return XFEATURE_RSRVD_COMP_16;
> +	case FEATURE_XSAVE_XTILE_CFG:		return XFEATURE_XTILE_CFG;
> +	case FEATURE_XSAVE_XTILE_DATA:		return XFEATURE_XTILE_DATA;
> +	default:
> +		pr_warn_ratelimited("Not a valid XSAVE Feature.");
> +		return 0;
> +	}
> +}

This function then maps the identical enums one to one. The only actual
"functionality" is the default case and that's completely pointless.

> +/*
> + * Dump type, size, offset and flag values for every xfeature that is present.
> + */
> +static int dump_xsave_layout_desc(struct coredump_params *cprm)
> +{
> +	u32 supported_features = 0;
> +	struct xfeat_component xc;
> +	u32 eax, ebx, ecx, edx;
> +	int num_records = 0;
> +	int sub_leaf = 0;
> +	int i;
> +
> +	/* Find supported extended features */
> +	cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
> +	supported_features = eax;

Why does this need to re-evaluate CPUID instead of just using the
existing fpu_user_cfg.max_features?

> +	for (i = FEATURE_XSAVE_EXTENDED_START;
> +			i <= FEATURE_XSAVE_EXTENDED_END; i++) {

Please use the full 100 character line width.

> +		sub_leaf = get_sub_leaf(i);
> +		if (!sub_leaf)
> +			continue;
> +		if (supported_features & (1U << sub_leaf)) {
> +			cpuid_count(XSTATE_CPUID, sub_leaf, &eax, &ebx, &ecx, &edx);
> +			xc.xfeat_type = i;
> +			xc.xfeat_sz = eax;
> +			xc.xfeat_off = ebx;
> +			/* Reserved for future use */
> +			xc.xfeat_flags = 0;
> +
> +			if (!dump_emit(cprm, &xc,
> +				       sizeof(struct xfeat_component)))

sizeof(xc), no?

> +				return 0;
> +			num_records++;
> +		}
> +	}

This whole thing can be written as:

	for_each_extended_xfeature(i, fpu_user_cfg.max_features) {
		struct xfeat_component xc = {
                	.type	= i,
                        .size	= xstate_sizes[i],
                        .offset	= xstate_offsets[i],
		};

		if (!dump_emit(cprm, &xc, sizeof(xc)))
			return 0;
                num_records++;
	}

It omits the features which are supported by the CPU, but not enabled by
the kernel. That's perfectly fine because:

  1) the corresponding xfeature bits of those component in the actual
     XSAVE dump are guaranteed to be zero

  2) the corresponding regions in the actual XSAVE dump are zeroed

So there is absolutely no point in having notes for the not enabled
features at all.

Hmm?

> +
> +	return num_records;
> +}
> +
> +static int get_xsave_desc_size(void)
> +{
> +	int supported_features = 0;
> +	int xfeatures_count = 0;
> +	u32 eax, ebx, ecx, edx;
> +	int sub_leaf = 0;
> +	int i;
> +
> +	/* Find supported extended features */
> +	cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
> +	supported_features = eax;
> +
> +	for (i = FEATURE_XSAVE_EXTENDED_START;
> +			i <= FEATURE_XSAVE_EXTENDED_END; i++) {
> +		sub_leaf = get_sub_leaf(i);
> +		if (!sub_leaf)
> +			continue;
> +		if (supported_features & (1U << sub_leaf))
> +			xfeatures_count++;
> +	}
> +	return xfeatures_count * (sizeof(struct xfeat_component));

Then this can be replaced by:

	int i, cnt = 0;

	for_each_extended_xfeature(i, fpu_user_cfg.max_features)
        	cnt++;

        return cnt * sizeof(struct xfeat_component);

In fact the number of extended features can be calculated once during
boot during xstate initialization.

No?

> +}
> +
> +int elf_coredump_extra_notes_write(struct coredump_params *cprm)
> +{
> +	int num_records = 0;
> +	struct elf_note en;
> +
> +	en.n_namesz = sizeof(owner_name);
> +	en.n_descsz = get_xsave_desc_size();
> +	en.n_type = NT_X86_XSAVE_LAYOUT;
> +
> +	if (!dump_emit(cprm, &en, sizeof(en)))
> +		return 1;
> +	if (!dump_emit(cprm, owner_name, en.n_namesz))
> +		return 1;
> +	if (!dump_align(cprm, 4))
> +		return 1;
> +
> +	num_records = dump_xsave_layout_desc(cprm);
> +	if (!num_records) {
> +		pr_warn_ratelimited("Error adding XSTATE layout ELF note. XSTATE buffer in the core file will be unparseable.");
> +		return 1;

This is going to trigger on all systems which do not support XSAVE. So
why emitting this note in the first place on such systems?

The function should have

	if (!fpu_kernel_cfg.max_features)
        	return 0;

right at the beginning.

Aside of that, these warnings are pointless noise in the case that
dump_emit() caused the function to return early. Dumps can be truncated.

> +/*
> + * Return the size of new note.

Which new note? This is extra notes, no?

> + */
> +int elf_coredump_extra_notes_size(void)
> +{
> +	int size = 0;

	int size;

> +
> +	/* NOTE Header */

  Note header ?

> +	size += sizeof(struct elf_note);

	size = ....

> +	/* name + align */

  Name plus alignment to 4 bytes ?

> +	size += roundup(sizeof(owner_name), 4);
> +	size += get_xsave_desc_size();
> +
> +	return size;
> +}

And like the write function this wants:

	if (!fpu_kernel_cfg.max_features)
        	return 0;

at the beginning. No point in emitting useless notes and headers.

Thanks,

        tglx
