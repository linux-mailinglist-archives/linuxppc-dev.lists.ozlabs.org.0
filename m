Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2037C0239
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:07:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Dj5MuKcn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4j4M4T5wz3vXW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 04:06:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Dj5MuKcn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4j2V06Hzz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 04:05:21 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c737d61a00so46479095ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957519; x=1697562319; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8bTrDTugOefVQ1gZ31VUL3xKHXyC/9v3hCQTi2FF0M=;
        b=Dj5MuKcnsnwD5SHGo0xCM5OrFd1E6Nl4PKZdmyrFZquB7wEDVFVwv0QSfO8aqrbL15
         SpA7zBQkXloqOT8sLGfLq9z24x463mAL4H1GlynIMksChGAaDAqUo8qvyf04aKmhr6ni
         QYmTUEIVb3O1SpgRw2/seHEGqRNOgx75E4xAE9IEDWdhIiwrOEcsRXFWzdilHbSvF2HE
         xxigz1bO4O1fR6P6FqaBnpRtnTMVDs2k9gj8/+1PHW4fDtStNYMAPnTmfdSJxb0skIPU
         +/lNmbSUWj0mN6PDXRFwzkk1p6OqudeqCVfoN0mCyrSaJcwHsb+Ip/hzq6h1hpPrmhzZ
         uwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957519; x=1697562319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8bTrDTugOefVQ1gZ31VUL3xKHXyC/9v3hCQTi2FF0M=;
        b=idIE0dOl/CIhh09pIPyC/UTjXTdKc1ZsZQSe/9qG8wuytUfiAjxcWsv9m/WjJhPaxq
         MO8FpGQICLt5oWtBJUH24KyBTM1XB0Pi8oG7NrKW+YAEvvAkx3ezBbbPCLPccKZAbplz
         woH8Zk5hjxR0tc2ZBNyoTgdSzu0H+/XW3lOgFsrfjhmZVlU2rNYnpGkU3UPPy0QFmxou
         SBU7h7AElBkLU0zt2EZ5uVl7rt9YMM2QZ42uOdZNo4nJSaznQNnENpreKnTBTTLV9BA4
         /z0nXvn7IWXJe8vRtyvAyLtIsrhEHt//5Nn66qh2r1/PVCHopm9Evtm9ZKiL6kuV9HdM
         Xbeg==
X-Gm-Message-State: AOJu0YyXJBWa7Bz71CgX7yQ22Xm4FBScce+ZO57iQyidNeu7dBIZ3oVN
	Urvv1bPL2Jz8ewIDHDqnKSGDHw==
X-Google-Smtp-Source: AGHT+IFL7+0d+NQPD7h5kg3nJxB/J3VP1OkPOJXtOKdl/WfOH7Q9zbTJf6UkIcSLTxobmxIUYWGImA==
X-Received: by 2002:a17:902:ea0a:b0:1bb:598a:14e5 with SMTP id s10-20020a170902ea0a00b001bb598a14e5mr24227444plg.43.1696957519183;
        Tue, 10 Oct 2023 10:05:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:18 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 1/6] RISC-V: Add defines for SBI debug console extension
Date: Tue, 10 Oct 2023 22:34:58 +0530
Message-Id: <20231010170503.657189-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010170503.657189-1-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We add SBI debug console extension related defines/enum to the
asm/sbi.h header.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5b4a1bf5f439..12dfda6bb924 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -30,6 +30,7 @@ enum sbi_ext_id {
 	SBI_EXT_HSM = 0x48534D,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
+	SBI_EXT_DBCN = 0x4442434E,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -236,6 +237,12 @@ enum sbi_pmu_ctr_type {
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
 
+enum sbi_ext_dbcn_fid {
+	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
+	SBI_EXT_DBCN_CONSOLE_READ = 1,
+	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.34.1

