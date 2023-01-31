Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CA683331
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rrn2x9jz3f2w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 04:00:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EnaxC5oT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EnaxC5oT;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rlt6dCPz3bWw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:55:54 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so1435162pjq.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRvp7QfXAr/JrBcDP8ItRy/9hpkMUm429uD7EjGj5Qo=;
        b=EnaxC5oTj1L/P2FmQOMTzj0xQfl9U8wHSS9J0JWyr7hEGtLfxJZGDcwoKjtws/Thwo
         BMIdOUMvlgogRSrgsdHvhbJn9qvv8/paDGcTg7sBEHOqkVFZCV6TVgT/9a+88BXXUZjG
         bUSMgCn5Wpf0p+ePlBh3zYAORVjIOUlQe0XCJyB0MRhMSF54qDBAz8ouQBJIZfODlEhz
         4MKbBlgRlIIZAaoH8/WG8TJi5OCpVJZf5gyidsSLaE4c/YG6yMKD2xaF4wxRulPr6lKI
         bUy/VyG5IS+xPV3uITVeQHL6jv/QxTr/I+M24C5nv3usaQOpwWOuO+99bwtQi61aSkHQ
         lQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRvp7QfXAr/JrBcDP8ItRy/9hpkMUm429uD7EjGj5Qo=;
        b=fNwntNyBdaYJScvI7pRtECeRGI51HxL4LcyZIhAPwY5k6w+jNh+dxrsYHtVBaUkeGm
         7M6LJw7D+QUL0PWvT5P+BTGj/UQSN1ErGcHJRvFN+oC4h/xbZJLQsu80VK5JpSslDbeb
         4ueIfoydt4lNB560XGBfyArRw6/2R43ntdTUg/r/8nkNZodZhZTJVIP9jYlO+9TmFuyM
         dZagas35CNyU5ly2FCOvvLufi1+lEC1Dc+Bufxo1Dz+CxjCMFh5fBrWhE4z8bP2vmtCS
         jQiX4KGzje66vYYe7KIESYtOAyVIx/ciVxLQ8/h/wiIVQk14eUaH4ltKnfiPHDXHXnhK
         bhKQ==
X-Gm-Message-State: AO0yUKUphEtWP0LsDb+CNl5TFS2/3SC9QpqbUbmv8J/tSQrzLc/cH99d
	Bv2mWpR5BZwTK2LOxdzFkqS19BXp5JQ=
X-Google-Smtp-Source: AK7set/1pJBGvlEBPIy7uZkV/zlXHYuoOyBWQstkVVtT8Rq10ZCbtw7gQD9wqGhHDgp3QWYBGfMP8A==
X-Received: by 2002:a17:90b:3ec2:b0:22b:ed00:1771 with SMTP id rm2-20020a17090b3ec200b0022bed001771mr29560020pjb.35.1675184152159;
        Tue, 31 Jan 2023 08:55:52 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/8] powerpc/64: ret_from_fork avoid restoring regs twice
Date: Wed,  1 Feb 2023 02:55:30 +1000
Message-Id: <20230131165534.601490-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131165534.601490-1-npiggin@gmail.com>
References: <20230131165534.601490-1-npiggin@gmail.com>
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

