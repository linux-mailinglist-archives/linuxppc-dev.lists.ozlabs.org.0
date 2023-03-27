Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E10A6CA47D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXfd1PhKz3fSJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TVsFZfDG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TVsFZfDG;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXbn4BY2z3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:45:41 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso10929794pjf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4ZWQOUypcsgCXXVPbKnNZqOOjIZdRA7smKekWER4aI=;
        b=TVsFZfDGtxV3DA4IKHsUd2IeCSVQNYKpAU1vanVIPTYoQR7OVETUUI6nYiLPxESWCT
         JDP6QugapIdjn8jiXCsrDNhAusZdolSkshwmrXRwO0BLSTnHfUU8742HK3P4Yu2F0IvY
         kdGlcWvT7H3JR+5J2Wuk4+FXEfV9dDgjcrb4kiqYbQ+K16XFKT+/2EcGEWH4GrU7NZdO
         UvQIZS3v95j8ryuHZuNmlVcp0OX+yUxIcr7cs7evQSVaxF5Jp480zduvAD3EwJeI/iMP
         1Nc56kQRHyASPzsxwrM/p5al6XgaeVMMpyi4bw7cIBndZZ5/XIpvn0zd8/Jj21xpxqLt
         Yb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4ZWQOUypcsgCXXVPbKnNZqOOjIZdRA7smKekWER4aI=;
        b=Pd9AZiaG16aj22HY1+EO8IhhxRXJRGS+lhLd3GgzZALKYgKNcmuZU6YY8ybDXU3bCW
         7fQP5UvBeznmmas1Edm92YjiErwea1AOUszXcmSRKYYHBJJ6I5j4DhTYbcGPVML1I3RC
         BdWtkbmdwWjXATFTERdVDYEeBnYrvswCbcY+pIRzreI73tXkl/0WKbNfbX/CXFaMk7oY
         /DX5hkP/A4bvOyb08gttQ7ACqb/hglp66YNmXI4T/cQQDLU3S28U60hS/DZmqi0zyh3c
         hqwQvzywt7g9rEMHNASrw+mKlfQfUVyyU2IBrBev38uwUSgdrhmYoHwcOaWRArPaN5f6
         IkzQ==
X-Gm-Message-State: AAQBX9df9xQ9HJ/v4CE71iLpRbfA5BQGRj65ELxEr0IZB/98PVJ8DePx
	qd21KJUy40dBVKEtnWWmtIU=
X-Google-Smtp-Source: AKy350b9+S4Php29L7XVK+EMmzBMHiDm9zO4F8aYkliY9fJDpX3S93CAYQiwwAiyO3co3/+pzY4f9g==
X-Received: by 2002:a17:902:e5c3:b0:1a1:98a9:406f with SMTP id u3-20020a170902e5c300b001a198a9406fmr14242489plf.67.1679921139262;
        Mon, 27 Mar 2023 05:45:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:45:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 02/13] powerpc: Add local variant of SPR test
Date: Mon, 27 Mar 2023 22:45:09 +1000
Message-Id: <20230327124520.2707537-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds the non-migration variant of the SPR test to the matrix,
which can be simpler to run and debug.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2:
- Don't use a new group for local SPRs [Thomas review]

 powerpc/unittests.cfg | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 1e74948..e206a22 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -68,5 +68,8 @@ groups = h_cede_tm
 
 [sprs]
 file = sprs.elf
+
+[sprs-migration]
+file = sprs.elf
 extra_params = -append '-w'
 groups = migration
-- 
2.37.2

