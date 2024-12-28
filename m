Return-Path: <linuxppc-dev+bounces-4508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281C9FDBEA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 19:50:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YLBHy5hfpz2ynR;
	Sun, 29 Dec 2024 05:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735411806;
	cv=none; b=HBHDaphP8jGfV/+9elg67rQK7/xQ3qg4+T9dbBWr6i+Z4qsSMiOTuXFezHTEcXNaq6SDw+sc7hwSSsd1gaaMMa6XHxwHz2ENToKO7zzm+8HMhY4TmcRDZ9QITDwyqUgNgdObQiBWi2IPKLVDMJ7fBAgQqkJN79c6LJbKdD5sthQ7uIcLDLGvH6HBhUSBL4vdBr+awUB//Wj1CH5NW9U9eYcJLUeF3/ljMPeZ4h2b3vxIvn936TScU5B+Zr8bRDDKsMNUxJVLEuCaKhUo7CW+MeMObREpAGiug+7LxQIfIugpYJrHsMtx0g8AXbhYHNQha1voum3oWuK8ka0dTPPY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735411806; c=relaxed/relaxed;
	bh=0bA6qa5mRtLx/JNJepZMf5RGZWm5ti1ameVb2qE56fE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6TF03aHdkh37yWiKUkPlzhhe/Ql3m9eFxKw/bkEEDs6SxnWWyzg6l2YX951X4yFuAB37CYIly0w7vvefHsWFBn7erZwAhgrQG4pJLEY/8rTVJ9BLQkqtXeGwI2+/oRTQN+fNemvn1QcgMLJcXSZKqhp4Fd4ZrzbVj63msi0OGfOZZL5hiathpO5FhoYoG+Sqp5VEqKUtPtOg0JnKAzIrdFExWdz6YbSmro/RYPLFNIWqihxhVy1f0dfulPPH5EWs3VxXBv5M8TGhwXKsTARUbJ/fbDw21qfChJM7NYsn+Lrqw+QjLzLYcqLHRsPVQ/ZcJEn+PFtMPhAVx8/L+EPxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SZaOJqwr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SZaOJqwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YLBHx5HsSz2yhM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 05:50:05 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso9233608276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 10:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411803; x=1736016603; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bA6qa5mRtLx/JNJepZMf5RGZWm5ti1ameVb2qE56fE=;
        b=SZaOJqwr2D80KY7gzpQI6pjk9ZW/tjNQFyNy4ZiMOCtl/d6f3s7WXigD7SbvxEVbaz
         N/+DzTGybflbFRQi/A28qPJ2Yj83hgl2TD5JIKbalXwAOBBRL1fiDdGAj17W/PiqGFOp
         vF2K493oo8/AK8SeCEjo19lMs2MDEmmzTp8i9PpIlf8dz7oWNpox04O7t7Pw8E6iTc4P
         La7vgvNRxhtFKajN6wP2oyLWC9EupBVqRJzLcpC04AUT4oRH+8qvLOeAr4W2ZKPZa9RK
         Mw7qB5VcIThv1H+Zxm+VUt1axtsBmyWt63kYBP2/uVKEuTyjW0ZDPaiTaDylcwEvrfEK
         Pr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411803; x=1736016603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bA6qa5mRtLx/JNJepZMf5RGZWm5ti1ameVb2qE56fE=;
        b=b36DO4+lwxWjTkhZxIBwu63o6OR+GDhxh9/nAERpp4ZB2ABdrnHLCzakdxhYwdvAnP
         Ow9dQPQrCpWjVy+9bzp+oVRI9uUT3os94rUyKFgzj8dWuUcKvHS96ARKGUhbajQfzk6f
         +IS2J1x2vgbeBxm8z+KRxX+tolqdIEZfrcjXmcRWYMegIw9ea/iXSWxje3nPBovx+tmF
         gLMV8oa5DGPp1J4PnYU/RLyDZLyChkDgoM6ocCyTQNtaA192IL2P3dYbH7JcZ3AViJ4C
         4IeZj3R+nYxdyIc+GnWg/SxYW4x6guNlWjrWjFP8bxm7KlGPfxJDefJsmqRElN7ob2an
         w4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEKKLlJmyBTt8EQTgBsfZwK0CvtPAB473KtM6Zr0xPaXzpvDVcYPsRFAKxGv1JjPv1RUtjQbWaCLmYU1E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzi7LOoxcThNE5nyK/GaVUHuMoUJL4jbvLdPv4SPlDSjVzCI0yT
	NKR50eE2C4PO7mmLhJE4MoNSDPEBSM73zNybMh/WUTxzFuLylc+u
X-Gm-Gg: ASbGnctuZDVzOW93+xJP7QGsLlc7lsptR56Hl91Ms9qcCV0HYIXakPN2STaQT7cULsE
	Yi0zfJFPIL5GrDSbAbcWVlI9qZ+GFzJ/pVeg5r/aLj7iIk7cVhs51YXrK+LacSTAg20Lrx5P26I
	IRudgakqaV8NvgJqOVD6VKZ5MsKm4eABVdY2Kd1iEeU8f2OKTUpvntNO94xUDLhw89ai1nBaC5U
	vPScS7IdbbRGSmsVrAS0pV3Re+5/FFGF0Tb2+1r0QWtGDfHAZ5MPrhqlgh6nzFbDZE66JPelSI8
	jFhRBwmSWPJK8Icy
X-Google-Smtp-Source: AGHT+IEdltlfo7VoM/K9Hx3CK/leMoimfCHWr7pfYR9wsJX7DjblcCmfKrexz0jlZQgTcU9bnrqr/g==
X-Received: by 2002:a05:6902:1a48:b0:e49:5f2d:e71d with SMTP id 3f1490d57ef6-e538c267d16mr23706682276.21.1735411803005;
        Sat, 28 Dec 2024 10:50:03 -0800 (PST)
Received: from localhost (c-24-129-28-254.hsd1.fl.comcast.net. [24.129.28.254])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cbeba44sm5051923276.7.2024.12.28.10.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:50:02 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kurz <groug@kaod.org>,
	Peter Xu <peterx@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: [PATCH 05/14] cpumask: deprecate cpumask_next_wrap()
Date: Sat, 28 Dec 2024 10:49:37 -0800
Message-ID: <20241228184949.31582-6-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228184949.31582-1-yury.norov@gmail.com>
References: <20241228184949.31582-1-yury.norov@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The next patche aligns implementation of cpumask_next_wrap() with the
generic version in find.h which changes function signature.

To make the transition smooth, this patch deprecates current
implementation by adding an _old suffix. The following patches switch
current users to the new implementation one by one.

No functional changes were intended.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/s390/kernel/processor.c        | 2 +-
 drivers/nvme/host/tcp.c             | 2 +-
 drivers/pci/controller/pci-hyperv.c | 2 +-
 drivers/scsi/lpfc/lpfc_init.c       | 2 +-
 include/linux/cpumask.h             | 4 ++--
 kernel/padata.c                     | 2 +-
 lib/cpumask.c                       | 6 +++---
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/s390/kernel/processor.c b/arch/s390/kernel/processor.c
index 5ce9a795a0fe..42ca61909030 100644
--- a/arch/s390/kernel/processor.c
+++ b/arch/s390/kernel/processor.c
@@ -72,7 +72,7 @@ void notrace stop_machine_yield(const struct cpumask *cpumask)
 	this_cpu = smp_processor_id();
 	if (__this_cpu_inc_return(cpu_relax_retry) >= spin_retry) {
 		__this_cpu_write(cpu_relax_retry, 0);
-		cpu = cpumask_next_wrap(this_cpu, cpumask, this_cpu, false);
+		cpu = cpumask_next_wrap_old(this_cpu, cpumask, this_cpu, false);
 		if (cpu >= nr_cpu_ids)
 			return;
 		if (arch_vcpu_is_preempted(cpu))
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 28c76a3e1bd2..054904376c3c 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1578,7 +1578,7 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 	if (wq_unbound)
 		queue->io_cpu = WORK_CPU_UNBOUND;
 	else
-		queue->io_cpu = cpumask_next_wrap(n - 1, cpu_online_mask, -1, false);
+		queue->io_cpu = cpumask_next_wrap_old(n - 1, cpu_online_mask, -1, false);
 }
 
 static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid)
diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index cdd5be16021d..86d1c2be8eb5 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -1757,7 +1757,7 @@ static int hv_compose_multi_msi_req_get_cpu(void)
 
 	spin_lock_irqsave(&multi_msi_cpu_lock, flags);
 
-	cpu_next = cpumask_next_wrap(cpu_next, cpu_online_mask, nr_cpu_ids,
+	cpu_next = cpumask_next_wrap_old(cpu_next, cpu_online_mask, nr_cpu_ids,
 				     false);
 	cpu = cpu_next;
 
diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 7f57397d91a9..31622fb0614a 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -12876,7 +12876,7 @@ lpfc_irq_rebalance(struct lpfc_hba *phba, unsigned int cpu, bool offline)
 
 	if (offline) {
 		/* Find next online CPU on original mask */
-		cpu_next = cpumask_next_wrap(cpu, orig_mask, cpu, true);
+		cpu_next = cpumask_next_wrap_old(cpu, orig_mask, cpu, true);
 		cpu_select = lpfc_next_online_cpu(orig_mask, cpu_next);
 
 		/* Found a valid CPU */
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 30042351f15f..b267a4f6a917 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -296,7 +296,7 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
 
 #if NR_CPUS == 1
 static __always_inline
-unsigned int cpumask_next_wrap(int n, const struct cpumask *mask, int start, bool wrap)
+unsigned int cpumask_next_wrap_old(int n, const struct cpumask *mask, int start, bool wrap)
 {
 	cpumask_check(start);
 	if (n != -1)
@@ -312,7 +312,7 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *mask, int start, boo
 	return cpumask_first(mask);
 }
 #else
-unsigned int __pure cpumask_next_wrap(int n, const struct cpumask *mask, int start, bool wrap);
+unsigned int __pure cpumask_next_wrap_old(int n, const struct cpumask *mask, int start, bool wrap);
 #endif
 
 /**
diff --git a/kernel/padata.c b/kernel/padata.c
index d51bbc76b227..454ff2fca40b 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -274,7 +274,7 @@ static struct padata_priv *padata_find_next(struct parallel_data *pd,
 	if (remove_object) {
 		list_del_init(&padata->list);
 		++pd->processed;
-		pd->cpu = cpumask_next_wrap(cpu, pd->cpumask.pcpu, -1, false);
+		pd->cpu = cpumask_next_wrap_old(cpu, pd->cpumask.pcpu, -1, false);
 	}
 
 	spin_unlock(&reorder->lock);
diff --git a/lib/cpumask.c b/lib/cpumask.c
index e77ee9d46f71..c9a9b451772a 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -8,7 +8,7 @@
 #include <linux/numa.h>
 
 /**
- * cpumask_next_wrap - helper to implement for_each_cpu_wrap
+ * cpumask_next_wrap_old - helper to implement for_each_cpu_wrap
  * @n: the cpu prior to the place to search
  * @mask: the cpumask pointer
  * @start: the start point of the iteration
@@ -19,7 +19,7 @@
  * Note: the @wrap argument is required for the start condition when
  * we cannot assume @start is set in @mask.
  */
-unsigned int cpumask_next_wrap(int n, const struct cpumask *mask, int start, bool wrap)
+unsigned int cpumask_next_wrap_old(int n, const struct cpumask *mask, int start, bool wrap)
 {
 	unsigned int next;
 
@@ -37,7 +37,7 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *mask, int start, boo
 
 	return next;
 }
-EXPORT_SYMBOL(cpumask_next_wrap);
+EXPORT_SYMBOL(cpumask_next_wrap_old);
 
 /* These are not inline because of header tangles. */
 #ifdef CONFIG_CPUMASK_OFFSTACK
-- 
2.43.0


