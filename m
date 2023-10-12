Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 902FE7C6484
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 07:17:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=LPEEO8Be;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5dFB3Zn1z3vd7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 16:17:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=LPEEO8Be;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5dBV3xsDz3cB6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 16:15:30 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-565e54cb93aso431466a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 22:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087728; x=1697692528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=LPEEO8BeaXnfumq5pF0udNN8OUbq0mlXgMZGKXlOWSWKGDBFYxZ47TkWc8LgsXQZZl
         ZFpZOImIf8O7/vNX72orJN6pDxPmS74hXlTl6zFxmKAcln5jjONiTbUVZMLg2BDyVY+w
         D3bjXYaZB3iXK3oWmey1hM+SU0IZXqKDx5R63ldPcoYoRW38frVrd3IuwkidN0RKAroN
         vB83iuy/hxlsoGlgxZoOXFbNuRJ2RATBncxl7c6ewt2HDlG2Po7G7E5ppBowTcis+1Pj
         DkshoZKZloNxlnwJDkrOFKPc9Aq7pR7JeeR8tzP9KgxHat6AHB2Jd3mm0FTDmGY3nSkd
         35+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087728; x=1697692528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3lhlJZP7U6sfVX0rlDY0S8d2x8DhhVnWXy5WEJL0wg=;
        b=P6i3tigDi6LeRDaAaGZ7PGTAHpFAZ+6JbbUD4BvHoqVWswAHoRpIJs08H400gno9Xj
         No/8PDVg1ioKB36CZ5hSqZyJ39+l5ZhcfiR15xtqEyD0hVK3Yuz8jfsDuhUH2LP52I/u
         IfoICW2bfJdP+4H3LzLXjGtYbzJLCjb+/uT9YluG8yQ8Nz4c4CuuPokloHFsUU62OPgm
         MNOiflh43pj6wODFEefqKLgkusKTg0Vmy8lIiqPbv3MkXKVu1cGAvaNRTgG/jIedF46M
         9WmL1vQoElUs1bWr2QEE16QBKZ4FxJ677gQ3k5uzuRB8JI0F8b90RmBteduHuBIHG8FO
         fCZA==
X-Gm-Message-State: AOJu0YzvC1oRGHbYJzH01oeGRFES58RvOUqhqZIcjLBcQEYSwSTDfZza
	eOZxxlerXPEYOT8l2bRtjTOOrg==
X-Google-Smtp-Source: AGHT+IEYTYmKd3tYlh3LiHGeR+Se06zPGfuu6PsLv0v0PYM+oZ1DNY/YAR7he8NCW/RMMx46gl3FeQ==
X-Received: by 2002:a05:6a21:7784:b0:173:318:b1ec with SMTP id bd4-20020a056a21778400b001730318b1ecmr5209664pzc.35.1697087727987;
        Wed, 11 Oct 2023 22:15:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 2/8] RISC-V: KVM: Change the SBI specification version to v2.0
Date: Thu, 12 Oct 2023 10:45:03 +0530
Message-Id: <20231012051509.738750-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
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

