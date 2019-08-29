Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F008A1A45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 14:40:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K2JW5d1LzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 22:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K26w6JH8zDrQL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 22:32:08 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64EC4AE74;
 Thu, 29 Aug 2019 12:32:05 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] scsi: ibmvfc: Fix fallthrough warnings.
Date: Thu, 29 Aug 2019 14:32:01 +0200
Message-Id: <1302692ee9813ba49e647b7e6203db5e99e65007.1567081143.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1567081143.git.msuchanek@suse.de>
References: <cover.1567081143.git.msuchanek@suse.de>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add fallthrough comments where they are missing.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 8cdbac076a1b..2a06a5b4d3a5 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1830,6 +1830,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 		port_id = (bsg_request->rqst_data.h_els.port_id[0] << 16) |
 			(bsg_request->rqst_data.h_els.port_id[1] << 8) |
 			bsg_request->rqst_data.h_els.port_id[2];
+		/* fallthrough */
 	case FC_BSG_RPT_ELS:
 		fc_flags = IBMVFC_FC_ELS;
 		break;
@@ -1838,6 +1839,7 @@ static int ibmvfc_bsg_request(struct bsg_job *job)
 		port_id = (bsg_request->rqst_data.h_ct.port_id[0] << 16) |
 			(bsg_request->rqst_data.h_ct.port_id[1] << 8) |
 			bsg_request->rqst_data.h_ct.port_id[2];
+		/* fallthrough */
 	case FC_BSG_RPT_CT:
 		fc_flags = IBMVFC_FC_CT_IU;
 		break;
@@ -4020,6 +4022,7 @@ static void ibmvfc_npiv_login_done(struct ibmvfc_event *evt)
 		return;
 	case IBMVFC_MAD_CRQ_ERROR:
 		ibmvfc_retry_host_init(vhost);
+		/* fallthrough */
 	case IBMVFC_MAD_DRIVER_FAILED:
 		ibmvfc_free_event(evt);
 		return;
-- 
2.12.3

