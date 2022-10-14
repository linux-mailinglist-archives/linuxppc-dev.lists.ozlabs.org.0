Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED75FE751
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 05:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpWbl0MDxz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 14:10:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UU1s5OgO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UU1s5OgO;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpWXh545Fz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 14:07:46 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id d7-20020a17090a2a4700b0020d268b1f02so6682426pjg.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 20:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUM1eVPgnKnSlmMyivyjw988SQgffBXBeBVBEebs8w0=;
        b=UU1s5OgOOf/UGsJ+dgY7k4Bqt9eS7EWhGqMdgfmKlG/3D9mhgDi95fp5I0Vfu8cVol
         1TMs8vXmnyG4YAMUNmlmPFgpm8U0h7133iJe/6veXHI0iASgOiffqk7QvluBr9Zda6FX
         s35Mvx/Fvi4Lc0GnTuzb1CK/eT3V84OrqvK00NWId21zNN4qBgSwbl9uOQvD8LLIIRBK
         N98cEFET9kS2fAX6QvfKlnhhK7tsC0YqGaPng4GpH/2JbH1337za+kQ8Svw2c0JJKugT
         BLnNiHfKd4Nc5wXdhBy/b2BFRXAGH0Lvhf3nonolI4TD/QKEDO7tcg9Wb+kY/JlRers/
         UVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUM1eVPgnKnSlmMyivyjw988SQgffBXBeBVBEebs8w0=;
        b=TCA9uMfRT1tOXEiktG3mh018lSkvYvfCDtVzTEjy9W7s9Gzs/v2pWgeOyy4Vivj/TP
         0I6k7VfD6I00tU5vaaZtGkgQ7KCFq1xsYI9bCm03Q5521DGOSCuELmmcVXVk1At2Qud3
         JsHP6OzdTgE5+C/t/bgSmjIR5GKKGTOOXrZg/aVIfO9XyVUITgtxf531HGthSYf7Stvl
         286qlzS5N7kEL1Fzjr4iWNp8UZ42AUSXEjSeuhGAxdYD+724n+3FHcqP4wOw9TdRqJ4F
         YK+KIDG5PS7GoMDmswBG5qoFaU+OrOEzjdZIRB/+cdDNLSOu+PFSn0XdCvpsthSmvbmq
         7HaA==
X-Gm-Message-State: ACrzQf0B+ngSTEkqHmBSNFPuarhRFYizgpOuEhC9kWB94p17IyR/VQQx
	jjZKgTafvksIiO+46P+vpwer9zthSPY=
X-Google-Smtp-Source: AMsMyM4qdx0RchWaAQWQ2s7FKUF8yBmE/xrmAfnSITZMOfJqtfO3+U3ByWfc+2HYzkRfROX3hh9vMg==
X-Received: by 2002:a17:903:20d3:b0:17c:8197:c4db with SMTP id i19-20020a17090320d300b0017c8197c4dbmr2842744plb.43.1665716862288;
        Thu, 13 Oct 2022 20:07:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.146.77.96])
        by smtp.gmail.com with ESMTPSA id ij4-20020a170902ab4400b0017f8edd3d8asm523443plb.177.2022.10.13.20.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 20:07:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] KVM: PPC: BookS PR-KVM and BookE do not support context tracking
Date: Fri, 14 Oct 2022 13:07:28 +1000
Message-Id: <20221014030729.2077151-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221014030729.2077151-1-npiggin@gmail.com>
References: <20221014030729.2077151-1-npiggin@gmail.com>
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

The context tracking code in PR-KVM and BookE implementations is not
complete, and can cause host crashes if context tracking is enabled.

Make these implementations depend on !CONTEXT_TRACKING_USER.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 61cdd782d3c5..a9f57dad6d91 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -51,6 +51,7 @@ config KVM_BOOK3S_HV_POSSIBLE
 config KVM_BOOK3S_32
 	tristate "KVM support for PowerPC book3s_32 processors"
 	depends on PPC_BOOK3S_32 && !SMP && !PTE_64BIT
+	depends on !CONTEXT_TRACKING_USER
 	select KVM
 	select KVM_BOOK3S_32_HANDLER
 	select KVM_BOOK3S_PR_POSSIBLE
@@ -105,6 +106,7 @@ config KVM_BOOK3S_64_HV
 config KVM_BOOK3S_64_PR
 	tristate "KVM support without using hypervisor mode in host"
 	depends on KVM_BOOK3S_64
+	depends on !CONTEXT_TRACKING_USER
 	select KVM_BOOK3S_PR_POSSIBLE
 	help
 	  Support running guest kernels in virtual machines on processors
@@ -190,6 +192,7 @@ config KVM_EXIT_TIMING
 config KVM_E500V2
 	bool "KVM support for PowerPC E500v2 processors"
 	depends on PPC_E500 && !PPC_E500MC
+	depends on !CONTEXT_TRACKING_USER
 	select KVM
 	select KVM_MMIO
 	select MMU_NOTIFIER
@@ -205,6 +208,7 @@ config KVM_E500V2
 config KVM_E500MC
 	bool "KVM support for PowerPC E500MC/E5500/E6500 processors"
 	depends on PPC_E500MC
+	depends on !CONTEXT_TRACKING_USER
 	select KVM
 	select KVM_MMIO
 	select KVM_BOOKE_HV
-- 
2.37.2

