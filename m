Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED52CB1FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:03:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm11W3QwGzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 12:03:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X0o54C5l; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm0pF1kcnzDr1m
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 11:53:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B20VkX6139457; Tue, 1 Dec 2020 19:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=pcL5VReTU0J7QsDxX1hP9luUG3IKmWM81Cxa6JZMWUo=;
 b=X0o54C5lllA36z63LhqUoSNX/dZD+udxFQtZJpnkxH6Wsu/oH/dAMSwVLom+dxuHUz9M
 XekVq4lF3zzrJSecbXVJo36gg8zHQjMnwCmswLvn4OdKjOB1UT8IQSPSJh7byoFx79YM
 bgNpoA1vWjZMHyZbIaA4UmSF9HgOmZMvi0qz49Z4LvQF4xMaHCIYASha6VEpAj8ZTjWQ
 Mtm5uZkBCgckPL5kI87cm8G5uPyyAsYSCmDRyel1XI4q5EMBCvWbazZgjGM1w3b0EmE5
 NQkEMvdB16CTcDvQLKPM39a0ZyGHgUdRd9z1299enfMYoP01ii6NwR7U0MNF8NmYVm7X xA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355d9duy0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 19:53:33 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B20cNaH028142;
 Wed, 2 Dec 2020 00:53:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 353e69beer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 00:53:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B20rV4T17432992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 00:53:31 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B37E78063;
 Wed,  2 Dec 2020 00:53:31 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F21117805C;
 Wed,  2 Dec 2020 00:53:30 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 00:53:30 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v2 00/17] ibmvfc: initial MQ development
Date: Tue,  1 Dec 2020 18:53:12 -0600
Message-Id: <20201202005329.4538-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_12:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=3 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012010142
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

Recent updates in pHyp Firmware and VIOS releases provide new infrastructure
towards enabling Subordinate Command Response Queues (Sub-CRQs) such that each
Sub-CRQ is a channel backed by an actual hardware queue in the FC stack on the
partner VIOS. Sub-CRQs are registered with the firmware via hypercalls and then
negotiated with the VIOS via new Management Datagrams (MADs) for channel setup.

This initial implementation adds the necessary Sub-CRQ framework and implements
the new MADs for negotiating and assigning a set of Sub-CRQs to associated VIOS
HW backed channels. The event pool and locking still leverages the legacy single
queue implementation, and as such lock contention is problematic when increasing
the number of queues. However, this initial work demonstrates a 1.2x factor
increase in IOPs when configured with two HW queues despite lock contention.

changes in v2:
* Patch 4: NULL'd scsi_scrq reference after deallocation [brking]
* Patch 6: Added switch case to handle XPORT event [brking]
* Patch 9: fixed ibmvfc_event leak and double free [brking]
* added support for cancel command with MQ
* added parameter toggles for MQ settings

Tyrel Datwyler (17):
  ibmvfc: add vhost fields and defaults for MQ enablement
  ibmvfc: define hcall wrapper for registering a Sub-CRQ
  ibmvfc: add Subordinate CRQ definitions
  ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ Channels
  ibmvfc: add Sub-CRQ IRQ enable/disable routine
  ibmvfc: add handlers to drain and complete Sub-CRQ responses
  ibmvfc: define Sub-CRQ interrupt handler routine
  ibmvfc: map/request irq and register Sub-CRQ interrupt handler
  ibmvfc: implement channel enquiry and setup commands
  ibmvfc: advertise client support for using hardware channels
  ibmvfc: set and track hw queue in ibmvfc_event struct
  ibmvfc: send commands down HW Sub-CRQ when channelized
  ibmvfc: register Sub-CRQ handles with VIOS during channel setup
  ibmvfc: add cancel mad initialization helper
  ibmvfc: send Cancel MAD down each hw scsi channel
  ibmvfc: enable MQ and set reasonable defaults
  ibmvfc: provide modules parameters for MQ settings

 drivers/scsi/ibmvscsi/ibmvfc.c | 706 +++++++++++++++++++++++++++++----
 drivers/scsi/ibmvscsi/ibmvfc.h |  41 +-
 2 files changed, 675 insertions(+), 72 deletions(-)

-- 
2.27.0

