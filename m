Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD550512910
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:46:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpdkn5GGsz3fT6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:46:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ZiYAT8sJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=ZiYAT8sJ; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpYzy2RTJz3bY6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 08:57:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vlo9T2/mvIa7VmsgTZAplfpKcY639xSpi9Lsc7QD2sA=; b=ZiYAT8sJyiBNaHzrk2673FL4+8
 1oiyWalKP6LGmKEc9hZJWoXC6cS5nMMrcCw5Iicmmfaanay2XW+Ea9CLz93XJRZPptEPdWhd8bk0b
 rKw9muPDbsgcmhx+6dtX/C/iDyONNGYxGodf7FR5gZ6gaCx9CBSOMyg/WgkwloH6LwMYOPDHwMc9i
 DlZzPF1Rmfq/gUUioCECpXAnYQMmNjWP7xmmSjqLdHZxdMlvMlgrtO3h+d5FTnJJbisLeLao1OJx/
 z7mwY9pmIo/3ja9SO2+rtPXIxKaESObUyZjm7eg6MS41mJJ7ZAlwRmPdpw93iK7tmvwyFHIvecdrE
 ZFlVRrJg==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqb3-0002Tm-Pi; Thu, 28 Apr 2022 00:57:22 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 26/30] Drivers: hv: Do not force all panic notifiers to
 execute before kdump
Date: Wed, 27 Apr 2022 19:49:20 -0300
Message-Id: <20220427224924.592546-27-gpiccoli@igalia.com>
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
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org,
 Stephen Brennan <stephen.s.brennan@oracle.com>, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, Dexuan Cui <decui@microsoft.com>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com,
 Haiyang Zhang <haiyangz@microsoft.com>, vgoyal@redhat.com,
 Andrea Parri <parri.andrea@gmail.com>, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit a11589563e96 ("x86/Hyper-V: Report crash register
data or kmsg before running crash kernel") Hyper-V forcibly sets
the kernel parameter "crash_kexec_post_notifiers"; with that, it
did enforce the execution of *all* panic notifiers before kdump.
The main reason behind that is that Hyper-V has an hypervisor
notification mechanism that has the ability of warning the
hypervisor when the guest panics.

Happens that after the panic notifiers refactor, we now have 3 lists
and a level mechanism that defines the ordering of the notifiers
execution with regards to kdump. And for Hyper-V, the specific
notifier to inform the hypervisor about a panic lies in the first
list, which *by default* is set to execute before kdump. Hence,
this patch removes the hardcoded setting, effectively reverting
the aforementioned commit.

One of the problems with the forced approach was greatly exposed by
commit d57d6fe5bf34 ("drivers: hv: log when enabling crash_kexec_post_notifiers")
which ended-up confusing the user that didn't expect the notifiers
to execute before kdump, since it's a user setting and wasn't
enabled by such user. With the patch hereby proposed, that kind
of issue doesn't happen anymore, the panic notifiers level is
well-documented and users can expect a predictable behavior.

Fixes: a11589563e96 ("x86/Hyper-V: Report crash register data or kmsg before running crash kernel")
Fixes: d57d6fe5bf34 ("drivers: hv: log when enabling crash_kexec_post_notifiers"
Cc: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Michael Kelley <mikelley@microsoft.com>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Tested-by: Fabio A M Martins <fabiomirmar@gmail.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

Special thanks to Michael Kelley for the good information about the Hyper-V
panic path in email threads some months ago, and to Fabio for the testing
performed.

 drivers/hv/hv_common.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index ae68298c0dca..af59793de523 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -73,18 +73,6 @@ int __init hv_common_init(void)
 {
 	int i;
 
-	/*
-	 * Hyper-V expects to get crash register data or kmsg when
-	 * crash enlightment is available and system crashes. Set
-	 * crash_kexec_post_notifiers to be true to make sure that
-	 * calling crash enlightment interface before running kdump
-	 * kernel.
-	 */
-	if (ms_hyperv.misc_features & HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE) {
-		crash_kexec_post_notifiers = true;
-		pr_info("Hyper-V: enabling crash_kexec_post_notifiers\n");
-	}
-
 	/*
 	 * Allocate the per-CPU state for the hypercall input arg.
 	 * If this allocation fails, we will not be able to setup
-- 
2.36.0

