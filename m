Return-Path: <linuxppc-dev+bounces-16607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIEWDgnPg2kFugMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 23:58:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEF8ED247
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 23:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5wkD73rcz2yFQ;
	Thu, 05 Feb 2026 09:58:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770245892;
	cv=none; b=ZrCR2/NMx/IlPNymVa/L4WxBlEb/Vbffcio+4Y/ui+1ESjaBzrKGAYqNp9KUqXyDNNaaZjkaWvL7eXDJlbbgbQzif1CNB94KMTQATpQF79d3gI9zVx2T4s2JizuNl4+gEr3Vi2x+F5t+hnqTcBpsCoYtX6BvZyfVX8JDl1DQRggCnXX+PsC7ZsFKOUq0vvrrX+QyXzUTbIX0+SyrZTmLOGdmTWbh2UEze2QvHt9H5HSOMWPd1qKQ9ugQKPDl084GrGf4aO8/qrnOzoG7Oz9S/FIZYqu7CDajgbjufaeVykjBFbIu2XxSXyk1i3cnS9a49NiFbdYBQuW02rMah3QFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770245892; c=relaxed/relaxed;
	bh=HXYYAkQIYtgJH8avjMGESEihpdp9UD0EHXLRnPGjhdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abut1HvcjKlicjadGJI+V05JkxMDARaeUTYi8PGIc3sRc5lxIYpPPRO0REc4f+dGrmEjWY0GllbL7GDh2Mz3laasurqdmwehBzLQ6e+3jfiSMYkhhl982ISuOE/wIS0VpzPLbGDJJcsPFvBz8PUIT8ks1mK88BKxEWEfQa6xMjzIALycSmjNQsuw1CmYBrRoFJuW3LgbJk3G1vkPbIXfmXXPGWTU+0i2lzrqm/xuyOJS/6MxyGZQxV2bq/oMhhCK6F89BGV/dXpDX06AGZWlJjFE31PpbU3qDIK1T/6dCfMGd0U3xvYbdkT6jzCud9CU3/fjdbTuGlcTF4wKn5g/Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5xBmlvb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5xBmlvb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5wkC2thmz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 09:58:10 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-45f0b597eb4so194432b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 14:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770245888; x=1770850688; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXYYAkQIYtgJH8avjMGESEihpdp9UD0EHXLRnPGjhdU=;
        b=Y5xBmlvb4s8LB+aLqovn2wfG6cLTU2gqUlDefbyF9GTq1w5biDb9WtIMc91JFw8jAQ
         H3HmzrFsoR0pDCoLImqt81PhdOFbHTRkwNDSl6XSMTs58Vvc4xwffmCIaPQweBy1qGha
         lsqr2zO8zHQC1N+Chjv4ACjWnEg9pwJFtx0wmO1JoF5VXD8n19IKCX44+BOpN3EiQjSf
         WPc/awX2c6VEhWo8QBrp3EEEoL+gFhx26fjSo32ivPNJeiTwBYi9cjsupVFmuN4vRW93
         6E5FjeLx2BLUGWwvsEN6RHa+Xx68EVVjIdBN+RrPBxYvbtddKBxxXrk5QkCBLgKm9Paf
         3yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770245888; x=1770850688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXYYAkQIYtgJH8avjMGESEihpdp9UD0EHXLRnPGjhdU=;
        b=qn2dX8+z93ETn4tyZVhWvml/gq5SAjs4M+Xp+a87i5a2PqJL0eHT+09eJ0HR1JF8aw
         QVJRpQbqV0GPAUqFVPkKUEXymr6Z48kAR1L8ENE1GNh2NmkHeqiTFuMyvxeHS2ZryCG/
         Ddj50ZGw1npENIwbjFgeWjyxNplUIXD0lJsqdIetVKAPWaihwyl4ZJ15xAzQpFfQ5TG+
         CS6xv2Ogd1kTyefOMBhDrI4FQXutDWLtvSFZ7IvNKFXlGQ3bcNZaeDfEJLBA/TcYykHk
         E30m6VIxTsziMVHk/bzNxZSNqvFsDyJg4/IhzPgtK4zPkQCM8SraelMCZRvhZBhw7Cfm
         WgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCETWk6A6P8JeXFoZSsySt5b1jWDl+1AFB/Jgh58lUWggJFleJg88ziCRm4h2Qr1g4mqw6fn9zwcwXYDs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1VJL3qYA9cp/+BNFJMp0UQhS/FFEvvG4zKIzhnCb+Lne04WIM
	AiU1/dMXQ/QFxG3H+Q3sK+XYO0he/CUQX4AC/zMzUkay9g1Srz7DSH6j
X-Gm-Gg: AZuq6aLIWhK+I0EpeU8BTDmWRvuP7g7idtfLWyBelr2+jJJztCZ+oEEwvu9iRsAq4WM
	qRkYk5L4HWYC8kxC04fKxcz7aR+b5hkR+guxon0ixUdBgLY8Y6slw5Tz0+WzS8O9D1tIzWXL2iU
	BS0MS5eAMAGmc1KtdJjecPk7/cMbaZJ3+lJcYTD9xX5ojTYS7jM9yUKuybNcAbcbZ5Q/qjomMnB
	jVs529JT4k6hDel+opXptRFJsHlO20QyQWZB+BwyU2Zq/QGLwRr4y6y2zNWH2OpTEueujLmqx/y
	M1Qx/rERstxfUyitzhF8PW2O6o/ZpU1FuwAMDYHOeLFVUmBw2hNoZLRd46CH2JSpRPj29e2acu0
	yBJRsaWiNa7VTDZxRaYsQSs2DR+BCE5rzJfFwTILiMCiYbgSmAkotiivdnYS4NzyJN5JA52XEY5
	DyRc53FYrH3lN7yIsoVChMmerN5bh1rWY45FAez4H5zDK39txQ25i5YT4sOwSHjdBJ
X-Received: by 2002:a17:90b:2f47:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-354870f8750mr3428377a91.14.1770238953409;
        Wed, 04 Feb 2026 13:02:33 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:33 -0800 (PST)
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
Subject: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
Date: Thu,  5 Feb 2026 02:31:25 +0530
Message-ID: <20260204210125.613350-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204210125.613350-1-mkchauras@gmail.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
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
	TAGGED_FROM(0.00)[bounces-16607-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CEEF8ED247
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

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 2 +-
 arch/powerpc/Makefile               | 9 ++++++++-
 rust/Makefile                       | 9 ++++++++-
 4 files changed, 18 insertions(+), 4 deletions(-)

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
index 17db23b82e91..c5dd03713af2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -283,7 +283,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
-	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC32 || (PPC64 && CPU_LITTLE_ENDIAN)
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
index ae22f2c5f0b3..c3961fd0d9a4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,10 +392,17 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+endif
+else
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
-- 
2.52.0


