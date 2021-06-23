Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EF3B1295
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 06:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8qcv5xJrz3btt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 14:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PWj3eARR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PWj3eARR; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8qcS5lQ8z2xvQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 14:12:54 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id x16so1252797pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 21:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WYXrlO9vJFnXxLwCmmWGkaRYm1AEGb2PWxmf4/aRaMM=;
 b=PWj3eARR1/KOLc3yUFheLksjLuh0Q1kxTZ+4oHKXglw1uxhedJdDbu/cVlPNToDUrU
 vh0DPZUtDfYhzhru/yUamRmY0kSp5DGEcIMdSbtabLFREq+yEoCpoD5dfB0z/RaLAjwS
 V9I1KEiKHJLSzFOKR0JzktMFj53vy/Llid1dQnkQ6JTqkfvOj0fz/7Am48X5VyAnyxAm
 ovBNINnq1tn7yKc5gq7NVyV2GgPtZj9OwYk6TmBcXmzW8j5fDxXmX4XNqGJwNV1lFGLH
 Gem552NteeFNYAgvn3vUwF+9Q1nYGzqIFFKG78UUunFBt1kS4Dh9G6l7lf8lrv/ZtHEf
 ItGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WYXrlO9vJFnXxLwCmmWGkaRYm1AEGb2PWxmf4/aRaMM=;
 b=Bkw8W8cRq9BMCQ+fWPeH9ZkOq6NQaLId/N0Gr1UhD228DQFTXtzQEo2LgkdO7fEZ3V
 OIvk+liH8KLQoFH2PogEcUkZmHi4PgKDr8+G/k/Vv9IqbRagqCQPmsR/AXV6EZuTgg4d
 o24ooN/sEZvm6HLZb0fyRqkYuew0d4je3ORp3yWuu3kzAdnLEqjK0ybw7bz65EJoasD/
 S1pidoUyC1uC/2+nzN4EpEAQye8nRchMKUcdhFgUXyw6ZpaIcefjT43nXenkst07lUwi
 gwBD3eZmE62RAvTJGebh+bgoLwrZ9xdDcGhGkMCKfoE6E6WlGL4W9jURGZsiA61rN19j
 iP7Q==
X-Gm-Message-State: AOAM530f+O6Vb6zfvXJXuBCSmZlONFYXpYnlX9H5ETm6H5lR0QyEgYnK
 Y8hMNBsj+sT3aB8NCb7uQIcOqAAr81I=
X-Google-Smtp-Source: ABdhPJxqsvT31RoEqpL2B1zCC5QEx2b0h4nda0WLSylu4lRu2rWNi2r9U5AmeDO2TXJUvLszAynE1g==
X-Received: by 2002:a65:5bc6:: with SMTP id o6mr1907710pgr.364.1624421571473; 
 Tue, 22 Jun 2021 21:12:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id cq4sm736439pjb.1.2021.06.22.21.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 21:12:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: offline CPU in stop_this_cpu
Date: Wed, 23 Jun 2021 14:12:45 +1000
Message-Id: <20210623041245.865134-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

printk_safe_flush_on_panic() has special lock breaking code for the
case where we panic()ed with the console lock held. It relies on
panic IPI causing other CPUs to mark themselves offline.

Do as most other architectures do.

This effectively reverts commit de6e5d38417e ("powerpc: smp_send_stop do
not offline stopped CPUs"), unfortunately it may result in some false
positive warnings, but the alternative is more situations where we can
crash without getting messages out.

Fixes: de6e5d38417e ("powerpc: smp_send_stop do not offline stopped CPUs")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/smp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 2e05c783440a..bf12cca86d70 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -619,6 +619,8 @@ static void nmi_stop_this_cpu(struct pt_regs *regs)
 	/*
 	 * IRQs are already hard disabled by the smp_handle_nmi_ipi.
 	 */
+	set_cpu_online(smp_processor_id(), false);
+
 	spin_begin();
 	while (1)
 		spin_cpu_relax();
@@ -634,6 +636,15 @@ void smp_send_stop(void)
 static void stop_this_cpu(void *dummy)
 {
 	hard_irq_disable();
+
+	/*
+	 * Offlining CPUs in stop_this_cpu can result in scheduler warnings,
+	 * (see commit de6e5d38417e), but printk_safe_flush_on_panic() wants
+	 * to know other CPUs are offline before it breaks locks to flush
+	 * printk buffers, in case we panic()ed while holding the lock.
+	 */
+	set_cpu_online(smp_processor_id(), false);
+
 	spin_begin();
 	while (1)
 		spin_cpu_relax();
-- 
2.23.0

