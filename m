Return-Path: <linuxppc-dev+bounces-16761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKnkNVbYimmDOQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 08:03:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D545117A15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 08:03:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9CG936y7z30FF;
	Tue, 10 Feb 2026 18:03:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770707025;
	cv=none; b=VmkrLwGmIN6nRT4Miw40rvSMZR2A3IkmrrDFWvbMUC8smWCy8XOccnHw8tjQB6Qlh4VO+NWgV3IPVk0fLbIZEMYN7FIocqmYKUjYkDgSyNLc0S3KjVN7GfKWGkK0HEx/4aTGj2GIjIKkTYcl+TEJqCsarcrrUL/KZH+1rssrzXeLibO5eus8QpSvb/ZteHS77ogsvEEFKV/9lJb2j6N464a2qX9D+QwQrUY885T03ZEfSyjLnLo/Py9nYj8jcUOGxpBU1pt5zdOZmI2DbsTGqT1k/GpmSGrm+GbJRroOUn8AJ0fXUyMOyv4j38RteIeqmy4Fhc5mzEEUobcrL8h2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770707025; c=relaxed/relaxed;
	bh=GFHY+kwDQdh2yEHJCYn420Oxm2P8lL33JJQBtOkv6/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=csGGPe9OvCEMmb/dLTjhVJHLFw6C6XiwijNZn08Nv8uX7d1BezSpYrLAlL4KueLHa3j1sryw7/uwCGzupWmWFldlHzm+Jk9YR0eYNL4n95y+2tLUn+DglChaPBDz32/whJIo/rzoYEvjqatu8NkFe9moZ2SzbIBQUpICtMKOsuSzr5c6Kug1TvGKYnpdU7j2nmmnKxJ4wMj/i2tVs5dnT0eQ9At19tl/9Ak7R6y3P9uhjrigwmgJHblXIkvkGL/Cq3+YKlmEkYxfiqmHIYkmxHuoZAKJtQmZKV1uJKXfjT1W2Z88RE0gydKbmfAGV930Tn+Wm/+JqChcm825FWkb6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dQNUOjDy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dQNUOjDy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9CG807NQz309N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 18:03:43 +1100 (AEDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-9489d087bcfso322848241.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 23:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770707020; x=1771311820; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFHY+kwDQdh2yEHJCYn420Oxm2P8lL33JJQBtOkv6/g=;
        b=dQNUOjDyd7OZF0+NvTMDK8lPapSUyGxuYZZ4hdhqIpXtnMcRV7+kKHpfaY1r0J8QN6
         ZM1iDTUqrKUwaePoSl6NbCN867nFcoDHIYBcFRgWRKA5PwZfMiHHGhfPXjTTTM2pQ9Hz
         5c1U7DIpAUK7EicpvCKWbLU4mewe0lps/MfQrn/d+m03aR9IdTxecdgu1+bQh+pRclLr
         UIFvXQ4vXS8pUJqFO/u2bFy8uOA7iY9C4B2HxqcjzAmRDCpTDFd8IXk3i6JR9/FV+Avz
         zBMVrhB9UmfxqyKEL7rhlyB4Guu+nQiy0n3ZuY/QSX4posXIyrfMA97235n+qIegssGW
         QhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770707020; x=1771311820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFHY+kwDQdh2yEHJCYn420Oxm2P8lL33JJQBtOkv6/g=;
        b=SEACJUweHw30nHbN+DpAGUXf7xuRc9xnBMM7wT9FYKrSNeMr9eMieB8x08iKhYYGU+
         xMPM8utyX87Css6gBd/uUZP/KGKguQn0wpWrILGYa/+Mtmd+Ig0cPfTYxJQ3tiK00SWr
         bxYRIko/1kL3KnCrkUpIc36PukEtPDaD/lUiNqhjHN8Dtb4USRA99MlEoEhazI8CLCxB
         WlKd4G5zBjfJ+MBK/8SsotkDMjLDe6DD6mCeNPNSJvyIVhlC8Otm6rbasP8Ydvghvm8+
         kYprEnuaaCXR/TmyeMrsAzjQ4kpqdRobKjqVFZQ6InrJmEBIB8EgQ+rM1tCgw2NZD1Fr
         gucg==
X-Forwarded-Encrypted: i=1; AJvYcCV5fh8MH8L22kQUMjOYiDIxcNVfCpW8AyHjmE10KD2WcAL478KFzA6aJyEB6/1C1LshxACoQxSW8ZmUkv4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyE70lyro9Jgp9DrWW0pwQ2ITGSmJytSp+YRbFDoWNxUQmts4oX
	trLnTAAVvp5hijUR6EjWDIfyCSbeEZrqujZR/oUAl8FjLLcRpXjzJB2HUNKHDw==
X-Gm-Gg: AZuq6aIj6GtgGHBwCy2+sFxkrmY8ypKSY5xlOHc0M3YWeklRnmtMx+Dn4qJBmXndl8o
	AyE+DuOeXK/IsWGd6q8vdfOsFQdpslMY7eHL20i8x/pP1342t4c9Gz+IR/eT1ZVcoEiSDtT92wA
	de2K90zegSX2DOCe52kjn4AwaE0DpQHV4UgIdZ0VLZ3iCTATtdQL0R5CSy/AXskt2IlDCUx6TFc
	ShC+yYyjANMBRdcb6u61BchMPGBCd4zwAlQjPwYmEicQ/9xBMpN3BGrnHMLyx5RRjfTtJ/pqF6I
	HSS/U3yTwWNqZJZ4+QCwofGdqa4VNPHyz48u56hDwjMMeya8/QSJakXSGgqioX9tP9CgGD8jqmi
	EnUTkHoV6SZBuF6OluroGViZZUsbjWFNPJLgkF0AYZgP5+YoTSOa1oVopcBQgfEqJpkRlztdE9K
	hz+n0bXmdqlzPJcvxVWLZYzar1t66rYnCWIh9shA76UgmSAxb2kNYdB2PH7Og8e1iPWXvkFfJHZ
	NofwJ7A3A==
X-Received: by 2002:a05:6a00:770f:b0:823:b6b:4850 with SMTP id d2e1a72fcca58-824416f8d24mr11637215b3a.44.1770701888061;
        Mon, 09 Feb 2026 21:38:08 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:07 -0800 (PST)
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
Subject: [PATCH V5 0/3] Rust support for powerpc
Date: Tue, 10 Feb 2026 11:07:53 +0530
Message-ID: <20260210053756.2088302-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16761-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6D545117A15
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
V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com/ 

V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

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
 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  9 +++++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 10 +++++++++-
 5 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.53.0


