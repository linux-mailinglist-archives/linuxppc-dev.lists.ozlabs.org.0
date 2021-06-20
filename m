Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4D3ADF17
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 16:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7Fr73rcNz3cBy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 00:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y/Bf/Ie3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y/Bf/Ie3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7Fpk0cnKz2yjK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 00:46:21 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15KEXRnr115696; Sun, 20 Jun 2021 10:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=JUOh3bBjd0Q+qWxCx1mLTSQdN+hm6WglLsfvKf41x2I=;
 b=Y/Bf/Ie3ZGH4Aw6XKBS7ZToAzzBHgIYno69vYeIO0C6DT0VolKAQA5jBAyY1iGZXAEwA
 MsX/ykh8expg3mlk2M752SUqVcMPimxg7CB4fZz0WfZ19OnyHgHzP1IiypHDlyEfhfBg
 +rg/CO1HCgUeXHc/spkAn0cKpz3Dl8iMpjY8uTSgN0c8ijX36c8Ntzas7k1f08FMUKZD
 aq7Bos6qrxgkqqU8O60uMEV8kctVOxg/nun7BO67v3OeIJOwAX8ITUBLLz2QKHk994zN
 19fnjyzWjWZmcvkSGYMxe615lLOY++m+Z2+vA5D07rdO8u8l+2lYc2PQdwbBi416cina 8w== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39a6tn8vtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 10:46:09 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15KEk7GW026817;
 Sun, 20 Jun 2021 14:46:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3997uhg8es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 14:46:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15KEk3Nl28377548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Jun 2021 14:46:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D32564C04A;
 Sun, 20 Jun 2021 14:46:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 071AF4C04E;
 Sun, 20 Jun 2021 14:46:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.183.154])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 20 Jun 2021 14:46:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 0/2] powerpc/perf: Add instruction and data address registers
 to extended regs
Date: Sun, 20 Jun 2021 10:45:58 -0400
Message-Id: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2jnnTs6nZcMW0YrYeu9mmFcYQ9zd-JqY
X-Proofpoint-GUID: 2jnnTs6nZcMW0YrYeu9mmFcYQ9zd-JqY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-20_07:2021-06-20,
 2021-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=918 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106200105
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set adds PMU registers namely Sampled Instruction Address Register
(SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
in PowerPC. These registers provides the instruction/data address and
adding these to extended regs helps in debug purposes.

Patch 1/2 adds SIAR and SDAR as part of the extended regs mask.
Patch 2/2 includes perf tools side changes to add the SPRs to
sample_reg_mask to use with -I? option.

Athira Rajeev (2):
  powerpc/perf: Expose instruction and data address registers as part of
    extended regs
  tools/perf: Add perf tools support to expose instruction and data
    address registers as part of extended regs

 arch/powerpc/include/uapi/asm/perf_regs.h       | 12 +++++++-----
 arch/powerpc/perf/perf_regs.c                   |  4 ++++
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
 tools/perf/arch/powerpc/include/perf_regs.h     |  2 ++
 tools/perf/arch/powerpc/util/perf_regs.c        |  2 ++
 5 files changed, 22 insertions(+), 10 deletions(-)

-- 
1.8.3.1

