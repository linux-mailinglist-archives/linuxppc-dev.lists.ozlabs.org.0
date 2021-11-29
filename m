Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B33460D11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:13:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vmy1Gmsz3ccK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:13:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kAyI7J5o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kAyI7J5o; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vfl2Rjvz3cBN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:31 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id u11so11005528plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=kAyI7J5o59N/Az4AEtNOtp31S1CcPWVnCsGhdNP9cr4yRVnofQ40T5O68PnEvgwlEp
 Gar2pCC6GgjYICuSFKN0fgR1MyaBoGGdezxnpfSn9TVMl7y6Ygl2jKfu8FlCfQ0+iRu8
 EuVspbHZYh8pW1ibjsYlGd1t8YG3whNfopmQe7aadsb72xHtRcH7TjIF9o7PKJIPyWUH
 Au4izeOxZ4CXwWm9iOTz9TMFRITmeXJcWbtEZx4hPeWSvtVewYYgdifu5kqRC7gSMT5X
 akmlk7q3JsHur9QFRZ/Bv3AMVFv6rYhj7EedraSCtZtzV9tIrUrPc/oUxFnIcBiZTiaZ
 Ew9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=et6ilDW5auTScI76Hrnfzsqgxa8BjxO9ZU2ULLojo0jjEr9qKXeNmCQq9xIC/P5nhT
 /i7E6HjUJjLeoIkQb/rNlgRrztSEkbZaoi6wn+O/KE2Rvk6KMigoZruU0kUWi7h3NLC4
 R48vQSeJLflbrgT7xxap8zf9Jp6VTrQvGvDtKWew6NYC7CU2RFtQzlvKH52MGMW0VjJ/
 9dMfyiBouGtBhMnxQ5nMXPZ9yZ7hIrr8KMl9chN898xP57v32iT7YKgiKoSiiizSKQ/1
 tDiaqV3ZTkoktGELtqLpLNWHki5KymWvkC5Mem80AN3jd4RkOJqtINZNgdLIgnqrcx9b
 Y/2A==
X-Gm-Message-State: AOAM533nvIZuioxski9+RqFZ6dROQKu47DkZRT03mx4hRR5MY9inK/64
 SBM8gRY/u5ONcpSz/iDZGF8Fp2ZlKvc=
X-Google-Smtp-Source: ABdhPJy827Pyo3MhLbZLWzvPhf4Cml2nS3KQ/cMP5IS2HPyZ0xehxtobatnGBK+EjNE/t90EylK+qw==
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr35325106pju.123.1638155309138; 
 Sun, 28 Nov 2021 19:08:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 08/17] powerpc/64s: Make flush_and_reload_slb a no-op when
 radix is enabled
Date: Mon, 29 Nov 2021 13:07:54 +1000
Message-Id: <20211129030803.1888161-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The radix test can exclude slb_flush_all_realmode() from being called
because flush_and_reload_slb() is only expected to flush ERAT when
called by flush_erat(), which is only on pre-ISA v3.0 CPUs that do not
support radix.

This helps the later change to make hash support configurable to not
introduce runtime changes to radix mode behaviour.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c2f55fe7092d..cf5263b648fc 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -80,12 +80,12 @@ static bool mce_in_guest(void)
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void)
 {
-	/* Invalidate all SLBs */
-	slb_flush_all_realmode();
-
 	if (early_radix_enabled())
 		return;
 
+	/* Invalidate all SLBs */
+	slb_flush_all_realmode();
+
 	/*
 	 * This probably shouldn't happen, but it may be possible it's
 	 * called in early boot before SLB shadows are allocated.
-- 
2.23.0

