Return-Path: <linuxppc-dev+bounces-1408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB897A225
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 14:24:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6kcJ1yJ0z2yS0;
	Mon, 16 Sep 2024 22:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726489456;
	cv=none; b=obcrOZk37NeueztmSZ9hV7n1UhFOo9dZjipSFCsALMd6uPVDQaSBP9l0kpZqRNJRvSm9WNc9LYyi+r0SiUlrUufGczcH0SOZcA43u9a7zJkjru6nFE8Cr+GgFsXw+yRXTzzk0lzyKTuXiInA1GMV4BdRtfIJ9KRg8De6h+LCmv6elrV00w33FvfzQJwMqHeeAs2+l5z5YInG0hfiPktPq/QD1rfV0c0ajbqrHEJaKEoUpFJb+ICp9mS6IoiqLCw2hbxfMGcRiX8JoPdxS2iScJBN9ot9fa/N6bAVYZbDHngzSU+phasoz8m/lORQEaX3x93Pwi0LtMiONuExbuWgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726489456; c=relaxed/relaxed;
	bh=UIQVZrqwrUMgVJOuTjxMJrg0tEe4W9lzFWo0vuBjDGA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YclkroEXcDX/S0kFH6Fg25TbRsmfcOQE4gjwZrjxaFU1XhBJjzyOD8rQVD4H/C2knwm6YunQyA29y/iWSvmeScZ7yCGW5ZgJEs6flgJ3fdY8gLIZqyxr5g1K0bY60kf8j9Xrchf8o60sFsqfLlP7Nwic9t0FPMq3DfmXBGhNOcMoEXNkFHSuPo9YyU2mStoZZQUqZR7QCTkKYI3+wz6Sdmp+hKPGMC+Vza4yXhRLucBS17Z4ZxsTi0k3qpcj9ys/pui8lzKI4C3iqbk9wVdDd4C/un9dh+7PEbq2AIO7KmN8Q6UGlVAkiSZEUA73y3o1yus8/nbLznxqO/GWMcfyeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=pass (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6kcH4mwVz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 22:24:15 +1000 (AEST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so37496035e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 05:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726489453; x=1727094253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIQVZrqwrUMgVJOuTjxMJrg0tEe4W9lzFWo0vuBjDGA=;
        b=IIH2Qi11FqxpHeYVERIGDGk3RMvYGfZoap9Zd4oQY2wLqW+Eai1DHY6bcVRrl/nBu3
         J+CKRjbsbS80LAS0J2mmnZCmXsd/VG+8uoCrLirxxwqzbNxyFhrnzoIC+LGBNubxXQW1
         qKG0Dn3Hx78MLAeTRAzk8x8GjQ/VYIeOumWY9pSMDS/eCv+oEJPUL+DXs/Hg4PRvSFSV
         yXxJFBwCkS8AUS5K3Qy2pwaoNUMYHJ5julGjSiWdhDFIwmoZoMsMU2Tiut4fZEfD254z
         rODWurLS4jkr9cd2l1lSGTUNOYzfsMU7sTBNOAoEOod/h/h42bfG14IjNWk3Qz2GR8lM
         QR9g==
X-Forwarded-Encrypted: i=1; AJvYcCXyOGlNUlJOvp/GnlgRzilDX1H/1Fdc1UMo9xqadOEZBiykmpoiulLV2AW0XrDK8FamVfT0IJbar7K5ZIA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxO0HxdS3deC+gSlxxdTZgyuHppEQXUNV6nUpy1KjyymcMHb29s
	UJck216lS1A0jRt7t/sdJBeHHRxcKsjB6N93jz/9U5fme/SJKfp1
X-Google-Smtp-Source: AGHT+IE0DmenEPK9NwFC2424pKeGC0BWrR50LQs1egXEXs39Z4HiNTrZQssjk5k4Z07jJC9ekhD5yg==
X-Received: by 2002:a05:600c:2058:b0:42c:de9b:a1b5 with SMTP id 5b1f17b1804b1-42cde9ba226mr106150255e9.32.1726489452681;
        Mon, 16 Sep 2024 05:24:12 -0700 (PDT)
Received: from costa-tp.. ([2a00:a041:e281:f300:ddd7:8878:b93d:7c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800243sm7117272f8f.86.2024.09.16.05.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 05:24:12 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: longman@redhat.com,
	ming.lei@redhat.com,
	pauld@redhat.com,
	juri.lelli@redhat.com,
	vschneid@redhat.com,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zefan Li <lizefan.x@bytedance.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [RFC PATCH v3 3/3] DO NOT MERGE: test for managed irqs adjustment
Date: Mon, 16 Sep 2024 15:20:44 +0300
Message-ID: <20240916122044.3056787-4-costa.shul@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240916122044.3056787-1-costa.shul@redhat.com>
References: <20240916122044.3056787-1-costa.shul@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shell script for testing managed interrupts
status adjustments.

Targets: managed_irq_affinity_adjust(),
	irq_restore_affinity_of_irq(), managed_irq_isolate()

Managed interrupts can be created in various ways. One of them:

1. create qcow2 image
2. run
   virtme-ng -v --cpus 4 --rw --user root \
     --qemu-opts '\-drive id=d1,if=none,file=image.qcow2 \
     	\-device nvme,id=i1,drive=d1,serial=1,bootindex=2'

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

---

Changes in v2:
- use shell script only

v1:
- https://lore.kernel.org/lkml/20240516190437.3545310-8-costa.shul@redhat.com/
---
 tests/managed_irq.sh | 113 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100755 tests/managed_irq.sh

diff --git a/tests/managed_irq.sh b/tests/managed_irq.sh
new file mode 100755
index 0000000000000..bd97f47991a0b
--- /dev/null
+++ b/tests/managed_irq.sh
@@ -0,0 +1,113 @@
+#!/bin/zsh
+
+# shell script for testing IRQ status adjustment.
+# Targets: managed_irq_affinity_adjust(),
+# 	irq_restore_affinity_of_irq(), managed_irq_isolate()
+
+# cpu# to isolate
+#
+isolate=1
+
+managed_affined=$(
+	cd /sys/kernel/debug/irq/irqs/;
+	grep -l -e "affinity: $isolate$" /dev/null $(grep -l IRQD_AFFINITY_MANAGED *)
+)
+test_irq=${managed_affined%% *}
+
+[ -z $test_irq ] && { echo No managed IRQs found;exit 1}
+
+rm -rf 0.irqs
+cp -R /sys/kernel/debug/irq/irqs 0.irqs
+
+cd /sys/fs/cgroup/
+echo +cpuset > cgroup.subtree_control
+mkdir -p test
+echo isolated > test/cpuset.cpus.partition
+
+effective_affinity=/proc/irq/$test_irq/effective_affinity
+test_irq_debug=/sys/kernel/debug/irq/irqs/$test_irq
+
+errors=0
+
+check()
+{
+	local _status=$?
+	if [[ $_status == 0 ]]
+	then
+		echo PASS
+	else
+		let errors+=1
+		echo FAIL:
+		cat $test_irq_debug
+	fi
+	return $_status
+}
+
+check_activated()
+{
+	echo "Check normal irq affinity"
+	test 0 -ne $((0x$(cat $effective_affinity) & 1 << $isolate))
+	check
+	grep -q IRQD_ACTIVATED $test_irq_debug
+	check
+	grep -q IRQD_IRQ_STARTED $test_irq_debug
+	check
+	! grep -q IRQD_IRQ_DISABLED $test_irq_debug
+	check
+	! grep -q IRQD_IRQ_MASKED $test_irq_debug
+	check
+	! grep -q IRQD_MANAGED_SHUTDOWN $test_irq_debug
+	check
+}
+
+check_shutdown()
+{
+	echo "Check that irq affinity doesn't contain isolated cpu."
+	test 0 -eq $((0x$(cat $effective_affinity) & 1 << $isolate))
+	check
+	! grep -q IRQD_ACTIVATED $test_irq_debug
+	check
+	! grep -q IRQD_IRQ_STARTED $test_irq_debug
+	check
+	grep -q IRQD_IRQ_DISABLED $test_irq_debug
+	check
+	grep -q IRQD_IRQ_MASKED $test_irq_debug
+	check
+	grep -q IRQD_MANAGED_SHUTDOWN $test_irq_debug
+	check
+}
+
+echo "Isolating CPU #$isolate"
+echo $isolate > test/cpuset.cpus
+
+check_shutdown
+
+echo Reset cpuset
+echo "" > test/cpuset.cpus
+
+check_activated
+
+echo "Isolating CPU #$isolate again"
+echo $isolate > test/cpuset.cpus
+
+check_shutdown()
+
+echo "Isolating CPU #3 and restore CPU #$isolate"
+echo 3 > test/cpuset.cpus
+
+check_activated
+
+echo Reset cpuset
+echo "" > test/cpuset.cpus
+
+rmdir test
+cd -
+
+rm -rf final.irqs
+cp -R /sys/kernel/debug/irq/irqs final.irqs
+
+echo Expected to be without major differences:
+diff -r 0.irqs final.irqs && echo No differences
+
+echo errors=$errors
+(return $errors)
-- 
2.45.0


