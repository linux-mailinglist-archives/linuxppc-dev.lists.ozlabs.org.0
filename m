Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647A52BB87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:41:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Df46s5Yz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:41:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ACA4d9lp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ACA4d9lp; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Dcq1pGpz3bnZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:39:54 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so2074390pjh.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFl1HhVES07t6DHx5+P8BFykBmF4tP6j1v+lhHoGjME=;
 b=ACA4d9lpWMlsi+mAqQJY/htJX4ILL6Sv3YEM8/dHEd9lVqta3VTZ8r4NHHosRUIZ0+
 UeAO98+uK+ekOQ0vEACH/EciYTnscZEPNmv2YLJLFlOQ2+16FS+FbH5Nwo84X6xE7zsf
 CmPZUasmyAdWO81+CRb0bKHO3yLREpe/X9RYMowbgoJLnDFmZ7shd/qOfvlblJ6XdsRp
 284TUtz2vTNaEXc7NlHWq2UBDRi30QIMTORkhreBBMmxjT3QGudnfqYFKODQSDzE6sBC
 Mt1BvUtmG0OJa4fp0narPvbWEuejL/Smq4t0dfn6sAW+j7LfW4GiWHaMHbI2+FDMRL/H
 Tz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFl1HhVES07t6DHx5+P8BFykBmF4tP6j1v+lhHoGjME=;
 b=P89NgmxqvOBIXCk+hcLwc8Awr1lXpFWKV6eISwT1eAmmKyicUGjOz8dp6UmRLtjhz1
 lhJFy6UqKB9e5rT0ypLw/tjoTkrob9P0sD+DwZysppJmAVL1cmVWePUf9Y9EHh9gnPBe
 BmO2ve8SGBvdAQ0AaQxfLuXXVoWffPBO76ywz10w5GgaaAAsveqlnbMLkWEJqPTLwLt9
 RV/UEO+9ZkwnYQX5SqLO8qXYdB4ynEt4tgIqaRM55/g3Ji5NPd7UCaJKsafIkZL8CBvs
 gSrlh3BuAKUdVCz+d8sdTUQkjseKGPvJnr+7aThwXhHV9TFgF+rI7/giGq6MF+r3UpQO
 E0Dg==
X-Gm-Message-State: AOAM530Ba3yn0yp186SL0H1N94HFofM/99dt78TFYoW7tuGWQZxwoIxd
 0A7pIWe7b4CSw99FyLYKsENF39i1EvUq/g==
X-Google-Smtp-Source: ABdhPJwaKrU4A8Pa61BHO3K02ZaBEyPiELkuS3f5WkQ/b31RC1cVyVbPA6lm/6ces6YrPnZmkmxh/Q==
X-Received: by 2002:a17:90a:1f4f:b0:1d8:23d9:de1e with SMTP id
 y15-20020a17090a1f4f00b001d823d9de1emr66972pjy.42.1652881191649; 
 Wed, 18 May 2022 06:39:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([193.114.105.210])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a170902e1d400b0015e8d4eb209sm1677511pla.83.2022.05.18.06.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:39:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/pseries: Add wait interval counters to VPA
Date: Wed, 18 May 2022 23:39:32 +1000
Message-Id: <20220518133935.3878954-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518133935.3878954-1-npiggin@gmail.com>
References: <20220518133935.3878954-1-npiggin@gmail.com>
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

The hypervisor exposes accumulated partition scheduling interval times
in the VPA (lppaca). These can be used to implement a simple stolen time
in the guest without complex and costly dtl scanning.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/lppaca.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index c390ec377bae..34d44cb17c87 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -104,14 +104,18 @@ struct lppaca {
 	volatile __be32 dispersion_count; /* dispatch changed physical cpu */
 	volatile __be64 cmo_faults;	/* CMO page fault count */
 	volatile __be64 cmo_fault_time;	/* CMO page fault time */
-	u8	reserved10[104];
+	u8	reserved10[64];		/* [S]PURR expropriated/donated */
+	volatile __be64 enqueue_dispatch_tb; /* Total TB enqueue->dispatch */
+	volatile __be64 ready_enqueue_tb; /* Total TB ready->enqueue */
+	volatile __be64 wait_ready_tb;	/* Total TB wait->ready */
+	u8	reserved11[16];
 
 	/* cacheline 4-5 */
 
 	__be32	page_ins;		/* CMO Hint - # page ins by OS */
-	u8	reserved11[148];
+	u8	reserved12[148];
 	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
-	u8	reserved12[96];
+	u8	reserved13[96];
 } ____cacheline_aligned;
 
 #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
-- 
2.35.1

