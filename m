Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3621E2F8206
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:20:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHScG1SgjzDsbT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:20:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UkdVuQMH; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRyr2MJDzDshY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:16 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id v1so5385540pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZsVbgqM/DNFt1/n0lamYI6JL/0G+ykNB7Vok8GqIgNs=;
 b=UkdVuQMHlPs50GnqtLaXeYAVCjGbHK3Kp+uzuLEqN/JmvaWA/x4/RG0HCOS6YA9XaX
 jzMjWJS4+a/xqq3pZuQABcQo46W4j7VOHxZXmQNMaWSwDQELPJHnM6QrMXQ8Nr8kVveG
 gORVL7TlACYyIncfzxoetL1OxGw0iPh1jYrcZB21524WG/veU8vsfeWHgD571AWdgLkk
 xHL76kELs0WiHUXTDldYtdTIr55LAvIuf7W1yKtkeoZac94V4i1H0zHE/WkxvQRZJSWw
 LSRCYFkHP3p+8e2b4gQT1DFDMoEZX0FaxKj1fDTN9Bq+LOas1CJmAJrbQ0GoxdRrU5GA
 /+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZsVbgqM/DNFt1/n0lamYI6JL/0G+ykNB7Vok8GqIgNs=;
 b=olmkE32+hU9wZ3qu2DIswf16dPKro+H+vWMGyN3loTh5cyyDXsp1DjYe43NGqxj2XJ
 +SA82gpUlyeY6qBpjpmVWWldVTJIAAsVB/iOMaYbw7yH4lFQ2qOwvMQBVgnb01e9SoXL
 YGYoHdNf/y3JsO2SBzMl7PnJdDm9QJKw+OQ1wB3ZrvaJuDCyV4V8xj1BCxihhTmGgAPB
 cb/5s0BZLUwaK822dAa82f92DxrE9uuWtI8MwvXJ1EXQAhsV5cUC7lyIV7xKe7+B8cHx
 JiciQgbUyzbldOdvQgpsOlF2mVsQoV6tn49p16pOK/0sH9Rc5c3AbU7E/6Q6N/9ng8Pg
 M3aQ==
X-Gm-Message-State: AOAM533moZkcheEFJdnEBbqPQ/oP7SszgAH5+Kjl74QYPnDFOan8xJ54
 FcSyo7eLPs7xWUmjliQR8exFzDx29Uw=
X-Google-Smtp-Source: ABdhPJw3TDxhsMa3/okFynTufeGp4IiiiF9SdFBJ/CDE9DgHITHnDHNBDRmkBt5xZUDQimFCHVsufw==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr11590237pjg.231.1610729471010; 
 Fri, 15 Jan 2021 08:51:11 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 11/39] powerpc/mm: Remove stale do_page_fault comment
 referring to SLB faults
Date: Sat, 16 Jan 2021 02:49:44 +1000
Message-Id: <20210115165012.1260253-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

SLB faults no longer call do_page_fault, this was removed somewhere
between 2.6.0 and 2.6.12.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/fault.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 965c89e63997..900901d0038e 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -377,13 +377,11 @@ static void sanity_check_fault(bool is_write, bool is_user,
 
 /*
  * For 600- and 800-family processors, the error_code parameter is DSISR
- * for a data fault, SRR1 for an instruction fault. For 400-family processors
- * the error_code parameter is ESR for a data fault, 0 for an instruction
- * fault.
- * For 64-bit processors, the error_code parameter is
- *  - DSISR for a non-SLB data access fault,
- *  - SRR1 & 0x08000000 for a non-SLB instruction access fault
- *  - 0 any SLB fault.
+ * for a data fault, SRR1 for an instruction fault.
+ * For 400-family processors the error_code parameter is ESR for a data fault,
+ * 0 for an instruction fault.
+ * For 64-bit processors, the error_code parameter is DSISR for a data access
+ * fault, SRR1 & 0x08000000 for an instruction access fault.
  *
  * The return value is 0 if the fault was handled, or the signal
  * number if this is a kernel fault that can't be handled here.
-- 
2.23.0

