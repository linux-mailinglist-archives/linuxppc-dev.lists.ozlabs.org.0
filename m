Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 133EA251802
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 13:47:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbRzt139LzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 21:47:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fb/tommi; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbRy91nCPzDqV1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 21:45:34 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id g33so6654709pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sdc3PosHFBwTYpEgono2hXMYMTHCEM+aagGqhGLifz0=;
 b=fb/tommiNV84wRN+Sjg2NPVNv6ZkpXBKJovyWRtp6EgUfuRZ9aX+dFZV0Q/wV3GVwz
 nclMYgFkwintJ5ssMpwnpH2+imlwarvupnp3ul+l3xSpEtzAAaI60Q2sNpwS4T18POZX
 VtGCn4MkVTSKqG6iBX13/DX90RxyK1aI66ctxyJpMmo6X1mdPF4B6qE1mtnuCL9gDlRG
 JpMNp278GtL+O6EgCMs8clj4YoMJ+sbSOz8Iuo6EzJnZYKIjkS3JWSD65bk+i7g6WW7c
 3Dg8g1wUxnwz1hbFh18FAXUu7VHtPxjvj02DriQ0e1r3zJfx2aLPknBjiKKWw+svIsjx
 87hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sdc3PosHFBwTYpEgono2hXMYMTHCEM+aagGqhGLifz0=;
 b=O0UOGrdF5lxPOw3xBFIqjCdVz5u0I+p+w2EGLsiMgrmpLp7vwlJHk1r8ekHHJEbQom
 utTybe2byn/yIhwnGw1nvUAy/YuIIVlfxPyA06jSI1b/MFyShbZF643icb/t5cesOnyE
 lpTGq9bsTtC8zfnlnu2TjjmwqQrtnb5TUbWfT0Jefwq07IyXBx8WYHEXBo0FiXESwJYz
 KNd5a+gev7xtO8SZv+kzEd01F4HNzhZA+2lOqMsy4xNlIclOvDN4dAosZpZgz8WQYaIO
 FUOBJtCxAtemyENdtQ1OLqif0xlLKtbjAixZqb9dhfGZFI/Fs68ammbFp6J6rq+6T50B
 kKNQ==
X-Gm-Message-State: AOAM530/w4TP4tOi8m6O5nDV7pc4jOdCFwVGv0pmOiRu0cApc7NHa2jb
 Fe+4WE3cF+tOXG8q8h3pqwoXmXKDzq0=
X-Google-Smtp-Source: ABdhPJxrDgPRn7RGgK4KJJahtqL+Pt2gMEKN1rgrA7Es3kSifHXT7iLcl5P+DmN3yupYVaCPQMGBRQ==
X-Received: by 2002:a63:f00a:: with SMTP id k10mr6561668pgh.76.1598355932498; 
 Tue, 25 Aug 2020 04:45:32 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id x4sm14694811pff.112.2020.08.25.04.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 04:45:32 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Update documentation of ISA versions for Power10
Date: Tue, 25 Aug 2020 21:45:07 +1000
Message-Id: <20200825114507.13297-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the CPU to ISA Version Mapping document to include Power10 and
ISA v3.1.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 Documentation/powerpc/isa-versions.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
index a363d8c1603c..72aff1eaaea1 100644
--- a/Documentation/powerpc/isa-versions.rst
+++ b/Documentation/powerpc/isa-versions.rst
@@ -7,6 +7,7 @@ Mapping of some CPU versions to relevant ISA versions.
 ========= ====================================================================
 CPU       Architecture version
 ========= ====================================================================
+Power10   Power ISA v3.1
 Power9    Power ISA v3.0B
 Power8    Power ISA v2.07
 Power7    Power ISA v2.06
@@ -32,6 +33,7 @@ Key Features
 ========== ==================
 CPU        VMX (aka. Altivec)
 ========== ==================
+Power10    Yes
 Power9     Yes
 Power8     Yes
 Power7     Yes
@@ -47,6 +49,7 @@ PPC970     Yes
 ========== ====
 CPU        VSX
 ========== ====
+Power10    Yes
 Power9     Yes
 Power8     Yes
 Power7     Yes
@@ -62,6 +65,7 @@ PPC970     No
 ========== ====================================
 CPU        Transactional Memory
 ========== ====================================
+Power10    Yes
 Power9     Yes (* see transactional_memory.txt)
 Power8     Yes
 Power7     No
-- 
2.17.1

