Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617B1FEA2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 06:35:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nTdK18sYzDqC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:35:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=2ASz2RAx; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nPWh5X1DzDqyw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:30:24 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3644A207E8;
 Thu, 18 Jun 2020 01:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443822;
 bh=FgYJtY6YjowxDgILyIBUCt/OhaAvMobU2W8m+To8XUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2ASz2RAxhkqzGuEADwS708RmmdvDhKrB40qdbn7gcOV1qJ2hZJObJwtZ62PrPTTg2
 m/UL5mDVPv4Qts0CwVJYZfYiIugXhPnoAoFPje88O1PIiGE6kiSWwXKx60260B6jra
 qrBTkqoYhfzYCr3NxKFwNOw1k4gHnlWsxk+7ZBT0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 14/60] powerpc/pseries: Update hv-24x7 information
 after migration
Date: Wed, 17 Jun 2020 21:29:18 -0400
Message-Id: <20200618013004.610532-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618013004.610532-1-sashal@kernel.org>
References: <20200618013004.610532-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Kajol Jain <kjain@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

[ Upstream commit 373b373053384f12951ae9f916043d955501d482 ]

Function 'read_sys_info_pseries()' is added to get system parameter
values like number of sockets and chips per socket.
and it gets these details via rtas_call with token
"PROCESSOR_MODULE_INFO".

Incase lpar migrate from one system to another, system
parameter details like chips per sockets or number of sockets might
change. So, it needs to be re-initialized otherwise, these values
corresponds to previous system values.
This patch adds a call to 'read_sys_info_pseries()' from
'post-mobility_fixup()' to re-init the physsockets and physchips values

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200525104308.9814-6-kjain@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/mobility.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 8d30a425a88a..58ddc4389a51 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -326,6 +326,9 @@ void post_mobility_fixup(void)
 	/* Possibly switch to a new RFI flush type */
 	pseries_setup_rfi_flush();
 
+	/* Reinitialise system information for hv-24x7 */
+	read_24x7_sys_info();
+
 	return;
 }
 
-- 
2.25.1

