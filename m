Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A556C0B19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:08:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg5Rn4rD1z3fCJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:08:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CjkhLNm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CjkhLNm5;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5Lq5VRnz3cJF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:04:03 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id le6so11426191plb.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679295841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgtM7TlxgAIoKdfgC+k38fH5tECmZ4bBfgi2cHLlGS0=;
        b=CjkhLNm5CeCG8XIRiBF6PK3VJ+SY/fLQd3hDXzjE9Qkd/SBHlfqRWYND38NZoJ+U/Y
         MRyI9kx66QpfyeO0GmdZOUhSSLQdHFusM6JFr/SNc+jY4FS7iQnypXy7HWS6qFnbPOly
         BWMiJvynKcIG6EciSMq6gLUQIwK5Eldvr6W2Ck5qkyKvo5QyUp+6A1ahbj5oxNZKukXP
         JcRysbmdfgrCJ+a05z/S3ccdfGgIktSrdl4HCKDGojUpu/Tct21492gmxD4K6hil4u3W
         xCj/511k9sDRrMa4hRniaAa34Mc95NC85KNT7pJshQq2WPt5Xp+c7myU+SmByG0z970D
         BkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgtM7TlxgAIoKdfgC+k38fH5tECmZ4bBfgi2cHLlGS0=;
        b=XTOzC4DPW/KNBNyYvF1u3iN+QJk/0mxigCYgfAjn2EJPVyagnd+7tc7TKN2vasAS7C
         F7zUzxuH/YaQCf9z6+gq5a3WUxSupjKvtZDbSnSzgdGvp5TNVfPucjpGRRM0acQJzppm
         gORiOunmHTkqDHOQNVo6rhq8088czW9PNyc7z5y/vtL4a7BUu+BYX0h8Tjsf3ApM7GHS
         p82RwFC50FeaFRD/9XUP4dXMClvlfgD4MQVqtmk8wKwjRZXpqsIqZG3ehUuqVxnRuGJh
         xe9xqdS7uvutXJz2o/HWcY9zmMaclCITupVHPf6tA17nXI4jMB0WMvaaQzhTrbf74hD+
         geWg==
X-Gm-Message-State: AO0yUKV11SHBKYEtRfzfKfgELNJZNPKDYLIBPuVBUOJb4u8zdBTvc4un
	e8+LY49TYSJc+DxmF9hqBF0=
X-Google-Smtp-Source: AK7set8l8LttOuDE9xEiqTXs3Aficc6Zhwou2AU693HO7yweDxG65R3m3lrsFWiUkoUSeupE+nh+nA==
X-Received: by 2002:a17:90a:4041:b0:23f:9445:318c with SMTP id k1-20020a17090a404100b0023f9445318cmr5460462pjg.38.1679295841474;
        Mon, 20 Mar 2023 00:04:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a632b11000000b0050f7f783ff0sm1039414pgr.76.2023.03.20.00.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:04:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v2 04/10] powerpc: Add ISA v3.1 (POWER10) support to SPR test
Date: Mon, 20 Mar 2023 17:03:33 +1000
Message-Id: <20230320070339.915172-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320070339.915172-1-npiggin@gmail.com>
References: <20230320070339.915172-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a very basic detection that does not include all new SPRs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index ba4ddee..6ee6dba 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -117,6 +117,15 @@ static void set_sprs_book3s_300(uint64_t val)
 	mtspr(823, val);	/* PSSCR */
 }
 
+/* SPRs from Power ISA Version 3.1B */
+static void set_sprs_book3s_31(uint64_t val)
+{
+	set_sprs_book3s_207(val);
+	mtspr(48, val);		/* PIDR */
+	/* 3.1 removes TIDR */
+	mtspr(823, val);	/* PSSCR */
+}
+
 static void set_sprs(uint64_t val)
 {
 	uint32_t pvr = mfspr(287);	/* Processor Version Register */
@@ -137,6 +146,9 @@ static void set_sprs(uint64_t val)
 	case 0x4e:			/* POWER9 */
 		set_sprs_book3s_300(val);
 		break;
+	case 0x80:                      /* POWER10 */
+		set_sprs_book3s_31(val);
+		break;
 	default:
 		puts("Warning: Unknown processor version!\n");
 	}
@@ -220,6 +232,13 @@ static void get_sprs_book3s_300(uint64_t *v)
 	v[823] = mfspr(823);	/* PSSCR */
 }
 
+static void get_sprs_book3s_31(uint64_t *v)
+{
+	get_sprs_book3s_207(v);
+	v[48] = mfspr(48);	/* PIDR */
+	v[823] = mfspr(823);	/* PSSCR */
+}
+
 static void get_sprs(uint64_t *v)
 {
 	uint32_t pvr = mfspr(287);	/* Processor Version Register */
@@ -240,6 +259,9 @@ static void get_sprs(uint64_t *v)
 	case 0x4e:			/* POWER9 */
 		get_sprs_book3s_300(v);
 		break;
+	case 0x80:                      /* POWER10 */
+		get_sprs_book3s_31(v);
+		break;
 	}
 }
 
-- 
2.37.2

