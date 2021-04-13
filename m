Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DED35DEA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 14:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKPw158LBz3btG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 22:25:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OG2y81Ne;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OG2y81Ne; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKPvZ5dwvz2xyG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 22:25:30 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DC56cB009542; Tue, 13 Apr 2021 08:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dHIo7LlYA2sKxb9eN7d5BXK3+U/RL0u4RDxgVNzFEpE=;
 b=OG2y81NetUUZfrO6PvaL7nzNAudl16jObA4U/KeH4RzBIG71uLN06dPn3fRmmTIxjE74
 8Zf556mkWpRhvUE6ZGyw97FDv4BJGPvkS9TILen7JTYv4aLIyS8dNE9covIVRCA/3pCc
 TTuU/vBhTbLQB2CpLe52NuNoYrm0PByy3MPOMkoN4WKBrfBIjFQG0JbG/nlpkVwWeqZ5
 ugPi8gXUcnytgsZ0ohJeeMu++plOQTCoB4+1VbO/Afm7QvI9ZF9YuR8qHI91dZPt/FAD
 Yj3WEtM19mh56Cgq3w13SreJqWPE8Cr/ellgzf2AGveXulxwVIo19zkCA0qbV8r2/MFp ow== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vjtu97c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:25:16 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DCKAIa030930;
 Tue, 13 Apr 2021 12:25:15 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 37u3na0fy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 12:25:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DCPE4e30999016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:25:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 801E0C6059;
 Tue, 13 Apr 2021 12:25:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49C2AC6055;
 Tue, 13 Apr 2021 12:25:14 +0000 (GMT)
Received: from localhost (unknown [9.163.8.142])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 12:25:14 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
In-Reply-To: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 07:25:13 -0500
Message-ID: <87k0p6fk2e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VzfuMwsmycBQCkdTPpjJNVI4LTzEi0fG
X-Proofpoint-ORIG-GUID: VzfuMwsmycBQCkdTPpjJNVI4LTzEi0fG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_04:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130086
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>
> Some of the per-CPU masks use cpu_cpu_mask as a filter to limit the search
> for related CPUs. On a dlpar add of a CPU, update cpu_cpu_mask before
> updating the per-CPU masks. This will ensure the cpu_cpu_mask is updated
> correctly before its used in setting the masks. Setting the numa_node will
> ensure that when cpu_cpu_mask() gets called, the correct node number is
> used. This code movement helped fix the above call trace.
>
> Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

Thanks.
