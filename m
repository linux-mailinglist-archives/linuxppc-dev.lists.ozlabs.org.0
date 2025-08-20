Return-Path: <linuxppc-dev+bounces-11168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD59B2E790
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 23:35:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6frp6lmtz300M;
	Thu, 21 Aug 2025 07:35:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755723533;
	cv=none; b=CM5WLNMr1V2fmiNLpUq482pM/J9M69vgPiU0H+AGsWkdtD6pMdTWdaIVNHBswPtGt4gfARHgzaXH354TQTboWVFW3FJ0jL7NAEho52Y/clQmlutO+oFC9y5E5RbuyM0YEHbZUZZv8lhvXcGNA6eFezgpBs6aEgnhE6yOI3ELdNlinYxMbCb6pktwEwwE0ifO2kQiGu6LCY4Mz0OSrAM11cJvXMQunHVjBRe3uileyQ2MnMosHZuNMYnKw8d1ac2J6LSBkJ+6QPqAf5no/nFV42oAEZiaOiPeJ0HBOMyp7BVL76Glk637II5y7z5sZX1YSUdafY79od26KdupHKbrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755723533; c=relaxed/relaxed;
	bh=t6Edp73bQQiSNyixqQ0B5YIyV1/7MLtaSk5DDgGwemI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WYfoMUM3UOTx3o7E3I0Rh/qEkJbH78lLUCe4+CKLVT/qpCEtFXDmHRXhozODkH7uVaFbhJpu6kN433N8OUBe5LW+KHKHI3JKHJniJCQ7nbhz87t+zPjqNRN2hCla+jgsYIZAEVsu1bkvk5SDnDMFRptcecLJGxRBdqgXRyr1wQ1hNL4WGm7wyWq+7lc0T8m0oGNzUPS96oqFXqyOKl/hLU4jC/9285CK23F4Vo1MhItK1LpWS2M1R8u/PKuvtZvE9U2Q993Ljyk1/v+XdTngSPTIuHYN6eUZ6CJngHnyqGwSUm/yiNXB/j9/19V96+gPgUxlrEzihi65qyrfoFLLqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mxpgfk/m; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=smokthar925@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mxpgfk/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=smokthar925@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6f234rTGz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 06:58:50 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3bea24519c0so665940f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 13:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755723526; x=1756328326; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6Edp73bQQiSNyixqQ0B5YIyV1/7MLtaSk5DDgGwemI=;
        b=mxpgfk/mx2y/adSc/UuEC4o4GmGeFTCaE+WTvhB9Wc4M503sHwOq9n6LQn1e4bJGXJ
         2CRBbtEWlB+o+szl3KKaKXw2K5y5WMdJHwdrsa2n2L0smb2hyFkPxkJdH6XxmJM7dh+h
         R9kdt8gs5BudFawD+BQhdTk/Wq12CRMISC5GTVYNQhAYnsc0Ypt7iNO80YomJXK5u92l
         BZvSD+UVCP2vxnLY3RcgX590QOjTr565BAx+Q94LqfAEMOF8AWKeoicbEK9lBdZeDuW5
         rZE2jdXmU7Ce4cg2WKbfn08ouV6jBN45kqkD76cxTnRMiz4ry8IFQ/4W8Du2fD64m7Dl
         Ydcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755723526; x=1756328326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6Edp73bQQiSNyixqQ0B5YIyV1/7MLtaSk5DDgGwemI=;
        b=vPE6wE/lgnZcQxdRlsY4bRNK/sDhuyDOd3SorEFTse7u0udlP7a+kKERyTjhAZg0YC
         EEl9p2jrZxjqDRymQOcyK3nnKtCHbinpy8aEwXQMhBsG96TRsru3NIp3MLiYbYWBA5UP
         AUZqox6zmU/g6p2xhqdM0lGPD2mHrz8gC86x1CBAJWqa/4S7gLlKtrPkSijsMZtd5cUg
         hu95A+usrSmPj+95enVdeLsGxy8Ug550HRPrd1BXNuxGTrjdGFKHO2Fh+GZZh4DgFwUD
         XWtE+JD24Z4f9kSQJEX7E/QaKd0ltByUWWvfgD07FSMq+GnDQp2YDH2IH7yzswtLH/zt
         iLnw==
X-Forwarded-Encrypted: i=1; AJvYcCVWWZ9JN0knAr75Ou77EsGF7W+fRXaBbKCAzfIXVhDxke3K71uIw4YAuDBb9qQ8CC8osjfAW+rdac6TAWc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yym2GYiTJjSVAhxgL1roKkkNVENF+sm8B1qY1AwF0lY4xQFu42v
	u/bOOCgo5F473ZWwhZOo0Z0ZYqtTI22bfXmTOv+Hq6D9j4n0TS9oEfYx
X-Gm-Gg: ASbGncu4z+xSUdyfpJvTUp9rmNf+14SVTT2ydL2qs5VWz283H/22Sg7a57HFyfPcTmE
	u4yMkZmcErALN9KBwwU57BJuz/3GhxXjWmpTaN9nsyeJ6OvRL4UaxFrFwXxJ4wG1RTt+XCP6xSQ
	cM6F0hN43cBHfPsP+55bYz2yV0uXBrzU45nffXAXqLdA87v47RTcT4elZpCRMtD5GQSH19ip7cm
	/HZzpJIL2wDbnHBLy/9tyTM8DUjzQMbtyNfVT4ZzhiNfNH8ZWEOLDLVKM+dOOD551lpOctm1y6w
	g2KSK6tAZYVDOE+f546SuH1QL2NbQCCOH2zTCIbIvrjoxB5heV6tgApicqcDMUcSJH91gLj+HrM
	2aqUwe15w5zPdk2Pr+HNlMBzJkSXnN+RF
X-Google-Smtp-Source: AGHT+IEEMvxpVzbgukpXq+PGYJJ5lV3rWBOBws9imBFzkyPoncfpZFKpE3Fffh0jmdp7St/8AngReQ==
X-Received: by 2002:a05:6000:2411:b0:3c4:516:bf62 with SMTP id ffacd0b85a97d-3c45e6322cdmr653237f8f.6.1755723525705;
        Wed, 20 Aug 2025 13:58:45 -0700 (PDT)
Received: from moktar-desktop.. ([102.31.181.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4976bc73sm45779575e9.6.2025.08.20.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:58:45 -0700 (PDT)
From: Moktar SELLAMI <smokthar925@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Moktar SELLAMI <smokthar925@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH] selftests/powerpc/pmu/tm: fix typos in tm-trap
Date: Wed, 20 Aug 2025 21:58:16 +0100
Message-Id: <20250820205816.23146-1-smokthar925@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix spelling mistakes:
tmp_trap.c:94 te -> the
tmp_trap.c:96 tread -> treated

reported by: codespell

Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>
---
 tools/testing/selftests/powerpc/tm/tm-trap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-trap.c b/tools/testing/selftests/powerpc/tm/tm-trap.c
index 97cb74768e30..298bd09c55bb 100644
--- a/tools/testing/selftests/powerpc/tm/tm-trap.c
+++ b/tools/testing/selftests/powerpc/tm/tm-trap.c
@@ -91,9 +91,9 @@ void trap_signal_handler(int signo, siginfo_t *si, void *uc)
 			 * LE endianness does in effect nothing, instruction (2)
 			 * is then executed again as 'trap', generating a second
 			 * trap event (note that in that case 'trap' is caught
-			 * not in transacional mode). On te other hand, if after
+			 * not in transacional mode). On the other hand, if after
 			 * the return from the signal handler the endianness in-
-			 * advertently flipped, instruction (1) is tread as a
+			 * advertently flipped, instruction (1) is treated as a
 			 * branch instruction, i.e. b .+8, hence instruction (3)
 			 * and (4) are executed (tbegin.; trap;) and we get sim-
 			 * ilaly on the trap signal handler, but now in TM mode.
-- 
2.34.1


