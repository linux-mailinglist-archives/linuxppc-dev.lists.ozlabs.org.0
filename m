Return-Path: <linuxppc-dev+bounces-16735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAb+ASm9iWneBQUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 11:55:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3485B10E671
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 11:55:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8hRv5mKSz3bf4;
	Mon, 09 Feb 2026 21:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770634523;
	cv=none; b=H11vHdd2cJQI5xd43WwQav4PWhekVf5G4GLXXWaYFGE+niqgZD/ujQYVIFSPIT97pspGqnLpAhQh7KA/xoPOEe3KPMesTNBtO40zxyljHACOjpaou1vxFMFT1N/27qKdAikEfzCHtdJJNmnQh+7SVllUk4m3uxbnfGGUF6y26PmlXGBtPLblJVGRu8W/Od8fkVWRvShCJvhPufBmJoHP0oyrXX83FTjEl+0hT7fgvdEHRehCTT+ePjpkcrY6YaJycHbBE/Vb/8C6eY/6N2roJ0vTK5KuNO//SCfVdZKGqmdzHdxjXsbUX0TQWQdfwQLFKoPhCJ2bjtoceGEAs1V+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770634523; c=relaxed/relaxed;
	bh=Cqa51jQ51mIYrhUu71vdVarPvI31OG/fcLZs5WN5E9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFOqXi1eTzCIMXEnbp8UfFgdd9Wj0JjQpC6otd0o8FnsarvP3Y4v0TRLOvDFmjsI8RfWWT/YOpw0Fo7talMQYlsiZrrFq9Ul371645rCWKBlAmlPFgryg3erUYngzvW3R//nnzdPtBqgG/4xeu919CNp6KmryOhfKwnGcf/XUpsDWQKaGedQJcyWewLjpZrN3RVTQ89c/t3GNOLXD3mHUCazyEXol59NZZFwF85x+VJDQDgE7JQL+A/1I2dziM2LMRxYRuq3PO0SuZz2xipw/pnKinkchWgnBCzb/aGFK7TZT0Xxhu4a0nspfnIutumef8/CugcvEDMfmtpA5MKylA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ah4S7gmQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ah4S7gmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8hRv0f3Nz2yFm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 21:55:22 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-823c56765fdso2368656b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 02:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634521; x=1771239321; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqa51jQ51mIYrhUu71vdVarPvI31OG/fcLZs5WN5E9s=;
        b=Ah4S7gmQJcZUvnrFesYJxUhDsSQLvEpdf3BwOn+8W2l8TuQYgYutLqk74NauBSsQNB
         TTxib3+RINyOJzFppnfG2UfnbcrAfO53kAcROUqKbmL+BXXp/dL224C0Cv/5j0Sr1dnT
         dZ36mxzpouPjcTUWjTnAwU/jv5GyCwlUBZ58szQzTJgIY478JKQtqw8EtPknxK8/TwWl
         kqYyz+wJH/EU8wm7sNYiMg8dBZTSmfPVl7mkz8P6W1QSKdfPGqBLw/+4/s/qqd4tS7Je
         69eMCAPOnEK9iWO/6jScpcDXGH3gUOjQxOSxua6+N1DqANh9q1w7F2KFEpljdQF/Ti0S
         BSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634521; x=1771239321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cqa51jQ51mIYrhUu71vdVarPvI31OG/fcLZs5WN5E9s=;
        b=HYMrtL/joXqsAFEAEzXuQw0NmrcvnZdBqf4FMp5eePF0bEW6x9fkKDf/pVA5+4frJB
         z6LCx39JnTRTlfoJo36UFlPNBSKfXX70HaMqVyyWeF8/5HMxkM3SIVQjIg0qZUFpsQRz
         vr5opmeEtQO+PeEO+4ulfqSo6hhBTqQckdwuESvrJeiZ695pSUQwe96besqTYUXOmSFk
         cS5rZn0DU4BfbuOPbEv6vRxDYCg5h5ikh3FBI90ExBhs+VPjzSdUWfMC3pKItMe274rb
         yzWRNTQg1pGSt1RyV72PWcNf0m8sL0R0Uq86auIQN5d60v3jrizXNoE9tNWiMftakJiM
         aZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKEGECqYxA0yavkSytuJEMWlgyhWfEEmbaYBDZ3y749fLN4e0Ulsvb/SHPnnKVY0yrjYMcSt6IsjFAphc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6aBUrR2/qzuwtqsiwzbTgI5UmM3F8ufBv763FJd6M/r/gplVk
	1+E1PHxcrnKqMtbsnnIqhAtlp1dOidF0ydWFkgmi+zDUJfrRd5oTbWF8
X-Gm-Gg: AZuq6aKIJrqX0Qa4z62yR7y29qWMwBWnIUafGH3y+a/G+ztFC7VJw70awwLSCmSBbVT
	EFdJJrgDVAfwf/pwhfefMYz5XTS9UF55Ba+A6+NroPXoy6c376iDKNxl1A2mDbvGqH8CWNeaEbV
	4OjpuLif7QArgXJn/iue+XR2Op04PMPR2Qh4+Mhf1yeFSZr3qCbjy+OwNvXmFyRH32yTUp/0peZ
	l0wwwcjgK8ErFDKWYeLSYJ+LQBegc9VHrHcbmD/qC9YKpwTNOP/xcvRZwGsVBJt/yrKU1C9DDNl
	EdDdhU6QFhE7RRhlAnikPdbt75UQi71uacY8vHYwObf5pKbfRTlKjgSdgKCRuDkhmF0arKeYZi4
	TJEI4ZYzM1m5qxBSMKlgehfao4miV+CCjPhUbjZNt9bqVee+DZA9hzV3NoBYUy44zrsYcOvpNtR
	+dj8YzMpWNSrD0qpHnE3kWA1qNhPrSvN+iGOuI6CezrvUVOZne8qmIKrEn+q8lGgHeQvinog==
X-Received: by 2002:a05:6a00:17a3:b0:823:244f:1f91 with SMTP id d2e1a72fcca58-82441612afdmr9001382b3a.11.1770634520745;
        Mon, 09 Feb 2026 02:55:20 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:20 -0800 (PST)
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
Subject: [PATCH V4 2/3] rust: Add PowerPC support
Date: Mon,  9 Feb 2026 16:24:55 +0530
Message-ID: <20260209105456.1551677-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209105456.1551677-1-mkchauras@gmail.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16735-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkmauve.fr:email]
X-Rspamd-Queue-Id: 3485B10E671
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
index 6e6a515d0899..e26a94808e97 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
+``powerpc``    Experimental      32-bit Big Endian only.
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


