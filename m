Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA15FF1E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 17:59:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MprgT4dT6z3dsL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 02:59:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=m5i1o0Ap;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=m5i1o0Ap;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MprfW509jz3c74
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 02:58:57 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id d26so11445830ejc.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5eO6i8yGqM/Qk/helghde+sK2B6uuy7iGWdi59LQv0=;
        b=m5i1o0Ap34XB2wlP21XgYIqsVDRRQOqNgXMX5tJzWsaI6hGrAZN9MXRzGc93zF2XPA
         8L/SLRgslFncCk0nXLKfro+LvVAuBiIJEkGi+kku5MAuwTr4Av+VkPDyus9j5yCxKY0e
         YOtAgl4m9DWHQK3UYRyVu1beWyQGVeOVcZD55vwQwp4fSb0QhgMCnZzRu0uhrRUo1Tvq
         XZgdlHZK3gCz7g4TIGW4i3ZvbPG7Gm3XysvcL00yJwc2GO4L3l9DhN608jkbddOb/W9j
         f6nCuDr1Hx3UpL7i6FB65/PdJkLsqhTn6pdhYB+vtA5dMZT/TwoMfVhWXkBkx0/mc7XG
         dKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5eO6i8yGqM/Qk/helghde+sK2B6uuy7iGWdi59LQv0=;
        b=OP9lFS930HnkcH/T51E3HrBgHPmNzytzexwE1F8ApeRQp5JZFig6CLVJ1NfqEBTTnK
         0Tf2xfjdkp0Px/aLeIzo7ikc3ZAKx+Q4XjdQ3rp1lpqZcxJaQtlnTcs21hi4k4muuEWw
         An9YhvEwq+pNQlvYExxTjATMfv2KTEk/657hxs/D/LIAXKYmPASX03ewwsCWJnCJul7j
         MQZ64cnmaFs0ktdZSFN/Vw4rgmm5/l4Ex9DbOao7arI2uptqNBlxh9DrxzRC/E3oBwAp
         njR9Y+o+2W+k1xc7Ha9dr+qVFYE+jvLmAYmQ2nSiEO+GyNZiXm14K6c4IXmDeJK3SD9o
         5vBA==
X-Gm-Message-State: ACrzQf3Z+RqH7nw1YyZFINVxYqxobPwVX5DMB8bIExok0hah08ZvNV0U
	0B8Eq8DPUbAqxc9KvR8yZu+f5w==
X-Google-Smtp-Source: AMsMyM7W6+fPu+mWcsl2mA5mLUmVxJY6ZAokGeJNv3DvlB68CliPDKXds+EoUBatPkHWx2Y7U7pt8g==
X-Received: by 2002:a17:907:94c9:b0:78d:3544:ff0a with SMTP id dn9-20020a17090794c900b0078d3544ff0amr3984138ejc.386.1665763126950;
        Fri, 14 Oct 2022 08:58:46 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id z5-20020a170906944500b007262a5e2204sm1693950ejx.153.2022.10.14.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:58:46 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
Date: Fri, 14 Oct 2022 17:58:43 +0200
Message-Id: <20221014155845.1986223-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
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
    
which will issue the warning when reading /proc/cpuinfo.

[*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.

This series address the issue for x86 and riscv, but from a quick
grep of cpuinfo seq operations, I think at least openrisc, powerpc,
and s390 also need an equivalent patch. While the test is simple (see
next paragraph) I'm not equipped to test on each architecture.

To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.

While the patches are being posted together in a series since they're
for two different architectures they don't necessarily need to go
through the same tree.

v3:
  - Change condition from >= to == in order to still get a warning
    for > as that's unexpected. [Yury]
  - Picked up tags on the riscv patch

v2:
  - Added all the information I should have in the first place
    to the commit message [Boris]
  - Changed style of fix [Boris]

Andrew Jones (2):
  RISC-V: Fix /proc/cpuinfo cpumask warning
  x86: Fix /proc/cpuinfo cpumask warning

 arch/riscv/kernel/cpu.c    | 3 +++
 arch/x86/kernel/cpu/proc.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.37.3

