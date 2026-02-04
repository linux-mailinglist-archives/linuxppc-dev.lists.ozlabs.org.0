Return-Path: <linuxppc-dev+bounces-16605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOduCO6zg2k0tAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 22:02:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5BECA29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 22:02:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5t8g45JNz3bhq;
	Thu, 05 Feb 2026 08:02:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770238947;
	cv=none; b=ZD/QrQbXPS0qvt3unUK5yyeKAu+gx93egKn/HANq+bUAeTHaxQf2gdjrIO1nnGb7AhSp21gAuuUF+JCoYNOcO2cFO7IvD6uPFKsxS+nmOqT1/CrE8as9eF7BbW/noUs2WCdDoVI85rQFjemyxB4lrGOTr7EfZeDsxjMymTpTbqrPUplbYFpNnmyD0r8olI25mz3Ls9nXkTj/q/DBCY9mC7jyOcISYm/kKzSx/kb2EzHTNwQSuAo8Ygs4mYvq7c48evX0uQdOBtD3dnTyf+UuZGxTnVUlTgu6QcjPfnT8Un6l5Vtwjgr/td3eZTs+PGo/VwDbbdsn4QwvQYqdD5VMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770238947; c=relaxed/relaxed;
	bh=5JEXFfn5owLVtRFRZ2oa7tX5z5wOjOt9hQA1ZlR21y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHxV2RoS7C8bWHAU7J1eacqZm9ZIOWTXu9BpA1K0Zu6p43tHC7F4KRSkW1H03XtpSBVvkpdk86h4ELK9DUVS7IIECpMjrBpvUAR64rTYGltSKmvwwG4GHDv5/rvD3tNZD3CXfLwxZLC+1102JVcgxA1B7x1bcqDUZHRY0knP/tymsoZeosffZGipoO59hCxCSCKeOzZiK9c0B34JdH4AGkSWp94+WXbTHQsmTmEKvQ6gjY2hfgQEeFvF97fX/YK7LGBHRyBCXIBCVULrTcqKCR7UsyK4S/3aotU4lR9Nh0GEpxz1WqMS/8TrCSCpnfY8qFPv1MCj2/muGhzj0+9NmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EOAc+sWT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EOAc+sWT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5t8f5R04z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 08:02:26 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8230c33f477so140449b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 13:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770238945; x=1770843745; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JEXFfn5owLVtRFRZ2oa7tX5z5wOjOt9hQA1ZlR21y4=;
        b=EOAc+sWTCxeCQtrAI5lq+Pccs4Ud5NJv23A6VzpeYTDYA4M9FHgANY+e+c4MNI5/eg
         fhLtSLHOOW10D8f65JIiUzWQPfbvZz8sFTM/77H0Y++XDDf5890Ggr0Lv6YOZRhAMP12
         c4STRrfStInCDTbw2jRmcQvAfDpdviFZ/bIyUj9bSEKKLhR4P0x66Dh3dbSBexa9/WMl
         fRWTiVGi6nNEnPwojs0fbshbtHCD9HrQyUND/yEvrqIuYzZw89XY4fatCjZ146tqZALQ
         Cu/r/z0KxwX3JQOiGlYVWV2+h9qoax5eriTF22GOLZLJXXVZ5YflLJDe+JGQAVVDNHvB
         y9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238945; x=1770843745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JEXFfn5owLVtRFRZ2oa7tX5z5wOjOt9hQA1ZlR21y4=;
        b=Gpxa38+8Yj6F+MLQPKv/6/vNgn3RWbnfbT/3G+sEzsSkOLw/aeGevSwRIOjtKJwrzu
         sFpcVaaumxEjPKTxDcbSRM2IfalWbuOCSR4iRUKTGJrSfhm73x7Z+Dw18wTz2EXOgAgs
         Ggh/lSwqZwtFHafjFdpYNg728k54F3AzHEodpl1//2/SeXV2WG0JmDXM6xjxvTNSaf2p
         wmFHi8k0E54Ur2PDz5Io22ChZVBMIPTGgJWShX2Ak3OYhgk2npbu5xGXAkLBG3gBH/7/
         Y8f+T8HS7QwADhQq4cucxpxzYnApt96/iID7LYxXP2VfCvrcAPtKZUGxAWOdXpnrFFds
         aVpA==
X-Forwarded-Encrypted: i=1; AJvYcCX4kGPZjUNYHZnwuidem50KMaJqlPuMwIlygAa6SgAdXS0xUQduzSsw4r8b+2V3aSRGX7mOb0WtFGlTsBg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSwGPRXvsRf/je1jKiLvic1/qt2IsMdHHVzW8h8ZGJVXq/jWam
	RP4y+kZt7C9QdpuZyLLbVS4dm/2UlbGXEzTiwm+Q9UAW2JijrF0YLgrA
X-Gm-Gg: AZuq6aJRPO7a7oX9ewTlFIksxfwE3wc+H6BRSi5v2poRJdrc1BVA8/kKIp0vHNXDOqZ
	6TBA5OdsMlBRrFpj/UX7CaUnRaqvOaqPI4DFgMd+6Yf2VclyTv3d51sDmMEdtNRm3++djxB1tnf
	LHBU5BBggbW4UO5EIPc6mo9h7hmVp8Qw/8L5DmjLPo+uuyO3rP2bkUteIecY+mh6tKFzu2oGkEr
	4Vs1sgA1oC1/xABxtcO0dbB68qMeKZPg6zrp5dIGe+FM/aw++m4SomYI3uxF7Pn8467M3hL0OO1
	rgwJMLRw274MK9MhZ9tWRvl6dVM+SarECoTcbZtJAcF5QObBkSvWDwDXs23Tb6aX00LwlwEs+0L
	ATrDlDEJULbb8G3IXi11mZnKW9+UgSg0GHmY9MbOBZVAAr2Ob3ybWFVeiR/HsxRUJCxg3DnE4S4
	VnXZEkJdJSxXz6hm1fxgsHy9HrF4udUMfW11hz4LxMj79r1m154m3hMTFywxUs4Mzg
X-Received: by 2002:a05:6a00:a907:b0:823:88a:7f1d with SMTP id d2e1a72fcca58-8241c648432mr4248864b3a.62.1770238944810;
        Wed, 04 Feb 2026 13:02:24 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:24 -0800 (PST)
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
Subject: [PATCH V2 2/3] rust: Add PowerPC support
Date: Thu,  5 Feb 2026 02:31:24 +0530
Message-ID: <20260204210125.613350-3-mkchauras@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16605-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2CB5BECA29
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
2.52.0


