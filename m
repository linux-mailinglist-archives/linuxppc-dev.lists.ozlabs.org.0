Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D174E23A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 10:51:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMVHb6nvSz3bXs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 20:51:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lYjtzbmN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=lYjtzbmN; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMVH01VxWz3069
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 20:50:36 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 509585C015A;
 Mon, 21 Mar 2022 05:50:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Mar 2022 05:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
 :message-id:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xqO+J3
 qYKvWooJVksUuAiiLBEJdNT3Gcv0iTkRapBjk=; b=lYjtzbmNgu9kHcHHiK3Z4S
 Dsr8cAsC3eoZ21FA9GYNMArW6agjvK34YkZm2IEL1eCgxxG+GAUOvyrTMRBe0XS7
 tTvfqzH3OPwq9SA4GblDIrIvWMiuK1oPZMglsLgZuJ1stUj9bHz632S3MKnF2Pag
 G9K0mdfMJmPCfXnvRU17VNSMEGwiRtYVyFomfAbL5Mq0RFmYYwExJ1LtOlR6sw1Z
 HtfNDswkO+q5oj2vGe2IulefbYLhZFdoTmNPJjYvwoX6BX0Tctmjl+QFcLhB6Bfg
 WTwyOwjDAU+uU2+uoC9CIF1YKHWVMczeVwW0J17OgewZWMHTrHMNFDheA7O2Jm6w
 ==
X-ME-Sender: <xms:ako4Yux8q43usDDm96wgdu2H1deV3FakXwGGIf5m_REAzk1_28HdBg>
 <xme:ako4YqRUxn2xzKbzU7Id-vLVlkC36KLiCZs8tkWKKH1oHfGzsFn_YchXSvCDeqOT4
 pimMjGugYTDdPFVRwM>
X-ME-Received: <xmr:ako4YgW6DfRERd-rdV_8o6HjweYOy6i0qBZXdZWNIcjnv5J_hJsZ6yohXljdl9EQV1xlceP-3-hZfARUAdRyTBbsUfQSWt-RFW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgrihhn
 uceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnh
 eptdelteekleekkedvueejheekgfdvtdehhefhteeitefhteefgefhudehveevleelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrih
 hnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:ako4YkgeeFYL9MUuHfcBrJUPWJTYuzijYp2tN2l3UjwySb7xHJQG2Q>
 <xmx:ako4YgBZ_VIRae9Wn588l_eKRby8MK8zlr80RZSeZsKhT_gmXif-zQ>
 <xmx:ako4YlKBu4AWNY8YP5qVw4Mc5NtRTKhWBcqwdqfbKZsSeyaECSztwA>
 <xmx:ako4YjOGuqakraTt_B-LeleQlEcEKwzY3o_m6BwrvOnJBY-YueV63Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 05:50:32 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <0c11c0770fc4ec7e80a4b2e0ffce1055b792cfdb.1647854880.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] macintosh/via-pmu: Avoid compiler warnings when
 CONFIG_PROC_FS is disabled
Date: Mon, 21 Mar 2022 20:28:00 +1100
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/macintosh/via-pmu.c:897:12: warning: 'pmu_battery_proc_show' defined but not used [-Wunused-function]
 static int pmu_battery_proc_show(struct seq_file *m, void *v)
            ^~~~~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu.c:871:12: warning: 'pmu_irqstats_proc_show' defined but not used [-Wunused-function]
 static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
            ^~~~~~~~~~~~~~~~~~~~~~
drivers/macintosh/via-pmu.c:860:12: warning: 'pmu_info_proc_show' defined but not used [-Wunused-function]
 static int pmu_info_proc_show(struct seq_file *m, void *v)
            ^~~~~~~~~~~~~~~~~~

Add some #ifdefs to avoid unused code warnings when CONFIG_PROC_FS is
disabled.

Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since v1:
 - Simplified to take advantage of the fact that proc_mkdir() is stubbed
   out when CONFIG_PROC_FS=n. Hence that call doesn't need to move
   within the #ifdef.
---
 drivers/macintosh/via-pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 2109129ea1bb..495fd35b11de 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -204,9 +204,11 @@ static int init_pmu(void);
 static void pmu_start(void);
 static irqreturn_t via_pmu_interrupt(int irq, void *arg);
 static irqreturn_t gpio1_interrupt(int irq, void *arg);
+#ifdef CONFIG_PROC_FS
 static int pmu_info_proc_show(struct seq_file *m, void *v);
 static int pmu_irqstats_proc_show(struct seq_file *m, void *v);
 static int pmu_battery_proc_show(struct seq_file *m, void *v);
+#endif
 static void pmu_pass_intr(unsigned char *data, int len);
 static const struct proc_ops pmu_options_proc_ops;
 
@@ -857,6 +859,7 @@ query_battery_state(void)
 			2, PMU_SMART_BATTERY_STATE, pmu_cur_battery+1);
 }
 
+#ifdef CONFIG_PROC_FS
 static int pmu_info_proc_show(struct seq_file *m, void *v)
 {
 	seq_printf(m, "PMU driver version     : %d\n", PMU_DRIVER_VERSION);
@@ -977,6 +980,7 @@ static const struct proc_ops pmu_options_proc_ops = {
 	.proc_release	= single_release,
 	.proc_write	= pmu_options_proc_write,
 };
+#endif
 
 #ifdef CONFIG_ADB
 /* Send an ADB command */
-- 
2.32.0

