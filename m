Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1836EA1EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 04:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2fDr5sWMz3fV8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 12:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZmpAEUq+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=htejun@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZmpAEUq+;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2fD20t9Sz3f5P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 12:50:57 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-52160b73bdfso1356172a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682045453; x=1684637453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmtrNohZohvwwvoXrwix45PfrI45pVOsg46nypoG6vA=;
        b=ZmpAEUq+gjuPKgzNFcuAAdXwmm2GgiMJlJhP1UqCHPzgFmzgT/Z6Ri4oGf+vaelLbF
         bo4eVpMsoWtjWBTio6FfNgAKkq3C5sXwv2quyHuNUvOTEYUuw9ww0QuVP4DrckZQtoJC
         3ADJOE5YEviK6cYzpxW9M25DRSL9ZsUGz+3uPJsgTfoqmZtPSEX+tuMrLqWj81i7An02
         nxmDWw1C2GX+ThleqlvVhVu0Q6NmK4HTO567n+ZW5hevASnd4N1RERG2XiuEe7P45kwI
         zmc4aPBM2h1Bl0gmIJeKUixs5hDOsBbS6DfSJXPSEgahAgLQ1PeLj0Mud/zYDJ2Z+2Zb
         lx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682045453; x=1684637453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QmtrNohZohvwwvoXrwix45PfrI45pVOsg46nypoG6vA=;
        b=AFQsOHTGMePQ3AYGV5tbRn23kQ75kbliZjAvrBaIlzXRnwNMx87ljwyxXZ8L2nT+aK
         4OvYG4zerFiKHtf3jcpjHKaTljqblUwUaZyjbXerLyHJUCM4V6idoJwKmByJ7P77WOuw
         ja121MIB914j65An1IZlcgbDdB3yJEsk/U/ZDlrPqIHUXNramFbd5Lf1HffkFWInMkvE
         jNnGu3MnHPpXs7RCDKaUsOI9YZF10UHEoA6rr/N+YbXlsoquj+V7HxMFGRjb23pXlapa
         2pqzxqHAxrYE99rMf3ucOHTkl8fg0b730n9U5K2740BVTCUzgWoYWnJyhwQpEDvl2x5X
         PXTg==
X-Gm-Message-State: AAQBX9cN786XuPJYCVr4Pagdaa1Hz7ApltyNhkGMZ2PjEauNIkP6xylJ
	0HyJI6uEieURnSquITQUnQw=
X-Google-Smtp-Source: AKy350YCCXl0aX+uUc3WbUIS6fp5Ro/TyaD4dYwRUknPa7n2rlaCcw+doGuOEoZcxrkGH+2h6Bs9qw==
X-Received: by 2002:a17:90a:d985:b0:247:193b:ce84 with SMTP id d5-20020a17090ad98500b00247193bce84mr3540463pjv.15.1682045452656;
        Thu, 20 Apr 2023 19:50:52 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id gg6-20020a17090b0a0600b0023d386e4806sm1742354pjb.57.2023.04.20.19.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 19:50:52 -0700 (PDT)
From: Tejun Heo <tj@kernel.org>
To: jiangshanlai@gmail.com
Subject: [PATCH 01/22] powerpc, workqueue: Use alloc_ordered_workqueue() to create ordered workqueues
Date: Thu, 20 Apr 2023 16:50:25 -1000
Message-Id: <20230421025046.4008499-2-tj@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421025046.4008499-1-tj@kernel.org>
References: <20230421025046.4008499-1-tj@kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BACKGROUND
==========

When multiple work items are queued to a workqueue, their execution order
doesn't match the queueing order. They may get executed in any order and
simultaneously. When fully serialized execution - one by one in the queueing
order - is needed, an ordered workqueue should be used which can be created
with alloc_ordered_workqueue().

However, alloc_ordered_workqueue() was a later addition. Before it, an
ordered workqueue could be obtained by creating an UNBOUND workqueue with
@max_active==1. This originally was an implementation side-effect which was
broken by 4c16bd327c74 ("workqueue: restore WQ_UNBOUND/max_active==1 to be
ordered"). Because there were users that depended on the ordered execution,
5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active==1 to be ordered")
made workqueue allocation path to implicitly promote UNBOUND workqueues w/
@max_active==1 to ordered workqueues.

While this has worked okay, overloading the UNBOUND allocation interface
this way creates other issues. It's difficult to tell whether a given
workqueue actually needs to be ordered and users that legitimately want a
min concurrency level wq unexpectedly gets an ordered one instead. With
planned UNBOUND workqueue updates to improve execution locality and more
prevalence of chiplet designs which can benefit from such improvements, this
isn't a state we wanna be in forever.

This patch series audits all callsites that create an UNBOUND workqueue w/
@max_active==1 and converts them to alloc_ordered_workqueue() as necessary.

WHAT TO LOOK FOR
================

The conversions are from

  alloc_workqueue(WQ_UNBOUND | flags, 1, args..)

to

  alloc_ordered_workqueue(flags, args...)

which don't cause any functional changes. If you know that fully ordered
execution is not ncessary, please let me know. I'll drop the conversion and
instead add a comment noting the fact to reduce confusion while conversion
is in progress.

If you aren't fully sure, it's completely fine to let the conversion
through. The behavior will stay exactly the same and we can always
reconsider later.

As there are follow-up workqueue core changes, I'd really appreciate if the
patch can be routed through the workqueue tree w/ your acks. Thanks.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/tau_6xx.c          | 2 +-
 arch/powerpc/platforms/pseries/dlpar.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index 828d0f4106d2..cba6dd15de3b 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -200,7 +200,7 @@ static int __init TAU_init(void)
 	tau_int_enable = IS_ENABLED(CONFIG_TAU_INT) &&
 			 !strcmp(cur_cpu_spec->platform, "ppc750");
 
-	tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1);
+	tau_workq = alloc_ordered_workqueue("tau", 0);
 	if (!tau_workq)
 		return -ENOMEM;
 
diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 75ffdbcd2865..e9117b03807e 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -564,8 +564,7 @@ int __init dlpar_workqueue_init(void)
 	if (pseries_hp_wq)
 		return 0;
 
-	pseries_hp_wq = alloc_workqueue("pseries hotplug workqueue",
-			WQ_UNBOUND, 1);
+	pseries_hp_wq = alloc_ordered_workqueue("pseries hotplug workqueue", 0);
 
 	return pseries_hp_wq ? 0 : -ENOMEM;
 }
-- 
2.40.0

