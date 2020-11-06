Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F22A99C6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:46:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSR9q3hzczDrCs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:46:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fO+7b1Ae; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSR7N5zQ3zDrBY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 03:44:32 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6GWbEE176788
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Nov 2020 11:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=V2iR+bsLRq/BHMr8FKrrfoqtFEb7GZD2FHyLUBuA8I0=;
 b=fO+7b1AexaQtd2CyMnYmyK4w9bP5FBnHrRg90fuiQqUi/rMYFKGLJRjvzeNMyZg5d2LO
 YuOi1UU0FUTli1lxw3Wxmcyrd3JYpm5LRlh5Cd+5RTEGuS4OC66MrOsGzok9Ar6gxqZZ
 H/YD7aJy+LChL5Q4kkcNU5GQGXkFYAWo3i+U67azTuBDLFMm/iSTVblYCoOOywTPsLOn
 B9gsIdkfTvJKUcQrzk4OApfzhqSh9iyrAyP3HVDX2t8uMMUehVKYvniAQsM9qpGzsMuA
 qZwBQxtBDX6fXpvqzz6rkg/ctnehhN0GvWVwARTp6DCD9OkD8FwrTlOQc6bhr79uCm8a 4A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34n3qrec36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 11:44:29 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6GhGpO004432
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Nov 2020 16:44:28 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 34hs33twjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 16:44:28 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A6GiJlT7995932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 16:44:19 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33D556E053;
 Fri,  6 Nov 2020 16:44:27 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E91376E04C;
 Fri,  6 Nov 2020 16:44:26 +0000 (GMT)
Received: from localhost (unknown [9.65.230.88])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 Nov 2020 16:44:26 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/29] powerpc/rtas: prevent suspend-related sys_rtas use
 on LE
In-Reply-To: <95c8b599-f939-ad28-5671-cfbf7436508e@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-3-nathanl@linux.ibm.com>
 <f7386a11-61b7-4ed5-65d4-e702755be16c@linux.ibm.com>
 <87r1pfkj7z.fsf@linux.ibm.com>
 <95c8b599-f939-ad28-5671-cfbf7436508e@linux.ibm.com>
Date: Fri, 06 Nov 2020 10:44:26 -0600
Message-ID: <87mtzujuz9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 mlxlogscore=943 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060115
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 30/10/20 11:10 pm, Nathan Lynch wrote:
>>> And there's a zero chance that drmgr will ever be fixed on LE?
>> 
>> It's always used the sysfs interface on LE, and the only way to provoke
>> it to attempt the syscalls is by doing something like this before
>> running the migration:
>> 
>> # echo 0 > /tmp/fake_api_version
>> # mount -o bind,ro /tmp/fake_api_version /sys/kernel/mobility/api_version
>> 
>> So I'm not aware of any circumstance that would actually motivate
>> someone to make it work on LE. I'd say it's more likely that drmgr will
>> drop its support for using the syscall altogether.
>> 
>
> Okay. librtas should handle the error fine, so I don't have any huge 
> objection to this, though perhaps a documentation patch to librtas to 
> mention that these calls are BE-only would be in order.

Good suggestion, I've drafted a documentation change as well as an
attempt to mark the appropriate APIs deprecated for LE here:

https://github.com/nathanlynch/librtas/tree/topic/document-suspend-filter

which I'll send to Tyrel if/when the Linux change is staged.
