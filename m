Return-Path: <linuxppc-dev+bounces-16772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CbjC/QOi2l/PQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 11:56:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E1119E43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 11:56:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9JR02w8Zz2yFm;
	Tue, 10 Feb 2026 21:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770721004;
	cv=none; b=OvinQEifCOW/3Kf9CFE/fiLF+B5YNLcE4MuQgj9eBlnvGa67nCsmhzJRseqMdiy5Ug/gS9DKDM22GsAFKmJC4LYhSmWHKOw3oYde8Gxo8epVEVQY3DxIQOCJjMEzaNhVE1pSxRR4HeOuyn2VPcFXcR6+Vi2uMouF5LLFC5fDUmeNO2fVIs47jgbYpCtHNj7xrjMbyeykY3Ll7+rbicmi2qcMWfsbMjIvLFLpQaDGqjXF/NWshMEZ3107VFyvMr5w9UiPXZvUFbYSQhSeyELSxBkIZtCayfftOzQUrn64P3f9hE5mqAK7Ou3epUmG7FQn+hFsrgtGK0Bda262QnAV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770721004; c=relaxed/relaxed;
	bh=fIJz3kYN33qG3Fl2V6Bqi8+KcSudbe9ldFTSf7iXp3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hac7pzlRQ3tKpaUunzz8ExE1DtdjSUzH7Ny3nIw13IAR1qdu9osqMo4QrBhpdcOR12eeljb3xIfgvqfTYYXS6LFVBkYe7xj/+x87lccSjUNvQ5MefVLn4+J4b9LmNMuvJTXEUc8K9r9HAqaxVKdceru+PBg8JN6B1Zs72ihXgs4YVfxQjM8/p/+DJRfpSAtfJdnOGgYpdd4DRMbaqL2NYH72XjFGbbVf5RJXEh2d8p3+xx5IZJVpjcreuMmbQcsZzbjvDtcEj64rjy/Pa68FBS0xIVnq2Zd3akeTPUTqnEEfN4NiGaaHN4pQ9bz93ZzpJI3WAhx0N/IoXX7WO35MHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y4PdIx7C; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y4PdIx7C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9JQx6ZLDz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 21:56:40 +1100 (AEDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-4096aab5521so3153978fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770720993; x=1771325793; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIJz3kYN33qG3Fl2V6Bqi8+KcSudbe9ldFTSf7iXp3g=;
        b=Y4PdIx7C6/S1dTzAxNiTT3yP8mC/fg6jGnF2O071sZjLGdQ6c9r+Zaer8FAwVGcxQJ
         p541E14ftgNNzjtsRTDQLl3dOl2kJ86q70vxat5B+ilelsFoak52DEZO9vqRGFWMKi0c
         xIctUlNEJbkX4NKMALbF4Cni53LXyeHUHoHjDlLa8awtHB3A4Hn6lZhrhe6kbQtcHyTU
         DqlwkcRY9q1t+4TOWDVX3+RMbn9U1fjXQgmrpocjkdHRHMqRExF3YeYdk3CSnY8Rmy+C
         hs+vmleVUyf+EtkDrEqIW/t7wcorVEScmqwSGkQ+T3BkcYE1XzUqJaLR/RxStZAnuVa9
         dugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770720993; x=1771325793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fIJz3kYN33qG3Fl2V6Bqi8+KcSudbe9ldFTSf7iXp3g=;
        b=uNKeSyQ1hJrC7skuoCPtmFlSu3lRGcKQWBV91q4mGP43YCyXLJO9fNrLAxp4Hn7VOx
         DUpOGNow7MsP0fGAd7RHrz7xTG5ibotwgwPD2qiU/FYTpDSQCWGZkdGXErmi9XvUm7LS
         9i8AZ2UghatU9EJ8ei36R5BmtqK0RgWKyj13o3H4QT+7CQ/DfJWcxnBfN8mpa5lP98gm
         P74l6b+3WFeVH8NH64CI9IVtt4Tdf9m2wNXUpeMeX11TM00RynYPISFeBonZDdJ5ybdG
         FTe3qbB8dJ+SnGfl8D3RCPaY/K+4+sSApVVivzQ4qznd1Vd0TMPd6y8QexC5gcXKfZaQ
         JhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUc05RwvnDuBa7O2iu5v09K4KDHTIqvKLNcQ475iNLMS360R45N7iHBC1/qVrwmpH2ApSARraQkUz87Lc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzc0Ot+KnFu9WnJEhKLuUH0mxzrXMQdnhtW2jXp6VTabJPzQodo
	ntnOssNdT9yiNZRQYdOHVqDmDB9y5Jr9sojqoe1SU8/HtuSxdfgLN4Nw1fBp2w==
X-Gm-Gg: AZuq6aI0syQDfRyXTk7yWxLjffis4wbnFF9rxu08MB3NiNJ58X+euetogsw4zIX86bS
	10TdKxqV7sBbjbbw7NqpM1KfQWA7ZsEXcw+mlGvT/mI67dmrAJxtqGyaXFdZ67hlFU12AyYfNc9
	rwOrYqbBpQw8+aAiz6PSlJH/62UkdefhOdH+9uKywaZLdb7n2LdeqTkJzx9aH2EET6/MOlniZyE
	jIdfDNU1fnA544Bmnc37UP0qfiZq4zhNAC10p29ZDj5W3zw/J5z/eqzwtHk5EJGwDUrvHVnfVVC
	RIAvQXQAph0n1k6oQmv1DpS7T5yt1WS9CfjU0pWvxS4YLWRrLLwwcbgNjVh3iF+Qq32ZKeMt8zE
	WB5ZZdmdW6U1+EixaVIiGg+/9gcVpT/WQSfRbli+2/dM0qjx8JUJO+4d0QLbzzkQE4JOj/CwG4/
	Br7lq9YdyXnyEIhyBmTU3y6c9ePknFYOA1CJCZg3cNRj1Pb4HEAzHkj7iwAavyFMY+zZHxF2M=
X-Received: by 2002:a17:903:b4e:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a95194aaeamr120907585ad.55.1770714055465;
        Tue, 10 Feb 2026 01:00:55 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:55 -0800 (PST)
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
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V6 3/3] powerpc: Enable Rust for ppc64le
Date: Tue, 10 Feb 2026 14:30:22 +0530
Message-ID: <20260210090023.2587534-4-mkchauras@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:venkat88@linux.ibm.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.ibm.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-16772-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkmauve.fr:email]
X-Rspamd-Queue-Id: 682E1119E43
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
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 7 ++++++-
 rust/Makefile                       | 6 ++++++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 70b9e192a7a0..70bcd726ad0e 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``powerpc``    Maintained        32-bit Big Endian only.
+``powerpc``    Maintained        64-bit Little Endian. 32-bit Big Endian.
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
index 9fd82c75dcbd..9385db478c59 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,12 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index ae22f2c5f0b3..0aef472c6cf5 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,7 +392,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+
+ifdef CONFIG_PPC64
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0


