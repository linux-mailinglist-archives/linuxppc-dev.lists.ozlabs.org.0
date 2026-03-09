Return-Path: <linuxppc-dev+bounces-17920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AlYBiEOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:14:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BF23E6B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:14:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4t437Ybz3c9r;
	Tue, 10 Mar 2026 05:14:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080092;
	cv=none; b=SHst4CjwepTAwHsWmHq78lwzpJrLdP4TJ7zrijgdTp9N+5S8J1RjzAORT9XX2YHReOCjkGnll0+7dGiefbjt03p32taU4R/f5RTYimDTk2q1beloAjaRK+NfxWGHIrZIJ/wHhdMog05cmcTG++gzLE0HFKr303hhfvUpqG4LzSzSE4T4F5iFS61/3Lme3ALzxR+Xo1NavthNRqrrfiM+NRiRdCn/wMHnoeNUZGFV9XcU1RDWL6Rudo7Ese5vkLgPnnifWYkmYOwAB1XdozmUi/76igG1btQxlxZo0QtB97zZ+oP5wcXe8lh9gENUO8krn7SIFxAa+6WR0FXb2S78fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080092; c=relaxed/relaxed;
	bh=mJDyEUxbg+fSEFo76EUWknUv0hQh2A+TgKh6QQ9jqgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgEnVmmGBZT7wL1JlbljlTguysIwKJBG1hWTH7tlWoqmBG+N/eY3uzcDTQnKFDNyk2sExYIG4RANiVCIEwGozwZt9iQCvUh+QccYabx1De6Th3mElr8Pi9Su9+C84q1Mk0DslFIJDnJL5qmpnSd0tkUpALPYDqYexJrY3KyB/umzWbdK7GMUEBTiPyzmiOHNYsZ8BPSX4cOMlhbuxwZz/khEw+XJLbKuFFi5Ca/T+BewXJbsRZC2W4qVmyptgNMi48/1ZS9haysy31lCDRdr1UMXMBvVRgZsOopovAOGfnct8Jnw+3a16IhOkMZLDZq90zHzKyp9FexHKZ/vC4xhWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YNiMVZUN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YNiMVZUN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4t26XYvz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:14:50 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c2af7d09533so7640689a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080086; x=1773684886; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJDyEUxbg+fSEFo76EUWknUv0hQh2A+TgKh6QQ9jqgo=;
        b=YNiMVZUNV8Xxn71vJmx2DcwhZPtfPiXDWgcowsxxhbaUnK2V9SjE1mJPm1+IJ3DPoe
         aAHB+Tk1wsaQDdzN0nB2fQh2hFilZ5gE4RYLqkeVsJ5+YDzYFmhLrM859z8pk7c4SGzJ
         bhz6+bNFQpt0R+pIfT1s0tz0h+YG/KcLax8FTWGc5l8RTwx2m3WBytwrZybfGvpQF+Oo
         iWE38O3QzqqeNHxaMeg/bwkli1lgkk097l+OZRuY27AZPFLJ7c4za9WFE8vL3r7SI6dY
         NIUbR6fQBI0uHmSt7zhPDAtM7u3aDmok0ORuQoHGLNQ3WbIE+H4+iSTopPxyMMBf0WIV
         KlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080086; x=1773684886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJDyEUxbg+fSEFo76EUWknUv0hQh2A+TgKh6QQ9jqgo=;
        b=DEBfswVE1gAbIf0sGwYD7bD1pS3/zefyUFqUxmdJImoKP3oLRSY1wjW0fJTH5XlF5f
         NQTLVcXSQ6s0COVqWeGywV5mfcudM223fEZG72AeniGuLzrXzdiHRa3hdrdNtp79xtYV
         xTXsRbhAns2r+60qBYPGC8sYgRB9CuLBH3VZyegMIElX1J7SkCd20p+AbMZDffER8QLK
         w8Auf5gY1uo/GjmGyUjC8eIkq4eUT3OBjZqcym1dHwK4Y5sKVzxMSzDxHpOmi5aR2MoR
         JvpemMIM71dAB9tAdOaSNmGkPsE8QORCXsWARIUMNRpsPplz/+UJ1MFAamCFW79Io/4p
         2iCg==
X-Gm-Message-State: AOJu0YxySNyuENjNeTf5vEQLmeLNKTcVXlVKfxUyBiDLnMC865QMv690
	Skna7c/bmDkjkbrKq7Fl/TESISumnoE+iOQVqq8IhkTfSLELNVQQzuE53C7L6mhV
X-Gm-Gg: ATEYQzzGds2XzyWp/sGRG9YbHFg6N/54vJw09UzxrbUScaeMJsuCgWN5zBdn50Mj2N/
	EirYr/o3qCAkUarSfohBI6Pzxjeu4pauGezffUwGkk75W9KbfErpJ8mvltYdv7GSt/ElC3vH0fu
	BoCGQ2H7IjJUz7iXz7T2UxqQMjb2CT3Ppe8GGR7I5YyaAZH1AOSecTDvmphIiFPENFJhNszb5OZ
	xoC2Sz5qOEyBoDxV0UApiNscp/+JxQN4A4w9JDJxNylLtEB/QOvcuZKfQDyQ88DS8fjItjMhB0W
	Cnsns/tJpw+HVepT9JiFx+y1RlMZXeW0ne8uuAgscwKB5fmAtXdAqDs0bWI/vj/Jk7HH+8P37wo
	BlZH5t4oHm0TsmDlIu3TxyZ3sjYuIJy2s1k6sbMu5cCNpucp/+7lssf+QTl83XFRdwfOTsVgs/U
	4ea0Oo2hl2BLX2OO7oNxzWjs+GDbR/Sdm6utNo5HFx/IYDAb84xm0Lwx0SDkYyX9Dr
X-Received: by 2002:a05:6a21:7e0e:b0:398:7019:1cd6 with SMTP id adf61e73a8af0-39870191db1mr7031143637.36.1773080086227;
        Mon, 09 Mar 2026 11:14:46 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.14.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:14:45 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 00/10] Misc powerpc selftests kernel fixes and cleanups
Date: Mon,  9 Mar 2026 23:44:23 +0530
Message-ID: <cover.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
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
X-Rspamd-Queue-Id: 496BF23E6B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17920-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

v1->v2:

- dropped debug_vm_pgtable patch which adds a testcase to simulate the
  failure scenario. Since it belongs to linux-mm, I will send that out
  separately.
- Modified Patch-2 in this series to also cover PMD device migration
  entry (in addition to PMD THP migration entry). Hence dropped the
  previous RB tag.
- Added a new Patch-3 to fix another selftests WARNING.
- Fixed commit subject of Patch-10.
- Changed subject pre-fix of few patches to be consistent with others
  (powerpc/64s) 
- Added RB tags

This patch series addresses selftests issues w.r.t warnings or
VM_BUG_ONs seen mainly on book3s64 powerpc kernel. This also carries
cleanups and refactoring changes which I identified while reviewing
other's patches and/or during code walkthrough.

Suggestions and feedback are welcome!

Ritesh Harjani (IBM) (10):
  powerpc/pgtable-frag: Fix bad page state in pte_frag_destroy
  powerpc/64s: Fix unmap race with PMD migration entries
  powerpc/64s: Fix _HPAGE_CHG_MASK to include _PAGE_SPECIAL bit
  powerpc/64s/tlbflush-radix: Remove unused radix__flush_tlb_pwc()
  powerpc/64s: Move serialize_against_pte_lookup() to hash_pgtable.c
  powerpc/64s: Kill the unused argument of exit_lazy_flush_tlb
  powerpc/64s: Rename tlbie_va_lpid to tlbie_va_pid_lpid
  powerpc/64s: Rename tlbie_lpid_va to tlbie_va_lpid
  powerpc/64s: Make use of H_RPTI_TYPE_ALL macro
  powerpc: Print MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS at startup

 arch/powerpc/include/asm/book3s/64/pgtable.h  | 20 +++++-
 .../include/asm/book3s/64/tlbflush-radix.h    |  1 -
 arch/powerpc/kernel/setup-common.c            |  4 ++
 arch/powerpc/mm/book3s64/hash_pgtable.c       | 21 +++++++
 arch/powerpc/mm/book3s64/internal.h           |  2 -
 arch/powerpc/mm/book3s64/pgtable.c            | 40 +++---------
 arch/powerpc/mm/book3s64/radix_tlb.c          | 61 ++++++++-----------
 arch/powerpc/mm/pgtable-frag.c                |  1 +
 8 files changed, 79 insertions(+), 71 deletions(-)

-- 
2.50.1 (Apple Git-155)


