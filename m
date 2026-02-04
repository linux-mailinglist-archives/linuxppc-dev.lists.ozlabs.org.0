Return-Path: <linuxppc-dev+bounces-16603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFYiEdyzg2k0tAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 22:02:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52101ECA11
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 22:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5t8S50bqz2xKx;
	Thu, 05 Feb 2026 08:02:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770238936;
	cv=none; b=HL2ljsMmBN8FcT9eMDS/qcaYwv068Z/zVn2Un3puJNT3A9jVxu5WHlpQgRLgA5RPXV53l6WeVStiCrVq6Ampl2sikqMexqQeE69yKWu8BVX9CybmXJfrjh+S0yA45FTFM1UGYmFoq+lbnPVRs95ELn1a1aqkn7c7gMHxwMr/r7HedgpvFDxbfTKYl5KgruASWfrFH7sTDl1Y2B3gdRbsM2Vu/ZQLJP/GvuguwGuGfTK/wAkaFQY7yYepCFTJUfDa8J2VI24pzmT5p8g7FYg4kcGZeI3VzvfgY3k/o+VPEs5iFyRFbeZsjypkNhBph+a2C/RF5GLvQNkG3JsXO4aheg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770238936; c=relaxed/relaxed;
	bh=2V/4lpM1tyoivo3E/+Mz0tbhlWt4A1di3YB0XAjK7Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WWl7p8Um2klAx0B6VJBAw7100fPYLcblx441FEQBdjZkdvBY+VcZKtIC+hisHneHjGAtn0nMAT18GlWi7bhSDbRA7XHxQqUzc27BdaiAPsKp+F4YQ1F3ZspekRKph9RLyCOTWmeDM4tZWGYn5uF0lzYbaVUv8+rbQrEXIQV5BnxxJLQldreJQk9q3aynTAHWSuopnkYsa1rq3/+CWBgVuBL+mPSPfw0p+ZFLZoX3dNpn5RR75HnK4OS1ZO4/GF7HgW5tAonntPxeXURWl85f4DeA/8zyIRAuzIeNqhGBtuJk+SDSsasPTcYXFpP0G+N/FBBQb+xKwwlmq3Aqsf//qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MDziLQ9z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MDziLQ9z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5t8R2JTFz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 08:02:15 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c551edc745eso62288a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 13:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770238928; x=1770843728; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2V/4lpM1tyoivo3E/+Mz0tbhlWt4A1di3YB0XAjK7Lg=;
        b=MDziLQ9zlL1jwugjkAoVCjtHesl5gLLkZl6+FZNZ/TKjrLrgGfYX15olVlzgFfFPIt
         UzdF+xpxjDPabHqObPJgiShKJ3ymexhG1dz5FXCxIQPCmwrNHZhJR6AO4HBGGT5Rwe0r
         iO3768QsePo9CLHDYabdNP/Vli/piIc3EPVYmhQ0Ja6wKfcOulm9CLaWCbyucjLvKYnR
         ld8NB3XkEGfDXT5o4Jdd7FjAixZDA0y7W6wEIR9KqWBiu/6s2Aec3bN7uZ8sCx72k9ca
         m8TNNDh9h70xjWOPtHGvHibC2KwK50WTTHFaHl5AGyWgGHnW97/IRsyKTSu0Yn4T1mS3
         AHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238928; x=1770843728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V/4lpM1tyoivo3E/+Mz0tbhlWt4A1di3YB0XAjK7Lg=;
        b=kT1qJYbzjbGr9hJowz2GfkygZG898Ye3y7aXrL6Nz0Vg7GSW2RQLQt8yq6Hs8yJhTG
         dARntRZkg6Uh1t9Dt/wLq+R8BTcgItlVPpBU6tqANw4Sqp+z7sq4MTTBbbICse/IenMJ
         8hOvNsS209UQIAin66bsgHL+9pnYQ6IIARThzvtG1TPVnqtuwqc2Aidlr3OtJ3+JiaCu
         BIub/0Bfx3jSudsGGh9ckoxsfm3c234IdgyjlWYwIyhSbScdBGG3VS1puOG1qYxBm7RX
         H1vGoglr06oJPAVfhHTYDeot+JLThERtlJOG1zymoW2aAhlQfuv3tY8vaM/0uk5hQldQ
         Ly9A==
X-Forwarded-Encrypted: i=1; AJvYcCUzu4uQTd2Lws0qTppsRElvC+fi7HNCTD55vvVkpLuRdPgDgFnBuauhflxcRfFJF3cFsTfYcBFzEwbKKJo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5N5lDZGl7mc5UAgNVEdKl+zwnFlmPmdJOP5JAjoLQh+bOsnvX
	qVtfvrU5z2otJcDiJZHlnOJHooXdBqGZyDX/btaZIja03oSSrLNa+cBc
X-Gm-Gg: AZuq6aI+UaogM75UlNG9LqsEypAK8HoKg+dWUcyA70gWAEHgM8ZtxppMsSO5e16Ie4f
	EEIv7dgLhVi/8+8ovFF8eAVTnAGAKOf63x8bLOrUBt0iqzYKM+gjF6QEXplWCj90K9/fz3Mtijs
	VQk3p8X1X+QPucug0f5ryLcGp5cs7d6Jc/5yseLX3BNE5Venx8k2fPuAQemLDdfYVrtThaS/z7M
	zT9Edo82oYhOvndesTDHO5OfupwjiYVYrwYezmIDIImXejLY18fFwgZ8EBi3YGbzATk/oja/8ST
	EVBliDcXhe42dTJVZFmAwAcBHAjVQaYYwEIOzcn1CmoEBb9duLF7G/QE9fb3tUYxRJR5YxSaCeC
	O7yY8BcvAvANcia3f70HHy0UR0EqCfqPJ0viFUtnu8OXw1hB/Z6ueoKOuocvmrcq9xttRwqmey6
	8KfEvVsxNgQKfcONUjtiScBslJVTOSwVrl3XhiJ5LFpQol8jA6z6NnckVwYgJhX1S0
X-Received: by 2002:a17:90b:350d:b0:341:315:f4ed with SMTP id 98e67ed59e1d1-354870eb613mr3795120a91.10.1770238927704;
        Wed, 04 Feb 2026 13:02:07 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:07 -0800 (PST)
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
Subject: [PATCH V2 0/3] Rust support for powerpc
Date: Thu,  5 Feb 2026 02:31:22 +0530
Message-ID: <20260204210125.613350-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
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
	TAGGED_FROM(0.00)[bounces-16603-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 52101ECA11
X-Rspamd-Action: no action

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been 
merged over it. ppc32 needs some toolchain fixes mentioned in the patch 
`rust: Add PowerPC support` and the discussion for that is done here[1]. 

This has been tested on powernv9 hardware and power10 pseries qemu. I
I request Link to test the ppc32 part as i don't have a hardware to test
it out. 

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 Documentation/rust/arch-support.rst   |  1 +
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/Makefile                 |  9 +++++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 11 ++++++++++-
 5 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.52.0


