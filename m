Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985814A2AF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 02:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlxMH3YFdz3cNS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 12:19:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SjId7EXD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SjId7EXD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlxLT12pBz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 12:19:12 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SNaJ3H031290; 
 Sat, 29 Jan 2022 01:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3bCmiHj6FmpH0YGfAY8oBiTl7kfECfZALv/FwUMU6CE=;
 b=SjId7EXDj1aMYIGNWBUkUnRYWakeGK5QdC7ML54beOtH9jecwbYGYJyxs+lfit5BwE6j
 QfLX0yng+EZfIowtSX3f0WrZsJbYo9CVC2BPy0LPKG9trSHLHA2fEoNAg65lRPRSCejn
 VKA7GfC4yV5qdpHJqwqQc/j2Sp4vGj+VbofeEW2RkeEbRlIqkqDlwVeZO3il4Thntu7s
 UhNsfXOu5LowaX8UNOvqH/73dg38kDQvEBDUaBVwCjJ0KV/SyqhAEvz6m5s7Mmg8voqK
 oui+7j58s5IXAItLjxzRrnkVdhBkQqDhIScwNH0fp2otM6GhLc2DpQLan0K9ow0z11D4 NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvgqjdbvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:19:05 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20T1J4Bp019614;
 Sat, 29 Jan 2022 01:19:04 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvgqjdbvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:19:04 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20T1HHIn023658;
 Sat, 29 Jan 2022 01:19:03 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3dt1xcedc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:19:03 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20T1Ixft16712076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Jan 2022 01:19:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0CD4BE063;
 Sat, 29 Jan 2022 01:18:59 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61FD5BE06D;
 Sat, 29 Jan 2022 01:18:58 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 29 Jan 2022 01:18:58 +0000 (GMT)
Message-ID: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
Subject: [PATCH 0/3] powerpc/pseries/vas: VAS/NXGZIP support with LPM
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Fri, 28 Jan 2022 17:18:56 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: quMaONuiAiGRDu9HPMQflu-TkRS6EKiw
X-Proofpoint-ORIG-GUID: 7LELH2j9xtLjt4I3ub9Rk_ff2wRvA0BD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=11
 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=91 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=11 spamscore=11 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201290003
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
Cc: haren@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Virtual Accelerator Switchboard (VAS) is an engine stays on the
chip. So all windows opened on a specific engine belongs to VAS
the chip. The hypervisor expects the partition to close all
active windows on the sources system and reopen them after
migration on the destination machine.

This patch series adds VAS support with the partition migration.
When the migration initiates, the VAS migration handler will be
invoked before pseries_suspend() to close all active windows and
mark them in-active with VAS_WIN_MIGRATE_CLOSE status. Whereas
this migration handler is called after migration to reopen all
windows which has VAS_WIN_MIGRATE_CLOSE status and make them
active again. The user space gets paste instruction failure
when it sends requests on these in-active windows.

These patches depend on VAS/DLPAR support patch series

Haren Myneni (3):
  powerpc/pseries/vas: Modify reconfig open/close functions for
    migration
  powerpc/pseries/vas: Add VAS migration handler
  powerpc/pseries/vas: Disable window open during migration

 arch/powerpc/include/asm/vas.h            |   2 +
 arch/powerpc/platforms/pseries/mobility.c |   5 +
 arch/powerpc/platforms/pseries/vas.c      | 187 +++++++++++++++++++---
 arch/powerpc/platforms/pseries/vas.h      |   6 +
 4 files changed, 181 insertions(+), 19 deletions(-)

-- 
2.27.0


