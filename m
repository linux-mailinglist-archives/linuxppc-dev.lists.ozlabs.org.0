Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C472797B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:02:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGsY4RlZz3fkF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:02:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QeXYam2T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QeXYam2T;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGn96qLvz3dy4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:58:53 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64d44b198baso259086b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211131; x=1688803131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rz2qKoH3DNrsLGjh2uEgTknkQbSjekuqzOD1uG30Q6U=;
        b=QeXYam2TKtQKJlmYK+hS4PipoH7jZSjxhlzJtYatN7aADBYfeYQjB+M4CVMO2YtaYX
         DJ2UYrJzZ5UXG1b+ZkV5fAFGW8kxcJyzUheMdr1RJn2NmTpba6dvrSKzVf3cWvg9Gt95
         6atsVKDvSbtgS4TWqMZoAbBOEDW1pmuhtrA+r1mFHVXu8SuJsEWT4Xu/Pq9DYD+/LUUA
         m7sKplV2sgU3jVFxoai6J6P7B1V/pHe3wQZ35ioBoTXUXoT4qyi8XJ2iyDp7Bm35iuLQ
         w3F/risInMRWJgWHYob9TXd+aNLZjZq4/iLth9pTkksVKKLGHEy8wzNhvOgk31Ubp41Y
         ve+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211131; x=1688803131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rz2qKoH3DNrsLGjh2uEgTknkQbSjekuqzOD1uG30Q6U=;
        b=QZY/zwI57pIFntEeYssen5cqNLfRvFfnLcJio4Z6b16dw8oXwcvNyUIy2mhfu3zcKq
         PXDIwQq0T17RTKPgU1szunFRqdy2pfuDX6CJxhXcj+kHCiXe09XKWR2idi/2Oa1uQ22+
         ZXvNulwP2sDo4/31BADid3/2+3vHCkLpCPwwU9qmbKXMrkkyX6coSuvqgOfZkSSyoylQ
         jpum3IgzZvyZ9Cv/AohUiAuQILaY1aMS/yM09uSmK0D8FRJ3+nVEe+eUUzmP1S8nXgZ+
         ONkKfC+fMRwqc8o8xYJAX1SyuLG+sapqMlFbPcVo3JoBYtZ7u30L6vWtivhQvhw3hnk8
         frQw==
X-Gm-Message-State: AC+VfDxPmFrigaGOaD5Gg2BD2k3kuFGZSH/UPCMrhujmodnPKSQ6P26I
	aER5sCPsZ+fhLD6qHRppK7s=
X-Google-Smtp-Source: ACHHUZ5CkbXbO96YImP08Vnh4l4C7KyGIVtp0KFP01IXjaZyq6CNPW8hQqqQqLpVvC3UWM2LzcAWtA==
X-Received: by 2002:a05:6a21:329b:b0:110:2064:ecb with SMTP id yt27-20020a056a21329b00b0011020640ecbmr1676434pzb.15.1686211131186;
        Thu, 08 Jun 2023 00:58:51 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:58:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 04/12] powerpc: Add ISA v3.1 (POWER10) support to SPR test
Date: Thu,  8 Jun 2023 17:58:18 +1000
Message-Id: <20230608075826.86217-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
References: <20230608075826.86217-1-npiggin@gmail.com>
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index ba4ddee4..6ee6dba6 100644
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
2.40.1

