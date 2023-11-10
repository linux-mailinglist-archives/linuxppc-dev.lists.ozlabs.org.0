Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED987E7D27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 15:50:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N3RzrTPU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRhZh52LTz3cYV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 01:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N3RzrTPU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRhYn6Q81z3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 01:49:49 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AAEgeHR023896;
	Fri, 10 Nov 2023 14:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=pp1;
 bh=8EgQILAIzxCVrDZs6HD2DIpTAOE0C30qR5bidQWM848=;
 b=N3RzrTPUy0oDABHEdtVrwu/vaiSttxBKTbW9ypBQRSGpih6Y06EaR2t7JEAUyAuUU+ix
 CJolZrp5w38F4nAfi3L1ZrCk383Wf7jQbByn36luegBz2T5TtY7PgdSNGjs169Cb+h9G
 dsHou35QoERRG7/45IvmchhKw9OiYJdn44eBnXduWmSLz+S5c+htsKJlnhxrHKZTgNSa
 tYHB2gkDgEAKmypr57y/jRTpBXWKKAx2L0QIz0UtUngrogv+iXEBZ5gb5hWl/CNHQUb7
 6wWRCEtUiT5Nejj+zN3tlYC081NaxISv/5HjkMRdWeiP7i9Iu+AC2mxZWuycyYOP+/z0 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u9ph3r6cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 14:49:33 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AAEhI8J029268;
	Fri, 10 Nov 2023 14:49:32 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u9ph3r6c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 14:49:32 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AAE0uEi003431;
	Fri, 10 Nov 2023 14:49:31 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u7w22bfx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 14:49:31 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AAEnUFf6554222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Nov 2023 14:49:31 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 929F558051;
	Fri, 10 Nov 2023 14:49:30 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDE105805A;
	Fri, 10 Nov 2023 14:49:27 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.3.89])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Nov 2023 14:49:27 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
        Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>,
        akpm@linux-foundation.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: get_user_pages() and EXEC_ONLY mapping.
Date: Fri, 10 Nov 2023 20:19:23 +0530
Message-ID: <87bkc1oe8c.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h6iFfAsG-ZU_npkoCH6EsMix9gfG4l19
X-Proofpoint-ORIG-GUID: Wsorie0BiqKyNeoiLVGcjmznJSoa1yB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_12,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=299
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100122
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello,

Some architectures can now support EXEC_ONLY mappings and I am wondering
what get_user_pages() on those addresses should return. Earlier
PROT_EXEC implied PROT_READ and pte_access_permitted() returned true for
that. But arm64 does have this explicit comment that says

 /*
 * p??_access_permitted() is true for valid user mappings (PTE_USER
 * bit set, subject to the write permission check). For execute-only
 * mappings, like PROT_EXEC with EPAN (both PTE_USER and PTE_UXN bits
 * not set) must return false. PROT_NONE mappings do not have the
 * PTE_VALID bit set.
 */

Is that correct? We should be able to get struct page for PROT_EXEC
mappings?

-aneesh
