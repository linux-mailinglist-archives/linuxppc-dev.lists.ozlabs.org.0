Return-Path: <linuxppc-dev+bounces-16624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEl4BF3WhGlo5gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 18:41:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00979F610C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 18:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6PfX1y5hz2yFb;
	Fri, 06 Feb 2026 04:41:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770313300;
	cv=none; b=l3dvjRWwjxy9hqI1PzhZCG5+N+PS1DUJE7X5InxJjj1A1zHz4Daehc27hOBWaS+pG1iiCUG6ZHL9zoHFVqKW7UhCd9SAzwydj40r7cEg044Mnb0zhm4n5PpHX6YWuQEAzCAg8lPgAAKI6bNZN8OyNTT+WlIIp6KZX0OR/nqt/rq6mDUnhN0qUG9KyzSSXvQ1Ra/SKghqewcZZDThmbpQfd2hDl+rM23xTpK92BLb57lKip/dE67MYNitXkrLNUbbB/+dcIqLsICz9i09ZVLgiKCz5QReHtB1400AzR9LauIHJ6aqJYnK0ZlcUiT3BVsL4/TX2bdKQJ0fFcNiG0Gd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770313300; c=relaxed/relaxed;
	bh=gDZJl3VWBMgWhsMDZCRhkLiKo6ualtcqNRxB4YFGLLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpizHJXOvQC3L4itduUFUOZsA5cDr6Qwr68CqRR+dbaOfxmXNUYPIF7NfZlyYbcxxyMh/m2w7QTX7jMrZpczZkh6iiPYfEHMzMPQfHtgzJlI8Xa1dpZIThQgryPYGPZj2vcwbVeg9YzCdboqoOdDi4Ojs0aKXBgvF3aaXFA9XCMk9ZTQL3d+I5TdK+sTN2iOa2DzJdJ/DGmJHCSAaS09sWZIsnV0kGTzQHnP/w7p9GZBt4nKmQv4Nm7GbJPXaWy45lVWtxKPbfQUTDcC/P/Ofo6NLbFBYqO17qBgXRuzfpmdvrAoyTJK63fskVPDdRK//f3kR7Ed9A72iw5uyvS96g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CgZD8Shb; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CgZD8Shb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6PfW1Lqyz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 04:41:38 +1100 (AEDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-4096aab5521so947969fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 09:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770313291; x=1770918091; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDZJl3VWBMgWhsMDZCRhkLiKo6ualtcqNRxB4YFGLLc=;
        b=CgZD8ShbDYXsbj5x/7/NeSBkX0vCwyMWzFDfL2AlCkHkIHmUh+c5vuCLu2HwErB2Pe
         pmvKwjBjc7vvrm+K/4PvSl8ie/IQ7kIQHkELM1VVn5KORbVCXPkG34gmcdf8MWlQc9km
         xa8bKI7anOtYBVVti9dZ/OOWgy+yanOke+UycCdWKzlkjEnNl1J38pcHwbnCkPSWyKyj
         QgmEc7zoH3t8fWLuZIm8KuFwyNusYq4iT0AtOU06/BtSR7fwcPn/bDYGP0yApnTX7bGE
         H8Nc3G5Wwx0oDgvCnN9GCnQqdaYEuSk+FA0VjA6v6Fn7O4+PM6GTSZ4jxXgPw6rlWuSw
         VyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770313291; x=1770918091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDZJl3VWBMgWhsMDZCRhkLiKo6ualtcqNRxB4YFGLLc=;
        b=XgvseGVZpjIo6dwWNABBFryZObDXUMUXeS2zdl+LnApOhebkXcZ6EU/Jvdvd5PgV3k
         20e4txuWu74xY8QnYxiZave4+5w/b0tpNKKFuynnwIBiiVRPpj7zjc0KBcXdN6kUpdG6
         /gN4KBsLaQXNNo0ZBxbjVZo+9QElHy+diewuyvd57/gr3PkMGPh2NZkUt8hxvStwkOMK
         JhQ3ey0LD/7awtDUY6D5N9LyLmubz3rxoPp1itLvLVe8eYfXaQx6Faz/qHoQ7EryPQ/+
         JqsAkTGVSyV5t73+xljd75BzvzfU5ynjVA4e1R2/P3ImCe5l9tEY6WTirImCN2t79isb
         Ed8A==
X-Forwarded-Encrypted: i=1; AJvYcCUkQEawWmNDa0fKjqXXZiG/UM2+1mYTjm0CwZiB89xgGQiLHWWflvIp1mHjTXb3GsYZni4Ks8pJM6z0A1k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyK1Cr3hS09FtNOW2iQkbw9mlJo5kkSyTi9j0yuWplFDGAf/psd
	hSgAwAaw6PGVqs3L+02XYGgMo6TzOhGQY/BEWELIaFnWWafDRymo/5SabIKUYA==
X-Gm-Gg: AZuq6aLAo8mlBB2FcGC1pL+Q/K9dyUlSBBVb5KgQFYNVHyGKfyI7LYednUCLnqVq+q7
	6edHigOWnNv2VMGdpAN5Ey5hcavhaFeJmzeOC5hnkT0shcShunk5OwsxAnLfN7zUabAjwU6AKQ+
	lZe+qOi8TOPNRIPMKEcJCTM7/cLrjAH6qlli564cFA0pHvqps2ap4cBPRCs+6/2LTAkWH2djnFH
	Zg9IeZSVNa8bj/GdCiatBqBpdbFHQx/cLppT/l77ZAedbBbnkpVaspZeSScd3EiePt8cBrgfeV7
	YVTdExlPqu66SG4ltZp6WmzdH3+qGDN33/X5D5yN9tWbVVinJOCzIXUUiM9gsFAPg2bwjHyou1X
	ANbU33T5Ff25FuJVu/yRFspB86A+69TXKlWUF2reo85CkuakjXNy6arl0SM3PWtG0CVebNt91mX
	m0ta9DJj5aK1Iy/7PVYBBVCvtNLxyxqXjzL+hA4kqiWQ50jNr2WLACjI/A
X-Received: by 2002:a05:6a00:39aa:b0:81a:d633:db03 with SMTP id d2e1a72fcca58-8241c6734a1mr7102468b3a.59.1770306362810;
        Thu, 05 Feb 2026 07:46:02 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8243c22f991sm733144b3a.48.2026.02.05.07.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:46:02 -0800 (PST)
Date: Thu, 5 Feb 2026 21:15:52 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYS6fdNFVSEqoRY-@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna>
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
In-Reply-To: <aYSgjPD5KRcNN0j4@luna>
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
	TAGGED_FROM(0.00)[bounces-16624-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkmauve.fr:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid]
X-Rspamd-Queue-Id: 00979F610C
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 02:52:12PM +0100, Link Mauve wrote:
> On Thu, Feb 05, 2026 at 02:31:25AM +0530, Mukesh Kumar Chaurasiya (IBM) w=
rote:
> [=E2=80=A6]
> > diff --git a/rust/Makefile b/rust/Makefile
> > index ae22f2c5f0b3..c3961fd0d9a4 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
> >  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
> >  BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
> >  BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> > -BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> >  BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
> >  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> > =20
> > +ifdef CONFIG_PPC64
> > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +BINDGEN_TARGET_powerpc	:=3D powerpc64le-linux-gnu
> > +endif
> > +else
> > +BINDGEN_TARGET_powerpc	:=3D powerpc-linux-gnu
> > +endif
>=20
> You define BINDGEN_TARGET_powerpc after BINDGEN_TARGET has been set to
> the value of $(BINDGEN_TARGET_$(SRCARCH)), so it is empty and bindgen
> then gets passed --target=3D which makes it fail here, with this error
> message:
I am able to compile it and boot it on ppc64le qemu pseries and
powernv9 hardware.

I agree this might cause an issue. Will fix this and send out a new
revision.
> ```
> bindgen ../rust/bindings/bindings_helper.h --blocklist-type __kernel_s?si=
ze_t --blocklist-type __kernel_ptrdiff_t --opaque-type xregs_state --opaque=
-type desc_struct --opaque-type arch_lbr_state --opaque-type local_apic --o=
paque-type alt_instr --opaque-type x86_msi_data --opaque-type x86_msi_addr_=
lo --opaque-type kunit_try_catch --opaque-type spinlock --no-doc-comments -=
-blocklist-function __list_.*_report --blocklist-item ARCH_SLAB_MINALIGN --=
blocklist-item ARCH_KMALLOC_MINALIGN --with-derive-custom-struct .*=3DMaybe=
Zeroable --with-derive-custom-union .*=3DMaybeZeroable --rust-target 1.68 -=
-use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests --no-=
debug '.*' --enable-function-attribute-detection -o rust/bindings/bindings_=
generated.rs -- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc -=
I../arch/powerpc/include -I./arch/powerpc/include/generated -I../include -I=
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
> error: unsupported option '-mbig-endian' for target ''
> error: unsupported option '-mcpu=3D' for target ''
> error: unsupported option '-mno-prefixed' for target ''
> error: unsupported option '-mno-pcrel' for target ''
> error: unsupported option '-mno-altivec' for target ''
> error: unsupported option '-mno-vsx' for target ''
> error: unsupported option '-mno-mma' for target ''
> error: unsupported option '-mbig-endian' for target ''
> error: unknown target triple 'unknown'
> panicked at bindgen/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
> If you encounter an error missing from this list, please file an issue or=
 a PR!
> ```
>=20
> Did this work on PPC64?
>=20
ppc64be still has some missing things from the toolchain side. For
ppc64le it does works, atleast on powernv9 hardware and pseries POWER10
qemu.
> > +
> >  # All warnings are inhibited since GCC builds are very experimental,
> >  # many GCC warnings are not supported by Clang, they may only appear in
> >  # some configurations, with new GCC versions, etc.
> > --=20
> > 2.52.0
> >=20
>=20
> With this fixed:
> Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>
>=20
Thanks.
Regards,
Mukesh
> --=20
> Link Mauve

