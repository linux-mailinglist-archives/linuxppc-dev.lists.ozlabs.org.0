Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCAD1FE9E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 06:21:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nTJc0fXczDqBV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:21:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=a7ZbIrF4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nPV50GX6zDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:29:01 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3D8322208;
 Thu, 18 Jun 2020 01:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443737;
 bh=iIN+qJHB6oLC8jBufSOSyzEby7BxuAnArOsN4kb89VE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a7ZbIrF42JPQrsSFTAp7qRUf2qRyqQHMk7Vduy/P21eFR+4UQXZ9mrj+WkhfaQ6Us
 w39NiPPqLlmz07docytPrPSEKmSuMcrYqLaiPnkMlV9sUEb4T49SODuqPNnqub0bqI
 4rDfZIU+TzG212cgozhJPkaIeugZZpynQpydq/W8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 28/80] scsi: ibmvscsi: Don't send host info in
 adapter info MAD after LPM
Date: Wed, 17 Jun 2020 21:27:27 -0400
Message-Id: <20200618012819.609778-28-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012819.609778-1-sashal@kernel.org>
References: <20200618012819.609778-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tyrel Datwyler <tyreld@linux.ibm.com>

[ Upstream commit 4919b33b63c8b69d8dcf2b867431d0e3b6dc6d28 ]

The adapter info MAD is used to send the client info and receive the host
info as a response. A persistent buffer is used and as such the client info
is overwritten after the response. During the course of a normal adapter
reset the client info is refreshed in the buffer in preparation for sending
the adapter info MAD.

However, in the special case of LPM where we reenable the CRQ instead of a
full CRQ teardown and reset we fail to refresh the client info in the
adapter info buffer. As a result, after Live Partition Migration (LPM) we
erroneously report the host's info as our own.

[mkp: typos]

Link: https://lore.kernel.org/r/20200603203632.18426-1-tyreld@linux.ibm.com
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index e1730227b448..f299839698a3 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -425,6 +425,8 @@ static int ibmvscsi_reenable_crq_queue(struct crq_queue *queue,
 	int rc = 0;
 	struct vio_dev *vdev = to_vio_dev(hostdata->dev);
 
+	set_adapter_info(hostdata);
+
 	/* Re-enable the CRQ */
 	do {
 		if (rc)
-- 
2.25.1

