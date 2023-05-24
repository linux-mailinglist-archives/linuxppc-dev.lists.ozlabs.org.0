Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E4070FB11
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 18:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRG9J0nrDz3fS8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 02:00:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KzIdXKHw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRG5m5kH8z3f7j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KzIdXKHw;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRG5l41STz4x46;
	Thu, 25 May 2023 01:56:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684943819;
	bh=SibCu5hbkCNZrPVw6RETBvRPo+OI/DYG2D1OFC/b1dE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzIdXKHwxxd3j0FduASPcesMjZeYkfSk/g00GGwANuRi+5VTyrdO766gIAOTULPzN
	 /98f2t9c+kfBcgveEWZZodfvf2KGTl++qMB1HYBn2XoiF5Yz9CsM1T65V4zhn45qIZ
	 IaUB9NswoROgPrF1J1CEI2MTgF+wR3xMTq6A2OgWZiozYhTBFsqes4zEcCIn+DCCt5
	 UpWHTXj4ezY5TPaHp1yOnKA0Iq05FnDc9uvz84pMJpLAFQOG/Z1ppaeSnyzOifTRQB
	 MDDy+PLYnzxP/mmqtf2dsWpOtRxpAI1BUzRFctT7VQBQoCye8l58BZCuaMLMVEj0W3
	 j3cIoZ6bsOzwQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/9] cpu/SMT: Move smt/control simple exit cases earlier
Date: Thu, 25 May 2023 01:56:23 +1000
Message-Id: <20230524155630.794584-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155630.794584-1-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the simple exit cases, ie. which don't depend on the value written,
earlier in the function. That makes it clearer that regardless of the
input those states can not be transitioned out of.

That does have a user-visible effect, in that the error returned will
now always be EPERM/ENODEV for those states, regardless of the value
written. Previously writing an invalid value would return EINVAL even
when in those states.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 kernel/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f4a2c5845bcb..01398ce3e131 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2481,6 +2481,12 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
 {
 	int ctrlval, ret;
 
+	if (cpu_smt_control == CPU_SMT_FORCE_DISABLED)
+		return -EPERM;
+
+	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
+		return -ENODEV;
+
 	if (sysfs_streq(buf, "on"))
 		ctrlval = CPU_SMT_ENABLED;
 	else if (sysfs_streq(buf, "off"))
@@ -2490,12 +2496,6 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
 	else
 		return -EINVAL;
 
-	if (cpu_smt_control == CPU_SMT_FORCE_DISABLED)
-		return -EPERM;
-
-	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
-		return -ENODEV;
-
 	ret = lock_device_hotplug_sysfs();
 	if (ret)
 		return ret;
-- 
2.40.1

