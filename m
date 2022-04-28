Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE005137D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 17:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpzYX1pmmz3064
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 01:09:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ywfgs5ZI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ywfgs5ZI; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpzXm6Y5kz3064
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 01:08:56 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SF76km008031;
 Thu, 28 Apr 2022 15:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZvYUKIE/q3zlzDiQoig2sZJPK2f4lQnsmkod4T+qLtg=;
 b=Ywfgs5ZIyk8FJ4H3gnKd1SCQrSyVOvq+fTxXt4UrlIW3HHwisM3SSk1zTJHazw8t9Scc
 WqeQmv93aDWT8eMuX/M3NqGKc0kiTpN9Z/hE3ua3jelFQcIxTTbTK/ad7EtE1ZwGQ1yY
 mfCrTwCgcDPTlEtCdKf5uuGhlDIOyF6DfZFt2B6kzKi3nWEP7GNvgF7dHAWze1lAfGac
 yp7TDubK/ltPC8BOoV3qb8QUvhk5awZzO6uQ4GsANSeCwOi1DyrjOZXv+3rUiLDMRklK
 sp7w6qtW99ENYZ2GguxlRyiubo1HasPLrd66jDLL55frZHCmmAUQBvslrSucBHwE3q0c bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqu6nbp7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:08:44 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23SF77w7008148;
 Thu, 28 Apr 2022 15:08:44 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqu6nbp6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:08:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23SEubDa011031;
 Thu, 28 Apr 2022 15:08:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3fpuyga25h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:08:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23SF8cjP29098390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 15:08:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FBBEA4054;
 Thu, 28 Apr 2022 15:08:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8DF7A405B;
 Thu, 28 Apr 2022 15:08:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.4.60])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 15:08:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH 0/2] Fix session topology test for powerpc and add utility
 function to get cpuinfo entries
Date: Thu, 28 Apr 2022 20:38:27 +0530
Message-Id: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tTopQ51BCMirbN5EiQclu7mxQdcoqaWM
X-Proofpoint-ORIG-GUID: lQwOMsyouRr1pcc7R0cQiGtqq-y_9Xvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_02,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204280091
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The session topology test fails in powerpc pSeries platform.
Test logs:
<<>>
Session topology : FAILED!
<<>>

This test uses cpu topology information and in powerpc,
some of the topology info is restricted in environment
like virtualized platform. Hence this test needs to be
skipped in pSeries platform for powerpc. The information
about platform is available in /proc/cpuinfo.

Patch 1 adds generic utility function in "util/header.c"
to read /proc/cpuinfo for any entry. Though the testcase
fix needs value from "platform" entry, making this as a
generic function to return value for any entry from the
/proc/cpuinfo file which can be used commonly in future
usecases.

Patch 2 uses the newly added utility function to look for
platform and skip the test in pSeries platform for powerpc.

Athira Rajeev (2):
  tools/perf: Add utility function to read /proc/cpuinfo for any field
  tools/perf/tests: Fix session topology test to skip the test in guest
    environment

 tools/perf/tests/topology.c | 17 ++++++++++++
 tools/perf/util/header.c    | 54 +++++++++++++++++++++++++++++++++++++
 tools/perf/util/header.h    |  1 +
 3 files changed, 72 insertions(+)

-- 
2.35.1

