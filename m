Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473EDF0F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 17:11:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xg874FCPzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 02:11:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=2a02:1800:110:4::f00:d; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xfwT43z1zDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 02:01:12 +1100 (AEDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 46xfk22MQBzMrSS0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 16:52:10 +0200 (CEST)
Received: from ramsan ([84.194.98.4]) by andre.telenet-ops.be with bizsmtp
 id GErr2100E05gfCL01Erri3; Mon, 21 Oct 2019 16:52:09 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-000767-52; Mon, 21 Oct 2019 16:51:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-0008Fi-1d; Mon, 21 Oct 2019 16:51:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David@rox.of.borg, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Casey Leedom <leedom@chelsio.com>,
 Shannon Nelson <snelson@pensando.io>,
 Pensando Drivers <drivers@pensando.io>, Kevin Hilman <khilman@kernel.org>,
 Nishanth Menon <nm@ti.com>
Subject: [PATCH 5/5] ionic: Use debugfs_create_bool() to export bool
Date: Mon, 21 Oct 2019 16:51:49 +0200
Message-Id: <20191021145149.31657-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021145149.31657-1-geert+renesas@glider.be>
References: <20191021145149.31657-1-geert+renesas@glider.be>
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
Cc: amd-gfx@lists.freedesktop.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently bool ionic_cq.done_color is exported using
debugfs_create_u8(), which requires a cast, preventing further compiler
checks.

Fix this by switching to debugfs_create_bool(), and dropping the cast.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/pensando/ionic/ionic_debugfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c b/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c
index bc03cecf80cc9eb4..5beba915f69d12dd 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c
@@ -170,8 +170,7 @@ void ionic_debugfs_add_qcq(struct ionic_lif *lif, struct ionic_qcq *qcq)
 	debugfs_create_x64("base_pa", 0400, cq_dentry, &cq->base_pa);
 	debugfs_create_u32("num_descs", 0400, cq_dentry, &cq->num_descs);
 	debugfs_create_u32("desc_size", 0400, cq_dentry, &cq->desc_size);
-	debugfs_create_u8("done_color", 0400, cq_dentry,
-			  (u8 *)&cq->done_color);
+	debugfs_create_bool("done_color", 0400, cq_dentry, &cq->done_color);
 
 	debugfs_create_file("tail", 0400, cq_dentry, cq, &cq_tail_fops);
 
-- 
2.17.1

