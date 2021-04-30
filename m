Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D336F9D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 14:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWrml0CZ6z3bt4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 22:10:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S35mwL2E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S35mwL2E; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWrlM6RTsz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 22:09:34 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id t14so4143035qvl.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ammUdlr+/AWGv6OKuoANx3/D8JbixebRyuO/wvvbQiI=;
 b=S35mwL2EEuMXAH5yoOoHXlS1oU7FXmMPU5Nw/TLWYmRB58ZClaTu/VEI6x55dizFrW
 RnA8j0aZ5E/Os17+SrIL53AjKlxBlrE5827QZrjT7HOKws+oOYmKggazpMpmwYj8ZC5A
 NJxzzggxOqdPwNIk1uB+gSeZAA4j2gXhBOr9BXRxW5YXcddQSQGg6OgAQHJ2Qp24vMAZ
 lURkK89qIh+lb9JzgAy6zO2U7Vh01fiukpPULqGnk9xxFqVhdrxx7ckRm2HzzKi9y/da
 0ZWOrapvRonlzyKSPZ2rua2JQLKMs7V2fwItqBsX1XQEjVWNm//ZE7ZGFIfqHF4XtpGW
 SfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ammUdlr+/AWGv6OKuoANx3/D8JbixebRyuO/wvvbQiI=;
 b=k2E2O1ploI2ljXAqPoLSsW3/4IdEkQe1/BBufHHgrkbeK7LrMgWT0ElT7iO0K63YeO
 V58/g+uSgQwvlhF9BzkjYGS69XtX6EjdX12gp5UDQZ+HUDAQ/G8Y420TTVk7sSCzm32z
 yi5px24VQWVAwP+qLUVw54MdYSmZEFp0NlTm2cwsyS7Jh47BUm2uifLi1KAMiaBSCA/C
 SKdwTYmA+o/9GPjob7m5DDCGcN9bIxEUx+U06KHZiDg2j8Y6er1PH956u51gXXJvIeQq
 ErA2zLcJN0YYP9fPnZDftOFlvalGCXLp8u4bD/Z+nO3l7xpNaKWC0F5oD/6ecMcifRp4
 u7vA==
X-Gm-Message-State: AOAM533i7UMQ6ytf03GBTXu+h+Nge4gsVrDK/8bEv0f4KWh7is4/85JJ
 70pmnelESI/omIKB6kgUxGbodc33oOKrKw==
X-Google-Smtp-Source: ABdhPJxCTlzp4XdUbJYxTyI/3h+DeOXfoStpanoHnvq9HjdttY9fcq9DmrISAA7yac1TI2Q2/OgExA==
X-Received: by 2002:a05:6214:ace:: with SMTP id
 g14mr4861505qvi.43.1619784570766; 
 Fri, 30 Apr 2021 05:09:30 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:6de0:3db1:1b8e:b097:6036])
 by smtp.gmail.com with ESMTPSA id p190sm928951qke.13.2021.04.30.05.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 05:09:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/pseries: Set UNISOLATE on
 dlpar_memory_remove_by_ic() error
Date: Fri, 30 Apr 2021 09:09:15 -0300
Message-Id: <20210430120917.217951-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430120917.217951-1-danielhb413@gmail.com>
References: <20210430120917.217951-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As previously done in dlpar_cpu_remove() for CPUs, this patch changes
dlpar_memory_remove_by_ic() to unisolate the LMB DRC when the LMB is
failed to be removed. The hypervisor, seeing a LMB DRC that was supposed
to be removed being unisolated instead, can do error recovery on its
side.

This change is done in dlpar_memory_remove_by_ic() only because, as of
today, only QEMU is using this code path for error recovery (via the
PSERIES_HP_ELOG_ID_DRC_IC event). phyp treats it as a no-op.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 8377f1f7c78e..bb98574a84a2 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -551,6 +551,13 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 			if (!drmem_lmb_reserved(lmb))
 				continue;
 
+			/*
+			 * Setting the isolation state of an UNISOLATED/CONFIGURED
+			 * device to UNISOLATE is a no-op, but the hypervisor can
+			 * use it as a hint that the LMB removal failed.
+			 */
+			dlpar_unisolate_drc(lmb->drc_index);
+
 			rc = dlpar_add_lmb(lmb);
 			if (rc)
 				pr_err("Failed to add LMB, drc index %x\n",
-- 
2.30.2

