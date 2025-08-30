Return-Path: <linuxppc-dev+bounces-11518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA62B3C7B1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLqT59M7z3024;
	Sat, 30 Aug 2025 13:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526069;
	cv=none; b=C/o8+bB/vc5LzUmwcjNKjltAa2r1cCQap1yEAEhNN6XXZkOib68PKM+ejA1JF9CtY3tYOoVhp8wIDJ6VAqOp/kejmAVdNSlW3O1xRZtBZ85TQ2JGaYuERUPZ3hwm9JZAtqRnTTug6b5r5plzPskLM5cAdM5FaxVTXjNHKT11kaaOa7iO9QxGkbHsPAjkmVAMWRu3bDGDhBgzVyHoKpKN6uB/q+yjni3PsbZYjehBXdSoCE2KHm1lgKFi56aTfTl6UxSLysQf6jS20NeIY7fbRkbZ4zb7NVxbRMmuOSL6UVYnCOuCpsSZxz3Wj7B9scqCNLvRceNsbjsiJcJ8V4PNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526069; c=relaxed/relaxed;
	bh=Dw0awhkPLz0fy7MIwdM9tJCgkmKNRO62beRQFlaegHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGrh3vnVcj52VCorKnZJzOP7D4jufvJ4UvBOd85S4GdJJBU+XZMkw8a4wocbl4WrKg/7sFP4h+ya4XgcFpkQzd5e4smkksynqNXJeNPVbBd31Ah/UusbVrp3J4hTY2ZKngwUY2VClxeK8XMi+2xY8Pbkd+vIs+VEFQv0y6pwS4nT6K2cEXcXRsvjmJg0HbkGE0K6m/oIbRkcyrUFU5q3bjBHkvwwPPa2sN/afZ5liwPUanoLIvPQgq49uVWqOnKqJVxTrVDM4GacmARw/BFk//dMaCGczSmGZiFXu9wut+T5/79t4NCXrHido3E8vyPxjDKrVCrx4Gl6/oRQzE44VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b0VLh8P7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b0VLh8P7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLqT0cBfz2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:29 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-327f87275d4so1064919a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526067; x=1757130867; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw0awhkPLz0fy7MIwdM9tJCgkmKNRO62beRQFlaegHs=;
        b=b0VLh8P7AUAQJUVGA2siuWuHX/cBYPn3eUoGb33WxKgay48jcQIz8U7wyFeLQgxb5L
         r6S1jfEqvc+0q7Evdi0Tqxqy/17LraW0tbB/LGewKKYWK42dvkVKUjNymRA+LCh6Yg/x
         TYt1cJbYTBEkgFVYOVGlcJeodYqcTdrB9WdHpoz1Uox4GCCbHnwl0QqIS/mli5yCFli1
         gH2oMu1/1gPRl2cbSmzNcuwCqrQ9UhCKxl7DVBdK2rFtkH09Tv2+tZQQnaZQaX9Meewb
         05vwzK1GTBqAQ9MKsMVwN3T2vxf3NUEejFarfOSHoK4Tg4LR/XHOa7ChoC2qvyQ+yr4H
         jyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526067; x=1757130867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw0awhkPLz0fy7MIwdM9tJCgkmKNRO62beRQFlaegHs=;
        b=N5QPRAheivaEsA6H2lzoJ15ZXQFQB6Hn14QX2xUV4i1ZO2idW37Dzq2varLrZ0UTug
         tt9nqHMPsbTVsHAnP8xNRP6UkYcoy8blLFQrOxXd43M9cPXVhaWY0hU37PAvAjUN/0jx
         6vjGM/G+mPDkAbtfdjwvxYAh4Trr3yc2WNZLVMiJPnfqwNJn2ZvCRXEogBOdmjSAnOMs
         f3APWTAWoYxcGTd2kaRIvma8i/8TgY3qPLVSaqwaPCmmm/o8Be3CmE8k1a+Yc/s3OeVa
         tXfvd11sjN+vAuwBR7qwqDfz4z2hTQNL6UNw/+upybiQiCx3C/5UGrXJZ/aO91qjOc2P
         tlWQ==
X-Gm-Message-State: AOJu0Yzeap2nI2BueDlBax1OTS2qNPIHRBmGRgST0Z8NwROo8Atp3TBI
	M3tHSUFgHNvujXrRxJJn4GjpVXuc/YvSmbz9ouD4wZSFWlCfaKFPXv8/S30wYw==
X-Gm-Gg: ASbGnctgzTPk4KdzQmfEqkpvliKae/3t2BL0N1Kdb/A79AI1zWvA0FDi/y1vSqUN1Xv
	BEnLN44FADPNueSZmuxHagq1zJ3a3zaacPLpGDOG9zqBQ9oIn0XwWiIZPtisA/oNJe5MRd+zgTz
	++V47l/ilwuKBi2Y98L2wcbbE7IjQqWkHUuAyCSmZ8cpYlJHwuBRX5eroAlnZAjodDkbKJxouxE
	RKVw4UaZBRogHWdqhjhu/SrAsS8s0ypui6wF7Ae6vJKIHGHzjRDUVkTmqdjOzQvITU9RTD01rF8
	MRyn5EW70fyHYMKU75DgAjkQDVQK3+ykOc/tR0aD8iEYfhROAPfJJx9Rfw9IiXf9qRP79eu2J/P
	X+kutUi4Nc93flJQ=
X-Google-Smtp-Source: AGHT+IH7eeLT7c47ILk6LSXY988Al+H6ChAdFWP5QU2kfPsmVm/1Z+NWTQKIMbHcUEEHTtTbd8n5Og==
X-Received: by 2002:a17:90b:4d81:b0:323:7e81:7faa with SMTP id 98e67ed59e1d1-328156f97b4mr1147158a91.36.1756526066892;
        Fri, 29 Aug 2025 20:54:26 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:26 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 6/8] powerpc/book3s64/slb: Make preload_add return type as void
Date: Sat, 30 Aug 2025 09:21:45 +0530
Message-ID: <90acc8e1de6e9575f31f41182077571e7c34a794.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
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

We dropped preload_new_slb_context() in the previous patch. That means
we don't really need preload_add() return type anymore. So let's make
it's return type to void.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/slb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 7e053c561a09..780792b9a1e5 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -294,7 +294,7 @@ static bool preload_hit(struct thread_info *ti, unsigned long esid)
 	return false;
 }

-static bool preload_add(struct thread_info *ti, unsigned long ea)
+static void preload_add(struct thread_info *ti, unsigned long ea)
 {
 	unsigned char idx;
 	unsigned long esid;
@@ -308,7 +308,7 @@ static bool preload_add(struct thread_info *ti, unsigned long ea)
 	esid = ea >> SID_SHIFT;

 	if (preload_hit(ti, esid))
-		return false;
+		return;

 	idx = (ti->slb_preload_tail + ti->slb_preload_nr) % SLB_PRELOAD_NR;
 	ti->slb_preload_esid[idx] = esid;
@@ -317,7 +317,7 @@ static bool preload_add(struct thread_info *ti, unsigned long ea)
 	else
 		ti->slb_preload_nr++;

-	return true;
+	return;
 }

 static void preload_age(struct thread_info *ti)
--
2.50.1


