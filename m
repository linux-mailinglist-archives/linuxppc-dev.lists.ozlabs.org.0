Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0747B515F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 13:30:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H8AkdvIe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzf0J2MZ6z3vXV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 22:30:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H8AkdvIe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzdyS5qWwz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 22:29:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FCC1CE0E27;
	Mon,  2 Oct 2023 11:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2B8EC433C7;
	Mon,  2 Oct 2023 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696246156;
	bh=ZJT/h6KujIsYVdJAaw35ma6el/sMgxTmZwB8rPTK3Jw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H8AkdvIeEYjRYVGHhgh4jofXC6pRgfgRUn977wPUoBVixl7Ihv27IlVCkDkbzYgUw
	 JX3YmfESSQAA3wHuzCFfySd74tVQvryVpGAhB/4RNJZwz5kjyf0O9g4ZblOx1CSlFW
	 5cDEgwcBowAUng6+x/lrk5488XQ0u6ERILRg4fdsypnepBeNOyevQwqGkGrlZqZMRZ
	 0pUoDjC6Wh4lx8N2RvREMCpw/5KzB14bmOYvmc8urrphBg2fzpeHtc7lKSf2YNfjZT
	 UhyE56Yp5+vYnCRmjFygSZ8vRdyBxx3AYRkRt311hmSkSGw+ThguHUuzIsv0g7AmXS
	 cdDnGnTbBKgcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F57E7849A;
	Mon,  2 Oct 2023 11:29:16 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 13:30:36 +0200
Subject: [PATCH v3 1/7] S390: Remove now superfluous sentinel elem from
 ctl_table arrays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231002-jag-sysctl_remove_empty_elem_arch-v3-1-606da2840a7a@samsung.com>
References:  <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
In-Reply-To:  <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=pn7bMLkI/eiDwqHrK4wsGA8iyiwVG5+tCRzjqhQHPj8=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGqoTD6OVG9z33/NcsqSkaUWni+BE/Ybac1ZbK
 D1bCulrq+eJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqqEwAKCRC6l81St5ZB
 TwDYC/9wIAwjRpEE+yBz0V2sOLY6kH75yeL1P4jA+iE8PZylyyQ4a7Q8dvoM7DaRdzBzwm+UOho
 QCKoGbsX1Zj06C25/5fCa/5HFwqZBRfRrQ97ynnEe0fsGmXQ6MhzDErFBe1s/lW6EmrJnn0df7g
 uWO2RFOeND4Hdd55odOt7pkrsTqxtAMkTGhjQJVWrnrsy69EXJ/DmrjJxTn7x+UmSSN5pWrEed3
 vUCje8uKasMyEUm20V8M6nAVZ6SlaefUBhwJDsnUIccjpR96uAVXpByYrbXZqvVOlPJovahzjX5
 hmbdAm4hk9bkVLZkkGNfIlnkM/ynS1r7+X7z2huAe1ifp14shL8PpCcNO7t6kiw8K+4l1IjdQ5/
 yKWU1MuOLlcsMLx15ZgcFep8d0UAE0W0EFfztbWJ9QDXLY5cpgNGfTzHANoZsiX25PesgriFHLP
 jXdz1Yz0b/RR1QL7CbA0JRsDMWTsNyZeeD1zcG/iOPiIZTh313h1l4kk1TDYsdKznk1YU=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:  by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
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
Reply-To: j.granados@samsung.com
Cc: Joel Granados <j.granados@samsung.com>, linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which will
reduce the overall build time size of the kernel and run time memory
bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove the sentinel element from appldata_table, s390dbf_table,
topology_ctl_table, cmm_table and page_table_sysctl. Reduced the memory
allocation in appldata_register_ops by 1 effectively removing the
sentinel from ops->ctl_table.

This removal is safe because register_sysctl_sz and register_sysctl use
the array size in addition to checking for the sentinel.

Tested-by: Alexander Gordeev <agordeev@linux.ibm.com>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/s390/appldata/appldata_base.c | 4 +---
 arch/s390/kernel/debug.c           | 1 -
 arch/s390/kernel/topology.c        | 1 -
 arch/s390/mm/cmm.c                 | 1 -
 arch/s390/mm/pgalloc.c             | 1 -
 5 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
index 3b0994625652..c2978cb03b36 100644
--- a/arch/s390/appldata/appldata_base.c
+++ b/arch/s390/appldata/appldata_base.c
@@ -63,7 +63,6 @@ static struct ctl_table appldata_table[] = {
 		.mode		= S_IRUGO | S_IWUSR,
 		.proc_handler	= appldata_interval_handler,
 	},
-	{ },
 };
 
 /*
@@ -351,8 +350,7 @@ int appldata_register_ops(struct appldata_ops *ops)
 	if (ops->size > APPLDATA_MAX_REC_SIZE)
 		return -EINVAL;
 
-	/* The last entry must be an empty one */
-	ops->ctl_table = kcalloc(2, sizeof(struct ctl_table), GFP_KERNEL);
+	ops->ctl_table = kcalloc(1, sizeof(struct ctl_table), GFP_KERNEL);
 	if (!ops->ctl_table)
 		return -ENOMEM;
 
diff --git a/arch/s390/kernel/debug.c b/arch/s390/kernel/debug.c
index a85e0c3e7027..85328a0ef3b6 100644
--- a/arch/s390/kernel/debug.c
+++ b/arch/s390/kernel/debug.c
@@ -978,7 +978,6 @@ static struct ctl_table s390dbf_table[] = {
 		.mode		= S_IRUGO | S_IWUSR,
 		.proc_handler	= s390dbf_procactive,
 	},
-	{ }
 };
 
 static struct ctl_table_header *s390dbf_sysctl_header;
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 68adf1de8888..be8467b25953 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -636,7 +636,6 @@ static struct ctl_table topology_ctl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= topology_ctl_handler,
 	},
-	{ },
 };
 
 static int __init topology_init(void)
diff --git a/arch/s390/mm/cmm.c b/arch/s390/mm/cmm.c
index f47515313226..f8b13f247646 100644
--- a/arch/s390/mm/cmm.c
+++ b/arch/s390/mm/cmm.c
@@ -332,7 +332,6 @@ static struct ctl_table cmm_table[] = {
 		.mode		= 0644,
 		.proc_handler	= cmm_timeout_handler,
 	},
-	{ }
 };
 
 #ifdef CONFIG_CMM_IUCV
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 07fc660a24aa..75e1039f2ec5 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -30,7 +30,6 @@ static struct ctl_table page_table_sysctl[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
-	{ }
 };
 
 static int __init page_table_register_sysctl(void)

-- 
2.30.2

