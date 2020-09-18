Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59E26EC37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 04:11:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsy4B0R4YzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 12:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Nr8g0vBv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsxv86n6yzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 12:03:16 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAF6922211;
 Fri, 18 Sep 2020 02:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394594;
 bh=40VmAwP/yTt5HZ9+MDjxbKXNx1hzfy9nGDD8SwFa9Rk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nr8g0vBvCtw6Ify32wRCZaMx0TEsXRRxhQeOmeI11Nw274sRL5AC2ofQ2qNGfGHVF
 xryQn0ZzZxS3ogF/IgtEvd8deYA8mE2ZAhw+n6J1XLKh5izGMdcovt2gdjdSx3lDLL
 l5hlrHUV929DWGaJo0XvInFJvYoZsAhU4+R7ex+s=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 102/330] powerpc/eeh: Only dump stack once if an
 MMIO loop is detected
Date: Thu, 17 Sep 2020 21:57:22 -0400
Message-Id: <20200918020110.2063155-102-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Oliver O'Halloran <oohall@gmail.com>

[ Upstream commit 4e0942c0302b5ad76b228b1a7b8c09f658a1d58a ]

Many drivers don't check for errors when they get a 0xFFs response from an
MMIO load. As a result after an EEH event occurs a driver can get stuck in
a polling loop unless it some kind of internal timeout logic.

Currently EEH tries to detect and report stuck drivers by dumping a stack
trace after eeh_dev_check_failure() is called EEH_MAX_FAILS times on an
already frozen PE. The value of EEH_MAX_FAILS was chosen so that a dump
would occur every few seconds if the driver was spinning in a loop. This
results in a lot of spurious stack traces in the kernel log.

Fix this by limiting it to printing one stack trace for each PE freeze. If
the driver is truely stuck the kernel's hung task detector is better suited
to reporting the probelm anyway.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191016012536.22588-1-oohall@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/eeh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index bc8a551013be9..c35069294ecfb 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -503,7 +503,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	rc = 1;
 	if (pe->state & EEH_PE_ISOLATED) {
 		pe->check_count++;
-		if (pe->check_count % EEH_MAX_FAILS == 0) {
+		if (pe->check_count == EEH_MAX_FAILS) {
 			dn = pci_device_to_OF_node(dev);
 			if (dn)
 				location = of_get_property(dn, "ibm,loc-code",
-- 
2.25.1

