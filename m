Return-Path: <linuxppc-dev+bounces-16617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LryNZighGmI3wMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 14:52:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC83AF3934
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 14:52:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6JYv55zrz2yFb;
	Fri, 06 Feb 2026 00:52:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770299539;
	cv=none; b=LCwrdI34oDTSeXqDPzyij9hwymPbGIZ0pSDm6nG9t5vPLHhSOU7e6Cl9kruAxJTgutvpecuRtNlH5fWRsE+Nul09y9aNXBKs9k1ciAZNwETQxQmiyL42MgyLaDt6zpHBZWFsw8o/EhtNAbP62DCN5aqHsupubvy6KRkUhQ+w5EvRIiLO37TJC1WfulMGyVjwssRt+qYHUdc43MSN1iUYqDdq932HrfDd+TlMmB6Hr5b7JWUEnuer1Xn4e/U0vFgTrC4D4upnNVZ9kaWQC6tTJCjynoV09+lCXFTUhUkf+zAgl45uYbFl2ASb54KHVn//vc4mz+ejHoNYRTGrJGrU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770299539; c=relaxed/relaxed;
	bh=oe+cZwWfzwl4mqy38wZHxnKo6j283DOR47sSnKM2bdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3spmbmQJgsNCqVnaXhGmSjeIwN8aF8zptp0i6f+MK1ewT3nP0hUWqUS7ku28EJo3dxXFdkOs8qXZM71p6NGszQis9RcF4hhmsQ28JYy+j3/1WN3t0UIMvY79q5BIkjoQ+HXkRgivUDvNBDZ+yvPIORtqpyOZxdJj6jpIh/4UhROxuw3tSA+7RT8aT0pxurQAVUsbdX+wRqZtrhsxdgMgluyShsqrRxhauZy1YjnSDrg0clQKHUreZMdFdvqkAjsGSDRF1B6uhaw5DRwbpP7LQaQeNL9vEOLk9yle8qJWHrMs3tZ7doj94kgM8LldAUzhuC9W3HcxRv4AekqT0XfnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6JYt06v9z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 00:52:17 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 92A26F43990; Thu, 05 Feb 2026 14:52:12 +0100 (CET)
Date: Thu, 5 Feb 2026 14:52:12 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	rostedt@goodmis.org, ardb@kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYSgjPD5KRcNN0j4@luna>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
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
In-Reply-To: <20260204210125.613350-4-mkchauras@gmail.com>
Jabber-ID: linkmauve@linkmauve.fr
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16617-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BC83AF3934
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM) wro=
te:
[=E2=80=A6]
> diff --git a/rust/Makefile b/rust/Makefile
> index ae22f2c5f0b3..c3961fd0d9a4 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
>  BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> =20
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> +endif
> +else
> +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> +endif

You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
then gets passed --target=3D which makes it fail here, with this error
message:
```
bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?size=
_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaque-t=
ype desc_struct --opaque-type arch_lbr_state --opaque-type local_apic --opa=
que-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_addr_lo=
 --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments --b=
locklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN --bl=
ocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMaybeZe=
roable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68 --u=
se-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --no-de=
bug '.*' --enable-function-attribute-detection -o rust/bindings/bindings_ge=
nerated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc -I.=
=2E/arch/powerpc/include -I./arch/powerpc/include/generated -I../include -I=
=2E/include -I../arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
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
error: unsupported option '-mbig-endian' for target ''
error: unsupported option '-mcpu=3D' for target ''
error: unsupported option '-mno-prefixed' for target ''
error: unsupported option '-mno-pcrel' for target ''
error: unsupported option '-mno-altivec' for target ''
error: unsupported option '-mno-vsx' for target ''
error: unsupported option '-mno-mma' for target ''
error: unsupported option '-mbig-endian' for target ''
error: unknown target triple 'unknown'
panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch
If you encounter an error missing from this list, please file an issue or a=
 PR!
```

Did this work on PPC64?

> +
>  # All warnings are inhibited since GCC builds are very experimental,
>  # many GCC warnings are not supported by Clang, they may only appear in
>  # some configurations, with new GCC versions, etc.
> --=20
> 2.52.0
>=20

With this fixed:
Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>

--=20
Link Mauve

