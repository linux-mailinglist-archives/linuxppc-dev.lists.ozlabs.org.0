Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6ED3095D9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:19:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbtR3H8szDqkG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:19:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MfHiXtSE; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZM86SjZzDrRt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:28 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id q131so8008469pfq.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9WiMTD9C+QXV2s9iIq9yKjJvbj4geefnWEN4+rMDBPY=;
 b=MfHiXtSEutBYsm1Ng831KuiQhhmtSE81pY/1KfFe+TDvL3qGakL/CZZBaqTGrNP+qF
 qgtEu9EY7WpAnrZxaTZLf1FlTYfm1GpfciGpp6krrkOxckSez++ZJSjdliWgk7VpefP/
 fxOHj+iOzHI6JLzCYkCBB4/4ufgqp5kU6FKnj4wf1X5JivfxDUi0ZxgWoHNcmQpZke/d
 HGTBrxyVJYVsPLXyh2lNzhPAYg7T8iaX/MCUi3cvtT4lk8lR2dvoPobSktaXfW/rwbfp
 cNX1OW6GnnUY8x4BVI/xgcvWb8e2YqTQlsc+pdyx31ZBBHM9dKldu8KaR5B9DoTbPIng
 GM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9WiMTD9C+QXV2s9iIq9yKjJvbj4geefnWEN4+rMDBPY=;
 b=QQbKs3kkTPo+nz47yIHBFndTiciok/PvkkMWnaUnutU/pTpV33c0mqwFt8UoY+2G+4
 8jm4oBgn0GdqkDvX6J31O0/SHx5d2T3oxDKMoIOPsfZdAJrRBjOj29H718zoPDFJ2xCk
 YMYCg76xCvhx5qPlcXWRsKXnppC/tJ49kkMGrTgkVFAke027sfI1MUz92hhQROiW2ACN
 Va53vVBFZJQo5185oLdh2sD4GSxT4bzh8RJOdYvj6gr9WA5aocFKFPpIrTB9K4/5ROpg
 5jPRDUsDPeDDKsn4dBLumgbzdrBIyA0uyJzu0fsmKQqw4nMX0WYCiHEDcx9wVk1q+sir
 OiDg==
X-Gm-Message-State: AOAM531iv4aqvE4F8dPS2o2zVlwBDHdeLxrAPUcgvssUEwbDo+8KNYPB
 epMNHCOxmcmb2kcxa+r6709T63M1IRw=
X-Google-Smtp-Source: ABdhPJxhB347ogwC0a0EHUj2DhXVzJ4Yd+8lxrcwz23D8bVHYP/Tb4gz09WHSorEb2SgklWNE647EA==
X-Received: by 2002:aa7:9d84:0:b029:1bc:cebe:a15b with SMTP id
 f4-20020aa79d840000b02901bccebea15bmr8351900pfq.57.1612012225704; 
 Sat, 30 Jan 2021 05:10:25 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 25/42] powerpc: improve handling of unrecoverable system
 reset
Date: Sat, 30 Jan 2021 23:08:35 +1000
Message-Id: <20210130130852.2952424-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an unrecoverable system reset hits in process context, the system
does not have to panic. Similar to machine check, call nmi_exit()
before die().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3a8699995a77..f70d3f6174c8 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -503,8 +503,11 @@ void system_reset_exception(struct pt_regs *regs)
 		die("Unrecoverable nested System Reset", regs, SIGABRT);
 #endif
 	/* Must die if the interrupt is not recoverable */
-	if (!(regs->msr & MSR_RI))
+	if (!(regs->msr & MSR_RI)) {
+		/* For the reason explained in die_mce, nmi_exit before die */
+		nmi_exit();
 		die("Unrecoverable System Reset", regs, SIGABRT);
+	}
 
 	if (saved_hsrrs) {
 		mtspr(SPRN_HSRR0, hsrr0);
-- 
2.23.0

