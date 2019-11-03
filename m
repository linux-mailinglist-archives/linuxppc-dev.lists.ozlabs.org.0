Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE7ED673
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 00:36:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475skz00xBzDr6X
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 10:36:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=humanservices.gov.au (client-ip=161.146.192.132;
 helo=mailout6.humanservices.gov.au;
 envelope-from=chris.smart@humanservices.gov.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=humanservices.gov.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=humanservices.gov.au header.i=@humanservices.gov.au
 header.b="hz6T8gY5"; dkim-atps=neutral
Received: from mailout6.humanservices.gov.au (mailout6.humanservices.gov.au
 [161.146.192.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475shb1tz2zF4DN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 10:34:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=humanservices.gov.au; i=@humanservices.gov.au;
 q=dns/txt; s=dhs1-dkim; t=1572824063; x=1604360063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MYPMHwkow6CP3OlXdesr/dfIYoiUjLy5oDvtkHwK+NY=;
 b=hz6T8gY5dTQ7F4Thx0zBfozbjbJDiY3dhyzzlSEkUw2yxkJAqnkzuN0s
 2EwUnLWOxRyutSMfzMNIWw42v84B8IZIuRyisEXG/T6znqrXFG5sDD/0U
 FfmGX7HyeunM/W9Ipb5mAfVes+nYG0kFrbbAeXwnTz5kiGYAx7PWhEdRZ
 6Mg4FhD6r7aGBKtNZErqDnYslYy075hdwc+ttOSPxgbHg+e0rG7bAfqmg
 4i6LUHR2GW8W5VvOr459G4AOI7KKKG1nwANPW/YpfozUXM9lyxKjGrQ86
 3dolE3J0SQpIHiuX/ezBvyN2PyWciJ6zBU1bHYnOPw80WrxsI7kECmIjP A==;
IronPort-SDR: QOZ3d+EkPao9Qkx0g/49vdXtSG3O8t9QKmJNGsabFnqIUbda0LCJGtNFnxLcxxBHN97NpLrwY4
 5pUz1EX5iMHQ==
X-IronPort-AV: E=Sophos;i="5.68,265,1569247200"; d="scan'208";a="167087358"
Received: by mailout6.humanservices.gov.au; 04 Nov 2019 10:34:21 +1100
X-OutboundLoopMarker: 1
X-MTA-CheckPoint: {5DBF63FD-0-B60611AC-115407B6}
From: Chris Smart <chris.smart@humanservices.gov.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/1] powerpc/crypto: Add cond_resched() in crc-vpmsum self-test
Date: Sun, 3 Nov 2019 23:33:56 +0000
Message-ID: <20191103233356.5472-1-chris.smart@humanservices.gov.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Cc: distroguy@gmail.com, Chris Smart <chris.smart@humanservices.gov.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The stress test for vpmsum implementations executes a long for loop in
the kernel. This blocks the scheduler, which prevents other tasks from
running, resulting in a warning.

This fix adds a call to cond_reshed() at the end of each loop, which
allows the scheduler to run other tasks as required.

Signed-off-by: Chris Smart <chris.smart@humanservices.gov.au>
---
 arch/powerpc/crypto/crc-vpmsum_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/crypto/crc-vpmsum_test.c b/arch/powerpc/crypto/crc-vpmsum_test.c
index 47985219a68f..dce86e75f1a8 100644
--- a/arch/powerpc/crypto/crc-vpmsum_test.c
+++ b/arch/powerpc/crypto/crc-vpmsum_test.c
@@ -103,6 +103,7 @@ static int __init crc_test_init(void)
 				       crc32, verify32, len);
 				break;
 			}
+		cond_resched();
 		}
 		pr_info("crc-vpmsum_test done, completed %lu iterations\n", i);
 	} while (0);
-- 
2.21.0

********************************************************************** IMPORTANT: This e-mail is for the use of the intended recipient only and may contain information that is confidential, commercially valuable and/or subject to legal or parliamentary privilege. If you are not the intended recipient you are notified that any review, re-transmission, disclosure, dissemination or other use of, or taking of any action in reliance upon, this information is prohibited and may result in severe penalties. If you have received this e-mail in error please notify the sender immediately and delete all electronic and hard copies of this transmission together with any attachments. Please consider the environment before printing this e-mail **********************************************************************

