Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B876CACD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 20:17:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Plgy85zS9z3fT6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 05:17:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CvlUsE/u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CvlUsE/u;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlgxF4SxKz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 05:16:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8E3B9B816D6;
	Mon, 27 Mar 2023 18:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABABC4339B;
	Mon, 27 Mar 2023 18:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679940971;
	bh=zdL+k3/HodzdiDKsCUqJ/ncG7UqyOUXuharkX+zcLow=;
	h=From:To:Cc:Subject:Date:From;
	b=CvlUsE/ur0tboElKU6eL5mxsD6spgitv88oe/0jq9Kj2Rus+RyRoeHzd2dY5KValB
	 YAtfBpPENsPYo6hyXSPyN9gqsNVG6x+aDoI67NJlBB5He3bP6irbz3rZcH7G72FSbF
	 MuVLp77uf+hhqMXQTYUMI9EE2Va+g/0U2Srl4gVs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/fsl: fix compiler warning in fsl_wakeup_sys_init()
Date: Mon, 27 Mar 2023 20:16:06 +0200
Message-Id: <20230327181606.1424846-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=gregkh@linuxfoundation.org; h=from:subject; bh=zdL+k3/HodzdiDKsCUqJ/ncG7UqyOUXuharkX+zcLow=; b=owGbwMvMwCRo6H6F97bub03G02pJDCmKd1PEzCpzpPdXvExbrvBGNNHU64CndspJde0le3miT yzd8sK+I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACYyZQbDgml9rFfN3XKLl/Bc Unw3z4TruvLSiQwLtp/fVzNN0pfz85+QPf/TlV5UnFrzBQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: kernel test robot <lkp@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit c93bd175414a ("powerpc/fsl: move to use bus_get_dev_root()")
changed to use bus_get_dev_root() but didn't consider that the function
can fail and return an uninitialized value of ret (hint, the function
can never fail, but the compiler doesn't know that.)

Fix this up by setting ret to -EINVAL just in case something really goes
wrong with the call to bus_get_dev_root().

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Fixes: c93bd175414a ("powerpc/fsl: move to use bus_get_dev_root()")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303280045.4oaaezcn-lkp@intel.com/
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
index 147b5d8bb904..ce6c739c51e5 100644
--- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
+++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
@@ -117,7 +117,7 @@ static struct device_attribute mpic_attributes = __ATTR(timer_wakeup, 0644,
 static int __init fsl_wakeup_sys_init(void)
 {
 	struct device *dev_root;
-	int ret;
+	int ret = -EINVAL;
 
 	fsl_wakeup = kzalloc(sizeof(struct fsl_mpic_timer_wakeup), GFP_KERNEL);
 	if (!fsl_wakeup)
-- 
2.40.0

