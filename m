Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ADB8D5554
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:25:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j9buZble;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr15n089Mz3dTf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:25:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j9buZble;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishna.kumar11@ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vm5Y12W4Fz78kp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 23:31:32 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44ODIeVU021390;
	Fri, 24 May 2024 13:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pdNnJKtVLAviOZt2LChxaXSFMrdOA844o1VghTvA/nY=;
 b=j9buZblef9KOy+oHo0Vu2JxjYwsQJOvrd/hrGJ3D+5/HJ01GJMTUbv4NlM2DYpCGQ5O5
 hMyiVVqumjtqAxNNBOu/nYhR6yBO6I0vmtl7n7r99O3hxPOkvMXWU+7q2KWbRqtXOULj
 hN3L1azLl8A7OjbkisazdsFiPGRQ+/uXkytpg281/7MiHMbplR7Ezxu5pN+gdKoA+kb2
 yV+WE/h+nLStmL4rgDKW+avW1lF8bId7/gmXPLywg++soglLAQlcJFw+mGZ9msHIRmqN
 2sGGa+nGIKC2pSRC9eFnXkFJGpnnJZ/8U5tWNYWtC6j1wfmnxaQC/Cno+aw+/PO/KxUp OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yaunp81rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:31:23 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44ODVNbP010918;
	Fri, 24 May 2024 13:31:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yaunp81rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:31:23 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44OCB8OM023533;
	Fri, 24 May 2024 13:31:22 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77nprvmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:31:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44ODVGZ433882636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 May 2024 13:31:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80D3B2004B;
	Fri, 24 May 2024 13:31:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FF8320040;
	Fri, 24 May 2024 13:31:14 +0000 (GMT)
Received: from [9.109.241.85] (unknown [9.109.241.85])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 May 2024 13:31:14 +0000 (GMT)
Message-ID: <72eb6bfc-cd1e-4f4b-9d38-8adb483077f1@ibm.com>
Date: Fri, 24 May 2024 19:01:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] powerpc/numa: Online a node if PHB is attached.
To: Nilay Shroff <nilay@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com
References: <20240517142531.3273464-1-nilay@linux.ibm.com>
 <20240517142531.3273464-3-nilay@linux.ibm.com>
Content-Language: en-US
From: Krishna Kumar <krishna.kumar11@ibm.com>
In-Reply-To: <20240517142531.3273464-3-nilay@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: teh8NMBPFheK4MSJr5HogF3pMCw5FNlS
X-Proofpoint-ORIG-GUID: XbFgmpbFeNkyCPWoHQ6CpSwE9dst2v1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=886
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405240093
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: gjoyce@linux.ibm.com, srikar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, sshegde@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/17/24 19:55, Nilay Shroff wrote:
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
> Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>

Thanks for fixing this. Looks good to me.

Reviewed-by: Krishna Kumar (krishnak@linux.ibm.com)

