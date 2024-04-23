Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3750B8ADF2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 10:03:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=dzsiMjXG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNvlD6PCjz3dLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 18:03:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=dzsiMjXG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 417 seconds by postgrey-1.37 at boromir; Tue, 23 Apr 2024 18:03:09 AEST
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNvkP7236z3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 18:03:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1713858962;
	bh=rorPfneHsH4rUwSDhKhni5qatzGJBaNeOV3jbM8lXHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dzsiMjXGUMnBeinztfZVIlnYV1FybTv3PVNga/7GNRmjq0tvokzKVmAqMxqZ4TZfu
	 3Mm9Xa73ByvDCbl+zSGzluYBcTMsPar3kyGR78xthILGtEnmvJBhKWCBZI5pDCg6C/
	 UHsAfQ2uBimCPXwCv8/f91yRU/qBVoZCnvSEXqbk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:38 +0200
Subject: [PATCH v3 03/11] hugetlb: constify ctl_table arguments of utility
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-sysctl-const-handler-v3-3-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=1138;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rorPfneHsH4rUwSDhKhni5qatzGJBaNeOV3jbM8lXHw=;
 b=uf+pHLZXXpo1yHHJ2Z13M1e5OT7jsu5lvkviloIZv10UAQiz7g1qEzlA2Tlm9z/kgvmk0wE7S
 t+OfiZGT2B0DcKcd55qz3Jc+6I9uA8iEvRoTSo4pFJmvocUaelGw1Ie
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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
Cc: Dave Chinner <david@fromorbit.com>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In a future commit the proc_handlers themselves will change to
"const struct ctl_table". As a preparation for that adapt the internal
helpers.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3b7d5ddc32ad..8d12ce63a439 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4911,7 +4911,7 @@ static unsigned int allowed_mems_nr(struct hstate *h)
 }
 
 #ifdef CONFIG_SYSCTL
-static int proc_hugetlb_doulongvec_minmax(struct ctl_table *table, int write,
+static int proc_hugetlb_doulongvec_minmax(const struct ctl_table *table, int write,
 					  void *buffer, size_t *length,
 					  loff_t *ppos, unsigned long *out)
 {
@@ -4928,7 +4928,7 @@ static int proc_hugetlb_doulongvec_minmax(struct ctl_table *table, int write,
 }
 
 static int hugetlb_sysctl_handler_common(bool obey_mempolicy,
-			 struct ctl_table *table, int write,
+			 const struct ctl_table *table, int write,
 			 void *buffer, size_t *length, loff_t *ppos)
 {
 	struct hstate *h = &default_hstate;

-- 
2.44.0

