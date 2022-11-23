Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC8635AE9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 12:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHJCK53N4z3f4g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 22:03:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=zhang.songyi@zte.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 457 seconds by postgrey-1.36 at boromir; Wed, 23 Nov 2022 20:15:27 AEDT
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHFpR6PZTz3cGD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 20:15:26 +1100 (AEDT)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NHFdZ1yRtz1DDw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 17:07:46 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4NHFd63ssnzBf6M0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 17:07:22 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxus.zte.com.cn (FangMail) with ESMTPS id 4NHFcP2ZNkz9tyD6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 17:06:45 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NHFcH07HLz8RV6G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 17:06:39 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4NHFc36spTz4y0tt;
	Wed, 23 Nov 2022 17:06:27 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
	by mse-fl1.zte.com.cn with SMTP id 2AN96HLb057157;
	Wed, 23 Nov 2022 17:06:17 +0800 (+08)
	(envelope-from zhang.songyi@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 23 Nov 2022 17:06:19 +0800 (CST)
Date: Wed, 23 Nov 2022 17:06:19 +0800 (CST)
X-Zmail-TransId: 2afa637de28bffffffffb1842df1
X-Mailer: Zmail v1.0
Message-ID: <202211231706198927223@zte.com.cn>
Mime-Version: 1.0
From: <zhang.songyi@zte.com.cn>
To: <arnd@arndb.de>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIHBvd2VycGMvY2VsbC9heG9uX21zaTogcmVwbGFjZSBERUZJTkVfU0lNUExFX0FUVFJJQlVURSB3aXRoCiBERUZJTkVfREVCVUdGU19BVFRSSUJVVEU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2AN96HLb057157
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 637DE2E1.000 by FangMail milter!
X-FangMail-Envelope: 1669194466/4NHFdZ1yRtz1DDw/637DE2E1.000/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<zhang.songyi@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 637DE2E1.000/4NHFdZ1yRtz1DDw
X-Mailman-Approved-At: Wed, 23 Nov 2022 22:03:15 +1100
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, zhang.songyi@zte.com.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: zhang songyi <zhang.songyi@zte.com.cn>

Fix the following coccicheck warning:
/arch/powerpc/platforms/cell/axon_msi.c:457:0-23: WARNING:
fops_msic should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 arch/powerpc/platforms/cell/axon_msi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 5b012abca773..ab080b5022ff 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -454,7 +454,7 @@ static int msic_get(void *data, u64 *val)
        return 0;
 }

-DEFINE_SIMPLE_ATTRIBUTE(fops_msic, msic_get, msic_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_msic, msic_get, msic_set, "%llu\n");

 void axon_msi_debug_setup(struct device_node *dn, struct axon_msic *msic)
 {
@@ -475,6 +475,7 @@ void axon_msi_debug_setup(struct device_node *dn, struct axon_msic *msic)

        snprintf(name, sizeof(name), "msic_%d", of_node_to_nid(dn));

-       debugfs_create_file(name, 0600, arch_debugfs_dir, msic, &fops_msic);
+       debugfs_create_file_unsafe(name, 0600, arch_debugfs_dir,
+                                  msic, &fops_msic);
 }
 #endif /* DEBUG */
--
2.15.2
