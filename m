Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B827A3977
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 21:50:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=l9IWz+iV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpdnR08jcz3ccR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 05:50:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=l9IWz+iV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rpdkb2WlVz3c8q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 05:47:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5DB7DB80B1E;
	Sun, 17 Sep 2023 19:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E7FC433CD;
	Sun, 17 Sep 2023 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694980064;
	bh=mPmJTwuFdYUWP4GLWTyNtzlKEU2XPHQX33h7pddGDsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l9IWz+iVXBM0T7jyx4TqmUJmu6z2NIY6Xg2YnrlaMXByRFOMK3aXzetng6MtjCofM
	 v4k+mm96q1cxtdX8W0RfYcqfeyPFyOtNRnzTCP35am7UOE/LR/SpJk0M41dXN0hAbN
	 rVHtPNTCB4ka2mwf1uZG2Q9cKtnVsjEokC3bZKJg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.5 086/285] perf vendor events: Drop STORES_PER_INST metric event for power10 platform
Date: Sun, 17 Sep 2023 21:11:26 +0200
Message-ID: <20230917191054.686128724@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230917191051.639202302@linuxfoundation.org>
References: <20230917191051.639202302@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Kajol Jain <kjain@linux.ibm.com>

[ Upstream commit 4836b9a85ef148c7c9779b66fab3f7279e488d90 ]

Drop STORES_PER_INST metric event for the power10 platform, as the
metric expression of STORES_PER_INST metric event using dropped event
PM_ST_FIN.

Fixes: 3ca3af7d1f230d1f ("perf vendor events power10: Add metric events JSON file for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Disha Goel <disgoel@linux.ibm.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230814112803.1508296-3-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/pmu-events/arch/powerpc/power10/metrics.json | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
index 6f53583a0c62c..e3087eb1ccff8 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -453,12 +453,6 @@
         "MetricGroup": "General",
         "MetricName": "LOADS_PER_INST"
     },
-    {
-        "BriefDescription": "Average number of finished stores per completed instruction",
-        "MetricExpr": "PM_ST_FIN / PM_RUN_INST_CMPL",
-        "MetricGroup": "General",
-        "MetricName": "STORES_PER_INST"
-    },
     {
         "BriefDescription": "Percentage of demand loads that reloaded from beyond the L2 per completed instruction",
         "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
-- 
2.40.1



