Return-Path: <linuxppc-dev+bounces-13566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78096C20CD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:01:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6k066hHz3c1T;
	Fri, 31 Oct 2025 02:00:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836440;
	cv=none; b=Cp8pGHRHnK/2Nrq5qGtH79RY59dDcAsvSWoRk1J++FPWerjNGrNoxhcJ7nTP3yiLXbOYwJKBV1XZdvIbgY4BRT9JF+nJYQ9xV/m2wfvQKZPrLw19TdeRo/AxqYwpW4U4c6EAXubtdmo8Z7cXIPtlxKplU73lZLzaSZHajduWtr/+sA64smJHbHv9bsNQs8Y4o9gZTIye6L9yrqY/2FqeLdW2EnUWjhI+ds3fBA6JbQohp4WnHkn8wneVmAOjTbGuK1qLtSUSAg/Z2+I/OQawFwQbt9tYribJTflwCdyiU5IZBYaLtPqpWf0AKIeYBXjpRGE1z51QpL+CRnN1ra+2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836440; c=relaxed/relaxed;
	bh=DHBpwml26hfHk7sUibmf8Tn4BvfMsJjTx8uQ4u4LJWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DO+E5C7k2NJaKptg6otGQbeJE/nlPMT1FyP8V3suomJXma0cNC3i+LHm1ANi6jKGNr51COXbFIa1P7sCWOmeR3U3cof6HtYGa3pIv01syBDzabeGjzYf4tOwz+jd4gZM9mRSjrdd3Gm5/LV4Jr9TmccFVjDZZ0kec9QzmLKyjy92pjFTONiFG6qALvYUsmLP4tv4EnLxz/UiEe1pJ9YeND7zLcAuIue8+ScPP2xS/EFwQmM1ZCQRASEqe57adFupE0aXY23UH7Z6pufIAVdi9KAF7NLdfN6zwN/sBdS0WsIuX0QMkhaZDKH22b8vuSg51X9f2g77zNoGZx5XLm5bQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MyV7ZpBC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MyV7ZpBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6k0133Bz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:39 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-78118e163e5so1958661b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836438; x=1762441238; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHBpwml26hfHk7sUibmf8Tn4BvfMsJjTx8uQ4u4LJWI=;
        b=MyV7ZpBCHbgdTyg1jyjI16BeBNnRT4+kcqPV+SHysITFOMj1Y8FFXo1YTFtYpOFpr7
         BZEDKRi0rifV01Dew8X/g1KOcWfAcu31/IQ8AVhuqw0u3oV4Qb+MwXffEPnT55oGsRuS
         oG1Diw06KiuHGh9KHNSYpVnk2XAXkrLDwmb8kyLjqHDhV8ir6AMWOT4NkLnRiX2Rn/wp
         8Qbn2nr/NIMAoV0hasf+kkZD95bRDor5S3dqygvrOnfbnG0evxmDQMZI8AUSAA94aaYf
         mE4iH9WE+NPE7aohcrad8kmmj7xXgNNSSN/wFNFMCqZ9z7VpV74NmunJfNzlJkAKWTJO
         qJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836438; x=1762441238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHBpwml26hfHk7sUibmf8Tn4BvfMsJjTx8uQ4u4LJWI=;
        b=GNnyrK+c903KYTa+YVFxEdl9OrXwCkXrM7KZ3o85g7nkXW1xhZlq3ZNcMHAcx0kQXs
         7NHBENCqqnSbxNk0iaLMF5hQiuNLmej/OFPV392YypZWVOduvf6mDk+0CTo6BU74+17H
         CX/lYsJw0zWzB1fUruD8Ey2F0m9Kx/jJdTK9Hf2OTdBbZ24L36ASoG9yTa3Ec/uZ14nC
         /ApWyiILbwUX9TnfeRdGOv4/pAhDMjuhpATwhfjkp7h/YJSQiyyfpSo2Ab77qc51s+20
         iQLRxMe52U9UHOFXXnq+VqLcPwXt7F1I5HhowM/+GMJ9VU/eOdvvSeTnNnYj2KJuPVUc
         EY5A==
X-Gm-Message-State: AOJu0YzghREgWHnHxwFDr2oQNmrfZm50bSPBP8A6vPqmPcyRrHX+fo/I
	3OJkJPSQHE8btJDYAsbp3O7jnftsltubjpGeei/z7dN9SSoxbbJgUOzdqk/ZTVI4
X-Gm-Gg: ASbGncsBVHcjY9r6KgomnCAkmJRL/RmkUjgbhYW+QF4FGS6QlGMvY387R0WKePc1mQ7
	qkJHCyM87jbdFVduqtCjo8exEiYdf4mXuWmr9x0Eih1T/YHoWkWprewqjIsarbULYwWC+fUipkT
	sJ6LmwE4yJcYiUFFRGB+NF8LEMQ1pE0hP1O5AdXR8PDyTet9PfY6doqlDNj4+4bjg/Shzcb1bR5
	2SzBqsLxOp7pLWEETYkAt373qx+dfiFGG6UwiqT0+LIsll31VVtnHwciGN3k82LgheXzea5elli
	YOr1jO9Sw5xmxMojBA0eBdbXNEcUJyS/qsfMLqcHwaRUgpkZICvxvIbzDolcF3qkvZpaIMrQH00
	ws59zb6Z3TDJCRW1pXLl4HGendzaS4v3X5h/1VLWSAMiZzVUmIh70p0nM1uBId0dYgzTXbQ==
X-Google-Smtp-Source: AGHT+IET8XOyo5IylUlwV0nIjM/0LDspJ3/QW2ZUYFlyLfXPpIu7qFmc2wXXdQg7E2noqtyFNOOZpg==
X-Received: by 2002:a05:6a20:e292:b0:334:b280:b12 with SMTP id adf61e73a8af0-348b9e9fb8emr186489637.1.1761836437341;
        Thu, 30 Oct 2025 08:00:37 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:36 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 10/11] powerpc/64s/slb: Make preload_add return type as void
Date: Thu, 30 Oct 2025 20:27:35 +0530
Message-ID: <88b07223e93b0fc56c1119f6889b7d9c83e20109.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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

We dropped preload_new_slb_context() & slb_setup_new_exec() in a
previous patch. That means we don't really need preload_add() return
type anymore. So let's make its return type as void.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/slb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 7e053c561a09..042b762fc0d2 100644
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
@@ -316,8 +316,6 @@ static bool preload_add(struct thread_info *ti, unsigned long ea)
 		ti->slb_preload_tail = (ti->slb_preload_tail + 1) % SLB_PRELOAD_NR;
 	else
 		ti->slb_preload_nr++;
-
-	return true;
 }
 
 static void preload_age(struct thread_info *ti)
-- 
2.51.0


