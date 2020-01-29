Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF414CD7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:36:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4876ym2QX4zDqT1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 02:36:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4876pP6xDXzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 02:29:01 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFHMKd040250
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:28:59 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xtfh0vsxx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:28:59 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 29 Jan 2020 15:28:58 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 15:28:56 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TFStui45613308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 15:28:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 599B552050;
 Wed, 29 Jan 2020 15:28:55 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E43A252052;
 Wed, 29 Jan 2020 15:28:53 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/6] UAPI: ndctl: Introduce NVDIMM_FAMILY_PAPR as a new
 NVDIMM DSM family
Date: Wed, 29 Jan 2020 20:58:41 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129152844.71286-1-vaibhav@linux.ibm.com>
References: <20200129152844.71286-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012915-4275-0000-0000-0000039C0C57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012915-4276-0000-0000-000038B027B3
Message-Id: <20200129152844.71286-4-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=1 mlxlogscore=749 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290128
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add PAPR-scm family of DSM command-set to to the white list of NVDIMM
command sets.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 include/uapi/linux/ndctl.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
index de5d90212409..0e09dc5cec19 100644
--- a/include/uapi/linux/ndctl.h
+++ b/include/uapi/linux/ndctl.h
@@ -244,6 +244,7 @@ struct nd_cmd_pkg {
 #define NVDIMM_FAMILY_HPE2 2
 #define NVDIMM_FAMILY_MSFT 3
 #define NVDIMM_FAMILY_HYPERV 4
+#define NVDIMM_FAMILY_PAPR 5
 
 #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
 					struct nd_cmd_pkg)
-- 
2.24.1

