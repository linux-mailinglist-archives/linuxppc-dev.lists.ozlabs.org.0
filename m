Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE9F899BB2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 13:15:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L2WDI8fO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9wrj2p2Fz3vYy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 22:15:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L2WDI8fO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9wr06FJCz3vX3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 22:14:56 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 435B1SZo027428;
	Fri, 5 Apr 2024 11:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0ufvDreL2dMFe1aC8vuUH6yI08L/UZP/gRqWlOoBERE=;
 b=L2WDI8fOVmja2krYhGJyubOSu2l6aGtktZQ2a57WEyBMZgpq6RlB1ZPemZTCEe1aNL8B
 BQO6SXc384NsRrJcnJMMcQe4K5tqRMjBRo+RlajyIWsiOV5t93VlMOLClK9iWqn6nJ7N
 +47q2WogLFwj/9SOTrb7SFJBtA77Mb++21rBYCocotDjewrtk8fAvmnDZvzjLVcHifzb
 cmc2moIxeAGl4ift/EpE9YojEGPNLKAeQrfCs7Y0sP5TWH/kIapbJVd7RVFUtphL/ZPK
 gtY8AC0KNaB9jNGp3MZQlb88XykFqbmNKN/CJFAGfJg7vN5kG4+mIQJxsXYxWtet/rcx 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xaf840580-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 11:14:51 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 435BEprb016706;
	Fri, 5 Apr 2024 11:14:51 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xaf84057v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 11:14:50 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4359CarL003612;
	Fri, 5 Apr 2024 11:14:50 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x9epyj5gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 11:14:50 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 435BElG343647646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Apr 2024 11:14:49 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BEA95805A;
	Fri,  5 Apr 2024 11:14:47 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 859E65803F;
	Fri,  5 Apr 2024 11:14:45 +0000 (GMT)
Received: from [9.79.178.28] (unknown [9.79.178.28])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Apr 2024 11:14:45 +0000 (GMT)
Message-ID: <1caee4ed-2e91-4d64-be6c-f91395db2fb7@linux.ibm.com>
Date: Fri, 5 Apr 2024 16:44:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Add pool idle time at LPAR boot
To: linuxppc-dev@lists.ozlabs.org
References: <20240405101340.149171-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20240405101340.149171-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A7KkBRB3593GstZZo-qls3o8BAwTXfTX
X-Proofpoint-GUID: wKCWUXGZnBv-oBpkVl-_Rlc1sNf647Tj
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_10,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 mlxlogscore=746 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404050081
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
Cc: naveen.n.rao@linux.ibm.com, tyreld@linux.ibm.com, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/5/24 3:43 PM, Shrikanth Hegde wrote:
> When there are no options specified for lparstat, it is expected to
> give reports since LPAR(Logical Partition) boot. App is an indicator
> for available processor pool in an Shared Processor LPAR(SPLPAR). App is
> derived using pool_idle_time which is obtained using H_PIC call.
> 
powerpc-utils link: https://groups.google.com/g/powerpc-utils-devel/c/WZFxrm2aCzU 

