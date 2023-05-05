Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFBD6F7DB2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 09:22:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCMZj0L1lz3fNd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 17:22:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Dgh+6lxa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Dgh+6lxa;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCMW621djz3f8H
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 17:19:14 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso1675970b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 00:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683271151; x=1685863151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BP7sv56sSZVGYKuG4xdF4PTVbcSuzFuYTXq7ORXVJsE=;
        b=Dgh+6lxaNt69po5UAFCR8OvROisLfJhCFtpyahI7tJN/Axn2QJtM5GUn79EFBVAmLv
         RKE67Pp2hUQBvaIVIKHdNFy+1Res87wwqG31JZvXlFyeMF/zgJiJZP0sLUBj38Y6bRsY
         d451s9BjOMSMdmA7NsqDC32sgRQ/3f/9tdOmeMQ7j951Z54VgglfqHXPUB+rwohLQ1vO
         BdnjRIf1Y8JdcLlQsSAq/lPgNrSHZIpQLYlMrbehC7Wk2nQoE0gr231zHicMO+hJhK1u
         HqD5j2tpDkMWV/oAh43ibsJw4nkfqzHD2YvNnMr+7u9t1bx4pMNAIJ6m+OLqjAMqayH8
         /r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683271151; x=1685863151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BP7sv56sSZVGYKuG4xdF4PTVbcSuzFuYTXq7ORXVJsE=;
        b=JvsZgLAl2R9y07PWHLuW1pjlyX3EdfdqfjW64yWZDkQ5T6wtj/f94VIy7HeeTtTGow
         3LTcr3fY+eJKC9Xggprx42PdFc4fidPo6wHEhPbdrxBDDCA0aHtlrjbI9hqCxzMj0Fl1
         uaftIAQPUAjONc3P3+iD5pn/F/BdoGpctoLYI4BXA3cS5hBXoH2nvXxZqpLtRmoR5Kei
         sAbi/r56PPYu+qC2sy/UtHjzFvzgl+Q58uaPetMOZnZN2HXP3D28j39RUnmOaKhKUyag
         ILD6mH51KVwmFXVgxS4IMHtpzDvoAOLbRcj1jugajx80MvvtXE6lRRnRBKm5Xr38rUCM
         hkKw==
X-Gm-Message-State: AC+VfDwflQH18iPlV2AiU8JyQ9SyVpBaHvkStUT7omG6bBhErRkvSXl7
	1zVyoegqtMbm8ZCUqL+3XRDJiwkN8yE=
X-Google-Smtp-Source: ACHHUZ7Yh1vbFzObnGUfxBNOle6i9YBZybq/qvPQLph5lvSIyS/GrCHToVwjMO9KdGvfsdQhZRTSQQ==
X-Received: by 2002:a05:6a00:1a09:b0:63b:7119:64a9 with SMTP id g9-20020a056a001a0900b0063b711964a9mr1275944pfv.16.1683271150875;
        Fri, 05 May 2023 00:19:10 -0700 (PDT)
Received: from wheely.local0.net ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id i10-20020aa78d8a000000b00625d84a0194sm915384pfr.107.2023.05.05.00.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:19:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/64s: Remove support for ELFv1 little endian userspace
Date: Fri,  5 May 2023 17:18:49 +1000
Message-Id: <20230505071850.228734-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505071850.228734-1-npiggin@gmail.com>
References: <20230505071850.228734-1-npiggin@gmail.com>
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

ELFv2 was introduced together with little-endian. ELFv1 with LE has
never been a thing. The GNU toolchain can create such a beast, but
anyone doing that is a maniac who needs to be stopped so I consider
this patch a feature.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/elf.h         | 6 ++++++
 arch/powerpc/include/asm/thread_info.h | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
index 79f1c480b5eb..a26ca097d032 100644
--- a/arch/powerpc/include/asm/elf.h
+++ b/arch/powerpc/include/asm/elf.h
@@ -12,8 +12,14 @@
 
 /*
  * This is used to ensure we don't load something for the wrong architecture.
+ * 64le only supports ELFv2 64-bit binaries (64be supports v1 and v2).
  */
+#if defined(CONFIG_PPC64) && defined(CONFIG_CPU_LITTLE_ENDIAN)
+#define elf_check_arch(x) (((x)->e_machine == ELF_ARCH) && \
+			   (((x)->e_flags & 0x3) == 0x2))
+#else
 #define elf_check_arch(x) ((x)->e_machine == ELF_ARCH)
+#endif
 #define compat_elf_check_arch(x)	((x)->e_machine == EM_PPC)
 
 #define CORE_DUMP_USE_REGSET
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index bf5dde1a4114..bc5d39a835fe 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -183,9 +183,13 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #define clear_tsk_compat_task(tsk) do { } while (0)
 #endif
 
-#if defined(CONFIG_PPC64)
+#ifdef CONFIG_PPC64
+#ifdef CONFIG_CPU_BIG_ENDIAN
 #define is_elf2_task() (test_thread_flag(TIF_ELF2ABI))
 #else
+#define is_elf2_task() (1)
+#endif
+#else
 #define is_elf2_task() (0)
 #endif
 
-- 
2.40.1

