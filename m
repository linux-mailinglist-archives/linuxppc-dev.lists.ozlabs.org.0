Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FDB4359A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 06:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYf91J24z30CK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 15:00:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oyKt9xAQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oyKt9xAQ; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYX263XTz2yxB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:42 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id f5so24347355pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=oyKt9xAQj+7qpJiiKeSL9i9ojl4VLJE16KSdrJq3NgkxRqSNON3j+IzJsiAROBUoCu
 O5NHGVUVV9RnbbIXPNwVoRP5c22HG2y3YIHgPNLcSvFiejm75jxUiRDN4EyeOcIfUVOk
 9QryB+i+3w0RyWJD95oHSjYbBlgsEyrV/cMFKSuBB7yf9UrLL7wCNQz3helXS3WHEct2
 Qs8f4MfJrNJaP3XMSYRRikOuVCYIuz0EGcloKTbDt4NkXoB5ODvfAphyA6E6iMrZ3w/d
 4cV9E+zkslVwcqjNL1t5OZeLkfn1ZhmfBo99DQ8PiadihnxCY3+N0LsvP4fkS5A/tR2r
 zrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=D70A6GLOIGY0fVQM2Z8zjSOtgODnyqgHeKLFtK51V8iyEN2zXU8uxEgW5VnJUGRwJL
 v64BTDjOIzSt466Nb+2yJkxVD6b6Cml/oFu8o+sIZXeaf4jLVjBG8GiaStsliSEp0Wbn
 a3hMRzg8meiYX9udeNH6e1KFk2RjqTK9/okjmnXDGno4446yibNav1e2SUeRoaBAMLpc
 lx9zwCRcLvULEbLsfeQHddIjc4S+z7BYNBBliv9bZVevkmvVu5EeWn2DVzmkFOvgpN8j
 WIMOUV+tRYpfp5fzFWHaqRrTlBiUxyjRBlkWAMiPbnZzd0My9P9Lnz0JtGXUQdG+ADBf
 F6EA==
X-Gm-Message-State: AOAM530VEdxPQpF8VSrWgJ/bZI0TDsj2Vel0pzsXQMyAD+M+7qgpNoyP
 Gc528wCkaVRO/bMhioUDN41gg/vrKKg=
X-Google-Smtp-Source: ABdhPJwYPbM0HHleQ4eXU1bmGyjUFXS/23rfIZpddR8g4aZ8G+1vyfckQ3p1vSwBHebUrLPKi13rpg==
X-Received: by 2002:a62:d11e:0:b0:446:d705:7175 with SMTP id
 z30-20020a62d11e000000b00446d7057175mr2888818pfg.74.1634788480435; 
 Wed, 20 Oct 2021 20:54:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/16] powerpc/64s: Make flush_and_reload_slb a no-op when
 radix is enabled
Date: Thu, 21 Oct 2021 13:54:09 +1000
Message-Id: <20211021035417.2157804-9-npiggin@gmail.com>
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

