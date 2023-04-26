Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C94F6EEDEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:01:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pCS0LgZz3f4L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:01:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ItAx6qP7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ItAx6qP7;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8k68JYz3cF8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:02 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b35789313so4856786b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488740; x=1685080740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuyxNALPej8sJTQ1TenoUjVJzKsIrDxX3tSD5Kst8qU=;
        b=ItAx6qP7J/79PAof4jDx4YFB1fd3cP3KxfZuvpV1U++3FjiZ+zEyvqPyjZmD8mRnsw
         NuV8PKP26JW2lF4WduaDnmiWGUlsqovfgiey3taFqb80dHICqvK/p8v0XuU1xlc8IbHZ
         PCdJhgi+ZfLF7RfBBOnCy0jyNHAWYSKA3E1v2L7VB+Zi4Ti212ZGSHwb5IB1AEhi9f5a
         cbQKCGhl82Ui5A/ig1yPOOwTY3LZGGPHnGxOkgRgMQ5bIZwVZeC9nUuCJogMdtxTr9Dr
         x5Ppy7hK94UKe5L5bJFYEw+D06H0HHyk6qMd1O7lVO7oq+dy9b9tjPyiKf5BUrDr1zlH
         sE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488740; x=1685080740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuyxNALPej8sJTQ1TenoUjVJzKsIrDxX3tSD5Kst8qU=;
        b=FhuoPbdFjuEIAHOAJmMBbokP8VUIkZ/EK3+ytdnow0fWZ6hYVRZV6mFyk33yJBNFPW
         MtYEfLEe3f4w6dBRdfl4N7IHcHVN9Xcl2KMooB5Qf3w10LOuu0kJo3OAHI2bPXFv+qkm
         eF3JQtKFlYu0CLptUpb8135ZdKQrBZZ7fhjiiuLp+hYNfRVozEV0nrt1m77G/nVu/+DR
         YpygxOVnFl9GrdYyH6HnFRDXUSrLc2W1VH9zTOMGzwnk6q+WcnvuApOTisnG91+9TWcP
         kkmXU6cImFbxFQc739qzbPxwdEaYGf3JcUPee3RXdedpGtitxZ8dBRjEHR2fqvucau93
         08QA==
X-Gm-Message-State: AAQBX9eQYQTLD86EB1ryn8qiU0mYmhmXtMAVpbDdICc6Yly2CjgPWbdR
	iIpOn2hpVRoN5aIg9vszoiLLkFmCexYC0w==
X-Google-Smtp-Source: AKy350Z3m5OvWbGRs59ey6377RrOthRObuvCnFBxOX0Ujuve1SA6/42x1aHJbDEfYWOa8FREe+//Ug==
X-Received: by 2002:a05:6a00:17a9:b0:63d:489c:971 with SMTP id s41-20020a056a0017a900b0063d489c0971mr28963240pfg.24.1682488740248;
        Tue, 25 Apr 2023 22:59:00 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:58:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/9] powerpc/64s: Disable pcrel code model on Clang
Date: Wed, 26 Apr 2023 15:58:39 +1000
Message-Id: <20230426055848.402993-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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

Clang has a bug that casues the pcrel code model not to be used when any of
-msoft-float, -mno-altivec, or -mno-vsx are set. Leaving these off causes
FP/vector instructions to be generated, causing crashes. So disable pcrel
for clang for now.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7a0f25a09759..261e9453b43c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -8,7 +8,12 @@ config CC_HAS_PREFIXED
 	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)
 
 config CC_HAS_PCREL
-	def_bool PPC64 && $(cc-option, -mcpu=power10 -mpcrel)
+	# Clang has a bug (https://github.com/llvm/llvm-project/issues/62372)
+	# where pcrel code is not generated if -msoft-float, -mno-altivec, or
+	# -mno-vsx options are also given. Without these options, fp/vec
+	# instructions are generated from regular kernel code. So Clang can't
+	# do pcrel yet.
+	def_bool PPC64 && CC_IS_GCC &&  $(cc-option, -mcpu=power10 -mpcrel)
 
 config 32BIT
 	bool
-- 
2.40.0

