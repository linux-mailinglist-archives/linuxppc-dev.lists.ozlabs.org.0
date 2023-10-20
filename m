Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 815447D0976
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:24:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=bUOxJAeN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBbgY2zgfz3vfq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:24:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=bUOxJAeN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBbcn5c6tz3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:22:01 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so450689b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786519; x=1698391319; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeCDV01Cfgp2ua0LgBWyAWr2dv9+xpkaYGG6VewjHJM=;
        b=bUOxJAeNXqkbfrK217hGvC5h+Aakkv0Jb1V3rfibtOa8CvUfGFuw+6v9ImDpHsDQ10
         6+etKalkPylXRytaoW+aLmdAu7Mso4mP5NZfdeWgxd0v6PVIQXSoVeNpMl3R/4WEera+
         kXUHeo/9/v0y7cnYKPR99kR2kj65dFrsvMr0Pz8W4fsn+Rvcq/F1x1Bk3iRW/rAbVOXu
         6R7TFqHD8mw7LnmolmSRj0jqAQ7i/IIjodlddcLcF6FWyBLlZmehAwa+tjL+2UgazE5H
         2liUCVP96G7YbMoPi3jpPDfy6YdC8fRNQKJjwtEe6hg3IOy78WNgUzIER2uUM8Rxq98N
         mt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786519; x=1698391319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeCDV01Cfgp2ua0LgBWyAWr2dv9+xpkaYGG6VewjHJM=;
        b=YTX/JEUFBlG9JEk93ub8m5jgRDr2iXLs5kCzbWXD7Lm6O/1PXgszdCPFKqMJ70J9aZ
         +vzq0oX84pQmO5ssSfrbFvrd8artl+w1f9fAzXtRwyYz2NHVNS5Qj0c5tn+/BNB5BjJS
         P5GE/KDei5HhbsbyUGq+DXcP3fkrEd3NLDEmSUMKv4Gecl2F+AQ3mUmuxToh6/sA9EUs
         9sPcT/dQD1y37kvu1n1VKNSYAD2CDUrlAt/XThsswHFnS7sElcS5hyyvJoklv0c8QUPy
         0Ia8r46rJ6hu7HfEwQyztXX69cHckoi/t+OQYC+2fL+3xStTzrIFhj0BQLyRZTIlYTGD
         6AMw==
X-Gm-Message-State: AOJu0YxaE8kdFJv4Cg0MOVAABKh+XfOdHQCJlZBzjnN7XJQJyd4k1X7l
	TfVQD0nkLVRgt7GDQkvtx+722Q==
X-Google-Smtp-Source: AGHT+IHW872RFsEW0M8OTGxKAzWnTo/8F6Le59a6yN6WSYq8GfyXYOW1jHmUi8NhTnVPlD9i+6DmJA==
X-Received: by 2002:a05:6a00:b8e:b0:6be:4789:97ba with SMTP id g14-20020a056a000b8e00b006be478997bamr1029478pfj.3.1697786518893;
        Fri, 20 Oct 2023 00:21:58 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:21:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 2/9] RISC-V: KVM: Change the SBI specification version to v2.0
Date: Fri, 20 Oct 2023 12:51:33 +0530
Message-Id: <20231020072140.900967-3-apatel@ventanamicro.com>
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

We will be implementing SBI DBCN extension for KVM RISC-V so let
us change the KVM RISC-V SBI specification version to v2.0.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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

