Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43072EC55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 21:54:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mswOCzjW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgfQH4gKgz30ft
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 05:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mswOCzjW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgfPP51QVz2xqW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 05:53:29 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DJodkC027687;
	Tue, 13 Jun 2023 19:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=eCDQJfNdDcfY/qh8c7pDj2+5HZ61xTeacVz42YP5XRc=;
 b=mswOCzjWhhVjLyELX89z2tqx/HrK8jjrouaBsXBuOLi7DnxyE7z6geVjMc0MJkrN4XxK
 VF59xA9P1+lyGI548PdOXeNxi9lFh6mxDz2oAJEbJC4eohF2EKWqTuZgXsaO/8Kw2+is
 TdozZ7aIR377WQ6Cx8v47IBI0qH8htXxEwagUUjXJAGyO3eH0sWPoW2IlfyLxBWE/Yh3
 5ZgFBasMI18ucUpTwuu98iMaqQhUrCMWOsQ84lPQr2il+cI1XX7BxO+cGjVILzhJkucQ
 dkokSma5uKZhOCtxJgAlmNN6rBtXYt0aeBO7yAk8WaDVan1xGoYDJh90BL57t1Qd7XW2 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6xye025d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 19:53:20 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DJpH5W030438;
	Tue, 13 Jun 2023 19:53:20 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6xye0254-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 19:53:20 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35DHWdn9012038;
	Tue, 13 Jun 2023 19:53:19 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3r4gt646qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 19:53:19 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DJrH0r33751554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 19:53:18 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8C745805A;
	Tue, 13 Jun 2023 19:53:17 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAF1158056;
	Tue, 13 Jun 2023 19:53:17 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 13 Jun 2023 19:53:17 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 2B28B1756C9;
	Tue, 13 Jun 2023 14:53:17 -0500 (CDT)
Date: Tue, 13 Jun 2023 14:53:16 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/mm: Cleanup memory block size probing
Message-ID: <669b93ba-5865-4944-8d13-7acc0a0f2f94@arbab-laptop>
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CspLqJAJjxk_iGTrNgLqOpSHAyrXmUXE
X-Proofpoint-GUID: eqvbHzbeJYq6N_x4DIzqk0stSfE07GB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_22,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130170
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
Cc: foraker1@llnl.gov, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 09, 2023 at 11:38:50AM +0530, Aneesh Kumar K.V wrote:
>Parse the device tree in early init to find the memory block size to be
>used by the kernel. Consolidate the memory block size device tree parsing
>to one helper and use that on both powernv and pseries. We still want to
>use machine-specific callback because on all machine types other than
>powernv and pseries we continue to return MIN_MEMORY_BLOCK_SIZE.
>
>pseries_memory_block_size used to look for the second memory
>block (memory@x) to determine the memory_block_size value. This patch
>changed that to look at all memory blocks and make sure we can map them all
>correctly using the computed memory block size value.

Reviewed-by: Reza Arbab <arbab@linux.ibm.com>

-- 
Reza Arbab
