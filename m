Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D475E5FF1F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 18:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MprjV5R4zz3dwk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 03:01:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=TWAL9EKR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=TWAL9EKR;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MprfW4bXjz3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 02:58:57 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id b2so11461837eja.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFKG/UoJdjvjZL4a++TyBLwRn5J9ab/1o+9LeC1+Wdk=;
        b=TWAL9EKRVGNsLjKjhYh/mC6I8/1d/oatjVnsDN9OWuvFem7UzU02ZKqRzzv3m+6WNJ
         XpbFkMRKHd8kMuyJPFPJ2O4coxdaDl4faAyVqhStpaSUGYq7BHI1TWK1CROOsrCSLceS
         oCa0J4Fufc1QFYIqSNT7YYCBkHCuQagy+1h8ytDYHkttIN15LC4NsO9AFDHEPqj1jTqO
         4aCSqLM2Nu3stjaVcqAwPtMDAHgS/shNxwcrymDs9yg/ism0dyRjPiNJywK3a2Ao/iyX
         qrOsHJe4Ab8pwfjJp7mLQWu47/wJG/qQKDv8bTBXEBTHUkrCbt724EXqhc5mXve0RXVF
         Q5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFKG/UoJdjvjZL4a++TyBLwRn5J9ab/1o+9LeC1+Wdk=;
        b=Rq/PFMrczBFhpmRik0Prj1EXzF4QqYwTwDlxTcP4mgmfgvlPeBS/yNCq6wqTEqwbo7
         cb4MhBRvKWNwu977x0O8PK4rqIDQXGTCzQTX6JS47YPWYZWIyMkFFpn/ASQA4m9MqD+z
         zfGBtPWrcUaE/j5SKR5BXDrDRl4W2fdVPBq91q1dvqpwjdPF5lV+6SHdZabM8XIr//3+
         SFjfBuZdKgolOwoRX98oah8KOFF5/LUybSuRG1G80aO5EDk9TjDqWeG/8+QJ5aW7eNtr
         0uxOoVndll0BOO3VHdXuH7fejaZQa6SE5EGxIvhuUp0W+LJRI/p0LAh6FbFT8wxz4LTp
         kOXw==
X-Gm-Message-State: ACrzQf3XvDrkvrx9XkXONkn+dzj3S/oA7g7cRJpOekyQtRyX/gwCuriz
	UIHy9q7JyNrCQi7mqL2mjy1cYftL9WrQSQ==
X-Google-Smtp-Source: AMsMyM7/e9vDSoMxdhGGaaPUCS7n6lh8z7ltnxJPYvupdtdDP7MiBbMySEaXciThld3Qry9um9n4rA==
X-Received: by 2002:a17:906:4783:b0:780:5be5:c81b with SMTP id cw3-20020a170906478300b007805be5c81bmr4152627ejc.76.1665763128360;
        Fri, 14 Oct 2022 08:58:48 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906434f00b007806c1474e1sm1686070ejm.127.2022.10.14.08.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:58:48 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] RISC-V: Fix /proc/cpuinfo cpumask warning
Date: Fri, 14 Oct 2022 17:58:44 +0200
Message-Id: <20221014155845.1986223-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014155845.1986223-1-ajones@ventanamicro.com>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-type: text/plain
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Anup Patel <anup@brainfault.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
start and next seq operations implement a pattern like

  n = cpumask_next(n - 1, mask);
  show(n);
  while (1) {
      ++n;
      n = cpumask_next(n - 1, mask);
      if (n >= nr_cpu_ids)
          break;
      show(n);
  }

which will issue the warning when reading /proc/cpuinfo. Ensure no
warning is generated by validating the cpu index before calling
cpumask_next().

[*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Cc: Yury Norov <yury.norov@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 4d0dece5996c..5aa0ae8dd115 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
 
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
+	if (*pos == nr_cpu_ids)
+		return NULL;
+
 	*pos = cpumask_next(*pos - 1, cpu_online_mask);
 	if ((*pos) < nr_cpu_ids)
 		return (void *)(uintptr_t)(1 + *pos);
-- 
2.37.3

