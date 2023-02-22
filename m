Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6AB69ED10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 03:51:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM0zM3ZHfz3c9s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 13:51:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LzbueKS5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LzbueKS5;
	dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM0yQ6t7Jz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 13:50:36 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id w7so6467166oik.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 18:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3FFCt8YZaicmHfmZj/AGkoStrLtSljRIrqwUwWfE5Q=;
        b=LzbueKS5dUxi8UhgObjgBGQVM9xmvQd2mEA7vYiMJSFq18paUoO6/etb3yX0X1SCn5
         2i3I77KPWazwbo/9u9ZSzdms8MNt845ZGDSq8/zWIzeUOafT1u2/Fsgca//TqVlluev4
         kRWM8PBoncAtPQu/M2bSAE0MujWHlqcOJBVv92jZSR8unTOXGXhdOHxKmTNHCFW2G0Xr
         VhkfsxReW4dgFDGZrr7epgr/3Swku8xqUv1rtCcgwlSnwFCuSa1CgeBKdLT+KKXlZYBR
         ZjpEU5r0iKDvrKp7pU6N7oqfqcKMs+3tS0i7W1pKf4IdYczGqC2sfpfmb/fNYBsgq2ws
         20Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3FFCt8YZaicmHfmZj/AGkoStrLtSljRIrqwUwWfE5Q=;
        b=yWbs+G3POiT2scxlf6BfJnugsAYn2ZN/bTIFA53fvwS25ruCLz3xXmaxTmdk8IFErN
         WH+sXzLftxOq2IvLWna+I3gMtoGK4q7Lgnj3VK9xAgrkEAv1luTxd7bHXx32JvlQ5s+w
         ELLZ7OZVOmj3MKHTZyrr1eOcEU/bgetFUksNnXTiyqKFGagap9Wly18Fx4YNof0QQ1s2
         XHfUtmwpQMRK1JrcGG7OJlNpIANY+609NkXMG0frTl6h77Ax91w7nslYrVFdShJaNzxs
         zuct13VWex7axFFWj0IOigPlqBfCuMXpICud284lrjfUKDqtHiVCPt4RwtUaVf1k438V
         04FQ==
X-Gm-Message-State: AO0yUKXrmmLGclAZuXLf4ufUOgKpjpvHsxOWcWb1RK8dH9LP/IW8fiOg
	Z5MglpKyj7jo808xVzrbMdX37S/P+kk=
X-Google-Smtp-Source: AK7set/kFB+K3t5utsTeZa2jYSy11RX9Oh54PT1UbsJcbnblK7NKt5QvARs1M9lbIdjBY/pCkMEU9A==
X-Received: by 2002:a05:6808:e8a:b0:37e:9955:3e16 with SMTP id k10-20020a0568080e8a00b0037e99553e16mr5897465oil.25.1677034232783;
        Tue, 21 Feb 2023 18:50:32 -0800 (PST)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id m132-20020acabc8a000000b0037880fdb1f6sm1009627oif.24.2023.02.21.18.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 18:50:32 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched/topology: introduce node_has_cpus() macro
Date: Tue, 21 Feb 2023 18:50:28 -0800
Message-Id: <20230222025029.453834-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Valentin Schneider <vschneid@redhat.com>, Yury Norov <yury.norov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Barry Song <baohua@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, to check if NUMA node has CPUs, one has to use the
nr_cpus_node() macro, which ends up with cpumask_weight. We can do it
better with cpumask_empty(), because the latter can potentially return
earlier - as soon as 1st set bit found.

This patch adds a node_has_cpus() macro to implement that.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/topology.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/topology.h b/include/linux/topology.h
index fea32377f7c7..7e0d8f8f5a39 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -39,9 +39,11 @@
 #define nr_cpus_node(node) cpumask_weight(cpumask_of_node(node))
 #endif
 
+#define node_has_cpus(node) (!cpumask_empty(cpumask_of_node(node)))
+
 #define for_each_node_with_cpus(node)			\
 	for_each_online_node(node)			\
-		if (nr_cpus_node(node))
+		if (node_has_cpus(node))
 
 int arch_update_cpu_topology(void);
 
-- 
2.34.1

