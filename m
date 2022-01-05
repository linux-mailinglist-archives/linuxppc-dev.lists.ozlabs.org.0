Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35590485C35
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 00:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTlpJ0qmcz30KR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 10:20:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LpOZLfG/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LpOZLfG/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTlnX3Fmqz2yY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 10:19:59 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205MC5m7013705; 
 Wed, 5 Jan 2022 23:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5nhAuUGy4s/feljIwBRFAak36LkwKkjrrPJnBSJyHw4=;
 b=LpOZLfG/yorAP1uqCownEE2tB5vYpx6Z/6JYUsqzx6804FgGe7wwbSeKGbFki6KN5Voo
 DT9f+Eb643E2TNu0hrW6jh43Xv6xd6ujPZk4jRrR4unKMlpYu2wVVIbAqELQq5KF6gFS
 r4iHlmIiQqGA5Wbw9VQEmKAIqaYAAgNESIGhb98zQIgmojXdc7ZkbP+9l6DvGc1+uKSU
 PLomTeaZGYFIKiYAQpRdmmbTq4/WTIwvFOLKkMKQ60BbUrgLgYHFvE49qOmTb3QWq2U9
 qRzi1FgPM2fexLheUTzYrez8nNH/5v2k0JI5UQqGmZ6PITlWGlddLklCzVjueVWuBd4c 0Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dckxtd1hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 23:19:53 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205NIK11022817;
 Wed, 5 Jan 2022 23:19:52 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3daekbj5a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 23:19:52 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205NJoOq36897172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 23:19:50 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C359B6E054;
 Wed,  5 Jan 2022 23:19:50 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 602986E053;
 Wed,  5 Jan 2022 23:19:50 +0000 (GMT)
Received: from localhost (unknown [9.65.92.26])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 23:19:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <25527544-b0ac-596c-3876-560493b99f6b@linux.ibm.com>
References: <20211207171109.22793-1-ldufour@linux.ibm.com>
 <25527544-b0ac-596c-3876-560493b99f6b@linux.ibm.com>
Date: Wed, 05 Jan 2022 17:19:49 -0600
Message-ID: <8735m1ixd6.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AHwdpzrmszQBOJqeRl9Xam2MeG5QAYGM
X-Proofpoint-ORIG-GUID: AHwdpzrmszQBOJqeRl9Xam2MeG5QAYGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_07,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=801 priorityscore=1501 spamscore=0
 mlxscore=0 bulkscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050146
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> On 07/12/2021, 18:11:09, Laurent Dufour wrote:
>> The LPAR name may be changed after the LPAR has been started in the HMC.
>> In that case lparstat command is not reporting the updated value because it
>> reads it from the device tree which is read at boot time.
>> 
>> However this value could be read from RTAS.
>> 
>> Adding this value in the /proc/powerpc/lparcfg output allows to read the
>> updated value.
>
> Do you consider taking that patch soon?

This version prints an error on non-PowerVM guests the first time
lparcfg is read.

And I still contend that having this function fall back to reporting the
partition name in the DT would provide a beneficial consistency in the
user-facing API, allowing programs to avoid hypervisor-specific branches
in their code. I don't understand the resistance I've encountered here.
The fallback I'm suggesting (a root node property lookup) is certainly
not more complex than the RTAS call sequence you've already implemented.
