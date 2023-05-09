Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162AE6FC284
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 11:17:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFsy46Z4sz3fM8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 19:17:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E61D3B2b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E61D3B2b;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFswF63XBz3cKV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 19:16:13 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-643465067d1so4223638b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 02:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683623771; x=1686215771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQRVEMdxg3bJ3RT58FLQe3azlS0hXknq+d2s1ifzqZw=;
        b=E61D3B2b5EzVlMpJ3qNe+XkV0VIWGv6szlrRvG3gNeeQkoqvocSjKXmkw3n7UP3jq4
         elArqE4qnHyPug0OjAht/quWvc41KF/y5n3OAfAfm7dKS//JcI4PJ0Dd/dEzbhs26rf+
         gF8J+DvqR7QSFHiC8i1SiVR0lUEEs1hfSv0yThCgLGI2bw+k+ZbOk/x7UleuPfR93gxL
         +VzB2RY54DVeE4z8LkevKUigBKgFskHlskhC4l1wQfCLrWA27RxLps+3D72/lO8waEf/
         YWRHsrKmSMOUi1jhCbzWTjV20ouCgO6Jl2bBfw1DmDRyraQfRcm5kUSQ8OflZYRWhBEs
         5zgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623771; x=1686215771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQRVEMdxg3bJ3RT58FLQe3azlS0hXknq+d2s1ifzqZw=;
        b=BrPDHm8QxdQxethynn5D1+0a8R98xTudQt3T+rkihPi2fjOX09fi1vwYDUkLQvYegf
         JL3njSULqSPO6G8efsuQkhtk1Bj+NkXVIHR22r3Qyh4K9hpFpSh0Mdk58tOyXJZ471rJ
         fuRYUDymf4HIKmLJb1IfcG29kShIO3mJ/XYfp6ROFYp24Hy7NMuUzK1bQn4yGuVCAaW5
         Uj9dAi9hTy9euVEWuOUr08F4nVSO0LpQFVTbWUta/7jCo8Jr7xBFJiOaPKkKNMX1Stkh
         K7R28Ku/Ul3QmtCe7rvl/5fWPkWbhHIN7EylZWdQ60XFbglt64M3e7CGEeMhfVPhpvs9
         trXg==
X-Gm-Message-State: AC+VfDzGHVXzjqcM7pCAvEU8ejqLFCfK3pnJOMPPF9xH5MUACt8vZZ7W
	GJEC2QQE3u/QafDL4QzqDtvifhtfVs0=
X-Google-Smtp-Source: ACHHUZ6gz9Srf7ZoD58Q1isbS5QQ/3u4aSYkbOYFr3KFJrOIzllaD0uEF35umHXiJuywh/Rbbt65rw==
X-Received: by 2002:a05:6a00:2e0e:b0:63d:24c0:1223 with SMTP id fc14-20020a056a002e0e00b0063d24c01223mr18809572pfb.29.1683623771619;
        Tue, 09 May 2023 02:16:11 -0700 (PDT)
Received: from wheely.local0.net ([118.208.131.108])
        by smtp.gmail.com with ESMTPSA id z11-20020a65610b000000b00528db73ed70sm874353pgu.3.2023.05.09.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:16:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries: Remove unused hcall tracing instruction
Date: Tue,  9 May 2023 19:16:00 +1000
Message-Id: <20230509091600.70994-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509091600.70994-1-npiggin@gmail.com>
References: <20230509091600.70994-1-npiggin@gmail.com>
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

When JUMP_LABEL=n, the tracepoint refcount test in the pre-call stores
the refcount value to the stack, so the same value can be used for the
post-call (presumably to avoid racing with the value concurrently
changing).

On little-endian (ELFv2) that might have just worked by luck, because
32(r1) is STK_PARAM(R3) there and so the value save gets clobbered by
the tracing code when it's non-zero, but fortunately r3 is the hcall
number and 0 is an invalid hcall number so it should get clobbered by
another non-zero value. In any case, commit cc1adb5f32557
("powerpc/pseries: Use jump labels for hcall tracepoints") removed the
code that actually used the value stored, so now it's just dead code.

It's fragile to be storing to the stack like this, and confusing. Better
remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/hvCall.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index ca0674b0b683..bae45b358a09 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -92,7 +92,6 @@ BEGIN_FTR_SECTION;						\
 END_FTR_SECTION(0, 1);						\
 	LOAD_REG_ADDR(r12, hcall_tracepoint_refcount) ;		\
 	ld	r12,0(r12);					\
-	std	r12,32(r1);					\
 	cmpdi	r12,0;						\
 	bne-	LABEL;						\
 1:
-- 
2.40.1

