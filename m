Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1224308A12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 16:49:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DS1xV3rDXzDsXk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 02:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aqVRXvyg; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DS1hy4XcMzDrhh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 02:38:58 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C7B664E0E;
 Fri, 29 Jan 2021 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934736;
 bh=YRUUqm23s/ETZbX9vU/encIPO1XYTTBMD0pNKS+yxzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aqVRXvygy6JRiJAWtHyhyb6gCrmBFF4CMsfI52lNRI1LuuW2/RrHqTRN9+Llq2AzG
 yfbJ/ACBEM2z5CZgivnI9GRRqncnW3+kBZ5pBPxLLBaPnwPzVhH7Spe3MPMlDSAyBK
 lQA4T61d2oYAgD44JfDsKLfmi4CmHnNwSTr0xVJo3ktBWnUL+qI2y6Hejc78njjVy6
 KB7Vz2u/q6mfP7gF9xzFHZKsLFbA0BBRylMv6pMGk0mo0vRCFOByIoEqXSDJ+DAW3s
 gzv7Y62ouuieWqHJkD44c5wUoAUmkNPRKKYDHaGnIVuWC9fR/ZQMZr3YXy4+PWkbq2
 gcPSmFEXk4Sjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 6/8] scsi: ibmvfc: Set default timeout to avoid
 crash during migration
Date: Fri, 29 Jan 2021 10:38:45 -0500
Message-Id: <20210129153848.1592916-6-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153848.1592916-1-sashal@kernel.org>
References: <20210129153848.1592916-1-sashal@kernel.org>
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
Cc: Brian King <brking@linux.vnet.ibm.com>, Sasha Levin <sashal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Brian King <brking@linux.vnet.ibm.com>

[ Upstream commit 764907293edc1af7ac857389af9dc858944f53dc ]

While testing live partition mobility, we have observed occasional crashes
of the Linux partition. What we've seen is that during the live migration,
for specific configurations with large amounts of memory, slow network
links, and workloads that are changing memory a lot, the partition can end
up being suspended for 30 seconds or longer. This resulted in the following
scenario:

CPU 0                          CPU 1
-------------------------------  ----------------------------------
scsi_queue_rq                    migration_store
 -> blk_mq_start_request          -> rtas_ibm_suspend_me
  -> blk_add_timer                 -> on_each_cpu(rtas_percpu_suspend_me
              _______________________________________V
             |
             V
    -> IPI from CPU 1
     -> rtas_percpu_suspend_me
                                     -> __rtas_suspend_last_cpu

-- Linux partition suspended for > 30 seconds --
                                      -> for_each_online_cpu(cpu)
                                           plpar_hcall_norets(H_PROD
 -> scsi_dispatch_cmd
                                      -> scsi_times_out
                                       -> scsi_abort_command
                                        -> queue_delayed_work
  -> ibmvfc_queuecommand_lck
   -> ibmvfc_send_event
    -> ibmvfc_send_crq
     - returns H_CLOSED
   <- returns SCSI_MLQUEUE_HOST_BUSY
-> __blk_mq_requeue_request

                                      -> scmd_eh_abort_handler
                                       -> scsi_try_to_abort_cmd
                                         - returns SUCCESS
                                       -> scsi_queue_insert

Normally, the SCMD_STATE_COMPLETE bit would protect against the command
completion and the timeout, but that doesn't work here, since we don't
check that at all in the SCSI_MLQUEUE_HOST_BUSY path.

In this case we end up calling scsi_queue_insert on a request that has
already been queued, or possibly even freed, and we crash.

The patch below simply increases the default I/O timeout to avoid this race
condition. This is also the timeout value that nearly all IBM SAN storage
recommends setting as the default value.

Link: https://lore.kernel.org/r/1610463998-19791-1-git-send-email-brking@linux.vnet.ibm.com
Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index dbacd9830d3df..460014ded14de 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -2891,8 +2891,10 @@ static int ibmvfc_slave_configure(struct scsi_device *sdev)
 	unsigned long flags = 0;
 
 	spin_lock_irqsave(shost->host_lock, flags);
-	if (sdev->type == TYPE_DISK)
+	if (sdev->type == TYPE_DISK) {
 		sdev->allow_restart = 1;
+		blk_queue_rq_timeout(sdev->request_queue, 120 * HZ);
+	}
 	spin_unlock_irqrestore(shost->host_lock, flags);
 	return 0;
 }
-- 
2.27.0

