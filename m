Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D336A7C92C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 06:23:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KafOiL9C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6qxs5V10z3vXv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 15:23:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KafOiL9C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Z3J1vS1z3bZ1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 04:57:30 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c9d132d92cso6324905ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697219845; x=1697824645; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fonQwXfCN69NQb+A4dqVyCysjcLISiFg18CBwAvV4OA=;
        b=KafOiL9CjLgeiUkCQW8uguPEA5K02iVh3FtxuM0Q8YmNIKsEc4Nm6jmr7NeYQrXptK
         1JIZdf+QXr8NnylDTGzvznSjFKj7igMumbQOnDs+6ZXKukMgJzOZC2KnYBDbNzvmppQs
         ZYa/z8TGA3yvbUKhT956uQ/Qyxxs7MwEsLtLTAojQgNpwwfHOhVmkxm56JPfKq45yS50
         Dbx1iLADIPdgzqiREv/FtHFSYmO/ITuIQj0LzRDiCvK4SYBM+C3zIqmSy4x8Mvm1TK9y
         y5wf2rtklbleoydPd4Yy/mZ8QjhcDX7Ak6Wc09zW3zqPwSPw6hrCKCw85Cb36D7WXnQh
         iiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697219845; x=1697824645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fonQwXfCN69NQb+A4dqVyCysjcLISiFg18CBwAvV4OA=;
        b=c2xrXVFt4UmcXb/80LZVOEK5sNarBNwVh7daBIRFJ4mWOhepKUr77R2niT8/yL9SCy
         aNJScgVxFQN8Z5zM+kmZu/AbkZH+B0+R1yX52SzEc64UEMEYngG2PAI0LVBpuYgk/++D
         EkBvoy4NHF8x3Uy4nG3kfcFtkvMJGA1PoVRYRTBkmnjOiqlEVayr3Q1nqA4G1NdR3T59
         JJMF2SjK/BpvUhK7yFGKeA6IcyKa8WusIAGigVnODuqDdFW1IznBzXliTLfd+ocCNu0s
         HlcPhDrfFOcMmgkt/Exl5TYPobQfXAuvoc5+6kKm4DXWWmYJb3xwCA/spahb+MHKWLA/
         l3Xw==
X-Gm-Message-State: AOJu0Yw/UgzmH1bgQ5E4nPGndOwq9J3sFmGqzhDZBtrLyAb4f2ImcG7u
	qYLj2mHHmkEUFBbWxP18chg=
X-Google-Smtp-Source: AGHT+IFhoOHVOaGD9kq5X81RwxEZLP3PqLvj1FxrxbU49r5DYy2eSGLjob+eRv+TUFObOX1sv5UuTA==
X-Received: by 2002:a17:902:f686:b0:1c7:5581:f9c with SMTP id l6-20020a170902f68600b001c755810f9cmr29945485plg.0.1697219845416;
        Fri, 13 Oct 2023 10:57:25 -0700 (PDT)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001c63429fa89sm4232472pln.247.2023.10.13.10.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:57:24 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Optimize find_alternatives_list() using binary search
Date: Sat, 14 Oct 2023 01:57:14 +0800
Message-Id: <20231013175714.2142775-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Oct 2023 15:23:03 +1100
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
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch improves the performance of event alternative lookup by
replacing the previous linear search with a more efficient binary
search. This change reduces the time complexity for the search process
from O(n) to O(log(n)). A pre-sorted table of event values and their
corresponding indices has been introduced to expedite the search
process.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/powerpc/perf/power6-pmu.c | 43 ++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
index 5729b6e059de..b6030ea130eb 100644
--- a/arch/powerpc/perf/power6-pmu.c
+++ b/arch/powerpc/perf/power6-pmu.c
@@ -335,25 +335,34 @@ static const unsigned int event_alternatives[][MAX_ALT] = {
 	{ 0x3000fe, 0x400056 },			/* PM_DATA_FROM_L3MISS */
 };
 
-/*
- * This could be made more efficient with a binary search on
- * a presorted list, if necessary
- */
 static int find_alternatives_list(u64 event)
 {
-	int i, j;
-	unsigned int alt;
-
-	for (i = 0; i < ARRAY_SIZE(event_alternatives); ++i) {
-		if (event < event_alternatives[i][0])
-			return -1;
-		for (j = 0; j < MAX_ALT; ++j) {
-			alt = event_alternatives[i][j];
-			if (!alt || event < alt)
-				break;
-			if (event == alt)
-				return i;
-		}
+	const unsigned int presort_event_table[] = {
+		0x0130e8, 0x080080, 0x080088, 0x10000a, 0x10000b, 0x10000d, 0x10000e,
+		0x100010, 0x10001a, 0x100026, 0x100054, 0x100056, 0x1000f0, 0x1000f8,
+		0x1000fc, 0x200008, 0x20000e, 0x200010, 0x200012, 0x200054, 0x2000f0,
+		0x2000f2, 0x2000f4, 0x2000f5, 0x2000f6, 0x2000f8, 0x2000fc, 0x2000fe,
+		0x2d0030, 0x30000a, 0x30000c, 0x300010, 0x300012, 0x30001a, 0x300056,
+		0x3000f0, 0x3000f2, 0x3000f6, 0x3000f8, 0x3000fc, 0x3000fe, 0x400006,
+		0x400007, 0x40000a, 0x40000e, 0x400010, 0x400018, 0x400056, 0x4000f0,
+		0x4000f8, 0x600005};
+	const unsigned int event_index_table[] = {
+		0,  1,  2,  3,  4,  1, 5,  6,  7,  8,  9,  10, 11, 12, 13, 12, 14,
+		7,  15, 2,  9,  16, 3, 4,  0,  17, 10, 18, 19, 20, 1,  17, 15, 19,
+		18, 2,  16, 21, 8,  0, 22, 13, 14, 11, 21, 5,  20, 22, 1,  6,  3};
+	int lo = 0;
+	int hi = ARRAY_SIZE(presort_event_table) - 1;
+
+	while (lo <= hi) {
+		int mid = lo + (hi - lo) / 2;
+		unsigned int alt = presort_event_table[mid];
+
+		if (alt < event)
+			lo = mid + 1;
+		else if (alt > event)
+			hi = mid - 1;
+		else
+			return event_index_table[mid];
 	}
 	return -1;
 }
-- 
2.25.1

