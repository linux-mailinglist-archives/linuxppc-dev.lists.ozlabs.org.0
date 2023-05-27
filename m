Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F77131C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 03:48:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSl7h2015z3flC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 11:48:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q025PITc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q025PITc;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSl0Q5kr2z3fG9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 11:42:30 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64d44b198baso1094627b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685151748; x=1687743748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAUIzM0ipEZnJ+DKEACmhXTzJMTqgJKwduhWCKwpQIQ=;
        b=Q025PITc8JDv9dJTfN7tctFHTJNnpaJy29WWhsH2ZPNUoOboOZYviwhQysV0Gmhli6
         56fngg0HA+HuSP7ILjSstqS+Mhqo+R8NkGbp1+jpakojtJHDkgDTve7zASH3nWRB6R5B
         bOOBqThle1HJJLIUfe8O4ba5IMukCJE/7Qfis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151748; x=1687743748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAUIzM0ipEZnJ+DKEACmhXTzJMTqgJKwduhWCKwpQIQ=;
        b=GpHfJtzGnhwrrXuABiHmILtJvCvgXnS+SZuuwUwtb6H7SAYG+Of4AMInIa8TVee6Nw
         Ys9zJlxwVE+uvPJy8f1D/pVH3cBXlW71qJ6bEqY9kunDrfY0dDU5DNH5N9qZx/kp0VfE
         gb2bqQhPQUutIIehj7Gz7ttvz/RYHyUghastcyAwxapzKedhbkebWBMtHaVFfKRxnVF6
         0y6hBPjPvLdYoRjzZfzXY0+5Rk1rOejseGFvIDojz4vLCbkgfl5CY2+FIowb5YLsEiWA
         /m9lo5smIT5JMokts4MNgzX0VM/TFadAj2uYMNrtM8hl521YEB/ea7102uoc4Lq9IMvj
         Qj2Q==
X-Gm-Message-State: AC+VfDzqK/92T9EfjGUSMZh8PBm7CJNZcMgZdZl5jlgwUYv2d4nCLxlp
	BCBwWqhLU5IRsz8UcSx1wTp5EA==
X-Google-Smtp-Source: ACHHUZ7CuB7PPQInlPEZH0k1cEJvxZtnt0cbbm9xAfq9bZv1LojzgB0/25WLra3jsMmghAsHAYATEg==
X-Received: by 2002:a05:6a20:7351:b0:105:3e47:7504 with SMTP id v17-20020a056a20735100b001053e477504mr902971pzc.11.1685151748589;
        Fri, 26 May 2023 18:42:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4015:7255:c79a:26d7])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:42:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 07/10] watchdog/buddy: Don't copy the cpumask in watchdog_next_cpu()
Date: Fri, 26 May 2023 18:41:37 -0700
Message-ID: <20230526184139.7.If466f9a2b50884cbf6a1d8ad05525a2c17069407@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's no reason to make a copy of the "watchdog_cpus" locally in
watchdog_next_cpu(). Making a copy wouldn't make things any more race
free and we're just reading the value so there's no need for a copy.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog_buddy.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index 3ffc5f2ede5a..2ef88722c5e7 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -10,12 +10,11 @@ static cpumask_t __read_mostly watchdog_cpus;
 
 static unsigned int watchdog_next_cpu(unsigned int cpu)
 {
-	cpumask_t cpus = watchdog_cpus;
 	unsigned int next_cpu;
 
-	next_cpu = cpumask_next(cpu, &cpus);
+	next_cpu = cpumask_next(cpu, &watchdog_cpus);
 	if (next_cpu >= nr_cpu_ids)
-		next_cpu = cpumask_first(&cpus);
+		next_cpu = cpumask_first(&watchdog_cpus);
 
 	if (next_cpu == cpu)
 		return nr_cpu_ids;
-- 
2.41.0.rc0.172.g3f132b7071-goog

