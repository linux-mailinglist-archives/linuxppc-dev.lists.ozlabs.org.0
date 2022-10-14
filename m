Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3355FF1E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 18:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MprhV35QDz3dsq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 03:00:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=de2qcklm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=de2qcklm;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MprfW4tTCz3c6r
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 02:58:57 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id a67so7403185edf.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBIOqGjmdzThiZsnnbTdUiYSPQXS/qp/QRUJHndogxY=;
        b=de2qcklml8jKYdhJlyXqmJXoz8FYGzMVRLfN9JcOUqf4UOLuKCrWZr59qwP/CI15i8
         9ZEYt9iqHJUORqeLDasCpf2TvKXJ2eNiOMML8Fk+bz7YKFJbV57Ez3yS2OMYxbifi8aU
         80V2z5mOPzJ5j+SPiaK/ExtA7pvzSXkVFgQy9BgPDzmgfE18Klp1ebv/IKnNb6TVl3x7
         K0gO3P8T9E6LTR2oS1WZnI3pbS2vkD6iCSFlqd/rinFyB9u6Ftb/GsYDL097UX4vn1na
         X5w9kGup7pabQp9pwZ84Krxhofd+fyywuWkx0d61FPGLmHqmWuc2PbVNpdjodZPMfLJV
         6NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBIOqGjmdzThiZsnnbTdUiYSPQXS/qp/QRUJHndogxY=;
        b=2YiYsGeS9LD8hObW7cE5SMagjdieXejUa7G+9bDyFqGXefYvWzKxxO/xN839f7hfco
         m6SEof4mIaAgKdFhby7kjng9QZ/TF0N1pDsNvYypf9jsx2qsyMxcS32TtbkSvNtDjxt6
         sHPjf0lf+X8/QhW8JrTOSJ91lniDAPwu4DEY00hOWFl7HbZ06Y4Ux8Eh6YsuxBpUD1dd
         M7ENeuJ3Mb/woqElJFiK3ES6S3TigShMEdboTyC7oTR/GuKia61S698SvTz3fIHgdZs6
         14g1EZS1hesrXhC8/3Moe1ufx43MUVhmiP+/I33nJw4bQJOOwMsUAtBvU87RL4xRRnT3
         Sg8A==
X-Gm-Message-State: ACrzQf34TYj+ap3bACZdkkel7R3CvHet4AKrVQbSCylcZM4YdSmGkPSc
	SRCiy/4YEYkC/TNlMupNbSo0Ng==
X-Google-Smtp-Source: AMsMyM7AeOygOXkM1z/GTKaGU+3a1Uh1fQyGWBmDx0oj1luEK/7mcX83iQG4d2XLgbn9xXhJP10WDg==
X-Received: by 2002:a05:6402:3485:b0:45c:d688:6848 with SMTP id v5-20020a056402348500b0045cd6886848mr4672473edc.279.1665763129826;
        Fri, 14 Oct 2022 08:58:49 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906300c00b0077a1dd3e7b7sm1746796ejz.102.2022.10.14.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:58:49 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Date: Fri, 14 Oct 2022 17:58:45 +0200
Message-Id: <20221014155845.1986223-3-ajones@ventanamicro.com>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
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

