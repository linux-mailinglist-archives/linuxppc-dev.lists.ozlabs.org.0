Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D37C5DF0FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 17:13:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xgBs2ghmzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 02:13:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.137.77; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xfwV0ZRHzDqkd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 02:01:12 +1100 (AEDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 46xfk10rrJzMr0ly
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 16:52:09 +0200 (CEST)
Received: from ramsan ([84.194.98.4]) by xavier.telenet-ops.be with bizsmtp
 id GErr2100B05gfCL01ErrRZ; Mon, 21 Oct 2019 16:52:08 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-00075h-Vs; Mon, 21 Oct 2019 16:51:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-0008FR-UG; Mon, 21 Oct 2019 16:51:50 +0200
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
Subject: [PATCH 1/5] crypto: nx - Improve debugfs_create_u{32,
 64}() handling for atomics
Date: Mon, 21 Oct 2019 16:51:45 +0200
Message-Id: <20191021145149.31657-2-geert+renesas@glider.be>
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

Variables of type atomic{,64}_t can be used fine with
debugfs_create_u{32,64}, when passing a pointer to the embedded counter.
This allows to get rid of the casts, which prevented compiler checks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/crypto/nx/nx_debugfs.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/nx/nx_debugfs.c b/drivers/crypto/nx/nx_debugfs.c
index e0d44a5512ab455b..1975bcbee997481e 100644
--- a/drivers/crypto/nx/nx_debugfs.c
+++ b/drivers/crypto/nx/nx_debugfs.c
@@ -38,23 +38,23 @@ void nx_debugfs_init(struct nx_crypto_driver *drv)
 	drv->dfs_root = root;
 
 	debugfs_create_u32("aes_ops", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u32 *)&drv->stats.aes_ops);
+			   root, &drv->stats.aes_ops.counter);
 	debugfs_create_u32("sha256_ops", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u32 *)&drv->stats.sha256_ops);
+			   root, &drv->stats.sha256_ops.counter);
 	debugfs_create_u32("sha512_ops", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u32 *)&drv->stats.sha512_ops);
+			   root, &drv->stats.sha512_ops.counter);
 	debugfs_create_u64("aes_bytes", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u64 *)&drv->stats.aes_bytes);
+			   root, &drv->stats.aes_bytes.counter);
 	debugfs_create_u64("sha256_bytes", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u64 *)&drv->stats.sha256_bytes);
+			   root, &drv->stats.sha256_bytes.counter);
 	debugfs_create_u64("sha512_bytes", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u64 *)&drv->stats.sha512_bytes);
+			   root, &drv->stats.sha512_bytes.counter);
 	debugfs_create_u32("errors", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u32 *)&drv->stats.errors);
+			   root, &drv->stats.errors.counter);
 	debugfs_create_u32("last_error", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u32 *)&drv->stats.last_error);
+			   root, &drv->stats.last_error.counter);
 	debugfs_create_u32("last_error_pid", S_IRUSR | S_IRGRP | S_IROTH,
-			   root, (u32 *)&drv->stats.last_error_pid);
+			   root, &drv->stats.last_error_pid.counter);
 }
 
 void
-- 
2.17.1

