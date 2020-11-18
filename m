Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 188182B73A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 02:17:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbQ041K5JzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 12:17:24 +1100 (AEDT)
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
 header.s=pp1 header.b=mzAQJtmL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbPrw3cNfzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 12:11:12 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AI11bpF016626; Tue, 17 Nov 2020 20:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qqtdFimCAjGS2THNY3F0NZ9EpxY5xgsEj5s0tuyKV9E=;
 b=mzAQJtmL+h/GoJx/BkDT/93z/ZKECUJ0k7ANKewBercuCZrhoqdv91UwjR6fcB3Q1cxw
 rEb8xCe2lVZH1nGnYiwW8heLYxlP1PITqCmqPfnXO4zhtNSsiaVZOe3+Y8kY30uEm07P
 9buE+KTIEnULEnr/F73IhVnjR/ZPG/oOte2+HP0lqPYTB3He4sQEzLrDqrjF4RKP+MFm
 46XbXhkbIgTyUkBnu9FuTmrOkglq0uVaZi0ICpmmMKR7GvBPTnK2oZWYeWkH5vvkVpAQ
 dxb58ub3ECD4ZRJ9YUztswjB8SQhozDBUikkUyViPgDPe6hTNdXtPDQSY344ouS1Y3pz JA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34v9pfxg2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 20:11:08 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AI12RdP021467;
 Wed, 18 Nov 2020 01:11:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 34t6v994dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 01:11:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AI1B5gl11272836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 01:11:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1C2CBE058;
 Wed, 18 Nov 2020 01:11:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 441B4BE04F;
 Wed, 18 Nov 2020 01:11:05 +0000 (GMT)
Received: from vios4361.aus.stglabs.ibm.com (unknown [9.3.43.61])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Nov 2020 01:11:05 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH v3 0/6] ibmvfc: Protocol definition updates and new targetWWPN
 Support
Date: Tue, 17 Nov 2020 19:10:58 -0600
Message-Id: <20201118011104.296999-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_15:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=775
 impostorscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180000
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

Several Management Datagrams (MADs) have been reversioned to add a targetWWPN
field that is intended to better identify a target over in place of the scsi_id.
This patchset adds the new protocol definitions and implements support for using
the new targetWWPN field and exposing the capability to the VIOS. This
targetWWPN support is a prerequisuite for upcoming channelization/MQ support.

changes in v3:
* addressed field naming consistency in Patches 2 & 5 in response to [brking]
* fixed commit log typos
* fixed bad rebase of Patch 4 such that it now compiles

changes in v2:
* Removed bug fixes to separate patchset
* Fixed up checkpatch warnings

Tyrel Datwyler (6):
  ibmvfc: deduplicate common ibmvfc_cmd init code
  ibmvfc: add new fields for version 2 of several MADs
  ibmvfc: add helper for testing capability flags
  ibmvfc: add FC payload retrieval routines for versioned vfcFrames
  ibmvfc: add support for target_wwpn field in v2 MADs and vfcFrame
  ibmvfc: advertise client support for targetWWPN using v2 commands

 drivers/scsi/ibmvscsi/ibmvfc.c | 185 ++++++++++++++++++++++-----------
 drivers/scsi/ibmvscsi/ibmvfc.h |  28 ++++-
 2 files changed, 147 insertions(+), 66 deletions(-)

--
2.27.0

