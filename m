Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 983014D2FAC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 14:08:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDCDp2jX5z3bXR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 00:08:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g6pE8rPi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g6pE8rPi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDCD10Fd8z30Dh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 00:07:44 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229BL99f008286; 
 Wed, 9 Mar 2022 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Q4BPbw4Ik7tzyy4nG4W5hW5AeYOuCGhmja4u3uH6GCw=;
 b=g6pE8rPiiCiFeH0pj+39J76lDiNyQqz9BAxyPSDeWoyUkcRwkhs7zbcIsG5X8Q1a1jEF
 ydkTg8n3ZU2zna6r+sidJykGnULpeVeL6r9ACGmA2JiBEK70FBiXmQMx5s6nQSVLs2yU
 1Hm6do747JNcOKJLQK9k+dszp1k5dNevoE1BaQrR/Ur9DJk4YHVNyjrShtiCx9oxO4X5
 I9G+W7zlrA7zI5YiZQ8G7zaxLhc77U2F0hdbCO9EtkIQFZ/2DRna2LBZ/TkLCowiy207
 olJRq0qpuo080ZXq7ZhSaKC7/AFX5+CnnNn/QUM/ewxxK1AW7g6DL26sSI4mSiiYEovV Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enww84h0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 13:07:34 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 229CucCl023370;
 Wed, 9 Mar 2022 13:07:34 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enww84h03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 13:07:34 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 229D4a5h030135;
 Wed, 9 Mar 2022 13:07:33 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3emgakx18h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 13:07:32 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 229D7Vsq4260802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Mar 2022 13:07:32 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFB62AC05F;
 Wed,  9 Mar 2022 13:07:31 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3559AC05E;
 Wed,  9 Mar 2022 13:07:30 +0000 (GMT)
Received: from localhost (unknown [9.211.59.35])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  9 Mar 2022 13:07:30 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/6] KVM: PPC: Book3S HV P9: Fix "lost kick" race
In-Reply-To: <20220303053315.1056880-2-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
 <20220303053315.1056880-2-npiggin@gmail.com>
Date: Wed, 09 Mar 2022 10:07:27 -0300
Message-ID: <87bkyfb7g0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qTajH0LZUZJzI5tQzWQiQ2sawlKICWfI
X-Proofpoint-GUID: nnnsRdUnbTWKBIXDcNZ1oJUZCX_IyPoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_04,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=638 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090072
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> When new work is created that requires attention from the hypervisor
> (e.g., to inject an interrupt into the guest), fast_vcpu_kick is used to
> pull the target vcpu out of the guest if it may have been running.
>
> Therefore the work creation side looks like this:
>
>   vcpu->arch.doorbell_request = 1;
>   kvmppc_fast_vcpu_kick_hv(vcpu) {
>     smp_mb();
>     cpu = vcpu->cpu;
>     if (cpu != -1)
>         send_ipi(cpu);
>   }
>
> And the guest entry side *should* look like this:
>
>   vcpu->cpu = smp_processor_id();
>   smp_mb();
>   if (vcpu->arch.doorbell_request) {
>     // do something (abort entry or inject doorbell etc)
>   }
>
> But currently the store and load are flipped, so it is possible for the
> entry to see no doorbell pending, and the doorbell creation misses the
> store to set cpu, resulting lost work (or at least delayed until the
> next guest exit).
>
> Fix this by reordering the entry operations and adding a smp_mb
> between them. The P8 path appears to have a similar race which is
> commented but not addressed yet.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
