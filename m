Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 915428ADF56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 10:05:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=dtp2KrFT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNvmp1bKGz3vgy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 18:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=dtp2KrFT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNvkQ0kY8z3cLQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 18:03:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1713858962;
	bh=C10U8w+9znaxkvj5EdGV6iNeFy+LKwoCMige5+WbmRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dtp2KrFTs1ZPOV423X3Lj+ohYH+w1R0E/8kBpk9DMXXZtdIcFmbTu30wN5OkBGmMP
	 FLzPXuqgfXj6gzjMKHmGAW69Xpdffu14WLEeO5qDjUe0ZwtkRmnV3IoKoevaneipoy
	 3sjOVDTg0D0OU3K0YuEo6+K2obOUKB6HIC+G61H4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 23 Apr 2024 09:54:40 +0200
Subject: [PATCH v3 05/11] neighbour: constify ctl_table arguments of
 utility function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-sysctl-const-handler-v3-5-e0beccb836e2@weissschuh.net>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Joel Granados <j.granados@samsung.com>, Kees Cook <keescook@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713858961; l=808;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=C10U8w+9znaxkvj5EdGV6iNeFy+LKwoCMige5+WbmRk=;
 b=EAoTey3kmtnh/z6T2K9kHOuOiGQPDvnlrHzdVg4MNSMG74MpVnrzaAzOlr8qG7tTA+0aGApZ5
 EfQ5uq8SVYaAWFetEV8qu3UzVUp6J12UzjZsoq4ZupsTosh3ACnOL89
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
helper.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 net/core/neighbour.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 0805c00c63d4..92a01664a723 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -3578,7 +3578,7 @@ static void neigh_copy_dflt_parms(struct net *net, struct neigh_parms *p,
 	rcu_read_unlock();
 }
 
-static void neigh_proc_update(struct ctl_table *ctl, int write)
+static void neigh_proc_update(const struct ctl_table *ctl, int write)
 {
 	struct net_device *dev = ctl->extra1;
 	struct neigh_parms *p = ctl->extra2;

-- 
2.44.0

