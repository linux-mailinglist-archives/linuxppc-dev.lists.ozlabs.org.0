Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5589639AA5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpS64sDcz3f8f
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BQP4sppK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BQP4sppK;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpN70WY9z30F7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:49:58 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id a9so4608690pfr.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kopJVXpPl5hMllWOYROF1Y+LvaD1GOcWxcWvOEKsr1A=;
        b=BQP4sppKR8nSWF55rs2f4V4m6fNd/mVuLHVxX/hF2siOO6d7WK+FrHtNAkW9etii9L
         1Ihfio8tR7VD/x9wayb5mP/W+UzDSTCcbjfR2KiM2ra8MLu4OzWCYp1vUp/fiq2Sp+Ql
         P9t2nw6Le2A0o/JxlLCZ5kr5aBj4MU0wtrGfIHFwPlp/1nne3zaFCUVBOkrGP/81KJsM
         /TyVUqbYLcbt2Px9S68NciZ2d9CidZB8mLAggH3QD9nVjlszSioApXeMoD+dA36EO6PQ
         1nWg3Jqr4azQzzNkYMFikE19v7ZWMp4S2TtYfHT7ttZwU9OPMrR/26U/dV+kl7LgPo3V
         KbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kopJVXpPl5hMllWOYROF1Y+LvaD1GOcWxcWvOEKsr1A=;
        b=xiY6KTvTPJDCppivDn6EJjn86NKsDwHfAitfs1+8eKvrfNz4F+CvV0SQg2dmATXISV
         6YW5v+4rsFQ2CCOYedal/7VjBQYDiIoDqGyUrrkKtL+aGGJkdRqAC7j8QXxrEgMbc8mc
         vhuzx5dIFmca5l5H7sDCAR5ygKO0NrN7jANvc0hAkkSOKgP131/HS3OXlGdAkUVItJpY
         0r8oMp+/7ZmIHfveuP9UU27Y3ghkwWLDguo6LbPvW5WK+pNcO7Um4rPk9Z/1zyGAJbzf
         NHwKql79Et2ws9boSPLosly0onY1IBvKaiiK/yDcayj+Du6qUUafBAvx8DQjm9RvyMXq
         xTkw==
X-Gm-Message-State: ANoB5pn2WBB4gjsmAw5sW6pPA7uFuMGHC1rZLW5wz0oNzJ+INXcJZxud
	KjJgmLCCsF90k6+7QpBHozvMBkK0CbMMFA==
X-Google-Smtp-Source: AA0mqf4gsw6KP9Tbko+uN3sT6EPPQp+cY3MtGo1elpaF4oKJZzhFm3oN+6CU7/G+GqlxjhWSQJUKdQ==
X-Received: by 2002:a63:e008:0:b0:46f:5979:8889 with SMTP id e8-20020a63e008000000b0046f59798889mr23785779pgh.119.1669553396453;
        Sun, 27 Nov 2022 04:49:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:49:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/17] powerpc/perf: callchain validate kernel stack pointer bounds
Date: Sun, 27 Nov 2022 22:49:28 +1000
Message-Id: <20221127124942.1665522-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The interrupt frame detection and loads from the hypothetical pt_regs
are not bounds-checked. The next-frame validation only bounds-checks
STACK_FRAME_OVERHEAD, which does not include the pt_regs. Add another
test for this.

The user could set r1 to be equal to the address matching the first
interrupt frame - STACK_INT_FRAME_SIZE, which is in the previous page
due to the kernel redzone, and induce the kernel to load the marker from
there. Possibly this could cause a crash at least. If the user could
induce the previous page to contain a valid marker, then it might be
able to direct perf to read specific memory addresses in a way that
could be transmitted back to the user in the perf data.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Not sure if my attack scenario is actually valid, but I think there is
some concern here...

Thanks,
Nick

 arch/powerpc/perf/callchain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 082f6d0308a4..8718289c051d 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -61,6 +61,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 		next_sp = fp[0];
 
 		if (next_sp == sp + STACK_INT_FRAME_SIZE &&
+		    validate_sp(sp, current, STACK_INT_FRAME_SIZE) &&
 		    fp[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
 			/*
 			 * This looks like an interrupt frame for an
-- 
2.37.2

