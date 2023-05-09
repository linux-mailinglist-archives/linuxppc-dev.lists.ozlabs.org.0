Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A77576FC283
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 11:17:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFsx84LZ7z3fLl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 19:17:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=D+QrBbPV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=D+QrBbPV;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFswF2qhgz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 19:16:11 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-643ac91c51fso3050078b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683623769; x=1686215769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2mX/KBFvL6QREotKCqG9I5UDS28fLR4zwMgz8QbR4E=;
        b=D+QrBbPV30HzOHGd8afjFLYnaYDkKgiN6K900Ec6Mxg3WnXsKNn3L0myF8+cynRtFo
         XMPlL3fyTZ7HQJ4vHnJAf3AHQx/XPEvNl29yb1e25+/pD87JKDBpNxdDfBejpBz9VgVs
         RAPWIF9LgSUuOAg6OLqz3KLVGGxifQkOW75IHQZAxzRNm3KomqpSqnCMOMqNSH0txA9p
         yjVlW1pGKwDBaVwo1LNz6DDS5ZFJ6casuL9WMwUjqgSRI3imxkdeQAl984OLKqbsyNko
         Rlp0SnMOFU919xg7AnT212PvqICZzR3Lo+Fp3qoa68DTDQ8eF8RYMjqoKYUGw3aGFUxj
         2Xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623769; x=1686215769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2mX/KBFvL6QREotKCqG9I5UDS28fLR4zwMgz8QbR4E=;
        b=Gw17oQG5p/tGrAG7MdurWlxIcvCkT8EmgGCLVoS3MxEQf31OwDSuyW9h2KfZ1Ku5cA
         1ScvHSREEHwo8Xbnj7SH4DmfCq1AGkOX/AxKjAeZ4e1RcG6qm/Ep8mXA0sYc8+ytQXOL
         v130awTIYd71/k8fQfkhHzMLjJQpoIqb5k6YdlF3IeEcTL0rmu3PUXvpEgozhH8SyzPd
         JTsLOd6dcot38NcHdecKS/z66taKtIJH5AluWTYXIIZLbajVGZLAHh2WwT8FWSilb/bb
         ByQaOPs4Stwv/o+2x2lwBXaJfJ24zqLPSJjIyLmB+e84GchO8pZPPKRy4p0gQtkN/ylz
         tuNg==
X-Gm-Message-State: AC+VfDy+0mlc/jGt56XuZeIaN/L2c221RjJgpIgTE2T8iKkWFjsBp9nR
	YTgN8adjUQdMhaa5xh42njO3YyWyB0M=
X-Google-Smtp-Source: ACHHUZ6P+ie/fiYSiL+iOYLyb9XiU7hT1imfB+1CnghG7zRYBsdlVSrCFtvsePnc41O7BK3XBkuzpg==
X-Received: by 2002:a05:6a20:4c8:b0:ec:6039:f76f with SMTP id 8-20020a056a2004c800b000ec6039f76fmr12894404pzd.11.1683623768934;
        Tue, 09 May 2023 02:16:08 -0700 (PDT)
Received: from wheely.local0.net ([118.208.131.108])
        by smtp.gmail.com with ESMTPSA id z11-20020a65610b000000b00528db73ed70sm874353pgu.3.2023.05.09.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:16:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/pseries: Fix hcall tracepoints with JUMP_LABEL=n
Date: Tue,  9 May 2023 19:15:59 +1000
Message-Id: <20230509091600.70994-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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

With JUMP_LABEL=n, hcall_tracepoint_refcount's address is being tested
instead of its value. This results in the tracing slowpath always being
taken unnecessarily.

Fixes: 9a10ccb29c0a2 ("powerpc/pseries: move hcall_tracepoint_refcount out of .toc")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/hvCall.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 35254ac7af5e..ca0674b0b683 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -91,6 +91,7 @@ BEGIN_FTR_SECTION;						\
 	b	1f;						\
 END_FTR_SECTION(0, 1);						\
 	LOAD_REG_ADDR(r12, hcall_tracepoint_refcount) ;		\
+	ld	r12,0(r12);					\
 	std	r12,32(r1);					\
 	cmpdi	r12,0;						\
 	bne-	LABEL;						\
-- 
2.40.1

