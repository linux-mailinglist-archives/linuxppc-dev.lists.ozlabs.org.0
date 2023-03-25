Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A346C8E34
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:33:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJQw4X01z3fXW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SfoYHG20;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SfoYHG20;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJL026XGz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:28 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id q102so3663978pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRvp7QfXAr/JrBcDP8ItRy/9hpkMUm429uD7EjGj5Qo=;
        b=SfoYHG20btHyWhL8Gg5wNLxPBpBeK/qTTjuE+qi9Y/ZU+jjqJRSfG+PKn02ngFGv4A
         WAveWOEnx61UwG5TldTVOgdssPQS8gUxe4ourUSZaO/s95/cmF+QL/29wYATnQC0JUMj
         FsJQCVkkcAAa5sMIqg01KN0vt5eKihYsOa27wTKCGJntb6OKqSeGitK1piAzpKNqhx5E
         DAkuPSFBcL8LCmo4pTccaa7RUTloRzrSS5ZTiJMB9U+ZqbMc2tjWOf1u11YA3YUmX/iW
         ph6UxyS61lXzGmF38T7BlreTZNtm0Yq3ewxPTTyyDgwpx1tAmulRc2NWfYrbFSRlo1k2
         utwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRvp7QfXAr/JrBcDP8ItRy/9hpkMUm429uD7EjGj5Qo=;
        b=bTKwGueKUphUQQZYtA8I8SFPIWtchGA06oOZVioopKughR7V7srbsBmWQ+AHNZigS9
         CVal7wfr1A7VhrbNOAIKqs4GJwoloEmdfqBFTqKHJmaqDZl/MY4w6XJcPALQ0Bvr2MgO
         yzXi+mdgyzYpQ5EunF86huCi1vbucNV2LB4L5CQdUnSwV/6ywQZPasQwOyItN/0Ikc82
         1+7hjsd5A3+jV3uIDIi6fZkGU3vtmcDZGnfnEPLL92HfcB4dsrmJy250B0mzKo+IktSl
         Ph7AIw3gmCasCoZrDyue/q5jsKFDSZH5X5qEHR8whqQHS7/rTEwW5N/bN3moO1IBXodt
         FloQ==
X-Gm-Message-State: AO0yUKVgS1Xc/Xi9CPuNHApSKoHSpAUW9faXhHgRe6I0XKe3em5WFQ0K
	ulWnV1qwvvKmL0SFjvDI+qCPLBs0wmg=
X-Google-Smtp-Source: AK7set+sCLoE5QTzQNMeUm11T9fMMDpH3xJHf4n5Yqpxzd/QZ4l8+Ik9I8z8Jfgn4a8KAzpXN4KJ8A==
X-Received: by 2002:a05:6a20:8b26:b0:d8:d061:96ec with SMTP id l38-20020a056a208b2600b000d8d06196ecmr6316763pzh.27.1679747365782;
        Sat, 25 Mar 2023 05:29:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/8] powerpc/64: ret_from_fork avoid restoring regs twice
Date: Sat, 25 Mar 2023 22:29:00 +1000
Message-Id: <20230325122904.2375060-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325122904.2375060-1-npiggin@gmail.com>
References: <20230325122904.2375060-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the system call return path always restores NVGPRs then there is no
need for ret_from_fork to do it. The HANDLER_RESTORE_NVGPRS does the
right thing for this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index d60e7e7564df..bac1f89501ac 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -728,14 +728,14 @@ DEFINE_FIXED_SYMBOL(__end_soft_masked, text)
 #ifdef CONFIG_PPC_BOOK3S
 _GLOBAL(ret_from_fork_scv)
 	bl	schedule_tail
-	REST_NVGPRS(r1)
+	HANDLER_RESTORE_NVGPRS()
 	li	r3,0	/* fork() return value */
 	b	.Lsyscall_vectored_common_exit
 #endif
 
 _GLOBAL(ret_from_fork)
 	bl	schedule_tail
-	REST_NVGPRS(r1)
+	HANDLER_RESTORE_NVGPRS()
 	li	r3,0	/* fork() return value */
 	b	.Lsyscall_exit
 
-- 
2.37.2

