Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C0358DFC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 22:01:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGXG16KHfz3bTr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 06:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KuXAXrTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KuXAXrTF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGXFY2n04z30BM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 06:01:04 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138JxPbZ099427; Thu, 8 Apr 2021 16:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=TnAleMvyumXa+sXW+bz9hhpNo3+lfh7b5sCaa4ciu1g=;
 b=KuXAXrTFHFrAduFMtrjKsKxKtqAB2/GwdSnXGLkwiSpsaw6MwRqcceGd3lKY/IdtJRWB
 F/5YgcpOc991F54bSUhE4/knys2Q01+zNISYO2K7hGmmV5eMERPCBTO3raLohEzr/JUH
 4HlNNISYsEmcP+kqduosleRvBeXjE7+qIWaDn9W/OWeIbrRwJjuTpOYNilpQnycfUnI8
 YsqkTJsH43HpVULA0Xxnu8s3IVI4juY/8qeJbGCAwJ50WG+jcLLpgpod2aVNyKrDSoQ1
 m/zVuzfzAKmp2G658jbEWMguPtXZlEr9cGkW0rj8MjRZIT5ZxtKVc0OXgeGpqjstMUeG fw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37t8fm01hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 16:00:40 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138JpnVO023329;
 Thu, 8 Apr 2021 20:00:40 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 37rw2pjvu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 20:00:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138K0cGH30015800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 20:00:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A1C3BE04F;
 Thu,  8 Apr 2021 20:00:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 270D9BE058;
 Thu,  8 Apr 2021 20:00:38 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 20:00:37 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
In-Reply-To: <20210408111150.GK2339179@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
 <20210402031815.GI2339179@linux.vnet.ibm.com>
 <87eefml22p.fsf@linux.ibm.com>
 <20210407164930.GJ2339179@linux.vnet.ibm.com>
 <878s5tlvxr.fsf@linux.ibm.com>
 <20210408111150.GK2339179@linux.vnet.ibm.com>
Date: Thu, 08 Apr 2021 15:00:37 -0500
Message-ID: <8735w0lf6i.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BiWMl7_zebAu-qvq9BUChUTOb2iP23u4
X-Proofpoint-ORIG-GUID: BiWMl7_zebAu-qvq9BUChUTOb2iP23u4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_04:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080129
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Nathan Lynch <nathanl@linux.ibm.com> [2021-04-07 14:46:24]:
>> I don't know. I guess this question just makes me wonder whether powerpc
>> needs to have the additional lookup table. How is it different from the
>> generic per_cpu numa_node?
>
> lookup table is for early cpu to node i.e when per_cpu variables may not be
> available. This would mean that calling set_numa_node/set_cpu_numa_node from
> map_cpu_to_node() may not always be an option, since map_cpu_to_node() does
> end up getting called very early in the system.

Ah that's right, thanks.
