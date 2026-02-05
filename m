Return-Path: <linuxppc-dev+bounces-16623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMtSCRXThGlo5gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 18:27:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B416F5E63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 18:27:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6PLS5KzRz2yFb;
	Fri, 06 Feb 2026 04:27:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770312464;
	cv=none; b=izPGc9+PtYRwK+YbMz55w7m9s/7tYSLisDkueOW7OSIcG6qMcbexM8L+CUuyKPRb7SoDpErnlFjK+5RISEHUm/s1aex82pauSGgcmCxPZJcdvH5gF45bSLTUAWJ80W3RhNdB2kw0SRk1pbhZrVcLGpvx6BA3oYaYpc1X2Y7ukP90kSgYnYVLBI9xQFJjhqvS7NSNmg+PoO2uQfjhE8p2pI1JXMzE8hn2zSnEVeJkpv3STtKBJUJN5i+JjlCYoM+EAX6RP2jI5Wa7wRtD5c6A0+zj52iOGB9IISQg9/lv/5xk6EvigGOTF+RhxDRsows0i3/e7UczjWHoH6XuQJK+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770312464; c=relaxed/relaxed;
	bh=Tx7GpESeBXhVOZe1lCiVB4TdYsATVnhqG/m2mu3LDKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jceE0sSaoqK5lK0jGLkVR9kViqA7CmB6ISEpflsDLgGkSQSyNZ1vXVcZUWTQC89s9v3N3tiDHCb8U8B7N+moH/meUrTtURu6jhaHU1kBxpGoN3EZm3Q6GRc2LhEGEfKfeEfhI+yOKH7MraP56QBhyTSqVetCOBGk3dENpbtUVfz8zc8VTP4PwbD2lWzkh9ObFWN9Gxelf8coVfPy+1aJ6R42siz+GZsBQKGdYwC9UEdzvakb+5aU3sNhXyhXqCCtpsEXe31iq8AfGN3zQ+2JTAEou3OIsc55axa2k+uwzxeb2Hv8jYOwnyVWLbqzbdx+rscJ4TvYpgF4ekKVvcN74w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mti68/8/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132f; helo=mail-dy1-x132f.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mti68/8/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132f; helo=mail-dy1-x132f.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132f.google.com (mail-dy1-x132f.google.com [IPv6:2607:f8b0:4864:20::132f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6PLQ6t8Tz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 04:27:41 +1100 (AEDT)
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b785801c93so1071073eec.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 09:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770312459; x=1770917259; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tx7GpESeBXhVOZe1lCiVB4TdYsATVnhqG/m2mu3LDKs=;
        b=Mti68/8/avG5fhWX4xIBWWIJY4of0DSKfvSJzkXvUbjmuC1wlyb1bil8E9jfrFlZ0X
         DpU8X99Cyz/SoTwxWBqQIbI6ELHqI5SwTMiy7WxKiJGrZsunz9LGlchqC6qJgXZjCeYP
         AaAVf6pBV46Fja6Bt/ECcqY7FzPSTcOS8zDF24KBKMyPAao4DJ6dva0I10aR/8VnjOe2
         a//BNDLHXgSGEFAoclP/xQGYxtWz7l4utG2lyAjc8PhQnHBESXXf2BwHuoRo4IJ68OU1
         4mRA9nTkcIPkpP2g7vALqiNnvUTaKVB1UeeSd9SQhjxm5AWBDOThX40RJq9t6Zt+4+2e
         bWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770312459; x=1770917259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx7GpESeBXhVOZe1lCiVB4TdYsATVnhqG/m2mu3LDKs=;
        b=AgbhCIvrUlKps2igEQUAGd+7X9VdZuVX0n/oPoPwXPujxPvuJUO3a52XiqHfwt5zam
         spgEQyVUJ2NAFWXcHAYkdg/q1s7wuOYosnmhrvyD6/CKltDYLRkf/eywIlkShUnPLFBd
         yRFKEJ15QrI+S/JzV/EDJ/DQNEU8Zsf8JCHn4O6zfcm+CB0OjMM9RVTue2JlHARWVHeI
         Zjij7NaEyCIDwQ6909FYvFP+iscNBry14LIcze63ubyVo1GGo4ZnuK8YuAGTgFlP/06C
         q3r/pAcPZZ/SkNgH4ZYHFWQjddGwQD1jXNfTuyrX3pkKU4YwNC+TbbrYXjdO+4u7eUtx
         To+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW54PizdWfnWsuIgfbLAq3W0fs+q2sSNqwh+hZancRHq+GAJsrN8JEKGt15V/6ZljLkN5Mxv/RjhPBTJQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywfpiv4YPdszqbsWWu72NNdxRNdfJ5aAsfQPSO1HkOIDwmzB+5D
	OMgNcoKtHTnbZPFcsyfWQbvlb3YabseMJVbEfbjKAaAeEtGb7pgYvhr/gmkAOQ==
X-Gm-Gg: AZuq6aLQBmLt5IJBN6lvQHrXKKktqp0YBT2MB5hR4zCeeBBx+VnUOeIVfiyNbyvp4A7
	pfwTjEvdGS+QvfO7NNHSIvc56cc4aPVjGtS7wCeN6tOP4OSHT1jewWW2ovoMbXnp+/kwJYSkMNO
	WP2k3sj0YhMM9EhdcnD9w132O5re/lxtvNo4fxfq/4QRET1+S90EhjojPelvcquAHVx2CE0vdG+
	9UDoRv5BFO/TM4oR0Y8cE+GXnwsrrlX4iDWmHIkZvCLH5nFHCkL6vBE/qtJqtDuvdtBfPB6eskM
	G7GJy5mut2DVccjD0yV5raREOYHEssrw8AUrfYjViVRfyzkx07hrUL4iubHYVqTI6j7PmnA9MI2
	um2soDf6X8vg37zY0oq51Ze+UO5jMPm7drLxvPnQ1Xl8Opjbu1JHkJPalV/4P0xPPLe3DRzjE4l
	vQ+SDL8ER1emVBWUwJrGVXEwVHW5mKrW0HSSLEWMeaFVCDGo3zsrLLHMUw
X-Received: by 2002:a17:90b:2f90:b0:352:f2a6:334 with SMTP id 98e67ed59e1d1-35487102a6bmr6730739a91.16.1770306131994;
        Thu, 05 Feb 2026 07:42:11 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933898388sm74985365ad.34.2026.02.05.07.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:42:11 -0800 (PST)
Date: Thu, 5 Feb 2026 21:12:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
 <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16623-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:venkat88@linux.ibm.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,linkmauve.fr:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9B416F5E63
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 08:21:31PM +0530, Venkat Rao Bagalkote wrote:
>=20
> On 05/02/26 7:22 pm, Link Mauve wrote:
> > On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM)=
 wrote:
> > [=E2=80=A6]
> > > diff --git a/rust/Makefile b/rust/Makefile
> > > index ae22f2c5f0b3..c3961fd0d9a4 100644
> > > --- a/rust/Makefile
> > > +++ b/rust/Makefile
> > > @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
> > >   BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
> > >   BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
> > >   BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> > > -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > >   BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
> > >   BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> > > +ifdef CONFIG_PPC64
> > > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> > > +endif
> > > +else
> > > +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > > +endif
> > You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
> > the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
> > then gets passed --target=3D which makes it fail here, with this error
> > message:
> > ```
> > bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?=
size_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaq=
ue-type desc_struct --opaque-type arch_lbr_state --opaque-type local_apic -=
-opaque-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_add=
r_lo --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments=
 --blocklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN =
--blocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMay=
beZeroable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68=
 --use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --n=
o-debug '.*' --enable-function-attribute-detection -o rust/bindings/binding=
s_generated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc=
 -I../arch/powerpc/include -I./arch/powerpc/include/generated -I../include =
-I./include -I../arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
ed/uapi -I../include/uapi -I./include/generated/uapi -include ../include/li=
nux/compiler-version.h -include ../include/linux/kconfig.h -include ../incl=
ude/linux/compiler_types.h -D__KERNEL__ -mbig-endian -m32 -I ../arch/powerp=
c -fmacro-prefix-map=3D../=3D -std=3Dgnu11 -fshort-wchar -funsigned-char -f=
no-common -fno-PIE -fno-strict-aliasing -msoft-float -mcpu=3Dpowerpc -mno-p=
refixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fno-asynchronous-unwind-=
tables -mbig-endian -fno-delete-null-pointer-checks -Os -fno-stack-protecto=
r -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fno-strict-overflow =
-fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplic=
it-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werro=
r=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addres=
s -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes=
 -Wframe-larger-than=3D1280 -Wno-main -Wno-dangling-pointer -Wvla-larger-th=
an=3D1 -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-string=
op-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init=
 -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-=
variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncatio=
n -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initialize=
rs -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno=
-sign-compare -Wno-unused-parameter -DGCC_PLUGINS -I../rust -Irust -DKBUILD=
_MODFILE=3D'"rust/bindings_generated"' -DKBUILD_BASENAME=3D'"bindings_gener=
ated"' -DKBUILD_MODNAME=3D'"bindings_generated"' -D__KBUILD_MODNAME=3Dkmod_=
bindings_generated -w --target=3D -fno-builtin -D__BINDGEN__ -DMODULE  ; se=
d -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const /g' rust/bin=
dings/bindings_generated.rs
> > error: unsupported option '-mbig-endian' for target ''
> > error: unsupported option '-mcpu=3D' for target ''
> > error: unsupported option '-mno-prefixed' for target ''
> > error: unsupported option '-mno-pcrel' for target ''
> > error: unsupported option '-mno-altivec' for target ''
> > error: unsupported option '-mno-vsx' for target ''
> > error: unsupported option '-mno-mma' for target ''
> > error: unsupported option '-mbig-endian' for target ''
> > error: unknown target triple 'unknown'
> > panicked at bindgen/ir/context.rs:562:15:
> > libclang error; possible causes include:
> > - Invalid flag syntax
> > - Unrecognized flags
> > - Invalid flag arguments
> > - File I/O errors
> > - Host vs. target architecture mismatch
> > If you encounter an error missing from this list, please file an issue =
or a PR!
> > ```
> >=20
> > Did this work on PPC64?
>=20
> On ppc64le, I am not able to get a successful Rust=E2=80=91enabled build =
yet.
> I am consistently hitting bindgen/libclang failures during the prepare
> phase.
>=20
>=20
> Build Failures:
>=20
> error: unsupported option '-mlong-double-128' for target 'unknown'
> error: unsupported argument 'medium' to option '-mcmodel=3D' for target
> 'unknown'
> error: unknown target triple 'unknown'
> panicked at bindgen-0.72.1/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
>=20
> make[2]: *** [rust/Makefile:468: rust/bindings/bindings_generated.rs] Err=
or
> 101
> make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
>=20
> make[2]: *** [rust/Makefile:488:
> rust/bindings/bindings_helpers_generated.rs] Error 101
> make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
>=20
> make[2]: *** [rust/Makefile:474: rust/uapi/uapi_generated.rs] Error 101
> make[2]: *** Deleting file 'rust/uapi/uapi_generated.rs'
>=20
> make[2]: *** [rust/Makefile:643: rust/core.o] Error 1
> make[1]: *** [/root/linux/Makefile:1320: prepare] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>=20
>=20
> Regards,
>=20
> Venkat.
>=20
hey,

use rust version nightly-2026-01-28

the latest one has some issue. I just raised a bug for the rustc
here[1].

[1] https://github.com/rust-lang/rust/issues/152177

Regards,
Mukesh

> > > +
> > >   # All warnings are inhibited since GCC builds are very experimental,
> > >   # many GCC warnings are not supported by Clang, they may only appea=
r in
> > >   # some configurations, with new GCC versions, etc.
> > > --=20
> > > 2.52.0
> > >=20
> > With this fixed:
> > Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> > Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> >=20

