Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B327AFA667
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 03:29:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CT8k0ZVLzF49k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 13:29:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="q8y3PzVa"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CSPl1VVbzF5jF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 12:55:54 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E73722473;
 Wed, 13 Nov 2019 01:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573610152;
 bh=ynIhFj/qx4jDaE1Oo3VHwQCKtQ8asuUgAcjpPSkosCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q8y3PzVaR1c1Chf6hfIKQC0qe0Dz3Q2zwSxo8UYriI4p5C4Y6xY82Z3MdydYQpgt4
 82CbEYhKPFPozUkyziGnDkrt46FsYHdefMqAyYncEauWkpnNbguRqHjbUz0SzOKzEz
 RnTLHHYgYQjsEpvdPLH4qYLSHkBHVvyuqYgmoT4c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 196/209] misc: cxl: Fix possible null pointer
 dereference
Date: Tue, 12 Nov 2019 20:50:12 -0500
Message-Id: <20191113015025.9685-196-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, zhong jiang <zhongjiang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: zhong jiang <zhongjiang@huawei.com>

[ Upstream commit 3dac3583bf1a61db6aaf31dfd752c677a4400afd ]

It is not safe to dereference an object before a null test. It is
not needed and just remove them. Ftrace can be used instead.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/misc/cxl/guest.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
index b83a373e3a8dd..08f4a512afad2 100644
--- a/drivers/misc/cxl/guest.c
+++ b/drivers/misc/cxl/guest.c
@@ -1020,8 +1020,6 @@ int cxl_guest_init_afu(struct cxl *adapter, int slice, struct device_node *afu_n
 
 void cxl_guest_remove_afu(struct cxl_afu *afu)
 {
-	pr_devel("in %s - AFU(%d)\n", __func__, afu->slice);
-
 	if (!afu)
 		return;
 
-- 
2.20.1

