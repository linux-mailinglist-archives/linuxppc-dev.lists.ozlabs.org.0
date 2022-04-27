Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A97B51291E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpdsY1PSFz3g10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:52:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=R4BaLs+4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=R4BaLs+4; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpZcL4Dg1z3bd9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 09:25:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jw69MD++mJtoVz+5OF/yDyT7SM6GG1QVsO5qZnTbfPY=; b=R4BaLs+44BYJptao8GvC8ttDH3
 QBY0eMxhKSzWFCpxMbR+Fbp293MCB3zvPYgTPMf/b3OkQdSjP24E3L8e4Mxpy4tg+aM7LX40+eANn
 E9NmhqtSLVcTKfq6OAtiABfZVuEeL7pK/Jggwsb0Z66SwiIPgUgdk8N8FAOWtcyDE4pUFXnvlOs4u
 KY15nvIzaU7LDhXzbLelthG04bdK8jQeGFwa+aWfBFuZkkmcHkGvkm9AzL5O497raBTZiIXIwFkMO
 bBhCSNyrOC33WN5GrpTyqWn82roSYAhC1Njfns6EapEQdXDs5qCmdq3kXZk6bj6zjDvwVdiy1jwJ3
 PjTlDVgw==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqUS-0001zw-SF; Thu, 28 Apr 2022 00:50:33 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 03/30] notifier: Add panic notifiers info and purge trailing
 whitespaces
Date: Wed, 27 Apr 2022 19:48:57 -0300
Message-Id: <20220427224924.592546-4-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Apr 2022 11:34:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, Valentin Schneider <valentin.schneider@arm.com>,
 vgoyal@redhat.com, Xiaoming Ni <nixiaoming@huawei.com>,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com,
 Arjan van de Ven <arjan@linux.intel.com>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Although many notifiers are mentioned in the comments, the panic
notifiers infrastructure is not. Also, the file contains some
trailing whitespaces. This commit fix both issues.

Cc: Arjan van de Ven <arjan@linux.intel.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 include/linux/notifier.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..0589896fc7bd 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -201,12 +201,12 @@ static inline int notifier_to_errno(int ret)
 
 /*
  *	Declared notifiers so far. I can imagine quite a few more chains
- *	over time (eg laptop power reset chains, reboot chain (to clean 
+ *	over time (eg laptop power reset chains, reboot chain (to clean
  *	device units up), device [un]mount chain, module load/unload chain,
- *	low memory chain, screenblank chain (for plug in modular screenblankers) 
+ *	low memory chain, screenblank chain (for plug in modular screenblankers)
  *	VC switch chains (for loadable kernel svgalib VC switch helpers) etc...
  */
- 
+
 /* CPU notfiers are defined in include/linux/cpu.h. */
 
 /* netdevice notifiers are defined in include/linux/netdevice.h */
@@ -217,6 +217,8 @@ static inline int notifier_to_errno(int ret)
 
 /* Virtual Terminal events are defined in include/linux/vt.h. */
 
+/* Panic notifiers are defined in include/linux/panic_notifier.h. */
+
 #define NETLINK_URELEASE	0x0001	/* Unicast netlink socket released */
 
 /* Console keyboard events.
-- 
2.36.0

