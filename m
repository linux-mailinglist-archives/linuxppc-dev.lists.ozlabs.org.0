Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5BE45DA72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:51:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0HnT36vnz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:51:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=APERyK5R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=APERyK5R; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0HmJ4cwzz2ywQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:50:40 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id iq11so5124768pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=APERyK5R74ByqkBCKopgUB177/mLHFOekH9dc72LenpyIROMQbgG5QT6LRETq5Fscb
 3vLmFRUTbV/fL9xYOB1YH8Tsp9md5Ah1hP1ztn+Zg99/hGGr4ypDIHrNwxe3hZEfsD6w
 h84fzj4Ot8uIIczaent1JHboT/ShYyrcgo8H2FOXQv8pq4JW1AWngXliYOwgKB9Y8zWs
 PBQjR5v6Ulhx8RJ6CgfzFdw+HiLCvBmZmUdwYy5UQZ8DuW7XuUvLOI9g+LZZSylYMzGf
 pSJ7+2qEADxTB5mswdwh/9rmv0xClJhGhopCsBcQfzaYT4cC+7mXhILrisZ0lW5l4UCi
 yu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=Qk7NMdFBr3k1d5mrNiKyfHqO4ANeMyReLgfY5aRnb7VN9GiGwcdRLlXKL2HHHJGcw8
 g7sriUxi0cmWHTL/uKStdaSiSYWALvR0SyZs33E8zTJrHOzRcZ4F6FNRtjesGSc8BbuL
 d+Ww9PDh5U+IBrBXOQ65+a2RDwsBr0Uq27lvZ/qXDjtkUVb8LuMd9T39tLL+ecggIFle
 x9l8IgjodSb09D+e//pGQRFVlZpqcKSSCJbnh2qQkP0is5XJGB/r9ZN7qdjMTojg3v1A
 b1xFNzKhHYPXNh74gBBRCJpBd1C5ipCobbKqDlAn2RpQ843CGlek6Vw5x94JIaQ5pxkj
 0a7g==
X-Gm-Message-State: AOAM531WXDHvI79AWg7VsxOFP0nqb0wf8i6C7jVOb3xlwNjsk3bo53K5
 Am+/A//0eJjMg2Ybms06QtP6sebKMkQ=
X-Google-Smtp-Source: ABdhPJzZzM6LPzYfH6i7yoDMsR0CFEFybbmothO3CfJDptJDh24VOWuoPz/tcTvlPm+zn+mepYgv9Q==
X-Received: by 2002:a17:902:ea0f:b0:143:e4e9:72b0 with SMTP id
 s15-20020a170902ea0f00b00143e4e972b0mr29077612plg.29.1637844638493; 
 Thu, 25 Nov 2021 04:50:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:50:38 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/17] powerpc: Remove unused FW_FEATURE_NATIVE references
Date: Thu, 25 Nov 2021 22:50:09 +1000
Message-Id: <20211125125025.1472060-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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

