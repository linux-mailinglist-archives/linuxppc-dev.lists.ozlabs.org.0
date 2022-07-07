Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC55697DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 04:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldg8x53dVz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 12:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=2400:dd01:100f:2:72e2:84ff:fe10:5f45; helo=mail.nfschina.com; envelope-from=zeming@nfschina.com; receiver=<UNKNOWN>)
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdfkL1Lcvz3c2l
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 12:00:10 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id D52631E80D82;
	Thu,  7 Jul 2022 09:57:49 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZKH5BkaPIZF; Thu,  7 Jul 2022 09:57:47 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 094C11E80D74;
	Thu,  7 Jul 2022 09:57:47 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: benh@kernel.crashing.org
Subject: [PATCH] macintosh/windfarm_pid: Add header file macro definition
Date: Thu,  7 Jul 2022 09:59:49 +0800
Message-Id: <20220707015949.3733-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Thu, 07 Jul 2022 12:19:04 +1000
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
Cc: kernel@nfschina.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I think the header file could avoid redefinition errors.
 at compile time by adding macro definitions.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/macintosh/windfarm_pid.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/macintosh/windfarm_pid.h b/drivers/macintosh/windfarm_pid.h
index 83f747dbeafc..9882e90a5071 100644
--- a/drivers/macintosh/windfarm_pid.h
+++ b/drivers/macintosh/windfarm_pid.h
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _WINDFARM_PID_H
+#define _WINDFARM_PID_H
+
 /*
  * Windfarm PowerMac thermal control. Generic PID helpers
  *
@@ -82,3 +85,4 @@ struct wf_cpu_pid_state {
 extern void wf_cpu_pid_init(struct wf_cpu_pid_state *st,
 			    struct wf_cpu_pid_param *param);
 extern s32 wf_cpu_pid_run(struct wf_cpu_pid_state *st, s32 power, s32 temp);
+#endif
-- 
2.18.2

