Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FC2545B31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 06:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK7ZC4kwNz3cCY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 14:40:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SqA1/KbG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SqA1/KbG;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK7YY5z2xz2xbW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 14:40:17 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so1132939pjq.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jun 2022 21:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EJUAGx7KIQ5sU7nrJNy0KLaH4AopWlUj+arFLGMBPM=;
        b=SqA1/KbGZyU0vs9i7tXTznPkyPfbgkiodED+wIbRjiP6f0BWMKmEo5TKyKLL2mlnjM
         xhCLSUAc88T55bMVtLfqBMm8VQzpO9ky1Ab7QTop8GlaGHZwK/wU2enmjA73TR+ZAyoe
         PXEvpVMho6eCY7A97/50H3fDERf69NMHjuhfpOmbfjdMgQAzmLuD1PXqSbLRobT7Kuej
         DMG5FvBSVZTlj+dm8eeNCVIONRQ3KUc9XJHJsz94gPc8nIiMdsntUI58jJMSElJPajN/
         qZ81J9G8bi0qSVx8SVHi29pRT0x54bIn441dyjLXUsvNqxgovUCSvb348fitTdSt44f8
         fiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=+EJUAGx7KIQ5sU7nrJNy0KLaH4AopWlUj+arFLGMBPM=;
        b=KnkD/9mRSXPy2pzoRAAIeUdBcrHl8w0LVpeYGXeRETi1h6+vvAMvQJxuBoQMx4eSuM
         tQz13hp5bOcSgXvw2qp7H86XcnG2c14wQepaUF1LWkgyubhjJ3tsuxA6zGPNyMirb3SV
         /hROHSgtcrkfoJumBZQWVngrZDTx1TeEGVibYVfev7Vyfj0tkWBj58mO9SW8Q5qIAg1g
         Tcp34JqG8X+SxXbaUcybb0ZBkxUzdsPFtsTE7kH2Ez7d3WHrcR+kTb2gFNw/F8EH5+AF
         ttlLliFHiYw0yoCvyHFMYHSIZWatUb2NtI7uT3JhzWUGmaF+Fla/3I2YcJiymWWUG43P
         e0NQ==
X-Gm-Message-State: AOAM531o/khTixkz96CWeUNXHYXs/Fxb3OGZ9udsi1i3EKAt+04XATx5
	6aUkA9ibyHgxkINS456up10=
X-Google-Smtp-Source: ABdhPJzR4jZ/kvakb7D6klfuCrHB8s6GJGHYDlWUc+h3H4VBMm+uuxf9xRnlSRIBwVzNT2Bnbbu4pw==
X-Received: by 2002:a17:902:7202:b0:167:79d1:f with SMTP id ba2-20020a170902720200b0016779d1000fmr24859159plb.3.1654836013096;
        Thu, 09 Jun 2022 21:40:13 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id a14-20020aa794ae000000b0050dc7628146sm18107216pfl.32.2022.06.09.21.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 21:40:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/perf: Give generic PMU a nice name
Date: Fri, 10 Jun 2022 14:10:06 +0930
Message-Id: <20220610044006.2095806-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: Athira Rajeev <atrajeev@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When booting on a machine that uses the compat pmu driver we see this:

 [    0.071192] GENERIC_COMPAT performance monitor hardware support registered

Which is a bit shouty. Give it a nicer name.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Go with ISAv3

 arch/powerpc/perf/generic-compat-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index f3db88aee4dd..16392962c511 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -292,7 +292,7 @@ static int generic_compute_mmcr(u64 event[], int n_ev,
 }
 
 static struct power_pmu generic_compat_pmu = {
-	.name			= "GENERIC_COMPAT",
+	.name			= "ISAv3",
 	.n_counter		= MAX_PMU_COUNTERS,
 	.add_fields		= ISA207_ADD_FIELDS,
 	.test_adder		= ISA207_TEST_ADDER,
-- 
2.35.1

