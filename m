Return-Path: <linuxppc-dev+bounces-13959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C79CC422BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 01:59:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3HdR3VSrz2ytT;
	Sat,  8 Nov 2025 11:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762529404;
	cv=none; b=CgKHRz1vrmhcRFUsVVV4dkV1Ak2FDy4l/tuPow5y7tPQ5GLl6oYgr6ERjoA3q5hB7VkKh/QfxJAPSDFgipWVfTVsDkBL+fHK8w5KZauvpjt/fCoyl7nlWaQ+fVGpR2SJbmO2KtStDQ9yIWyd/Ao1bLwaeI4KHVHGA9419aR+YnYgJ9U9ND5Prhenb8L8TqjX1LnVfXkTmQuCzeBq/F3/MtTBfvirTB5cwsb1aZrY1REDaJtNJz0u+NmN6mSeBkSa5WjPmY2RaIYWyQZLoLavmNMO1+qiRtYLHW7076nEv3zvJo1ybaDY7huFEybPQDOoLuWcclCiv74LyFS7j6KIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762529404; c=relaxed/relaxed;
	bh=3GoZhodGB9FYGEwkYt87VVVUhKMfEv1z2Z+2hgowflQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cIcIA5/+ASwFJiQPFw9uEJme6BV3TAvgF9g1MLlvBiD2Z+BMNEwGhfKKwQy0mwQBtusc0n0JwxFstYcDp+ncZKUtoWTIG+Je7XT1BE1ATmzKsyAo0XE3fbTRbU/KPo9qs69DvVc6kwONuSCuIMRJ+NwcTdop7LP/7qjrB978ytMtG5kqW4AD9/g7KyA0JazeKrEHEz9u4wraq6B5CB6FPpA7ULyeUuN9O7wJJaBCTRsoTjLwrowfCEAGgJG+xDEXtf/yuRM2cIlHGfQ1O+UH+LVlhldRQEifPhg32F7NUoUn2d2MXZ2M+TJIrtiCDRtP71WTIzrX/1xjxTCgrXZXJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MZp0atrX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MZp0atrX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=marco.crivellari@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d330C0tn6z303X
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 02:30:02 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775ae77516so10143155e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 07:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762529399; x=1763134199; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GoZhodGB9FYGEwkYt87VVVUhKMfEv1z2Z+2hgowflQ=;
        b=MZp0atrXwq8Sz5kXXs13rnAWs99JmC3HfEQ55zffd8nH5OenLb5FBkicvCYprUmxS6
         jZjiZF8+gQ3csoAgm65OV5CObgR+AoBDhRo5wNDna6Np/z0/uHpJTkXDhEEXeTAf6sc2
         qlVIKgWfIePQRlaM/XuNz0BiSH8nBqH79uZuEjvPlHzVSzWGWyH0ucCJAIou+/kAfYQQ
         wpa+8IjSAW+q1fxxWRvduI3cqZHmYg1BhYVy+HaIEDwIxsmdW6Fen8lECzn7NgZ1SkWq
         k2y6upk7va2IZ/BgHY0ky3f+ji9OSJBuN+ZEEcTOUO7PxW9Ag7YcYmuxdngIYG2ML34c
         EQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762529399; x=1763134199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GoZhodGB9FYGEwkYt87VVVUhKMfEv1z2Z+2hgowflQ=;
        b=OlYdHeYyraAUBBscBWNO8AONnbBNlIt+K1B4/ZBlncDMafcrQBFRzh8V9JZWAkWkw8
         eKQrzDmIVrAF594ybT0bv2ndRAZhglcC7ponXRibEg+aLq+OJcbo4AQkzE94o1HfSt+w
         Nuj9VtoV9uxoOjSbMIE7Vk/J/YCeU1QsOj4mzA9/kAjw3pLs0eMcF8BgfSkQmzE7gLBS
         Tw0yKn6TByDiDPU81rEI+b5Nvv0025DCiptK8GdMy0tDQPmr8eWHVfE68Vc8issrGevg
         GMus0XrFRAmgrB7nfrWD/D7KYPujLxK3yGeHYWEIojAKbd7/6PmpJHgPfpIc0YxCwyU7
         ouhg==
X-Forwarded-Encrypted: i=1; AJvYcCWiJZyR1Q3AOJJ6snBm/PaxLqdb/0ndtOUrFKermWTMYnUHo4034VX593s4YSA0WgI/yLUsCswqKK4lUa4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbxvjWssbG0jTZlrGtbsOuXR8LswYk1wWF3t+TkubjiSv5oh0b
	Ok4JFjZuR3QlZbP2MNsy9PQaBJUK1C2TUR1ATyTV98gHJuu9l62uW+h1wRYHjT41L6s=
X-Gm-Gg: ASbGncuIpiOx/7VpEZY3BaL5XeFbm1HyCWShLxT4RNRV9rgKIC/xmh8KJdaKn/ozygZ
	DNxYz630EJpfD8/FVIAvueo2gDqXuRn5x4jUJby4sCDcoajCzMEoVsC0sQNib/II0P2DiBCCRH6
	zGSFTWxYLmy2+l+8LoazoSio0cDI+YScxmr2GnEt9y9w69Qw6f0e18Mu1TazQ0lQv58O15DnCef
	HoLi8q4Wj6/Exaz+NokqMLqK9QHhNH02J0wk4yvoH1NyAF3LpvHsh2+zORYQCflb8ib9cyGlP1X
	A0/8u/kpo3lLqnGJVlUS3Ppt/72R+mouVKbyNENxsVNfAhEhhakM80x3DOVdl8sQkeGD4Cx7Okr
	VrTlXlgq13WUfewEFT/h3DXwO99xq2OEal8mPeZ29u95EjUGd+E7S7/PE6N9iN2oPcJ6UeQIz8b
	HcWbQ8h4yiN9MoKIjuIfVnPlZA
X-Google-Smtp-Source: AGHT+IHmqZI9ktfvveouBP0DEC1fDTXy9L6bIOlkgXwbbIAASBfmpWtQSdTXKWT13I4wfNLTkOz9ug==
X-Received: by 2002:a05:6000:2889:b0:427:151:3db6 with SMTP id ffacd0b85a97d-42ae58d1316mr2821957f8f.24.1762529399362;
        Fri, 07 Nov 2025 07:29:59 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf26sm5755029f8f.3.2025.11.07.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:29:58 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 16:29:50 +0100
Message-ID: <20251107152950.293899-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/soc/fsl/qbman/qman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 9be240999f87..6b392b3ad4b1 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1073,7 +1073,7 @@ EXPORT_SYMBOL(qman_portal_set_iperiod);
 
 int qman_wq_alloc(void)
 {
-	qm_portal_wq = alloc_workqueue("qman_portal_wq", 0, 1);
+	qm_portal_wq = alloc_workqueue("qman_portal_wq", WQ_PERCPU, 1);
 	if (!qm_portal_wq)
 		return -ENOMEM;
 	return 0;
-- 
2.51.1


