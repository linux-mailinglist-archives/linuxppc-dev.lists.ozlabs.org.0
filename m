Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078E297F93
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 02:15:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJdlm3qg2zDqvx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 11:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OVYJUDnD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJdk56smkzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Oct 2020 11:14:05 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09P02QlR178210; Sat, 24 Oct 2020 20:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+4Whx5I2/deRwCxOT5OAYzlklPGHsrGZ99TYhrYZD14=;
 b=OVYJUDnDljdySO3AhxrV+dlQ0drNRGgWiO7eDBjW2bPDPBdbPcww4B7GN+rNEpkShXZ6
 YeUfAngMjACgtyeJeEVIVv3wCCEvVj5mXnHwwyUc+M5z4NoqhlzXKbFEldZgdv7VsCAp
 jSHRMBQen48RB1NoXSm6PRHWIbFDJfU9llCXUp3cZMHNzhLPTYqdrQ0/KJJWCyFSd9v3
 eomH5w2++wQlqZP9Rt8vkIWIwglwCkvXaps1ZNGY41R/ISwYcUBXG/08U5koCAoMRH3y
 jb/VqiUCUNo6tXaJdZaz1RI0nJrBrdMGENdmiPf2WclSU2DwdcmDwkR0xydF0xloBQwL fw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34cpf8fhf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 24 Oct 2020 20:13:59 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09P0D5C4003860;
 Sun, 25 Oct 2020 00:13:58 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 34cbw86p82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Oct 2020 00:13:58 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09P0DwNg35258864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 25 Oct 2020 00:13:58 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 047BAB2064;
 Sun, 25 Oct 2020 00:13:58 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 803C2B205F;
 Sun, 25 Oct 2020 00:13:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.188])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 25 Oct 2020 00:13:57 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] ibmvscsi: fix race potential race after loss of transport
Date: Sat, 24 Oct 2020 19:13:55 -0500
Message-Id: <20201025001355.4527-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-24_16:2020-10-23,
 2020-10-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=1
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010240186
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After a loss of tranport due to an adatper migration or crash/disconnect from
the host partner there is a tiny window where we can race adjusting the
request_limit of the adapter. The request limit is atomically inc/dec to track
the number of inflight requests against the allowed limit of our VIOS partner.
After a transport loss we set the request_limit to zero to reflect this state.
However, there is a window where the adapter may attempt to queue a command
because the transport loss event hasn't been fully processed yet and
request_limit is still greater than zero. The hypercall to send the event will
fail and the error path will increment the request_limit as a result. If the
adapter processes the transport event prior to this increment the request_limit
becomes out of sync with the adapter state and can result in scsi commands being
submitted on the now reset connection prior to an SRP Login resulting in a
protocol violation.

Fix this race by protecting request_limit with the host lock when changing the
value via atomic_set() to indicate no transport.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 36 +++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index b1f3017b6547..188ed75417a5 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -806,6 +806,22 @@ static void purge_requests(struct ibmvscsi_host_data *hostdata, int error_code)
 	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 }
 
+/**
+ * ibmvscsi_set_request_limit - Set the adapter request_limit in response to
+ * an adapter failure, reset, or SRP Login. Done under host lock to prevent
+ * race with scsi command submission.
+ * @hostdata:	adapter to adjust
+ * @limit:	new request limit
+ */
+static void ibmvscsi_set_request_limit(struct ibmvscsi_host_data *hostdata, int limit)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(hostdata->host->host_lock, flags);
+	atomic_set(&hostdata->request_limit, limit);
+	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
+}
+
 /**
  * ibmvscsi_reset_host - Reset the connection to the server
  * @hostdata:	struct ibmvscsi_host_data to reset
@@ -813,7 +829,7 @@ static void purge_requests(struct ibmvscsi_host_data *hostdata, int error_code)
 static void ibmvscsi_reset_host(struct ibmvscsi_host_data *hostdata)
 {
 	scsi_block_requests(hostdata->host);
-	atomic_set(&hostdata->request_limit, 0);
+	ibmvscsi_set_request_limit(hostdata, 0);
 
 	purge_requests(hostdata, DID_ERROR);
 	hostdata->action = IBMVSCSI_HOST_ACTION_RESET;
@@ -1146,13 +1162,13 @@ static void login_rsp(struct srp_event_struct *evt_struct)
 		dev_info(hostdata->dev, "SRP_LOGIN_REJ reason %u\n",
 			 evt_struct->xfer_iu->srp.login_rej.reason);
 		/* Login failed.  */
-		atomic_set(&hostdata->request_limit, -1);
+		ibmvscsi_set_request_limit(hostdata, -1);
 		return;
 	default:
 		dev_err(hostdata->dev, "Invalid login response typecode 0x%02x!\n",
 			evt_struct->xfer_iu->srp.login_rsp.opcode);
 		/* Login failed.  */
-		atomic_set(&hostdata->request_limit, -1);
+		ibmvscsi_set_request_limit(hostdata, -1);
 		return;
 	}
 
@@ -1163,7 +1179,7 @@ static void login_rsp(struct srp_event_struct *evt_struct)
 	 * This value is set rather than added to request_limit because
 	 * request_limit could have been set to -1 by this client.
 	 */
-	atomic_set(&hostdata->request_limit,
+	ibmvscsi_set_request_limit(hostdata,
 		   be32_to_cpu(evt_struct->xfer_iu->srp.login_rsp.req_lim_delta));
 
 	/* If we had any pending I/Os, kick them */
@@ -1195,13 +1211,13 @@ static int send_srp_login(struct ibmvscsi_host_data *hostdata)
 	login->req_buf_fmt = cpu_to_be16(SRP_BUF_FORMAT_DIRECT |
 					 SRP_BUF_FORMAT_INDIRECT);
 
-	spin_lock_irqsave(hostdata->host->host_lock, flags);
 	/* Start out with a request limit of 0, since this is negotiated in
 	 * the login request we are just sending and login requests always
 	 * get sent by the driver regardless of request_limit.
 	 */
-	atomic_set(&hostdata->request_limit, 0);
+	ibmvscsi_set_request_limit(hostdata, 0);
 
+	spin_lock_irqsave(hostdata->host->host_lock, flags);
 	rc = ibmvscsi_send_srp_event(evt_struct, hostdata, login_timeout * 2);
 	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 	dev_info(hostdata->dev, "sent SRP login\n");
@@ -1781,7 +1797,7 @@ static void ibmvscsi_handle_crq(struct viosrp_crq *crq,
 		return;
 	case VIOSRP_CRQ_XPORT_EVENT:	/* Hypervisor telling us the connection is closed */
 		scsi_block_requests(hostdata->host);
-		atomic_set(&hostdata->request_limit, 0);
+		ibmvscsi_set_request_limit(hostdata, 0);
 		if (crq->format == 0x06) {
 			/* We need to re-setup the interpartition connection */
 			dev_info(hostdata->dev, "Re-enabling adapter!\n");
@@ -2137,12 +2153,12 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 	}
 
 	hostdata->action = IBMVSCSI_HOST_ACTION_NONE;
+	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 
 	if (rc) {
-		atomic_set(&hostdata->request_limit, -1);
+		ibmvscsi_set_request_limit(hostdata, -1);
 		dev_err(hostdata->dev, "error after %s\n", action);
 	}
-	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 
 	scsi_unblock_requests(hostdata->host);
 }
@@ -2226,7 +2242,7 @@ static int ibmvscsi_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	init_waitqueue_head(&hostdata->work_wait_q);
 	hostdata->host = host;
 	hostdata->dev = dev;
-	atomic_set(&hostdata->request_limit, -1);
+	ibmvscsi_set_request_limit(hostdata, -1);
 	hostdata->host->max_sectors = IBMVSCSI_MAX_SECTORS_DEFAULT;
 
 	if (map_persist_bufs(hostdata)) {
-- 
2.27.0

