Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AB87D0981
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:26:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=dDhrR0ar;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBbkN5SSmz3vjl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:26:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=dDhrR0ar;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBbd31sdKz3cgB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:22:15 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b2e73a17a0so377621b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786533; x=1698391333; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XKdexmGCdd2bnnrJTDfux86dDbyR62+1G32W+zioUE=;
        b=dDhrR0arpSdqAd0LnNOJ3RD3TO98Ss/1fekCH//qGhyBUh7P898/idNz5OKZvg6biM
         CkfiX0NddR7Os9DVei6K6P4z8CIeGv16acQfYHPWASjAoNe7wW5NV+tUCVZ4bzpP9NOw
         hkzxEi3RRCJfqFq/cNoz7ZcNOH4HDmkZfRWWubQef27qlwhjMqQ860TaK5KWfwfJKa4o
         Z0UmjBKUQqDg8nJ2uYnDLKXLOmJhM5H+kI9Ta1i4VgNEpWDcfc4bpCRBP5UwHanDJocR
         1j0nsV6zGxKxUu+aE01pxuzmf4mlRbaKfGktcFWm9806F+63xe9Fj4Eg1qlX7OoUkiB3
         8+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786533; x=1698391333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XKdexmGCdd2bnnrJTDfux86dDbyR62+1G32W+zioUE=;
        b=FSAWxlUxp6Qnp/YX7CjamldUi4DuxDdwsoQ2LJ1X+zJJvjHI1O4yQbeHScvyB3xfLl
         4tZm+yjbwOOhBfqY/UucRauxSPgThjk0rZXYRW64ysEKUljeXD9LAnuh69ZG6sVQY3k/
         jfdz8JAFA17A/tM39bbk2lmkNTPJQoD6VitqQv6NjnNHgaop1eI3HGBhDiJ+RyINAgET
         79rqtDFO3BfSxjOyn7RvtBnZWkMxjD422DhmiP6KiAg6by1s6awMat2kiob72Q9uXyba
         jX40LO9rU986EELbzL73+3NIy5JRYqRyOGJgBOI/85X2Dyoa6Os3P/VE0jLFsY4RakLU
         T4pA==
X-Gm-Message-State: AOJu0Yyl/IRlWrIovmGP8psWyDjR+9ZUkLoWqqXXV4C5aXxY4Mb48rb1
	DzQt832BaNGyFGwSowre3VklYA==
X-Google-Smtp-Source: AGHT+IGNA3teY62UcK8wOWxlnmVNiOGXjjS4KNoIU7oF6NdgPgGX2+CnnNq3uwbgRObNWcOANMq+ew==
X-Received: by 2002:a05:6808:144d:b0:3b2:dcff:9e54 with SMTP id x13-20020a056808144d00b003b2dcff9e54mr1358519oiv.24.1697786532716;
        Fri, 20 Oct 2023 00:22:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:12 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 5/9] KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
Date: Fri, 20 Oct 2023 12:51:36 +0530
Message-Id: <20231020072140.900967-6-apatel@ventanamicro.com>
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

We have a new SBI debug console (DBCN) extension supported by in-kernel
KVM so let us add this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 234006d035c9..6bedaea95395 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -394,6 +394,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name))
@@ -567,6 +568,7 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_DIS | 0,
 };
-- 
2.34.1

