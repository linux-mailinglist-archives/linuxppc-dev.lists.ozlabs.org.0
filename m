Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C1B16EE11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:32:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnbS2fwbzDq8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:32:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iuDfawHB; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRm6ZvnzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:36 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id i6so7569591pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zK70HspF/WjMUe9NdnXVPSZ+2wHuVy5B9yUFwu/GrkQ=;
 b=iuDfawHBT+WbKWOwbdUuuI0zY4oXvvVNaEXxe4GNWn6GFJrdoea0I+VrwhEj8oenrn
 y1T6K4pm8s/lGf3oRX814tNCpHhejUCclo+Aj2pSFlBGO5p5hp11knHkHS8HIAPs0tte
 WUBh1qkcSQHwA73TtrGUEmmFes+vf84vR6Xdd143UvapQQ3Y9NjXbrZA438OVOfj/c21
 IvCiOWWQOEKNNVHMe0LOUL4HgnsIi+KAgumwHrBnH/v5wcCggA2+Bfjia9JgP19cx3nc
 MLh9lQcjpX/nmV+L31bvUe7+J6OKZMzYr3aTt9GAyI6JZQH6it1PTUbmELwbV4+CNTBN
 zUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zK70HspF/WjMUe9NdnXVPSZ+2wHuVy5B9yUFwu/GrkQ=;
 b=fFx5uw9CqKmx97NfwUSdyiZHtzyaGFnMgTbDabTHKwPdxyvCnrqQQ7JpR4yoDzxuJR
 BFMF1mtAfR2LOXC4L/YmV3O1AhgPqkIwiOD9yUS9Nk62OBgWpuUcvxbxUHDQesgySdlH
 tvWPq2DULtZBE1iUiJLTZ3L2GjmX/YegdY7QYgGxeXkMUjFZ6PutkD9zscXDUl5uMbF1
 wqCkmNG1P/RJ5Zf3fARgDZdyOZI+jX/ilZo5smIJMtzHxRJhJkiQC+kj+t85rCCMLmn6
 bpwjL1p5wbw/WBYdpNGrav1R+7ZNUk9D1d/b8o7ioR+yUlW0dox0vrQjLj6kTwfdo/Gk
 SV9A==
X-Gm-Message-State: APjAAAVc058izU88ioYB5v43PXeAr7nxh0ip7oGOCZgvIT/CsQttq71O
 vBvZMWv1CSac2ZHwilw9S9VzX2bR
X-Google-Smtp-Source: APXvYqzeWI6j7rRoox2NzXYnO7mh6xoXcV6v1euLvBPnbFwlzqep3pVqohNxlKzAq2DepnQd8uHLjw==
X-Received: by 2002:a63:4b07:: with SMTP id y7mr32449751pga.272.1582652432855; 
 Tue, 25 Feb 2020 09:40:32 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 17/32] powerpc/64s/exception: re-inline some handlers
Date: Wed, 26 Feb 2020 03:35:26 +1000
Message-Id: <20200225173541.1549955-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The reduction in interrupt entry size allows some handlers to be
re-inlined.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f87dc4bf937d..ae0e68899f0e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1186,7 +1186,7 @@ INT_DEFINE_BEGIN(data_access)
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	GEN_INT_ENTRY data_access, virt=0, ool=1
+	GEN_INT_ENTRY data_access, virt=0
 EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	GEN_INT_ENTRY data_access, virt=1
@@ -1216,7 +1216,7 @@ INT_DEFINE_BEGIN(data_access_slb)
 INT_DEFINE_END(data_access_slb)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	GEN_INT_ENTRY data_access_slb, virt=0, ool=1
+	GEN_INT_ENTRY data_access_slb, virt=0
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	GEN_INT_ENTRY data_access_slb, virt=1
@@ -1472,7 +1472,7 @@ INT_DEFINE_BEGIN(decrementer)
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
-	GEN_INT_ENTRY decrementer, virt=0, ool=1
+	GEN_INT_ENTRY decrementer, virt=0
 EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	GEN_INT_ENTRY decrementer, virt=1
-- 
2.23.0

