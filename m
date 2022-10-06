Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF75F68C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtX71cYYz3c6T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:06:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BP436Rx/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BP436Rx/;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtV90nPdz3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:04:32 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id gf8so1821061pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VUM1eVPgnKnSlmMyivyjw988SQgffBXBeBVBEebs8w0=;
        b=BP436Rx/7HlFlBKp9DKt7FQC93kCaULu6N6W0eIpzflTFKb0aqZcewegAjiWyhJ43D
         UomuZlgQW8kREr8oSznqfXaFo83ZhaY0Jx2YHItM6qr/hm1nn3lcVudk+h8cP1/KMgTb
         YD+0mRfDn+Z0dO2QE8/zqKr9O2Fpu09x+9Mdu2W/UKu9sIR1zZz6+J7IWU8KSCl2dCup
         tEKdlNOyB0Sz1Oex2ov5ZJrEzW3f7PuXGzWxyjr4NH3nrSxmkImuIAzO27aysCrQNdzl
         3r4QJoT34RN0g9CG+DE+qzLcaz7UwDmTaBNcs1NZM+ddtZhEBnra+1PT6Kvwk2N7uMvV
         B8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VUM1eVPgnKnSlmMyivyjw988SQgffBXBeBVBEebs8w0=;
        b=5Q954eA3eM4nHj23gs7/89r3dzaey9ooCOuP5FVfLgrkAhH+eu8enATendLgUtIt5i
         csHhSruXiAlIJe/TQ0zopOzx6pqoqJpH+GzD0QpGgEia40fDMnXOKWTahp0Rl/Q3tu4m
         KDM0RpF7dhUTjXGRuKdZUVRn0jXrQT60UQMzeInn2/ku95/qZ8mqIDju7J+OEK6zlT2o
         rjtFzgbASLe7I+upDBa3HaPJF8BYfTYQN77yWJvuuI91LnOcwYx1ZmllAX9HrEq7uPw9
         j6sO1w0yzWihv+MQRwJ2DjXyyKWZVEnrG6iA7JzjZ/8PXtiBldYbyMi34pYsvR/3Vz23
         c8aQ==
X-Gm-Message-State: ACrzQf1INy9s5bSRiMIc6nvZM/O9ksNVqfGjnxm2ttrBit3GvYBuqLtI
	uFfjLOzgUTKTbti6/2Zhmem4cFcM8Yo=
X-Google-Smtp-Source: AMsMyM7rxEDwH1V8yPUg7SmXD/2c3QidR2Le0RrJnopejk9NM0qD1rwl8Hakz+5XuvnVwYuRktn+Zw==
X-Received: by 2002:a17:902:da8b:b0:178:3980:4597 with SMTP id j11-20020a170902da8b00b0017839804597mr5005817plx.113.1665065070170;
        Thu, 06 Oct 2022 07:04:30 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902bb8100b0017bf6061ee4sm4602901pls.117.2022.10.06.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:04:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] KVM: PPC: BookS PR-KVM and BookE do not support context tracking
Date: Fri,  7 Oct 2022 00:04:10 +1000
Message-Id: <20221006140413.126443-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006140413.126443-1-npiggin@gmail.com>
References: <20221006140413.126443-1-npiggin@gmail.com>
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

