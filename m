Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35517C023F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:07:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=jXi5t0Sv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4j5J4fKLz3vfY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 04:07:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=jXi5t0Sv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4j2b4Bssz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 04:05:27 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c63164a2b6so418685ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957525; x=1697562325; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=jXi5t0SvhNcLkDrE8LTFP0zDyATo2U7TrKHBdtj8Z+r8RgoJlYAgMMguJu8uf4ESmq
         GEczg1JqCrrAoY1Npwd3QXvza29/R0bll4TFlHyYRbXL7QOVUeV4cXnMRtvdfJdMwgDs
         F391dv+QWYVTfuGZ7cns3QCw+iX/NbpWfgW59a7S0vemaUPV++Ex74KOJdLcSc/XzYZE
         kbBRXWcWijbTUAXwyPunQAYC2nBGopEhBVMcWfZzoI/5RiyBDBOUcGlrHT0ch6bvJiSO
         JiIUTuJ5CZaAf7ta2ajEglEFy/AgYnXvwf2/XA4zjIZilz0axeO47j/kUKEGgZxSpcEH
         508g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957525; x=1697562325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=ODGuh1ciRVvif9xedmUmWXBAMvEYbdnAfPMBAsaKQ5IqrmQAYYS9d9tFO9VDQgAC7m
         BQnSrYw6wxGSqaq+PeGyvkk99hGl64PU7w13heM5npx9jd1eerdbJ/f2vLlpCvH0GgZH
         qiVBvvKtzWlZlguUjiHlQj9CdqTJfrqwuVDa7dGKN6I69gazmC9FVDMtYFTqnExTyBEs
         fjBvNYSuXwRLgVXG9i48dUsqatq3E3W1Dq4BewjKTarF0u7YjaNW60OUQ60IdQpejMBX
         SenB5y6crIT+/6cDCyTZSHwtFHkgukEs8z/woP1B66pDOHmK+fuhdk6bfO1qc/FreYIf
         1kXA==
X-Gm-Message-State: AOJu0Yxib/3CfTSg2e0RKRFueq1lCqjWObw1bwwXVFIp9UnwOPCkV2Pm
	pf3v9r9cGJqCJ0uoIZiefU6syQ==
X-Google-Smtp-Source: AGHT+IG+mbNrQmt2GEYzZRkORnAD/EBo6KEPWJykcTVHm9mjjc11kbkmKKhIYwMGoWp8ra4yRmdzoQ==
X-Received: by 2002:a17:902:d352:b0:1c6:de6:5eb4 with SMTP id l18-20020a170902d35200b001c60de65eb4mr18397397plk.13.1696957524587;
        Tue, 10 Oct 2023 10:05:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:24 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to v2.0
Date: Tue, 10 Oct 2023 22:34:59 +0530
Message-Id: <20231010170503.657189-3-apatel@ventanamicro.com>
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

We will be implementing SBI DBCN extension for KVM RISC-V so let
us change the KVM RISC-V SBI specification version to v2.0.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index cdcf0ff07be7..8d6d4dce8a5e 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 1
+#define KVM_SBI_VERSION_MAJOR 2
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {
-- 
2.34.1

