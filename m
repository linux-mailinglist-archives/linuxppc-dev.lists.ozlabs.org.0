Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA7550226
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 04:50:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ0lH46Wfz3btp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 12:50:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=nwDTrMVg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.112; helo=m15112.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=nwDTrMVg;
	dkim-atps=neutral
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ0kd0xftz2xTc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 12:49:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qkQlh
	JZghESEYg/d4Msy2Ak1gToS/EiqAWzA7FqaO/Q=; b=nwDTrMVgqsrex7ezfztp4
	8dxOoWCiFIGWezETrlf7WgT5PsEY4wILYMgRJLIeFUIyXvAd4JjgmDxB2sWAR7QY
	JofUIKzHXzZvqPj2eXjOKJREpZVf1pmyeWfF68vcld8Mzbqemn5v98jY9cJYak38
	WxBsm+RqBc1OaitjlAZOxo=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp2 (Coremail) with SMTP id DMmowACXBAE6Pa1icrFnDg--.23352S2;
	Sat, 18 Jun 2022 10:49:30 +0800 (CST)
From: Liang He <windhl@126.com>
To: christophe.leroy@csgroup.eu,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: 8xx: Fix refcount leak bug in tqm8xx_setup
Date: Sat, 18 Jun 2022 10:49:30 +0800
Message-Id: <20220618024930.4056825-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowACXBAE6Pa1icrFnDg--.23352S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKry8GF4kGr13Kr4fuFW5trb_yoW3WwbEyw
	1IkFs5Cws5GrWktFnrZF43GF90kF15WFWqg3WjqanxZ343X3ZxGrnrXFZrGw47uF42krW3
	Ca4kKr9xu3ZakjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjBOJ7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RskF1pEAOORoQAAsI
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In init_ioports(), of_find_node_by_name() will return a node pointer
with refcount incremented. We should use of_node_put() when it is not
used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/8xx/tqm8xx_setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/8xx/tqm8xx_setup.c b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
index 3725d51248df..ffcfd17a5fa3 100644
--- a/arch/powerpc/platforms/8xx/tqm8xx_setup.c
+++ b/arch/powerpc/platforms/8xx/tqm8xx_setup.c
@@ -105,6 +105,9 @@ static void __init init_ioports(void)
 	if (dnode == NULL)
 		return;
 	prop = of_find_property(dnode, "ethernet1", &len);
+
+	of_node_put(dnode);
+
 	if (prop == NULL)
 		return;
 
-- 
2.25.1

