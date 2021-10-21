Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD04359B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 06:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYlJ1xy3z3f9Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 15:04:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=foe2Owo7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=foe2Owo7; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYXL2TbMz2ybM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:58 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id q5so24382431pgr.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBfegSip8uJBm6f+7E6aCO88l+bAoSzfsmhWLvtW/G4=;
 b=foe2Owo7Aa8fszcs7sC+IkUEdBOuXAwOyqnk/CG56hDTnV/DNKgNMFaQKtifnpx1NV
 ugyNeg+hVU3uQtZbBNer8GHAE9klidOXwaBfbPaup7DyzXZUT2WkwApFQG06eHZO/8Ym
 +c9ICidnE5Yz/YJjiPUprgJiyP4Z4pjtc2YrhgeMwI7dLUPj8r5bKHF96iP+fDyZwfix
 7/oonQC+Ww1YgpnFpFeXL5HR1fDqGbEYuEWO+O16bJVJvUAB04fVUlSSyD6VZf0ZuVUd
 BBZ7TMUW7gJHKbRvYZn7L7p5CT0pg27eHvVUTCARAplDosvpdji1CeyDcat/QvnDz8fZ
 wKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBfegSip8uJBm6f+7E6aCO88l+bAoSzfsmhWLvtW/G4=;
 b=kiJGyM4/lJH7gY8uUV2g5C0sDlDQtIEq+shoBWGI+4WnMr5bG9sNErgksCdddF8prF
 qv6dO4+s9kK+T4oRu9HWnYqiS1eACXu/Q283PI/N8IgMCbP3P36OCan+fs4EUEgNOkNL
 dR/odn6YKNFSRk0pZR87ghB2SdcZfX+IkFgCpVEvWxQA00s9A5te8ldFMRGBre1BXODO
 UuytW+JJllzsDl1WSfE1dNS8jFZoXXgIhMRA2othOti76q+GyeWqmkpKSsWWo96+3rrg
 aDEQ2bN6djrRNQVjc2omDmtjhPtg5fSIdGT2GTTuM4i3PQSyADjw/TctmOBbTVR53FSq
 L4uw==
X-Gm-Message-State: AOAM532Qn4/N6yLZgYGlnlH72fVj3WnyAUh2cYa1H1TEPh09ZRnDKzDc
 X9KwcOzJ6YndQ6WZSIymI2V+61hVQsg=
X-Google-Smtp-Source: ABdhPJx8Ikt4SkeTJhM1CIv0dXX9iJ0+uHTwqaQsotDdC5AYe5uVZTUZ2o/v+SiysnW23ItVzJVPsw==
X-Received: by 2002:a65:448a:: with SMTP id l10mr2499780pgq.313.1634788496018; 
 Wed, 20 Oct 2021 20:54:56 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/16] powerpc/configs/microwatt: add POWER9_CPU
Date: Thu, 21 Oct 2021 13:54:16 +1000
Message-Id: <20211021035417.2157804-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Microwatt implements a subset of ISA v3.0 (which is equivalent to
the POWER9_CPU option).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 9465209b8c5b..6e62966730d3 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -15,6 +15,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_PPC64=y
+CONFIG_POWER9_CPU=y
 # CONFIG_PPC_KUEP is not set
 # CONFIG_PPC_KUAP is not set
 CONFIG_CPU_LITTLE_ENDIAN=y
-- 
2.23.0

