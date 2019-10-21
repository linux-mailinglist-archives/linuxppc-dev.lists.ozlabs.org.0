Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98710DF0E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 17:08:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xg4Z2rqBzDqw8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 02:08:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xfwT42VhzDqkT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 02:01:11 +1100 (AEDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 46xfk35l44zMrVkx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 16:52:11 +0200 (CEST)
Received: from ramsan ([84.194.98.4]) by baptiste.telenet-ops.be with bizsmtp
 id GErr2100805gfCL01Err8s; Mon, 21 Oct 2019 16:52:11 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-00075l-0P; Mon, 21 Oct 2019 16:51:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-0008FT-V5; Mon, 21 Oct 2019 16:51:50 +0200
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
Subject: [PATCH 2/5] cxgb4/cxgb4vf: Remove superfluous void * cast in
 debugfs_create_file() call
Date: Mon, 21 Oct 2019 16:51:46 +0200
Message-Id: <20191021145149.31657-3-geert+renesas@glider.be>
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

There is no need to cast a typed pointer to a void pointer when calling
a function that accepts the latter.  Remove it, as the cast prevents
further compiler checks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c b/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c
index f6fc0875d5b0a285..4a07a73c672b5996 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c
@@ -2480,7 +2480,7 @@ static int setup_debugfs(struct adapter *adapter)
 	for (i = 0; i < ARRAY_SIZE(debugfs_files); i++)
 		debugfs_create_file(debugfs_files[i].name,
 				    debugfs_files[i].mode,
-				    adapter->debugfs_root, (void *)adapter,
+				    adapter->debugfs_root, adapter,
 				    debugfs_files[i].fops);
 
 	return 0;
-- 
2.17.1

