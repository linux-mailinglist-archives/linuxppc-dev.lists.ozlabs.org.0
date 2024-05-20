Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 26DB48CB8D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 04:06:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8EOiDC5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkZFk52DSz78pj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 11:58:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8EOiDC5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjklC4NZzz3fq1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 03:17:11 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44KGWMCa025758;
	Mon, 20 May 2024 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=HKtOB+oFscURG03ulDdZ1tuzGvSOwET8hBkLOc3xVCY=;
 b=P8EOiDC5pKDN1qY29oCGeRVg+2T7jZS2yKgyQB3K/8p4r9v2PDIWfRo/PrLRWnYKz7fl
 fWY2N0CrVVoAR4Fy33sBIKnzy/19kd7I1ESdqEV26FMhzOu2Vx3Kmmy8RftB9Y85BCit
 EvYQtNNNmvHlGLFQxXcbVHlVDvP8ZeY4DgfLIC+IJLPBq7Clw2+HWjJwroezOJURzV4r
 P48pZ3xMwEFRluoixEWTbcq29vLMV7Q1AF2hPc44lQjg4kxpPfEkvQ2KO7ROiZ6mgeoS
 riE8XTpPZ3UsEKO0A+RlXylrMsm+MeqTQSVIEK1MKOOfGV44ZHBUGN7UepUkr0zB0Ur0 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y8a4b83p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 17:17:01 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44KHH1QB001726;
	Mon, 20 May 2024 17:17:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y8a4b83p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 17:17:01 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44KFMMRl007412;
	Mon, 20 May 2024 17:17:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y79c2rfu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 17:17:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44KHGrwY57409814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 May 2024 17:16:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5C8120040;
	Mon, 20 May 2024 17:16:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC3032004D;
	Mon, 20 May 2024 17:16:51 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 20 May 2024 17:16:51 +0000 (GMT)
Date: Mon, 20 May 2024 22:46:50 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] powerpc/numa: Online a node if PHB is attached.
Message-ID: <20240520171650.GK2531@linux.ibm.com>
References: <20240517142531.3273464-1-nilay@linux.ibm.com>
 <20240517142531.3273464-3-nilay@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240517142531.3273464-3-nilay@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iOKmuu6NlxlxyOwx1K2qPsexcxYD3REF
X-Proofpoint-GUID: VpHDuA8fgUR__3-BZzHkmK_yujIA3N6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_09,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=777 lowpriorityscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405200138
X-Mailman-Approved-At: Wed, 22 May 2024 11:57:27 +1000
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
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: sshegde@linux.ibm.com, gjoyce@linux.ibm.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nilay Shroff <nilay@linux.ibm.com> [2024-05-17 19:55:23]:

Hi Nilay,

> In the current design, a numa-node is made online only if
> that node is attached to cpu/memory. With this design, if
> any PCI/IO device is found to be attached to a numa-node
> which is not online then the numa-node id of the corresponding
> PCI/IO device is set to NUMA_NO_NODE(-1). This design may
> negatively impact the performance of PCIe device if the
> numa-node assigned to PCIe device is -1 because in such case
> we may not be able to accurately calculate the distance
> between two nodes.
> The multi-controller NVMe PCIe disk has an issue with
> calculating the node distance if the PCIe NVMe controller
> is attached to a PCI host bridge which has numa-node id
> value set to NUMA_NO_NODE. This patch helps fix this ensuring
> that a cpu/memory less numa node is made online if it's
> attached to PCI host bridge.
> 
Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

-- 
Thanks and Regards
Srikar Dronamraju
