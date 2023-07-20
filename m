Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558D75A741
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 09:06:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=kjhXejBi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R63dg0Jfhz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 17:06:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=kjhXejBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R63cq1Mfbz30gF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 17:06:02 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R63cZ58xGzBRDsS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 15:05:50 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689836750; x=1692428751; bh=qrWNtrc5VN97OTDvxvlf/+l0vBs
	nH6jqf6iPZAMxb/k=; b=kjhXejBi6GsJ6XUi9Q/sPq+ppv8O6rKmp0i2/BEdxT4
	KAdNBs3KjlrinIK0qj3fC9IYcCQP7dbb2ABi0y7p74M5c+91JYry5yTi0XZrcL72
	cFwKNTLfnTg4u0lMp6cH0rS/s8RkmWO46EE/53tiqmRan/4tuzYWegK0n5ppMfVp
	Xi7VAK+W1iGa3gtIKPqrUhZtgWidxFWkkbP+Fy/l4MuvM0EkN5VVfda+cKbdQue/
	xZCo29peYq8KDf0sxiYZlhFr2EODJCtQ4WJHBpZL00RNrZi7FBSWwjCp6B6+QQvX
	/ip9mJDPM8Eze2/4/jofKUb3zwUeVM4YVXazMCpjoJQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NGi_ZYRuuh56 for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 20 Jul 2023 15:05:50 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R63cZ20L3zBRDsD;
	Thu, 20 Jul 2023 15:05:50 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 15:05:50 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH] powernv: vas-trace: remove space after '('
In-Reply-To: <tencent_17F68D4711DDD23ED72A9E0708C4549F540A@qq.com>
References: <tencent_17F68D4711DDD23ED72A9E0708C4549F540A@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <28bb80fbf964a6c110b17ae1908e68de@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix below checkpatch errors:

/platforms/powernv/vas-trace.h:ERROR:space prohibited after that open 
parenthesis '('
/platforms/powernv/vas-trace.h:ERROR:space prohibited after that open 
parenthesis '('
/platforms/powernv/vas-trace.h:ERROR:space prohibited after that open 
parenthesis '('

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/powernv/vas-trace.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-trace.h 
b/arch/powerpc/platforms/powernv/vas-trace.h
index ca2e08f2ddc0..64acc0dccca8 100644
--- a/arch/powerpc/platforms/powernv/vas-trace.h
+++ b/arch/powerpc/platforms/powernv/vas-trace.h
@@ -10,7 +10,7 @@
  #include <linux/sched.h>
  #include <asm/vas.h>

-TRACE_EVENT(    vas_rx_win_open,
+TRACE_EVENT(vas_rx_win_open,

          TP_PROTO(struct task_struct *tsk,
               int vasid,
@@ -45,7 +45,7 @@ TRACE_EVENT(    vas_rx_win_open,
              __entry->lnotify_tid)
  );

-TRACE_EVENT(    vas_tx_win_open,
+TRACE_EVENT(vas_tx_win_open,

          TP_PROTO(struct task_struct *tsk,
               int vasid,
@@ -77,7 +77,7 @@ TRACE_EVENT(    vas_tx_win_open,
              __entry->lpid, __entry->pidr)
  );

-TRACE_EVENT(    vas_paste_crb,
+TRACE_EVENT(vas_paste_crb,

          TP_PROTO(struct task_struct *tsk,
              struct pnv_vas_window *win),
