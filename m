Return-Path: <linuxppc-dev+bounces-16768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEt7JMzzimn2OwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:01:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9BE118767
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:00:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9FsH2NDpz30MY;
	Tue, 10 Feb 2026 20:00:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770714051;
	cv=none; b=lA+WNxpZzR5j1xf8JAyBUqLy6dw41hCjLymwTznV3Y20Xdc9YyOXa7cIBDigVTk4wnpQc/B9z0P2gSR7R9iD76sowtjUe9z2W9wpdtE+MPXBUwhM2h+r/cbm3FfbDxdf5hxWNpPsN7isZF+Yxc5F1D89QLBo/UsxajR0IJPzU1boz0TBthAsKSycHiPmMmYA85X9bLF82KF5i32lEdNVu+6FuUi7UvFre4HvrnWY5ODzoG3WtXHKYR+0p/2uZ6nllEQ94/s7e8GvDWql4ddPK0SVTuO1QcdfXim35k627wuh0IYDp/wUOMPu5GZMCcacYQa4F0MzMAWDAHNyRMb+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770714051; c=relaxed/relaxed;
	bh=XeR+VJLK+vbEiDYRs1UKox7LMnlGVq/UQvIDhBD1Vlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICgcnTFbBam+56IFNGvA+p9tqEl/X6da8H4vlbizXt0VqQpM+diufpecY7quQLPawIuUDXySUioo82ptcRWg9pZNBCpKeBDlqBaJRCcn9cKHUXApwLzoswmjQ6gYl4Ec8bAjFmVMAoBjNWZPTd4cG51ymkAjDNX/Ttti7OPC8fkjbVQF/JeJ5QmzCWPLsun5peAWvcCDoCxxO+TTnQ8aFUf41pbrFczF7X/hNMXKJWxhhQMxQhM18hgKx/2mDB94DAWWMS6xLbtQkR+ftuBNdfyNoVzQ0ESqiYBvamnX03uXV/0zkM0s6mRR5FIltyqh42nzQpahlvIiELFmwWx2nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DNSKRSLV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DNSKRSLV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9FsG3kcwz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 20:00:50 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aaecf9c325so12712895ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714049; x=1771318849; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeR+VJLK+vbEiDYRs1UKox7LMnlGVq/UQvIDhBD1Vlc=;
        b=DNSKRSLVL0+8j00XgpCdaIRXci8TRuGfTbKnojWOEEi2FjGg+RkOQyt4nah//uOew2
         5TjypBzG3Rhe6cxL0CdEXPQuVPSPYDOobx5obJJwvLP7aTf0hNq5yWoMrJIwKWTq/Nkk
         IQUwEBzKbTLBlvbxP03DC7RBGN2N1Dqm7tfcur+QoK8AwUCDspPr92JI4+iHYX/TPrKZ
         FdeuaVSflQG8LbJmjVihKhkflZ/sKj0fvkIcExdOK70nGhBOXbRaefnZjG8TRmjOW5r/
         hK/IUvlOn0ljQGmhj0/QT02cPOGfxRwblVwwYHDd+jhzb7AORgha/L6UvS8q9QlEbCBK
         0S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714049; x=1771318849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XeR+VJLK+vbEiDYRs1UKox7LMnlGVq/UQvIDhBD1Vlc=;
        b=aSCFjaJ3EsW8FzNhfo+U0c+0JP6/LGPwitL8Z3hg/m7lypc5PxOnFfMMbsCNeEt8dE
         FV3n5HSlEVvMHvvYOuHSZqn4sr6b8loQ7+P9EyUs2qqsLCF1QMUGcaHfCftoAf9V2zGP
         Fgk+RDtaRuHmkmkPsNkah6dYgzn5Od+SO6IgGbGrB35ft4EU2PCAp8NaBPXsSp15AAzE
         hJ9qFr0c/pAKatCKcdu3kmzGzn3ztyuuqD6Z/VlvoL8glPVy3VZyICVtBJJzeTdI9+ne
         C2zNQt44B+Bebk4BAmds4AsTv8J3JMWr5PCoQq+PSyyIKaxrSp3U8JTRlv0hkhf6qqKU
         lh7A==
X-Forwarded-Encrypted: i=1; AJvYcCW4Shw7dxmtApUREPjuTklxob6qzyAwB/SYhNnWl05gF9iFoZMneu1yRI7c+Rob+LZGjD/C5M1bTdPl6QE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz74UVq7clg3EfiDsV9voAMM1NTHO7uDQt9YsnEZAqVFBMQ9ki0
	Y/lIPldhq6kI2w+usOj8/Kd1m6Jp3NQfxzxZ2oq+z2Zfy0uaC0VUMvHP
X-Gm-Gg: AZuq6aKb+OFA68LDk6+FhN+EJlxb8qNE5Q/oKAh1CKKQo1xx38nXwJXBTyRZvyu2yrU
	WEsEyhcF0Kcjdfgkn48CceHOOJYVXhLcz7X2wNa+Gie0t0zZCuIxYXhurz5BjB7L9SNHhwkX0Uk
	Pmny7NAQvQt5DJdpW/A5BfMq5oajkshjU6WEEZcpiBxxq/G0GGrvF6jA/xGoe0ITo+85dWhY6Qm
	HOqne3cWJyAaCf0E+KsAgRdAysoc5/Eji22awrhkkzri3pZDArkghfMqwdtipJSMChNsUM9iOx3
	B/zf4ljLtJ6XhRM+MMoewHORh53VNHgnFtnt0tO0Aqudl8NFSTX8kEZdq9LuEeFd2PSZgVBzf6k
	sjKMVR7v9LEpZdin1VIUnSM+C+S235n9B2Gop/3slSL4ST1gRie66K3kzS7DaDJGhygydAOHJKT
	8mfd6cNFEXc5O2YwrJRpfa11qYr/z+2gHyFr6pOqmua/3wMIuDOgMvEmTsAeuhRLjqKN81u24=
X-Received: by 2002:a17:903:246:b0:2aa:f5b4:9a2e with SMTP id d9443c01a7336-2ab0fc899c1mr17797535ad.11.1770714048254;
        Tue, 10 Feb 2026 01:00:48 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:47 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V6 2/3] rust: Add PowerPC support
Date: Tue, 10 Feb 2026 14:30:21 +0530
Message-ID: <20260210090023.2587534-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210090023.2587534-1-mkchauras@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[linkmauve.fr:query timed out];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16768-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linkmauve.linkmauve.fr:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linkmauve.fr:email]
X-Rspamd-Queue-Id: DE9BE118767
X-Rspamd-Action: no action

From: Link Mauve <linkmauve@linkmauve.fr>

For now only Big Endian 32-bit PowerPC is supported, as that is the only
hardware I have.  This has been tested on the Nintendo Wii so far, but I
plan on also using it on the GameCube, Wii U and Apple G4.

These changes aren’t the only ones required to get the kernel to compile
and link on PowerPC, libcore will also have to be changed to not use
integer division to format u64, u128 and core::time::Duration, otherwise
__udivdi3() and __umoddi3() will have to be added.  I have tested this
change by replacing the three implementations with unimplemented!() and
it linked just fine.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 1 +
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 2 ++
 rust/Makefile                       | 4 +++-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d0899..70b9e192a7a0 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
+``powerpc``    Maintained        32-bit Big Endian only.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..17db23b82e91 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -283,6 +283,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..9fd82c75dcbd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index 4dcc2eff51cb..ae22f2c5f0b3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -384,13 +384,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0


