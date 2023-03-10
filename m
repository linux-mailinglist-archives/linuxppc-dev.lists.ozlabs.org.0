Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670206B55A1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 00:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYMk81cZBz3fRh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 10:30:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nd7BSFiH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nd7BSFiH;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYMh96S44z3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 10:29:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8/k/0g/cnB7JjkrJw62pfw7YETy2O4gsL5oxM2+sWXg=; b=nd7BSFiHFERaOSa0SJThwAwJMS
	bbXewyZgxa0XeZgYNC33U2n/qLEgBIMD3UDzFrq4bIhCUC6jfGewKah3QT/gLm6j/tVgx95ergkqv
	cahwvJB84yGe0Dhc+eq7pRz53STsCK/3l2EmN/Ab17V2/29GQ8N4ozL7ZXYGYrZnLmKoqe9lrYnyp
	wlha/IAEtdmNGOxHTq0h/Zao0/oKC3/+UfKw9n7uNq1ZJuULPtANW8MgD4VEuKSFrH2RK3Z69LpfE
	STv+MNARqOh7s0E1BKlBlhNmrBa+WarhclejAJ//sijYv5s4H1LJ7RH57DJdHauD+nqLPxMkbPLKx
	Dq3odsMg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamAN-00GcMA-32; Fri, 10 Mar 2023 23:28:51 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 2/2] ppc: simplify one-level sysctl registration for nmi_wd_lpm_factor_ctl_table
Date: Fri, 10 Mar 2023 15:28:50 -0800
Message-Id: <20230310232850.3960676-3-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230310232850.3960676-1-mcgrof@kernel.org>
References: <20230310232850.3960676-1-mcgrof@kernel.org>
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
Cc: j.granados@samsung.com, keescook@chromium.org, patches@lists.linux.dev, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, ebiederm@xmission.com, linux-fsdevel@vger.kernel.org, yzaikin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to declare an extra tables to just create directory,
this can be easily be done with a prefix path with register_sysctl().

Simplify this registration.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 arch/powerpc/platforms/pseries/mobility.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 4cea71aa0f41..2b58e76abef8 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -62,18 +62,10 @@ static struct ctl_table nmi_wd_lpm_factor_ctl_table[] = {
 	},
 	{}
 };
-static struct ctl_table nmi_wd_lpm_factor_sysctl_root[] = {
-	{
-		.procname       = "kernel",
-		.mode           = 0555,
-		.child          = nmi_wd_lpm_factor_ctl_table,
-	},
-	{}
-};
 
 static int __init register_nmi_wd_lpm_factor_sysctl(void)
 {
-	register_sysctl_table(nmi_wd_lpm_factor_sysctl_root);
+	register_sysctl("kernel", nmi_wd_lpm_factor_ctl_table);
 
 	return 0;
 }
-- 
2.39.1

