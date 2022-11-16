Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6736262B271
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 05:42:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBr4L1ryzz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 15:42:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fC+sD3bB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fC+sD3bB;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBr3M6PKFz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 15:41:18 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so1258439pjk.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 20:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx07O4hUo8odhvUQirYJUM2J8hFmSO39h1+XVMNT/Cc=;
        b=fC+sD3bBKzlaMYUFSfrDP5eVh6wpIjNi1x3mwHJ0IA2isQFszVGgqzTVTVibAFvulv
         lWPg9XkV1kUA6f+1dcmidDL49hhzY8hcGvgf70uXdLxh1Q+vXeeQ9NbLnAB/GQOltwYB
         ueeYMHOP53HC1X4Y/yEm9FQAl98SVtKWLdGsxZTMAqV05DwfOJN7QIDz6yPMOJ7sVYKj
         W9SuTPn9YdpO/uO9Z3jXwrl/UJrfMxZztfcjQGu1QV7PqA4yPxfVxkgeY1jfhsqdkuQv
         qDF8A4Yh0KXFhqlwMffxckNRorPaaPo+Evi8yTuWDNZ7Aq/byl38cO49YNi3uL7yq0BO
         xsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dx07O4hUo8odhvUQirYJUM2J8hFmSO39h1+XVMNT/Cc=;
        b=QwhVor0RXFMwnkNq2jFBjJPfxk1BJrB7SwLpremEO6eXi7Q2NUqduODjyPTMWIbbXn
         Z5hBr0ebD5vsGAKOM6IFF6bAySIDwx2VRljeqp5oI+wSbKO4oTGulNE6fyro9Wg9g1xo
         ltwnIZ0I+MgqrmoTrjxn+whiMlzsbtziKhi9Sqb0wgb3duJn7ohs2xVwOis+RVsDBzCN
         Hhc0KZee5KYSmU6ya5iE/FhUtr/aIWQmpT3GB2/sRhU1gDbdvt7PpVtiAPpHath2dSPg
         ERpyLitapH8o2p8TwMVnd2Bv9qbJe29eVWTv66STqlROctz9G9OSZViEiDDn0MGldhRr
         ADVg==
X-Gm-Message-State: ANoB5pkV+zokQlZ9bU2CdNu2HmHfaxQqCwQ+P9zsr59dtJCHJOhzzAh7
	Yvz0/F5JqZfWq0WKP5AZdIIg/oPYyas=
X-Google-Smtp-Source: AA0mqf4Yqb9NG/h8a1EgOIBqvJC40hgP8NRZiasPLJYpo3qJl2iM2la7JPL1MVDaNgUW3mck+Sa2fg==
X-Received: by 2002:a17:90a:c214:b0:218:3623:6ec5 with SMTP id e20-20020a17090ac21400b0021836236ec5mr1817712pjt.124.1668573675096;
        Tue, 15 Nov 2022 20:41:15 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-39.tpgi.com.au. [193.116.82.39])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902d64a00b00177f4ef7970sm10867066plh.11.2022.11.15.20.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 20:40:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fix writable sections being moved into the rodata region
Date: Wed, 16 Nov 2022 14:39:53 +1000
Message-Id: <20221116043954.3307852-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

.data.rel.ro*  catches .data.rel.root_cpuacct, and the kernel crashes on
a store in css_clear_dir. At least we know read-only data protection is
working...

Fixes: b6adc6d6d3272 ("powerpc/build: move .data.rel.ro, .sdata2 to read-only")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 7786e3ac7611..8c3862b4c259 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -142,7 +142,7 @@ SECTIONS
 #endif
 
 	.data.rel.ro : AT(ADDR(.data.rel.ro) - LOAD_OFFSET) {
-		*(.data.rel.ro*)
+		*(.data.rel.ro .data.rel.ro.*)
 	}
 
 	.branch_lt : AT(ADDR(.branch_lt) - LOAD_OFFSET) {
-- 
2.37.2

