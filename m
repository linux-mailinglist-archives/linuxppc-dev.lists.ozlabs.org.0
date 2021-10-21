Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FE435993
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:55:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYXx3972z3bXc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:55:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dpEnamfZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dpEnamfZ; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYWn4JW4z2yMc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:27 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso3956689pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=dpEnamfZmppOdrNzbUYAi/QHb79MHnzM+v1os76jHuoHW43yMkj2lr63MxL7PT6uWp
 4vauin4+YnYQZzY1U3ccCaBuTSyQINBiribUtJVPFXhivKEpbXGqVDmfJBS4T7iWYisz
 razU1ad8H28FZ8WMkkCB8GHQf5tSzpyx2G1NsmcoLlV7mgEBKQzEWxGvHjFRIhEKb+xn
 kGXOlpjLjsbt0zpFgKeatvGrVaXV0cz+oKr3xm3elA/hQOanrflicq22IQ5EPTjYz6LZ
 2uOd56T0VzDPMmA0bdNTPUB1M6EGAFWyUREOWxlueVozcHq4nk6V/bKQbWTyyascCcQa
 ua0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=mlMcUp2QiQ/xCJDrrwbFv17Tsk9As4g87jZERwDNJFNmW/7a2AjKn58J5mEGQUxTh8
 p/XrNjPZ9od7uE6vT8O/2VwWOYodrl3IiNI3EAooXwtVH5R6N7rBcqRLOIlepO8rjM7v
 j9LGGwpEqFpDDLA3p9dINgl4niVSBeFFjP19JF2UqZmALXIag0pyu5TCgabAW1lpkC4S
 yjepEFPEbZJLgHMG8kK7hMgotp7eeUWtTvOAYBhe4wi1w2Xz/n2QnUBRdTZn11oi88fV
 rIaLizCiBTVtsrfIdBT+fd6ng1LRllJpTFi/n7VmDUn8DLBM0ziO9BgZmMDchecr6IdN
 MvQQ==
X-Gm-Message-State: AOAM530V69pBLYd3j9PHzcwFVw1DKK3YOiPzRF3joOIbFnM5dWKYjWXM
 ixrcjSQ54wl2MwNxM+upokZlWhKKoQc=
X-Google-Smtp-Source: ABdhPJzC5obzMkYAvUya+/MbaFRuOMK/fF2OiyQkbO0tC/RQ1YDwnpsOKGnm47G7arcjWosbIOz5SA==
X-Received: by 2002:a17:90a:73ce:: with SMTP id
 n14mr3747786pjk.215.1634788465372; 
 Wed, 20 Oct 2021 20:54:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/16] powerpc: Remove unused FW_FEATURE_NATIVE references
Date: Thu, 21 Oct 2021 13:54:02 +1000
Message-Id: <20211021035417.2157804-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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

FW_FEATURE_NATIVE_ALWAYS and FW_FEATURE_NATIVE_POSSIBLE are always
zero and never do anything. Remove them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 97a3bd9ffeb9..9b702d2b80fb 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -80,8 +80,6 @@ enum {
 	FW_FEATURE_POWERNV_ALWAYS = 0,
 	FW_FEATURE_PS3_POSSIBLE = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
 	FW_FEATURE_PS3_ALWAYS = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
-	FW_FEATURE_NATIVE_POSSIBLE = 0,
-	FW_FEATURE_NATIVE_ALWAYS = 0,
 	FW_FEATURE_POSSIBLE =
 #ifdef CONFIG_PPC_PSERIES
 		FW_FEATURE_PSERIES_POSSIBLE |
@@ -91,9 +89,6 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_POSSIBLE |
-#endif
-#ifdef CONFIG_PPC_NATIVE
-		FW_FEATURE_NATIVE_ALWAYS |
 #endif
 		0,
 	FW_FEATURE_ALWAYS =
@@ -105,9 +100,6 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_ALWAYS &
-#endif
-#ifdef CONFIG_PPC_NATIVE
-		FW_FEATURE_NATIVE_ALWAYS &
 #endif
 		FW_FEATURE_POSSIBLE,
 
-- 
2.23.0

