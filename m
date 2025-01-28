Return-Path: <linuxppc-dev+bounces-5645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D9A20EEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjB5f1xfNz30Ds;
	Wed, 29 Jan 2025 03:47:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738082822;
	cv=none; b=bL2Zp1SnIuKJji0F8Bb61PWl3N2PR+II3pCR4oR350+iEaNMKJsdH1sRJNotNO6hbswIxmvRXgo23vaTtztAtU2xOWvMYdIyiviWjTORzaAaBvibPelA+sAoX41HF4eMe1bExlFT9nk75r3WHqPYloDppEzEC28oSb54TY1Bj3Bv0O46Rh3cckOC0C3UD7dcmSi4Na5dHuHjqBQDIKSyTwaA05BVFInnaROwd4S8N2Svdzhxd/kc/mnkS3ul9t/+cS//VdQuOYA8VETLya2eWws1JKdA2+SR8UoGCxyQLBOoOhct3ZpBHguTNd6cBVy7VqZZAdLoK7+9ygUTDPCOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738082822; c=relaxed/relaxed;
	bh=rCckKKNOPT0GHbl/F3PRHzvVHT9Q6qmCcPDx48VRDmE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdQ/DmNpuENQCRtymwpRpKYWa1zROJ2G3LmtLW1ZPNmdPY/XzKHFDGZiEOhJdvWe76jQU5K7EB1puDUIvKWiLsE+7PgaaZP2P3WE92b2pMBePpIqUgQaOdtnR770Ru+VUKKkO9IPwId2G14SUK7zWcAkannUH5dcyotoTjY+xxm48N/IAq4KW5hPiPRh843qgWGKysFOFnVp4Y2Jc/mSs+qjZC2xGo2osGNXRViuaPNE7dI3oeOLhyWqbQBT+7hdPZBMyqIWB5Qb05jun0VQb09JV1rgADbuirdqAME1XeyzxLf3714pZjoubhJ5sPzkUvbe0IFUI8aLP/oau3EZCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=inoCUxZ2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=inoCUxZ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjB5d3P76z306S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:47:01 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so8533581276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 08:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738082818; x=1738687618; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCckKKNOPT0GHbl/F3PRHzvVHT9Q6qmCcPDx48VRDmE=;
        b=inoCUxZ2cbsvbh98NV68XxAnmaBsqH3rxGdQgKRfr4FfoCRHofxzf3hAFvJcG02Lsb
         N8lU3h7yqb7TAoVxVwZ3Zxb+709bv3z/mYUl5bCMspMseGHvn0YZAQTnLwHJNpocOcfJ
         246WvuY+b9sAyQk6z3TSTPfUG+idqPKt+vcKSO4zUsw50DJWa5ncT0mbF9QGnkoIQKds
         w4w0IWE1hwtwx5UvxJcFJLWZmMu1tZ6Oh8NyE1pflpA1PKkzKZtBVudurj9IUHI+0rF+
         IDkOeZQBXC35sCPdT7SPAaipT1jquvX/c3WRgN8k0zbISGHpZT50dYBs+FyXAcPeFmxn
         QCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082818; x=1738687618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCckKKNOPT0GHbl/F3PRHzvVHT9Q6qmCcPDx48VRDmE=;
        b=fMUG3vuPuAjEuy2kwUBSuECxh/xvUoNkz99GvSzOxy+Fi1bRTyQoTwuTe7l7zGohAj
         Jz0Ld5zbYUK+TR4bfm4dM6/Gj+Bkw0AzOM6oSIUbDc2RHCjJWv2SvX962KPOjRkF8SBr
         PgnTAJqdQfAFtzazhr7hh9IzOz1mlCQ7fjEVXQhOG4W1Ry1xApUUT8AhnA4JMM+nkLJY
         r/U+tv2QtznVgXCrIacrJ+S8mrxxZOFpu+gFmQtlO7OF1t/NvoYEiF2az83Uq99ednnk
         tRzdzlqkcad00nMdOHCkQJq8h+siRO35xIWG+AkInImd5wJXE8APGXm5/c7SNaEXvMTZ
         y5ww==
X-Forwarded-Encrypted: i=1; AJvYcCXQuToBI3XF00t2q37v1f44shQXUyObj/bGg2Clh3fe90JZ6+R9c2gDVZ2Jq69gfwBY3mVayyf9FGm/wZ8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsWC0VseGhPzyh7r2AqtoXNce8uMpz23B3BM5WSIIuB9J//TB7
	MFl5Srai/CVks7q1l6BoCqZ1T5F7+mdD6YD8xq0oqzgBZ91ZmLY7
X-Gm-Gg: ASbGncucxdkVJWTT4Gkvd55ZNCS/SfrS7vC7ToMm1kIi486ZLHxeV0/E0ncCMQ96PKc
	3yuu/srumc+IUTfmLh8lK5rLiVJkFcDekkcps515vr3oXG/xoS0T2tiSiqPXsjzKHm12eMLjgER
	bSNAfsT5cdifG5PYmJiZVbRglw2RivfIE+iuhuO4ruHhlYDE86bny42zueUKV5WcQo2vETsVk83
	8K/b5QsWmtcihvG8vlBY0riNxegRa+0dp0qwgl57LI+0/1eJcAxAZlQYhx+/gLsiyWDdAszxgYg
	Tmc6lyAoBbkYdvZfXFNanGkiE44WX4KbTCuixJ6gnhIMNjjCa7c=
X-Google-Smtp-Source: AGHT+IFBJfNymvCDO315tC4xVxs+zkZuQynCdmKqW3cIaAkZSV4RPPUZkZxV0shs/Si+4edVpo1BeA==
X-Received: by 2002:a05:690c:c8b:b0:6ef:ac8b:529b with SMTP id 00721157ae682-6f6eb90589fmr351241927b3.26.1738082818497;
        Tue, 28 Jan 2025 08:46:58 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f75bf90de2sm17571157b3.70.2025.01.28.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:46:58 -0800 (PST)
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
Subject: [PATCH v2 05/13] cpumask: deprecate cpumask_next_wrap()
Date: Tue, 28 Jan 2025 11:46:34 -0500
Message-ID: <20250128164646.4009-6-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128164646.4009-1-yury.norov@gmail.com>
References: <20250128164646.4009-1-yury.norov@gmail.com>
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

The next patch aligns implementation of cpumask_next_wrap() with the
find_next_bit_wrap(), and it changes function signature.

To make the transition smooth, this patch deprecates current
implementation by adding an _old suffix. The following patches switch
current users to the new implementation one by one.

No functional changes were intended.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/s390/kernel/processor.c        | 2 +-
 drivers/pci/controller/pci-hyperv.c | 2 +-
 drivers/scsi/lpfc/lpfc_init.c       | 2 +-
 include/linux/cpumask.h             | 4 ++--
 kernel/padata.c                     | 2 +-
 lib/cpumask.c                       | 6 +++---
 6 files changed, 9 insertions(+), 9 deletions(-)

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
diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index 6084b38bdda1..c39316966de5 100644
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
index 418987056340..78e202fabf90 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -290,7 +290,7 @@ static struct padata_priv *padata_find_next(struct parallel_data *pd,
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


