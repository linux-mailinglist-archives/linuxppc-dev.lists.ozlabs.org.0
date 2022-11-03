Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA8617F74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 15:26:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N35g23WWnz3cF6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 01:26:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=WTZ/fhxM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=WTZ/fhxM;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N35d43nj3z3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 01:25:09 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id a14so3031649wru.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyXCEm+SN4JTuAX2T0R90Ie6jT6YR0PIuexybyKvkXE=;
        b=WTZ/fhxMJ71jLlitDHXKYaXGnn95ODQizEyx4pjZLu/FU2YdbKeNAo0B/NktNH9Hif
         0ihHLDxTp8U29NT+XMIjwbpXih+rDpGbzPso+IRrM4OQEis6MRNHdhg2+L+2iQ5ZiErf
         H2C2UNKqEdpYeg1ou6yBgu5uGp5t6In0MkSQENq2IWAYTPdvvddzhf9M2SUHCjdkNqlP
         pTfB+d1W2bpoY+NqsMD0CmY3+w2XyTZf6ZrvG8psupb3sY6BjQWTaeaT9RFdOarIdWjn
         Jj663Dqz2gYFZNCYKSrBaU2MDDJrY91RmxP0f4HXzCqrYeVlqsItUMv2dSlq4XkDrWmi
         x2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyXCEm+SN4JTuAX2T0R90Ie6jT6YR0PIuexybyKvkXE=;
        b=ftf5xwjzQd+USbAidhwhU70h+/VD+Q2EGddZstSWGANJcDvLDqnAwer1QWjt1LJVdm
         rxxcUU3gdlrwjQGCXxrF9qjlUlmj+isxeioXilmjbv3ZGeFgGo0pjpBnj7FwPIS/SILy
         tL6OJZaaL8B36Qh4RQOfG70z1wgZsxwSgXaQce51uA90VRqB9gcPBJMWlhw9q41vY5Cn
         QeDadryMUP/r6SwEqf1EfbtK5iTqYcNnS99P22L2RCVsy6oNxaQHa8vJA1xGblOBBopF
         ktUf3eemCh5UsZB5X3X4PZnFTQyroc0EAT28v/q4OJqYKSbRLb1asTbkKmjG2+5jBU9L
         YhdQ==
X-Gm-Message-State: ACrzQf3W2lD/l3GQd6R72VcuUoOIV/n+BqX6sO55i8Cnm4LL9zdjhlC+
	2inl45uOEpThHUdHYCZVZ+KHIg==
X-Google-Smtp-Source: AMsMyM5hdXBUu8yo8VO7zyELnZCeDW54TPy5bvl1rmzeZB7u0GPP01rGpP4zIsPcikd5aOtl3C5pdw==
X-Received: by 2002:a5d:654d:0:b0:235:197d:72d1 with SMTP id z13-20020a5d654d000000b00235197d72d1mr18800468wrv.680.1667485505908;
        Thu, 03 Nov 2022 07:25:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d6547000000b0023662245d3csm992994wrv.95.2022.11.03.07.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:25:05 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] Fix /proc/cpuinfo cpumask warning
Date: Thu,  3 Nov 2022 15:25:03 +0100
Message-Id: <20221103142504.278543-1-ajones@ventanamicro.com>
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

Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") started
issuing warnings[1] when cpu indices equal to nr_cpu_ids - 1 were passed
to cpumask_next* functions. The commit has since been reverted with
commit 80493877d7d0 ("Revert "cpumask: fix checking valid cpu range"."),
which raises the question as to how much this proposed patch is needed.
Additionally, there's some discussion as to whether or not cpumask_next()
should even be validating its inputs[2]. So, with that in mind, I'm fine
with the patch being dropped. However, it may still be reasonable to add
the checking to /proc/cpuinfo until cpumask_next has made changes and
better documented its API.

[1] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
[2] https://lore.kernel.org/all/CAHk-=wihz-GXx66MmEyaADgS1fQE_LDcB9wrHAmkvXkd8nx9tA@mail.gmail.com/

This series addresses the issue for x86. riscv has already merged an
equivalent patch (v3 of this series). Also, from a quick grep of cpuinfo
seq operations, I think at least openrisc, powerpc, and s390 could get an
equivalent patch. While the test is simple (see next paragraph) I'm not
equipped to test on each architecture.

To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.

v4:
  - The riscv patch has already been merged.
  - Mostly rewrote the cover letter as the situation has changed since
    78e5a3399421 was reverted.
  - Rewrote the commit message in order to try an better clarify things
    and also to add the reference to the revert commit, which results in
    the commit no longer claiming its a 'fix' in its summary. [Boris]

v3:
  - Change condition from >= to == in order to still get a warning
    for > as that's unexpected. [Yury]
  - Picked up tags on the riscv patch

v2:
  - Added all the information I should have in the first place
    to the commit message [Boris]
  - Changed style of fix [Boris]

Andrew Jones (1):
  x86: cpuinfo: Ensure inputs to cpumask_next are valid

 arch/x86/kernel/cpu/proc.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.37.3

