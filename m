Return-Path: <linuxppc-dev+bounces-16733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z/ktMBu9iWneBQUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 11:55:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD810E655
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 11:55:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8hRn3Y8nz2ydq;
	Mon, 09 Feb 2026 21:55:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770634517;
	cv=none; b=FhndHNXhfub2y5PlBjXmsGo5vGAK04F4WyW3IQJbGKlDf5oB8M7qOJGXx2qSYS+8UaKdjc8grbLGP80j9XnCyl/oTHurnn57tvN4sca8TFyj22FqlyD+8bSf+OTZqmsH205LFIbZWaKoK++QxHbrxQ7ZYpNJyQer+6X8FdRQw/TqrVv/AJhjpJiJfC3YWxSj7rcPAcmIC6t4oNfQujcju2Ojg5lmWhxXdR6bUrmndPBXQcm0h9m60XmT9JIX6SEzbjbN1Lfmdj7lMFRzOPTfL+cxqZ+93jrSBOPIfQrfQi2AYWC7F2Sn3FjCvXibXOMDnou/EvM/j5jd2icr4zZJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770634517; c=relaxed/relaxed;
	bh=aNqlTbhyZ28IS/AUv7WMI6I0SLBfjfBNRSCAUq4S/FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g5ztPbmj52VksxzK4HEt6L79yLFkFrYNbyrF33FvIZMRbgsClgjBrMxu4l4RiPnTZRWQwjCavQFqdwDNBGgVGedhcDMU3yMtNjfdgm7YDkqqfOgbIQrXPeaho2qQ8AH62zc9Pf06bjjXzt8KPFVlyTZBcvQdvswe3z1sCvjLt1IxOI2Akd4iWsugjpn6OK6u4hpuglg0zSSUCYNX8uQkY0+J0ANyHi7B8mbszldnORHnbk5hd+6LBufT5Tu8JvCkRWzrmT8jtM2wzWZe+Xvs82/eOaZYK+QbJsd/i20AsR6EeO4D0X8tzYiTUlLWVNiD4dF+Kf/W40QM7Qe8N/9rvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jQ7vgmuh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jQ7vgmuh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8hRm0Njbz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 21:55:15 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c551edc745eso1624099a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 02:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634508; x=1771239308; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNqlTbhyZ28IS/AUv7WMI6I0SLBfjfBNRSCAUq4S/FA=;
        b=jQ7vgmuhWcP/Op0NTs+8agc421fFIhVWsjt7jYVxLt7A400eOH6NM18WtaQaw53Vpy
         nQAKfRwNvqVayD4cq5LLMzqhjSVxLoZH3+0QRuojSKokxoIkZy7+Ww5LTlusyfMR8wKi
         cLrYf/cUuTef4/aZ2ypfnys82ual3zL0gTUfIfImWGPQo8a6B/gvfkDuC1J8D/mWVkxV
         gLn0G5jC5VVtIm6KXuio3W6fMZ4M5Ay5/QeLFZStHJAWYzizG9ynXyn0KF7IKpv96iDa
         XAIcZizgCE7c6T4n9Ja0mHsBDfXBN80xvRCsbMqkDBH3LyrZmdUCIP8TGf/+Ug8PCdmP
         D+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634508; x=1771239308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNqlTbhyZ28IS/AUv7WMI6I0SLBfjfBNRSCAUq4S/FA=;
        b=bdDbQ8JcUfE+QyuK6WKc9BaGTCJOayWPwbwU4z1P9XqUswInH6YEk1tqCZGVQhcLwr
         ohEi/SasxiEKbAU5OaS2Rd0VNJt09cA4gf4AN6+sM1JW6j2atqd5Hp5hBH0BVwC8PEvf
         nxqk3Mc0dXmB/vU8rKSc4iNqvelKxKiJDfUikwx3Nv2qWaVI7Twivfss3ZX4oWVZggGL
         xsKsLXnkcnNLCNJkB/MwgIgo3CcsX4UhNrO9BAK8I+ev9x9rJFJzrMR7YrkuHivKEkoy
         2adw/XIJoOKyttsoj7YhcGqvcyQuENPnsUeXxZZsyNdg4texnUUcpPjCFx/fwYBMrppZ
         5CZw==
X-Forwarded-Encrypted: i=1; AJvYcCUfTr+2BLqIAlkFTxEmmU4+IHhNQTOwZneHg2Lai6ANu6VKy9S9NmZX0pM7KMlBuM6J29pMFyLgt8lJJA4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+t39XnMx5NDnsGv7kSWtwVQ/D1RwivJsqLcEpj6Z4pZ5BmLu7
	hFgkB5erYp0mvIRXkRdoHPb+PMPLFFTcZn7WYtCXYsTXUaH/hR2FzxkR
X-Gm-Gg: AZuq6aKcfW1HDkmA3yVQY6c4as9gklNFDUz35yXiwhPUA3apc7sET/jVKeyA0jPHg2G
	X+v/zPZZKSpmh0JwQ50xVS+KC3mNJa8IAV/gWfuQdhcr8xEfnOT+k5PvtWY+06E4fTl8DpYQyfa
	fKaw5McPuUDaGurExD1IXX2Bmz913uH9M9kphnvXIGsJ4dV6Z90m/+xIIs85cB0g9umf+FTDPL8
	1atdWP3GSLVL2TUrAv7JwfN951KVe8/KaVVjQWRlRjDRvcJAq/NLSjTMKRA5LWfpqYJmKduO4T3
	ZxAA/o2d0wSxALy8+Hz4mDmPMVa5HUCaGQmx6TUvTBflE/Bki7WkVwVCa46y0ZEG0vMb/yCV/0O
	lfXE17SXsZPNnn2pLYo69N/OMW6oN9nCNEaHC+LrYanzELJ7oUWzaC6HomlqT7UWVG4CGrPLdmq
	mAYqlO6o+i9u5HvdqfyrggO9kOhkErzTNi7nPF4FGrzbEsgY2Q/CzQOQmmjLg=
X-Received: by 2002:a17:903:3c68:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2a9516d5821mr101672885ad.29.1770634507668;
        Mon, 09 Feb 2026 02:55:07 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:07 -0800 (PST)
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
Subject: [PATCH V4 0/3] Rust support for powerpc
Date: Mon,  9 Feb 2026 16:24:53 +0530
Message-ID: <20260209105456.1551677-1-mkchauras@gmail.com>
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
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16733-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 30CD810E655
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
 rust/Makefile                         | 12 +++++++++++-
 5 files changed, 36 insertions(+), 11 deletions(-)

-- 
2.53.0


