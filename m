Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB96BE97A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 13:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdNy65gT4z3fJ6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 23:40:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qfpi+iuX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qfpi+iuX;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdNt85xBDz3c38
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 23:36:48 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id p20so5117021plw.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679056608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgrFyKL0mkQqzfd3lw9FAzsbWeu2gcn/ROX5EFuiTaU=;
        b=Qfpi+iuXM1w/WHrL+cK8ZdUQoGQX8+OPSP5cEF0YEEKWuMjtYcnnHG+G0UvJ4++W5r
         xvReBfEicKE/neiF01ppuDvK69IVL65w6AGVUYXilEl1mCUNxoo8L1qhywP2hGu4tufq
         TUvabdh+ryfldzUxWPY7bh5IchpNjjp8yLcRW9hHHh3rYSrJqr05ooMmHL4k8d/q9Hro
         7WN03HM5houo1F0eG10L6LnW33u2ss8KpFTthTn4TxneRqmbbs+Rm0x6HsEYtHajmU+7
         TthDQTWxKs7RHSm9mCl4y5MMEyJQl5P+bRfbnO0mq2lVhOR4ZIj0EDSNcfNCpXFoOuQh
         SQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgrFyKL0mkQqzfd3lw9FAzsbWeu2gcn/ROX5EFuiTaU=;
        b=2sJtY3k6XiqWqLr2GgeItLQEF8eozuWypkH4BTjQlVjA7EuVuJBam+wDQsXzmyK0Ey
         /4SvCmTBGKTibjddxqFmdyaiq8RPHa44r39VXMbCtvdHb7wVvKoTaQfG8j5viCppd5tl
         ZZxq79g6eWsUEG2vdtVPYqP3kK6qiLrZ0NkjpYfiOG2mPJQCYLPRygoPIBPPatMMMVly
         kB5/c7Uz4El917/LYdAAnmpXUNkofRvaotcMIN/bIrego0gK85LEfHCu2cXBweMHBZZm
         24KO6hOglUjnCZx0u3xDKaDSCzFGyaueWnSDj0ZTvcGH7YwGDY7Ku1HBjsVq2/papfSW
         uivA==
X-Gm-Message-State: AO0yUKWx6Aut14mjsMhwrqFTdWSJuhgBk9JtnfILPhYzgL/km+c3Gw7L
	7PDYbxqa2rfzG3yAK5x8Qa8=
X-Google-Smtp-Source: AK7set8VVnF/eahtQSwmgDCRAgLIrEC12yNJlSdMxmpFXMYod+HltJkz8Hu+U2tHN+Jo09C4DTe92w==
X-Received: by 2002:a17:902:cecd:b0:19e:9f97:f427 with SMTP id d13-20020a170902cecd00b0019e9f97f427mr8445311plg.10.1679056608399;
        Fri, 17 Mar 2023 05:36:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902b28400b001a19d4592e1sm1430990plr.282.2023.03.17.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:36:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH 4/7] powerpc: Add ISA v3.1 (POWER10) support to SPR test
Date: Fri, 17 Mar 2023 22:36:11 +1000
Message-Id: <20230317123614.3687163-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317123614.3687163-1-npiggin@gmail.com>
References: <20230317123614.3687163-1-npiggin@gmail.com>
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
index 161a6ba..45f77a5 100644
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

