Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48065463865
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 15:57:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3QLZ16Zcz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 01:57:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M4rxyShl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M4rxyShl; 
 dkim-atps=neutral
X-Greylist: delayed 462 seconds by postgrey-1.36 at boromir;
 Wed, 01 Dec 2021 01:57:06 AEDT
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3QKv009yz30Hj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 01:57:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90521B81A28;
 Tue, 30 Nov 2021 14:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6588CC53FC7;
 Tue, 30 Nov 2021 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283755;
 bh=oRuAmpp5REdqeW8iRnEJPu/Vsovl/VI3cLjHZcmwVyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4rxyShlKx52j5Xnvk/W9k2vEVjbxm/8K8E9LWQXd4eOdBuM2IdgImMiY3w7LDC8/
 E2gANettHp8ne7JxlRLjzJRS6xg72bOswP0y5j0ucLQHB3HrmejJm9zy0Z7IXZ1nci
 gjdYdHY6fq+Muo0thL4ERLKuoLIHiKPFbevjt4ZHTq8/Z29pFsmlOpGAT/VbR4U6uH
 DD0VHv0heMdfrTHwGSCNSLpYiTG1EwhZOby+HmwOtxob3StyxZcUHgO1nGjgQ3fk2t
 FimxHt/J4J6hPJ2nDrXVYmKmHAGswV1R+I19JkBbOMKK7iCiOkMOetWd5Q/cxLK7NL
 t8/D83H6humPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 50/68] xen: flag hvc_xen to be not essential for
 system boot
Date: Tue, 30 Nov 2021 09:46:46 -0500
Message-Id: <20211130144707.944580-50-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, jbeulich@suse.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jirislaby@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 0239143490a9fa1344955dde93527b09f5576dac ]

The Xen pv console driver is not essential for boot. Set the respective
flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20211022064800.14978-4-jgross@suse.com
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/hvc/hvc_xen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index f0bf01ea069ae..71e0dd2c0ce5b 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -522,6 +522,7 @@ static struct xenbus_driver xencons_driver = {
 	.remove = xencons_remove,
 	.resume = xencons_resume,
 	.otherend_changed = xencons_backend_changed,
+	.not_essential = true,
 };
 #endif /* CONFIG_HVC_XEN_FRONTEND */
 
-- 
2.33.0

