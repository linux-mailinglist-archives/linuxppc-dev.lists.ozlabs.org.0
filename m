Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EC384CC73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 15:15:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ONDApOWB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVMbS5Qqrz3cQL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 01:15:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ONDApOWB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVMZk3NQNz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 01:15:10 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 417DRK4i024733;
	Wed, 7 Feb 2024 14:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=M7VY3bsanvzSPuzOMowwnwqXYsUsv2q9/y/knc+OF04=;
 b=ONDApOWB+CkBmtwnnrXx6SkUxdZPi/jvq2kA4RgwXzzT59PZgrgSpWUSf3T7AgIbaLnV
 dKeUqduQCegSZZhMIOTmY5lxo34H5DkQG+Ichg2wDidWhzh2HcZzzKnm8y4q9VflI0kL
 qfSyhhUiYGTFh4q0gQ1gcEK3cRLp46W1weVLRbTm9eEVdv1nx41qHuQUNNmeDziO82YF
 zFv1ELWokMX1r5pshDTNYMgDGqxj7gTrZTelM9Q7Rv4SPQX2H9NtBJ1Yw05atCuyYxch
 YIH4+aKK8PDx//ui2NUPtpS3LMUy+dkJHG6kQsCK2LS8r3cJnlqRT9t2q6KWzLuDXSon kw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4arnsgfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 14:15:03 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 417D19rM020234;
	Wed, 7 Feb 2024 14:15:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w1ytt6d07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 14:15:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 417EF0io11666036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Feb 2024 14:15:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FD5C2004E;
	Wed,  7 Feb 2024 14:15:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D041A2004B;
	Wed,  7 Feb 2024 14:14:59 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  7 Feb 2024 14:14:59 +0000 (GMT)
Date: Wed, 7 Feb 2024 15:14:58 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH 4/5] s390/irq,nmi: do not include <linux/vtime.h> header
Message-ID: <ZcOQYn7G+lE7sR9W@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
 <966148629217b56139f40c38ffbb45ca229bd489.1706470223.git.agordeev@linux.ibm.com>
 <20240129095144.6722-A-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129095144.6722-A-hca@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wQvamkGva6TInDfEiSrAYE_sclmi_aAF
X-Proofpoint-GUID: wQvamkGva6TInDfEiSrAYE_sclmi_aAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_05,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 adultscore=0 mlxlogscore=188
 spamscore=1 malwarescore=0 clxscore=1015 mlxscore=1 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402070106
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 10:51:44AM +0100, Heiko Carstens wrote:
> It is confusing when the patch subject is "do not include.." and all
> what this patch is doing is to add two includes. I see what this is
> doing: getting rid of the implicit include of asm/vtime.h most likely
> via linux/hardirq.h, but that's not very obvious.
> 
> Anyway:
> Acked-by: Heiko Carstens <hca@linux.ibm.com>

Thank you, Heiko!

Whether this wording sounds better?

s390/irq,nmi: include <asm/vtime.h> header directly                         

update_timer_sys() and update_timer_mcck() are inlines used for             
CPU time accounting from the interrupt and machine-check handlers.          
These routines are specific to s390 architecture, but included              
via <linux/vtime.h> header implicitly. Avoid the extra loop and             
include <asm/vtime.h> header directly.                                      
