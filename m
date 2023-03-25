Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B36E76C8E43
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJW64LzLz3ff8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:37:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pQEmmwMN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pQEmmwMN;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJL84Vv4z3fRv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:36 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so4042344pjt.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOK4ybUKKCVHpKeHMuf8AKxoCnSk6jA5Jd/sQGaKtjM=;
        b=pQEmmwMNYwdElM+lwFHCZgellVkrIBOO0IX5WJTsSWdCayyFHibzld4IV7zzoBpf1p
         FaMorEo6Lp6N3Spd7j2eYesgunER+6/aHr2XrLiZ476QAok143/noOPRDVXZrfVeb/h7
         cLRRpzGCmxRyc1GB0G0qYcilucThlSxSh28OL3XiHbqnvISGy/nc180TJwuy8i/hlfuU
         UQf10eT4RMweoBzmdgOMTOnaUoMO0A6k4wDPGA1iV1FoBfke1Zbbdk1PDkc/oxzCq5zf
         g4Ek4RUFx/f9blsZRQ2/KjvNi0viKnEDEsLhTM7TrXikMZigFIz7F24s66WA6UKjQlMo
         oWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOK4ybUKKCVHpKeHMuf8AKxoCnSk6jA5Jd/sQGaKtjM=;
        b=y27cjwsKPu9+zY1/uWpjfHhMVMjFMtEyJYOFDO8vk64Vqaf6d0euhEL61Tq7YW19tc
         XrgZnGMwDp6Up8sKyN3uNLAHgFb3bSpPyPD8Hk8Yg/UUTl1ENuQxtR2++RsWZD9KzLZz
         E3glmMfO2iqsOe7BqzoqN7l2Jwucyi16FVBO1hz7+MXflxJTQKmSUS71GwsMuJjqK1Tm
         ZQ0uIGOBFZRKu0oUonO1pIZxHy+Ck1ph8QEdeAtg/m7028f+hJRF43s+iKqA0XeEa8Hc
         CTzbbyKYhSjJPYv0Fb6YgnOZqBGb8eN8SjeEbxEuyg2jIdvvmZ557UqkZAPwoXJni+sS
         HM8w==
X-Gm-Message-State: AO0yUKWeCYoVYaMYtqqgiNc89hYcyT5P3JYffuag1zEm/gmtjbwgEHGb
	ItPvjbrTjBaBneqchnb4BPHmm3Wf//c=
X-Google-Smtp-Source: AK7set/hT5Cp2zqJ+YJn/8f2Dvj8WnkIam+lJcbQ7Rk1dv792ajO7Bqgs0IqW9RDYZ1LdKtqUvGcTw==
X-Received: by 2002:a05:6a20:b191:b0:c2:b6cf:96db with SMTP id ee17-20020a056a20b19100b000c2b6cf96dbmr4914437pzb.39.1679747374586;
        Sat, 25 Mar 2023 05:29:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 8/8] powerpc: copy_thread don't set PPR in user interrupt frame regs
Date: Sat, 25 Mar 2023 22:29:04 +1000
Message-Id: <20230325122904.2375060-9-npiggin@gmail.com>
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

syscalls do not set the PPR field in their interrupt frame and
return from syscall always sets the default PPR for userspace,
so setting the value in the ret_from_fork frame is not necessary
and mildly inconsistent. Remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 4140b25f489f..52e18cec865b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1812,11 +1812,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 				f = ret_from_fork;
 		}
 
-#ifdef CONFIG_PPC64
-		if (cpu_has_feature(CPU_FTR_HAS_PPR))
-			childregs->ppr = DEFAULT_PPR;
-#endif
-
 		childregs->msr &= ~(MSR_FP|MSR_VEC|MSR_VSX);
 		p->thread.regs = childregs;
 	}
-- 
2.37.2

