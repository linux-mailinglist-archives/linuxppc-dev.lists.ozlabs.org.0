Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E97FAC8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 22:31:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=G2kFeCAT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfJg02GqBz3cXd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 08:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=G2kFeCAT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.215; helo=m12.mail.163.com; envelope-from=liuhaoran14@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 944 seconds by postgrey-1.37 at boromir; Tue, 28 Nov 2023 01:57:27 AEDT
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf7wl6qxcz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 01:57:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=XRQp0zOYdNbHHuto1y
	IZyaF4vtL+R1Yy6pinuFlVyl8=; b=G2kFeCATce1RM9VxhgJW3Ni3vKuNEVGlSV
	z5z7sCjf5f+tGWBCo8lzrOsC3sK+ji6ZJlmbV0ZzPbc9JEetumc3AZKgfK3FAlrx
	2Nqe6Vr/1fytMTZZqs/xVlK3CukUyt9ZcbCHjB830BSb6OoUkoyj1TQmx2HAoHcP
	wNM6Bbyyw=
Received: from localhost.localdomain (unknown [39.144.190.126])
	by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wB3FVSGqmRlvUJQEA--.27646S2;
	Mon, 27 Nov 2023 22:41:12 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: npiggin@gmail.com
Subject: [PATCH] powerpc/powernv: Add error handling to opal_prd_range_is_valid
Date: Mon, 27 Nov 2023 06:41:08 -0800
Message-Id: <20231127144108.29782-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wB3FVSGqmRlvUJQEA--.27646S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWUuF13Xr1ruF1kCF1fCrg_yoWftFgEq3
	WxCa10qw48Wr4q9w1DCr1rGrnFk343Gr4UKr1Ig3ZFkryavasxC3s7ZrZ3WF17WrW2krZx
	GF98Kws8A3WSvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRufO2UUUUUU==
X-Originating-IP: [39.144.190.126]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/xtbBcgE1gletj1OaTQAAs1
X-Mailman-Approved-At: Tue, 28 Nov 2023 08:30:24 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Haoran Liu <liuhaoran14@163.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the opal_prd_range_is_valid function within opal-prd.c,
error handling was missing for the of_get_address call.
This patch adds necessary error checking, ensuring that the
function gracefully handles scenarios where of_get_address fails.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 327e2f76905d..b66b06efcef1 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -66,6 +66,8 @@ static bool opal_prd_range_is_valid(uint64_t addr, uint64_t size)
 		const char *label;
 
 		addrp = of_get_address(node, 0, &range_size, NULL);
+		if (!addrp)
+			continue;
 
 		range_addr = of_read_number(addrp, 2);
 		range_end = range_addr + range_size;
-- 
2.17.1

