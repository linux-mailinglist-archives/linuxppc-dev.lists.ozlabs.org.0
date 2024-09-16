Return-Path: <linuxppc-dev+bounces-1405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842F97A216
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 14:22:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6kZf01mTz2yN4;
	Mon, 16 Sep 2024 22:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726489369;
	cv=none; b=KBD08dYOx+ddxzEA/q7Rmufvui2K/6mo7RXsclxf36yzgh57CXSh2rePZ9m9U3tC4vIt72yi1mKONVonTlyW7OzpfkaQRn1/07rivHVvxxW08RhZSva2D4yWhO8KRlblSyyOoohhfJXd15rN6by8P5W5lyDhF4gI2lOQ3yVdt+W9jfzgMUL//riMqKTXkuQoXzUQIvMZa3lhcE6ie+JmQev7swNgJVoBGxp9Kf8arNqVvMwvwIycRgpf3RQMZwyoRegrEE376e57I71E5kMGVUGWmGnZRK9EOFhZjFgVs9KuyYPVgMSGd6rake1MYVW2vTPtP42sqHVq03sNVHEiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726489369; c=relaxed/relaxed;
	bh=GZBGRbBIGV5X5xLZ+rni4rJi5KtmpNZvI6X54qPGr6M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IzaVNJgXlc55aKU4Bshj3SLf4PSWWyhzp4vMfDuz6pC1JlTaKBZm/bsvhDMU+j71LJnkEt8/wraKeXMztR1G/rkYOayCzW8VukNmO+lAqGyQO9JJNREZ7Sk1W94niFd/TQW9+2ztBytE652SYQL77sxtLH+pJMJSMOmDSGe8vsf188bqm4P78sNNDQdNGOYYuEQrbvxwzffyu8xZI9UxM/1CSKoYCVGPMLCyRqrddR9x1fzS/jEjz0xYGE/etA+y6EIVK+z+QjJmFYOSxfjmKt+rNVjfHjC5jTAW0D+FvT/QY+f+rcpRjtW/9t9sfH0QLGx5MyNpMPjzWgHAkL8X6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=pass (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com; envelope-from=constantine.shulyupin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6kZd2qPcz2xkr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 22:22:48 +1000 (AEST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374d29ad8a7so3117530f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 05:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726489365; x=1727094165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZBGRbBIGV5X5xLZ+rni4rJi5KtmpNZvI6X54qPGr6M=;
        b=IKMnoypnIPFyGzymfBl1yP2eK/V8soakjEnHhEJIS9RMQOl5OucasU3hrKjh5FXvG4
         9Lzpczl4A2NELjuOGyhVLdJ3qAaclKYFnpVHUE6U+UN4AKphoMXWDpYSOoZ9U35kGm32
         UnQT7E4I+Gda+3CQFD9xr2Y0Ha4ikMYk+AdT53iWaKgbPTi/flr/IcdVNGDkm6w/wpUv
         nz6/ymUWuQ2v68bjZBkUwPkxzArNZsyqKIkHw1mBwYJ0KlurCFyvQRdLoYGNhwE6BE9j
         1o2AqFimUjfpXYMuCw6d58ozgJbarcVMLM36MW05lMo3VBAjdUafeyUS0kWOFBZKFV2+
         Pxng==
X-Forwarded-Encrypted: i=1; AJvYcCUp2SyJa0qzExRD8HsPG9mwd0+/l5ezCr/OJOlQMcLJOIvwYMFSyK6VObUA21LKvVUIAMy8d/FXuQeaHNc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMHukH03lnkMSaUoCvNpTKQRc8N8lWGQ7Ggdy0NBFzpliVahCN
	eAJPpo+L3UognZPJhvSKWhOKkXRO1C42W0882InBRdUQYQ2Xc/6s
X-Google-Smtp-Source: AGHT+IGnUnioaOxDZX1BUgvxFZDQXINgpAKMfpUC4aZJf56RSiMwVoLkPknPemhA8R9PyXrbvWBA7w==
X-Received: by 2002:a5d:5747:0:b0:374:c4e2:3cad with SMTP id ffacd0b85a97d-378c2d5b237mr7952757f8f.52.1726489364668;
        Mon, 16 Sep 2024 05:22:44 -0700 (PDT)
Received: from costa-tp.. ([2a00:a041:e281:f300:ddd7:8878:b93d:7c0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800243sm7117272f8f.86.2024.09.16.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 05:22:43 -0700 (PDT)
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
Subject: [RFC PATCH v3 0/3] genirq/cpuhotplug: Adjust managed interrupts according to change of housekeeping cpumask
Date: Mon, 16 Sep 2024 15:20:41 +0300
Message-ID: <20240916122044.3056787-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.45.0
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

The housekeeping CPU masks, set up by the "isolcpus" and "nohz_full"
boot command line options, are used at boot time to exclude selected
CPUs from running some kernel housekeeping subsystems to minimize
disturbance to latency sensitive userspace applications such as DPDK.
This options can only be changed with a reboot. This is a problem for
containerized workloads running on OpenShift/Kubernetes where a
mix of low latency and "normal" workloads can be created/destroyed
dynamically and the number of CPUs allocated to each workload is often
not known at boot time.

Theoretically, complete CPU offlining/onlining could be used for
housekeeping adjustments, but this approach is not practical.
Telco companies use Linux to run DPDK in OpenShift/Kubernetes containers.
DPDK requires isolated cpus to run real-time processes.
Kubernetes manages allocation of resources for containers.
Unfortunately Kubernetes doesn't support dynamic CPU offlining/onlining:
https://github.com/kubernetes/kubernetes/issues/67500
and is not planning to support it.
Addressing this issue at the application level appears to be even
less straightforward than addressing it at the kernel level.

This series of patches is based on series
isolation: Exclude dynamically isolated CPUs from housekeeping masks:
https://lore.kernel.org/lkml/20240821142312.236970-1-longman@redhat.com/
Its purpose is to exclude dynamically isolated CPUs from some
housekeeping masks so that subsystems that check the housekeeping masks
at run time will not use those isolated CPUs.

However, some of subsystems can use obsolete housekeeping CPU masks.
Therefore, to prevent the use of these isolated CPUs, it is necessary to
explicitly propagate changes of the housekeeping masks to all subsystems
depending on the mask.

Changes in v2:
- Focusing in this patch series on interrupts only.

v1:
- https://lore.kernel.org/lkml/20240516190437.3545310-1-costa.shul@redhat.com/

References:
- Linux Kernel Dynamic CPU Isolation: https://pretalx.com/devconf-us-2024/talk/AZBQLE/

Costa Shulyupin (3):
  sched/isolation: Add infrastructure for dynamic CPU isolation
  genirq/cpuhotplug: Adjust managed irqs according to change of
    housekeeping CPU
  DO NOT MERGE: test for managed irqs adjustment

 include/linux/irq.h      |   2 +
 kernel/cgroup/cpuset.c   |   1 +
 kernel/irq/cpuhotplug.c  |  95 ++++++++++++++++++++++++++++++++
 kernel/sched/isolation.c |  46 ++++++++++++++--
 tests/managed_irq.sh     | 113 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 254 insertions(+), 3 deletions(-)
 create mode 100755 tests/managed_irq.sh

-- 
2.45.0


