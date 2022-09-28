Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E75EE1C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 18:24:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md1yl5r4Gz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 02:23:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k0FdBy8B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k0FdBy8B;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md1y16cfXz301Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 02:23:21 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SGK5sK001882;
	Wed, 28 Sep 2022 16:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=YAtibWuc5oMzVqp55WCKs72Sw0/ah0i5PLNnJUPSc5w=;
 b=k0FdBy8BRhsithYUgRc3uwuCPWhJJxiLNaPd8IPG96Z9dMHwvFhZPRZbvRFbDmxKorQ1
 6yRrX71etg1LdhU+rFuyiJOQ2qg8sZ4NOKF2nEypE3qzI+2XGpuxhAW/3FDkwLkYID8U
 HZ5nZyQppHngxobcklqLspX1NLTjDvlhTZZurxCgdTq0RxYnfu0DwvAx++2kcA0GcgEy
 dfcmBx2KpWDzoVPMQ6flYrnCxd7a8Rme5CtEr6cRge7xV/lwkI8+/J1Q49ZK28rDfqBg
 yvBqF3d4tG0Bki9x7BFPKF1CtG+Ui1wjJ6Tq1TO/MKTm1sSkp1Ir/hWcTskPYtLO+NjH uQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvqxp46c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 16:23:11 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SGLRaF011582;
	Wed, 28 Sep 2022 16:23:10 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma03dal.us.ibm.com with ESMTP id 3jssha37fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 16:23:10 +0000
Received: from smtpav02.dal12v.mail.ibm.com ([9.208.128.128])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28SGN9YO46268826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Sep 2022 16:23:10 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE0195805C;
	Wed, 28 Sep 2022 16:23:08 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAE895805E;
	Wed, 28 Sep 2022 16:23:08 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Sep 2022 16:23:08 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/rtas: block error injection when locked
 down
In-Reply-To: <591a3e016605181e119496992027ae21700a2c3b.camel@linux.ibm.com>
References: <20220926131643.146502-1-nathanl@linux.ibm.com>
 <20220926131643.146502-3-nathanl@linux.ibm.com>
 <591a3e016605181e119496992027ae21700a2c3b.camel@linux.ibm.com>
Date: Wed, 28 Sep 2022 11:23:08 -0500
Message-ID: <87y1u3pixf.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0WZREWqYnhMhJI2Fp2k2r6ADwAiGOteU
X-Proofpoint-GUID: 0WZREWqYnhMhJI2Fp2k2r6ADwAiGOteU
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_07,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxlogscore=771 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280096
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
Cc: paul@paul-moore.com, nayna@linux.ibm.com, jmorris@namei.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On Mon, 2022-09-26 at 08:16 -0500, Nathan Lynch wrote:
>> The error injection facility on pseries VMs allows corruption of
>> arbitrary guest memory, potentially enabling a sufficiently
>> privileged
>> user to disable lockdown or perform other modifications of the
>> running
>> kernel via the rtas syscall.
>> 
>> Block the PAPR error injection facility from being opened or called
>> when locked down.
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>
> Is there any circumstance (short of arbitrary code execution etc) where
> the rtas_call() check will actually trigger rather than the sys_rtas()
> check? (Not that it matters, defence in depth is good.)

Fair question! There are no in-kernel users of rtas_call() that pass the
error injection tokens as far as I could tell. Nor am I aware of any
out-of-tree users, for that matter. But rtas_call() is the likely most
appropriate place to have the lockdown gate should that situation change
(as it might, see https://github.com/ibm-power-utilities/librtas/issues/29).
