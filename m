Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1876A93C1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 10:20:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSjBM2mYFz3f3Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 20:20:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j2b5M/qb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j2b5M/qb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSj9P1658z303P
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 20:19:52 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3238Jfdk019838;
	Fri, 3 Mar 2023 09:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=WT2ifIJXWR95oPt0gKQfOWQIsdk9yTznXhe7j7oYAxY=;
 b=j2b5M/qbrJJpqr9JnoFaAGZfBl/OFlrOEboCbgfT/ZUQeSo3JtFBqDBxWuFxLszPDH7x
 GuVeOETCee600bQm2CjSkdZ/3M1kbE9Dabn2UVtphiSnJjHNst9VDXtg2Rqdqg791iSL
 cTyZ5iG4neF+nGkvEVUBXTI66xKcA+qbX3uBHhFmn6u1MQi7ug4+TBuRH2E1eNl/IF6G
 bWJnRiQsODaDDjZ9UB45f8GeiWp7cGd2XDjxt+EF3bu7cawTr7lr14Opf5mSq4x8A1bT
 oGSKbgoUIxOSBVco3YkN7ruMzDUFxj0YPugAvmXhBk5gkVTpbRGN+z2/nA7FBbw/f2RA 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p3d9p9hr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Mar 2023 09:19:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3238JnlC019963;
	Fri, 3 Mar 2023 09:19:46 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p3d9p9hqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Mar 2023 09:19:46 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322GNDQU019309;
	Fri, 3 Mar 2023 09:19:43 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3nybab56m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Mar 2023 09:19:43 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3239JfXP52232698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Mar 2023 09:19:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1898D2004F;
	Fri,  3 Mar 2023 09:19:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54F1420043;
	Fri,  3 Mar 2023 09:19:40 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.96.50])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Mar 2023 09:19:40 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Selftests powerpc/primitives test hangs (linux-next)
Message-Id: <842502FB-F99C-417C-9648-A37D0ECDC9CE@linux.ibm.com>
Date: Fri, 3 Mar 2023 14:49:29 +0530
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oBvU-ziu51cmWW7JiMXFdtYVW2I3FL9c
X-Proofpoint-ORIG-GUID: uBRqe-uy61Dw-P32rjE8X1PDaZBhASz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_01,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1011 mlxlogscore=762 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030081
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
Cc: linux-mm@kvack.org, Laurent Dufour <ldufour@linux.ibm.com>, surenb@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running powerpc/primitives selftests, the test =
(load_unaligned_zeropad)
hangs indefinitely. This behaviour is seen with linux-next =
6.2.0-next-20230303
on a Power10 logical partition.

Git bisect points to following commit

commit 169db3bb460903443e25ac9c0737da45d6bb5402
   powerc/mm: try VMA lock-based page fault handling first

- Sachin

