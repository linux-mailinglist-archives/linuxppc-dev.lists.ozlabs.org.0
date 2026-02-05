Return-Path: <linuxppc-dev+bounces-16634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCkiE/b0hGlb7AMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 20:52:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76231F6F0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 20:52:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6SYF74N2z2yFb;
	Fri, 06 Feb 2026 06:52:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770321137;
	cv=none; b=HOl9W218F4KeaXlQxw3leQ/3gCz9IeoeJeQEp6FFBGf9wAxwG37uVBilT13Dlf4RJwAqMoVamrmaFYvSEqIfDNdhQzs4uIINfv+sSO942KGTkQGXZyW+T5/34Ezq3vZVeN0VdA52DT6WSDxSB32MfVhCMNPAjdeKhRdbNplXMv6oOvYu+CsyuhhbYZe3IJWjW9LHH4CQXMjaeAXe+y+QFpKmu9fV2L/uinLr7VXCyQ3sS/9TShCesfzTtIBKGDvbV4nIRdCuhzKQ5QYsO+j2+4q3hDhr+xM2ePXyzH+MiCoBk4LFFtU5nfhxbUddQLpR9JjG7JPxEVknpV6dK1P3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770321137; c=relaxed/relaxed;
	bh=Rvyue3lXA3fGB8HdBoKvnw8CYi0+bdICYfINuIQp+GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQwXtioDLKABTI7IRgDjI1doacxRMgqME4Lv/vMAwYnC5YSDL5QvV437flw92jJ+cqhhe7Z4NIyIjM4RYvO5VH7XTaAnnjb4D+liLtlg1j2XLaTtMHjVhmnLTmPwtZ9AQEnrnUa1NcoqzP6Ll9R2rQq2kNYc8mMu732RVgDMArtphj8cBVfsdXNlWt34JMRjhOR0XzgPOVbq1TsOnR/8UOsLeP0drThK+XH6t9HtnHNP4pzwbJkQQ/W4pmcEQSF4nVPa+P2w1P++r8AB8E+JjriyD2k2s0O0Rz/4RGMRPudYUUVkvKcEE5z7eusjU5xYzTCf9jY6Qg504TjRmNmHVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h0Tn9YMq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h0Tn9YMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6SYD4rFwz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 06:52:15 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-894774491deso16336116d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 11:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770321133; x=1770925933; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvyue3lXA3fGB8HdBoKvnw8CYi0+bdICYfINuIQp+GA=;
        b=h0Tn9YMqzQxsAX67Tu8JSF6V8Z+1jRCikXju9OtShM4q2Oso4lkxEZLxtYpA8vnvs8
         ixkApKgQ4lM9lhbAsM+U+p+PcZOpMzK+WSxFNn6C66XL6ubKmkb90KSF49AnTa6WrbQA
         ae0GnxCmgh2+Acqm6IedO7zKGH7I7esV8co1K3sx+l17XX08Xl5ht2DLffBi72pBnlBb
         r0UqXi5G4KIeNYRsCNw/mCq4PGTtFmuoQ5yzkgjYi5MeUyZnbIUBdURBIMX+MOXmVcy4
         HGoBDTfqkhzHpnyS2XivuW2odvBaTkPSAjSGSt4JjzCwEnxIBXYdM31OSkY/PEbixiGN
         EKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770321133; x=1770925933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rvyue3lXA3fGB8HdBoKvnw8CYi0+bdICYfINuIQp+GA=;
        b=sp3Qtythhw652xKFOAZVZwNHrgfobdypI2yHHzCUWHZ2Vb7ykUIVYoavqanmlmfM9g
         22l1TpqhatfObYsqvCZ+st8goQevKY+2Y/JGdgY7jG/toI8z+z1fFdnI+td+wRT6TFLS
         6r7Ec2WjrE6odeQVjkMPxRLa9PYVbVsRKZ/InmUv/xCQXlR2wCV4T867Aw3gADNpVY95
         OKEJ/CyPbhquXAOoBsaCXU/bxrXr09UL/YEIEMoEkl9+08X5R0/sBR1nMAIGiof50AS8
         pehJOHZ9PW6AxOFArE32pdNTNDqY3+3dQHBeOp4oaO9aYpKrMBssMgCWcM+YOC6Shx0q
         WF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHap4gq6NvGHayBjpiBHNKOLbScb2PyUz2a0fDfMpx5O7jZhnusuWIqu1qSyVqt7Dn/aY6sQu8QO/Cj8Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/8hpQ66BoctD/BYtGWp0yy1ClX1BERnk45dgWDgJvwHzYUsZE
	HXYUijNKJ27y8chIoPAH6dALUmpmdBL3MUBks/XlY/5tn+FzsmxaLcVfL3Wo8A==
X-Gm-Gg: AZuq6aJr158Fa9ULUtnx1pv091tgPO6E8WK/f3fAKz94HU+KwwLz4YpKBkuOD7njkhB
	0xaD1YXEZN4qR5AclAOhujxuPVDopiczOhoZiZfKM+DRNZf09c4Z7sFZ6fKXOEgcd1pDrmxTe4E
	Wwzcm90zIL552y+3jfX1ds+SCI7RLcUToEB50sVI4VSMgmGcb4Tky6q4OwD9xMx6f66sULz2m5b
	UYJKCqpv2cxZ9ba93K2611WfQ2urEODN0eyFiB2H07CwYk+U5uKvLEFJlcKm+16eYx9PeaWkR0H
	TYpAHtXbiOQXGZsqfqtsysZUUCxH/BFSoOIUjAG0TePBFN2VFEnJWt6eMfLZVQJVC2jcrkpL612
	wHFghp09/fyC+D7BaX636Vliy29RXzzWEP+1wdA5K17pUBOYfd8TFzHyTBfQO35nt/nazuBjdPN
	rys07PspbBDw4c9h5vtpaIliXUZnjWtwIUMJNLJtMILgmoYDdEK3AuDrB20Tf+7w==
X-Received: by 2002:a05:6a20:d12f:b0:38d:f0f3:b96d with SMTP id adf61e73a8af0-393acf88673mr215443637.2.1770314709806;
        Thu, 05 Feb 2026 10:05:09 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:05:09 -0800 (PST)
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
Subject: [PATCH V3 3/3] powerpc: Enable Rust for ppc64le
Date: Thu,  5 Feb 2026 23:34:29 +0530
Message-ID: <20260205180429.3280657-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205180429.3280657-1-mkchauras@gmail.com>
References: <20260205180429.3280657-1-mkchauras@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16634-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkmauve.fr:email]
X-Rspamd-Queue-Id: 76231F6F0C
X-Rspamd-Action: no action

Enabling rust support for ppc64le only.

Tested on powernv9:

$ uname -rm
6.19.0-rc8+ ppc64le

$ sudo modprobe rust_minimal
[  632.890850] rust_minimal: Rust minimal sample (init)
[  632.890881] rust_minimal: Am I built-in? false
[  632.890898] rust_minimal: test_parameter: 1

$ sudo rmmod rust_minimal
[  648.272832] rust_minimal: My numbers are [72, 108, 200]
[  648.272873] rust_minimal: Rust minimal sample (exit)

$ sudo modprobe rust_print
[  843.410391] rust_print: Rust printing macros sample (init)
[  843.410424] rust_print: Emergency message (level 0) without args
[  843.410451] rust_print: Alert message (level 1) without args
[  843.410477] rust_print: Critical message (level 2) without args
[  843.410503] rust_print: Error message (level 3) without args
[  843.410530] rust_print: Warning message (level 4) without args
[  843.410557] rust_print: Notice message (level 5) without args
[  843.410594] rust_print: Info message (level 6) without args
[  843.410617] rust_print: A line that is continued without args
[  843.410646] rust_print: Emergency message (level 0) with args
[  843.410675] rust_print: Alert message (level 1) with args
[  843.410691] rust_print: Critical message (level 2) with args
[  843.410727] rust_print: Error message (level 3) with args
[  843.410761] rust_print: Warning message (level 4) with args
[  843.410796] rust_print: Notice message (level 5) with args
[  843.410821] rust_print: Info message (level 6) with args
[  843.410854] rust_print: A line that is continued with args
[  843.410892] rust_print: 1
[  843.410895] rust_print: "hello, world"
[  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[  843.410977] rust_print: Arc<dyn Display> says 42
[  843.410979] rust_print: Arc<dyn Display> says hello, world

$ sudo rmmod rust_print
[  843.411003] rust_print: "hello, world"
[  888.499935] rust_print: Rust printing macros sample (exit)

Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 9 ++++++++-
 rust/Makefile                       | 8 ++++++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index e26a94808e97..627471ac9238 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``powerpc``    Experimental      32-bit Big Endian only.
+``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 17db23b82e91..954af27e10c5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
 	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9fd82c75dcbd..f93816ddc036 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,14 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+endif
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index ae22f2c5f0b3..14febe9c7643 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,7 +392,15 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+endif
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.52.0


