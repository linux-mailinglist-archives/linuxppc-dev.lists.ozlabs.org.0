Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B37D096C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:23:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=R2snwUVH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBbfS1jz7z3vbj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:23:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=R2snwUVH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBbcj2hVYz3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:21:57 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b2e22f1937so319988b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786514; x=1698391314; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFjlFx01Ut+IIk7lMz+iwDuvVBUbWHCR3u/gBbk/FU0=;
        b=R2snwUVH/YSVi/sRC1GpWubfS9H6+XcoaKvZiq/75Sj82wGtiGfbFODDM+ttUUGzOg
         4Bb+FtRIpsposUma1JQEW5Mp7zLa8+S17RJSiqdqJmvFPXa0JMry7r/zEQR70+28iFgS
         x2gdycRnRZGcPPFMoXS6U7WC97k8adnAtGG5iwYaltu7hnpkDUaPtBn9KvvCeQn9g5tj
         Gy4/wH9RlXjZ2+EwMLciS/BdPy97DqaghnA7xWQkuj4iGOoaXW9uRhO9wGcb/qS3GzVG
         3pxia93a71Gy+Z7khb3Z+RC1wSz26MlwY0bhmwZFJ8Y4e1JrKMCKYJd1ZQajDHhbXW65
         vAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786514; x=1698391314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFjlFx01Ut+IIk7lMz+iwDuvVBUbWHCR3u/gBbk/FU0=;
        b=WMzaZh9vztlT7pSpoDsn8BH8t0EAvTucJT9vtYF5gt4GbHJOH+38AupETLgN5XeyZy
         Md4puhUYW0rW9U45IabnofkvbA3OLz8w1ovDUDd488DhFTvA8Y3un2nqGRc5cJSEBX0i
         yuzXGZVlL8Y+kspQnjwfJJSYocO0BeAZfolocBVc+SkJq48oYU4JTq7XxZfaFha1l53O
         u7he40g8fxEnWvonoO3JzlYG3tBCFdQ4NZCqmRQrQchgexIGwp6b/Y9DanKQWX8sSC95
         yU+VXJ2PDEo6gdLBt9m6JHD5T2py4BTglLd7w6REwREhf9e3F/mdjSxUXG+1rHuSTeNz
         Zcfg==
X-Gm-Message-State: AOJu0YxmBAG/mE0Ah1ghSuyAQ/P0IpWmWPADXP+DLlU6/Zex2dcSa2AT
	hS+/3UnhGN7eNWS3LQoYQDmPuQ==
X-Google-Smtp-Source: AGHT+IHCf4SRFvcjUaBZbUoLW1qmUD5qW9WnhX5EFjNLnYxx3oBY2eRFWdyPRUuwwRReyZ05UhdEZg==
X-Received: by 2002:a05:6808:15a3:b0:3ad:ffa4:dfee with SMTP id t35-20020a05680815a300b003adffa4dfeemr1187937oiw.51.1697786514419;
        Fri, 20 Oct 2023 00:21:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:21:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 1/9] RISC-V: Add defines for SBI debug console extension
Date: Fri, 20 Oct 2023 12:51:32 +0530
Message-Id: <20231020072140.900967-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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

