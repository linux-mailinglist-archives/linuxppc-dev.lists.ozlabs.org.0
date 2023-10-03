Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D987B62C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 09:48:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PuxNGo/0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S091R1MgMz3vXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:48:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PuxNGo/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S090W5vVxz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 18:47:55 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3937fxJi013819;
	Tue, 3 Oct 2023 07:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dFT5PqHWVBVRgRf1w7hkI2DyIK0y1miyGJCr9AYihaM=;
 b=PuxNGo/0rOHG5msgNhaX2+DI15PhMGqGKnrgvJAarLnr/HAi6OTeK6PduPQM5c5FDc3p
 VEKug1MrxexWLPy6YvSKsOl7s2Euo0SnIdVscKDIHJkGAxCCWtthju89O+r6zPH2vSKs
 pbYvo8TNJDosv8gRO0OLPeUSjtdLMI5uEddkZXqQ1zM6+TS44fbigu/fTy5Lmeh2KjoV
 JvhBmWABWOpA8o/RlqIXkMieh3+0eHYaLLlteS80aZqZrdDe8Z6wc9dI+n8qFkbrfz/5
 JmRGO4Q45hkAX6edXQT7fV7IAt9FM5qjdJdANQrqstobLl1+HwLAPDCGLbbKSftjK22d wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tgesy860b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 07:47:42 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3937gwoD017317;
	Tue, 3 Oct 2023 07:47:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tgesy8603-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 07:47:41 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3937SsYa017644;
	Tue, 3 Oct 2023 07:47:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tey0myvns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 07:47:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3937ldZR11535032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Oct 2023 07:47:39 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F10120040;
	Tue,  3 Oct 2023 07:47:39 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EB8C20043;
	Tue,  3 Oct 2023 07:47:36 +0000 (GMT)
Received: from [9.171.39.117] (unknown [9.171.39.117])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Oct 2023 07:47:36 +0000 (GMT)
Message-ID: <3fb9bd59-afaf-a651-16b7-d62f45ca472a@linux.ibm.com>
Date: Tue, 3 Oct 2023 13:17:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with latest scripts in
 tests/shell
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S7WI6bn567ncmGnHGV17pwArAObB0rhs
X-Proofpoint-GUID: PQT5uEn6mq69yuCAalyMGXOsajv0R765
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_04,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=936
 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310030056
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
Cc: linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset looks fine to me.

Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

thanks,
Kajol Jain

On 9/29/23 09:41, Athira Rajeev wrote:
> shellcheck was run on perf tool shell scripts as a pre-requisite
> to include a build option for shellcheck discussed here:
> https://www.spinics.net/lists/linux-perf-users/msg25553.html
> 
> And fixes were added for the coding/formatting issues in
> two patchsets:
> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev@linux.vnet.ibm.com/
> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev@linux.vnet.ibm.com/
> 
> Three additional issues were observed and fixes are part of:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next
> 
> With recent commits in perf, other three issues are observed.
> shellcheck version: 0.6.0
> 
> With this patchset:
> 
> for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
> echo $?
> 0
> 
> The changes are with recent commits ( which is mentioned in each patch)
> for ock_contention, record_sideband and test_arm_coresight testcases.
> The changes are made on top of:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next
> 
> Athira Rajeev (3):
>   perf tests test_arm_coresight: Fix the shellcheck warning in latest
>     test_arm_coresight.sh
>   tools/perf/tests Ignore the shellcheck SC2046 warning in
>     lock_contentio
>   tools/perf/tests: Fix shellcheck warning in record_sideband.sh test
> 
>  tools/perf/tests/shell/lock_contention.sh    | 1 +
>  tools/perf/tests/shell/record_sideband.sh    | 2 +-
>  tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
