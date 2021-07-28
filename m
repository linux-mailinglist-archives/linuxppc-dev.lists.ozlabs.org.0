Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A753D8D75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 14:06:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZXSM1PzVz3dCV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 22:06:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RuJbATXb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RuJbATXb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZXRM6bdNz307g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 22:05:19 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SC2Wcx102161; Wed, 28 Jul 2021 08:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=aDjoQ6PCd+ro0kecpAZRm+2oFswZI14RrcJfPOq+DS8=;
 b=RuJbATXb873pUUrRb6xKR6yAyaMOzfNG/pnRZvs2Z2gSHL+FYsTquIQu3shSJ+baxZPD
 aSVxA2S0shsQOIMJWzBN2/uQA2m059Ji78hr6bqmxvtGhx6ZtdixPM4X2/8KkKh+wICN
 8rW4HZfIkMUqFiwieqtP2aB0rtmxImZkdv5tvUE2lfTFP3py6VPd8owzzR+8qCPwUAWg
 oCWTr9Cq5s++wroNPBQ2BVgxJz246CukuCXqdSyzu2YDUbmMaB2kHG5qC+qQRjrqqYdP
 pS8uAc65qtF3VmWCFt1u6N/PAJuEPXt2GztL9PamnawAXxSfD5dVuPULnScJz2JJ5JyA Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a36g897ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 08:05:11 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16SC2jZu103800;
 Wed, 28 Jul 2021 08:05:10 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a36g897d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 08:05:10 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16SC2enw028535;
 Wed, 28 Jul 2021 12:05:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3a235prnpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 12:05:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16SC55iL27459932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 12:05:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A88111C04C;
 Wed, 28 Jul 2021 12:05:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EE4711C052;
 Wed, 28 Jul 2021 12:05:02 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.80.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Jul 2021 12:05:01 +0000 (GMT)
From: "Pratik R. Sampat" <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, rjw@rjwysocki.net, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [PATCH v2 0/1] cpufreq:powernv: Fix init_chip_info initialization in
 numa=off
Date: Wed, 28 Jul 2021 17:34:59 +0530
Message-Id: <20210728120500.87549-1-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qLF8gRZNsat2QJgIsydJHKnL5EJaRZen
X-Proofpoint-ORIG-GUID: 79Iav9C0fPQN7vYJm35dA6APE-PsZyRf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_07:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280068
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v1: https://lkml.org/lkml/2021/7/26/1509
Changelog v1-->v2:
Based on comments from Gautham,
1. Included a #define for MAX_NR_CHIPS instead of hardcoding the
allocation.

Pratik R. Sampat (1):
  cpufreq:powernv: Fix init_chip_info initialization in numa=off

 drivers/cpufreq/powernv-cpufreq.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.31.1

