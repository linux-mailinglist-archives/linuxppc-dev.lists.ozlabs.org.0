Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C78AC617F6F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 15:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N35f24NWsz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 01:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=jMtJfzvs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=jMtJfzvs;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N35d43kgQz3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 01:25:10 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id v1so2996514wrt.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj/ZFbn3Zm8rxzcKsJGd6yFucy8YocyT0mV+oXpe7Do=;
        b=jMtJfzvsVyM2XNkO7dOnrzsj5bFsNMWPr9qRIuRvfNs1tOIvR8I1IP8JVx8tLG7Dep
         v7Un2NZW58xBtWmwuCjYH772AaiwgcpVC21xqkhn0o/tmaNi7buIljvNSAt6F+cUJUMm
         ty0TFwUWGldw91R8cET10BSTY/z5J4prX7tkwNyHo6zddMYQimrfEvNM/sLXJ4IbkhDZ
         m9cFvv72Li0sU8oIZulB0WLbKf4nulNrh7pWjefMCTf4HMlXuiYiEY3FH49w0tZgWXlu
         BN1Vbu6K5RGrqIIVUiu2VYCjwuaaGz/52VTavOGbRx053ikoFEVXHhj2bCgUlI2OBbQL
         U+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fj/ZFbn3Zm8rxzcKsJGd6yFucy8YocyT0mV+oXpe7Do=;
        b=iErh8tSGtS5hnGRSqfPnKJD+PZxfjVpX2r1MzGnKZaSWCGZaN//wL1CzAKNTxg9W+e
         HVPF3/Z/p3u1fqRip5LOGgnTTgCQ6bEV/VJQeBi0phensosuwinL0Pqja1M6Q/k4B2Vx
         mPBCO8Pq85U5Is080C4PIyQ2wQtZbUfoQuFpgLSKjyrGv1JUlUdmHYSIVI5URLcQ4qEt
         qil5HrFoGdOpLxiozSzVMn1sjE5X70j4eadLReKIn6C7oHX/TMhI0f9rTKybgJo0GQ8O
         kRNw270YByfzqkursPm/tz4F4aOub0Y1bRP6OKxuS6JEiO7AfY2d85ENr9NZ9wc27cYb
         trZw==
X-Gm-Message-State: ACrzQf3iQXKt7TCAj8K4RRHCyac7K3R/8mgAzGxrN5Jy02XWnwqp2kpX
	i4GfnkGoCpONEahGySIT+HUunQ==
X-Google-Smtp-Source: AMsMyM7Fd10uROzTNx7lsAW66oPjI1uph9DNvAe559a3qkiRN8acm3Iyt5ChbLPnm5wfe14jlQcTjQ==
X-Received: by 2002:a05:6000:170d:b0:236:6aa1:8a56 with SMTP id n13-20020a056000170d00b002366aa18a56mr18858226wrc.302.1667485507181;
        Thu, 03 Nov 2022 07:25:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id c19-20020a05600c0a5300b003c21ba7d7d6sm1348138wmq.44.2022.11.03.07.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:25:06 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] x86: cpuinfo: Ensure inputs to cpumask_next are valid
Date: Thu,  3 Nov 2022 15:25:04 +0100
Message-Id: <20221103142504.278543-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103142504.278543-1-ajones@ventanamicro.com>
References: <20221103142504.278543-1-ajones@ventanamicro.com>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The valid cpumask range is [0, nr_cpu_ids) and cpumask_next()
currently calls find_next_bit() with its input CPU ID number plus one
for the bit number, giving cpumask_next() the range [-1, nr_cpu_ids - 1).
seq_read_iter() and cpuinfo's start and next seq operations implement a
pattern like

  n = cpumask_next(n - 1, mask);
  show(n);
  while (1) {
      ++n;
      n = cpumask_next(n - 1, mask);
      if (n >= nr_cpu_ids)
          break;
      show(n);
  }

which will eventually result in cpumask_next() being called with
nr_cpu_ids - 1. A kernel compiled with commit 78e5a3399421 ("cpumask:
fix checking valid cpu range"), but not its revert, commit
80493877d7d0 ("Revert "cpumask: fix checking valid cpu range"."),
will generate a warning when DEBUG_PER_CPU_MAPS is enabled each time
/proc/cpuinfo is read. Future-proof cpuinfo by checking its input to
cpumask_next() is valid.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Cc: Yury Norov <yury.norov@gmail.com>
---
 arch/x86/kernel/cpu/proc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
index 099b6f0d96bd..de3f93ac6e49 100644
--- a/arch/x86/kernel/cpu/proc.c
+++ b/arch/x86/kernel/cpu/proc.c
@@ -153,6 +153,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
+	if (*pos == nr_cpu_ids)
+		return NULL;
+
 	*pos = cpumask_next(*pos - 1, cpu_online_mask);
 	if ((*pos) < nr_cpu_ids)
 		return &cpu_data(*pos);
-- 
2.37.3

