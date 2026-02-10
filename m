Return-Path: <linuxppc-dev+bounces-16766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKvgBr/zimn2OwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:00:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56A118754
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9Fs21tKRz30M0;
	Tue, 10 Feb 2026 20:00:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770714038;
	cv=none; b=azk5KPIdqq+MfIgdTh0xOFDnsF+DdhTyddu74v0k33e1lKG3m6uj+pCve8VoPrNdrXwTOgS8fWqP25ZPHO2uoiTM/dUyA/nevfWeEWnR1hiyQ011Az0FJyZ4mKTBJayIVeM1Od61HvyioWrVlPfZ8vlZl4vs1FI7JdGaa6lpMvXF6gvUFa7Dt+fD7P5/sw4aJAMo0ra9WxGFfF25Kh7kxMeSRsLFuoIp3U91Ls6OyGerBO9IvL2rL015smFw7bWXcGBCndbUpcY3i+ARCwZyjTnOLlXdRd+IvRtNOZNpdsjnSEi7pEMHaBa5I3RGWUrhPAZxojrP77IypzbWsEb5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770714038; c=relaxed/relaxed;
	bh=n+z8sIhK3ezw4HrshgmYtJdGACxW3bN8LLVtULfSwKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PPXBT9MSQUjQW7maIWDLl4+23ba4f51ZTUl4IcGTOvKbKH89e3SSB/BzRbzosWmK33SpHdyLTiO/Ynkd6Q9k1xUQzo18QdO7aAngJP3s/v9ZeWYZyMfD9p1tUUNMqDtTmTiz5ASas/Fz2ksNeEvJguBhhZHLwLEMEByT8gs+0GfIx+HpKqfErYl+S4uYgXd4XXu9HFBv6flkt94ZVEr6+vZqB+Eq7i0rQB/3DTIIO/RY0U1U+cVNnTBU+9OV8+lKtpmlolkoLv6PodLjZqXDVuutMG8RLvQCNC9XV7A1FLxKVmE2o7impSHuX0BA7HY/DvyXLmA25FeS7g6hI4jeZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LqYIyuDs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LqYIyuDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9Fs11nZyz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 20:00:36 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a929245b6aso34142925ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714035; x=1771318835; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+z8sIhK3ezw4HrshgmYtJdGACxW3bN8LLVtULfSwKk=;
        b=LqYIyuDs9UPk788eRwz0VkAqCX+Mwc9TW8QDXT2V25XZZT4AgHNcmYf9ynxYn7zLY9
         zPhuPaEP8anuw3+P6psVLkRqU5Mkp3ZtMavFZhyVNC8mHUfiheB4afWXwz6EMzFtLBin
         XFPi2GHeePoCiVeBoYFjFCiX9yqp9SNWJRh78jrz2SVkeN+oYoMoGuQeSnHR3uZr+1qa
         GHNoduCAncAyxuzDhBDHNtHY0rb4Nq7z8WYzGCH2RiyLLZU7XizLCn1NpTmsHlR6dtG5
         +bk1w2x6A4ZmCeLb+MKgYMYzpkHayC1DAyInMjkKxNoZYxZgTMSu7ApZ7baAs33wFoe1
         d8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714035; x=1771318835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+z8sIhK3ezw4HrshgmYtJdGACxW3bN8LLVtULfSwKk=;
        b=QooimQOO9CEy4s7aVxiWCw2J8+GUCHe39B/yT6KiQv4nAfz3kOY9cNcIcONmSFzhxi
         +r9abLiXCKzQpP7DFTqPFPtDCa/oHXlzWpybigIqKM8RRw+GuqMRcqsMNOG1Cu+qE7uu
         BLYn3OqKd121tZo7dvd2TSyqvQ4VE9pAI9nmDCish68kXUSfY9ivY1PDrXX1xyzDnnYj
         9YGRGzR5qAgS0s5NCIHIxUphubKRR15U3NVWHE6EPOS0qf0IuVFRkOFquuRq6ZDE04a2
         R7ospy7tN08B7kik04t9+Ni4xEeozJCT1PzfNoPHL3aF4QFPcIB190NdgVa2t5Xh6zMo
         BzNA==
X-Forwarded-Encrypted: i=1; AJvYcCVcufKb0fZMiWLDHMeWBTyAXgqR5Uj8PrKgFe/C/7KC4vNPUHgSkH0ErTCkBUIXloBun4FGfZed6twrLKg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJ1EVeHWXJCfExouAd+KgnMyFF9IVV1zHuuAZXgbRlaTqNIKcz
	ve6ZdhjKENeoJJpBNSfoizxzUik1V3fQHefNB7CD2VuvBH146d4KPzOp
X-Gm-Gg: AZuq6aJEPbRZ6GNRL3HaLXYnBCWxjEiG1nY4mGnHcRLDHBClR+KF9w0wkFiBVDNVUC1
	+U0E2s6SanUDkKThR98IzvPY8lU+lULv5g9SrtRqW2iMiUf3RhtMx3j9lgLBE7FgdAZA+gK/EsX
	GXLzQ0THt/shiZIegafwJztK+K4ZXXQQpF0y+KQppVn3c6fvUo8IZV8//ec1CbAp8OeDJGX3p9K
	Fb7Z8islqSCI1FCFsQvqX40Xc7KD/hrdzXH/Ti0Bp8zZtBDamve0lqZoXVcr10yxuNzK3onkeze
	uZ0vP14bStDOiOwSEM5NG6IgnhHROB7SrNg6qYDK4EsG4YyRAC7GPm+c8OQ1pUp+EIxo9Ic6oZg
	CjEzK6FMe8U1qXbjIEG5hizVfTPj3DWRYKpn22izCK+DrhkmLNcmFWDgW+XysVL5S1Ryee1xC7o
	4HWlP3MksQ81/9JmIqSCiKXpu9rlzd0Gnqgi6ZsyHwy/Q5Yu9sxVqQxTWNUy8WxqC0LiRMm2M=
X-Received: by 2002:a17:902:e94e:b0:2aa:ecec:a447 with SMTP id d9443c01a7336-2aaececa5ffmr69096715ad.36.1770714034700;
        Tue, 10 Feb 2026 01:00:34 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:34 -0800 (PST)
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
Subject: [PATCH V6 0/3] Rust support for powerpc
Date: Tue, 10 Feb 2026 14:30:19 +0530
Message-ID: <20260210090023.2587534-1-mkchauras@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-16766-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 8F56A118754
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
V5 -> V6:
- Added a missing Tested by from Venkat which got missed since V3
- Support is marked as Maintained instead of experimental
V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com

V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com

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
 arch/powerpc/Makefile                 |  7 +++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 10 +++++++++-
 5 files changed, 32 insertions(+), 11 deletions(-)

-- 
2.53.0


