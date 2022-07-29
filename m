Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC5584A7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 06:02:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvDPT4rfqz2xss
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 14:02:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PYUEXQcF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PYUEXQcF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvDNn57G3z2xJB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 14:02:00 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26T3pjbI008744;
	Fri, 29 Jul 2022 04:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=kf1wklTtygav0QkVe3wbTRtARzqP/4c1qpoJs26j9CY=;
 b=PYUEXQcFP9FxMdTjFaA1JLziEZ3JOZyDHKI0qWIVU++wA8/f97MQEIGIiqk5ZXC0aAz+
 bTYEnt3Grtrftburb9qB82OB/ZK70WlqNMMngmElsJ1Yg82uAAjpTJUJg6+9l++ZPHt1
 TdDFgioJSBhBU1WoGg2X/ZYpIJNHVubY9BXZTdGpPFiNvI5/DvOqxPL75GF7WvfmQ9Cg
 xQutjlhRCmZSGhs4pSHYH4/hY6yR3x+C95r9XotqbjBCPcsH5R19JWkejAn+fF9sw46x
 ElwGhYpJPpubZWCciq7UD1+JfrzTAefdwOCOQoQsUq3Sy13tycWycyHCftaFJrMbEkMl 5w== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hm81287xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Jul 2022 04:01:49 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26T3pw8g031268;
	Fri, 29 Jul 2022 04:01:46 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03fra.de.ibm.com with ESMTP id 3hg95ydbm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Jul 2022 04:01:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26T41i7h25428266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Jul 2022 04:01:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E2054C04A;
	Fri, 29 Jul 2022 04:01:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4643C4C040;
	Fri, 29 Jul 2022 04:01:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.46.37])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 29 Jul 2022 04:01:43 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: [linux-next] Build failure drivers/cxl/cxl_pmem (powerpc)
Message-Id: <7FF6D18F-2F85-4FFC-96B8-D1B1E8D8D622@linux.ibm.com>
Date: Fri, 29 Jul 2022 09:31:42 +0530
To: linux-cxl@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wfRyDm2Vup0VjLW_upUfefaR4N9g9Ee5
X-Proofpoint-GUID: wfRyDm2Vup0VjLW_upUfefaR4N9g9Ee5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxlogscore=904 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290014
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linux-next (5.19.0-rc8-next-20220728) fails to build on powerpc with
following error:

ERROR: modpost: "memory_add_physaddr_to_nid" [drivers/cxl/cxl_pmem.ko] =
undefined!
make[1]: *** [scripts/Makefile.modpost:128: modules-only.symvers] Error =
1

The code in question was last changed by following patch:

commit 04ad63f086d1
       cxl/region: Introduce cxl_pmem_region objects


 - Sachin=
