Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B82BA0AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 03:59:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cch9C3tc0zDqvy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 13:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qwaRz9Pz; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cch7Q0PlNzDqv6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 13:58:09 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id f18so6050215pgi.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEquB2e4ILjHkuvoO1HDaYbpd0GtS6EX4u7NzQ82bGM=;
 b=qwaRz9PzkgumlOLi6+U/YB2GvWe8NTcbyeFyYcl1tx+ZCOb8wx26LgiYUsITReXuI5
 AKdC25sqEkLSn+pn+ghWdehXOkTQzQKLKN8rU+9phrz8+lyLEw5IcqeXrlXq8Un1W9mk
 x6rut2m2uUY2JeDfr+//mz/yfN0VEFWhr3I4oJ+F2rgfdRMMuI4+6rOWQBWk9D4O/P1G
 JYha8RQW+gTPv0mpu8zkUYkfHXAr28zd+HqvrKGKECEH2hvZnprIt6Ydih80X8M0+JvE
 nWRg4rUMzDMKqVBPHm4bl5kQDyHa8KAblvxxlj2T44hiCkSiZnezGB6VV0xdTSxIoZQA
 yRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEquB2e4ILjHkuvoO1HDaYbpd0GtS6EX4u7NzQ82bGM=;
 b=jo5r2cAqiqPJSKGrS16WKdQNPFytkJsnb8LY6uKdV+o56O7KkgXfastpCEB+whSFB2
 FSaVRFSd3IMm+j3OIMmjH471aJTDZ1hAeWqOMh3Nzr5FGhjQKCt1Tg2EELwBKY9z4Rl1
 JId7MwaQIOb8gAKck8xRKdosu6KPJZaxWcZR3FeZPrQRekrMeCBStKxjZg3IHoT1zxfV
 2sWvdf4oh2FjGLF3XiD9RL9f43FsFtP8vKSwKGyFkanhfN9l9osLKor+veI4BVGh+tVU
 fGft+kjglTumhk1aLYwJSIpSlv9HazheHJsnm5pr2uFUSqcOQoAs/kSMOCtQQwC7WNBN
 S6rA==
X-Gm-Message-State: AOAM530fi/8pfEe4GxrOMZ5nird2EWbjkzDMRf6qGoInpkfUNMYxscvg
 w+1mJegWwvT7Nqiz6kJEF63p/k+CZ5Q=
X-Google-Smtp-Source: ABdhPJzV6Iqey8/uSJdBfUMohg+eIQvpY6Ifki/IcYVuYzXRJbV3GpliRlXIFEnM/YSdiNCpW4kZSw==
X-Received: by 2002:a63:4956:: with SMTP id y22mr15351360pgk.266.1605841085625; 
 Thu, 19 Nov 2020 18:58:05 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id i130sm1181212pgc.7.2020.11.19.18.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 18:58:05 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc/64s: fix for CPU hotplug vs mm_cpumask bug
Date: Fri, 20 Nov 2020 12:57:55 +1000
Message-Id: <20201120025757.325930-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Anton Vorontsov <anton.vorontsov@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a race in powerpc mm_cpumask code, I hope the core kernel
patch looks okay and we could take it through the powerpc tree with
an ack from someone (Peter or Thomas, perhaps?)

Thanks,
Nick

Nicholas Piggin (2):
  kernel/cpu: add arch override for clear_tasks_mm_cpumask() mm handling
  powerpc/64s: Trim offlined CPUs from mm_cpumasks

 arch/powerpc/include/asm/book3s/64/mmu.h     | 12 ++++++++++++
 arch/powerpc/mm/book3s64/mmu_context.c       | 20 ++++++++++++++++++++
 arch/powerpc/platforms/powermac/smp.c        |  2 ++
 arch/powerpc/platforms/powernv/smp.c         |  3 +++
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  3 +++
 kernel/cpu.c                                 |  6 +++++-
 6 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.23.0

