Return-Path: <linuxppc-dev+bounces-14365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3435C6E9A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLyg737yz3c9l;
	Wed, 19 Nov 2025 23:54:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556843;
	cv=none; b=XfJcxofRSC4eyIZhCWEKLO/4tM3uyV9KBBRSJI1ez3BGqQ9Nl/n8nek3qB9YY5jBx4/sqS17PdwUTynC5pKxI5tEKOWN5TcnPzh1fqr1wmncuupiwDVhsQdsksS1c3QwatVIPFcw+phW6WQjON9v8yKExH5KYRgzkymxGeZZJW5a+7KgaXshxeV6qmHIWi8Hi8AhCL1b6xX1y21h3WK/7+O3w4KmGG80myJ6A33jjU56VAxT+c0dWbckaYe6PMSZkGomlwJnUpA8kEzEFsO5q2NcqJD6wi2EefO0KQVWy5h5QzjzPBb87eR86ggJ4WBq/vUOmw0EfE3XPpytqXUgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556843; c=relaxed/relaxed;
	bh=RUkFnKFn/OE/Pv+QE71cglYHh9/NYz4niGoSXEaodwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lg3wlaT3OcMvNgDiN5hvXKfmsw7HYETuNVMSaCN5GrVq42fKjSfobK/vJ0C/5u8OaV/tWlK2IV3Yi27OSV6Gpj9J/iGygJRJzIu7BcJJ2fbGuPB/NbVKnQrxtD68fvuwZP5I+Wp5IYkVZqzRCm+kwleZYtZSnDBgMqWtr/HIQjyEUVc9FYwL7RkLYivPxdAZhzJE13fWgPjUFGqNmhgpHF321HWtE0U9Qp+b78LjZ87nmva25x93M5OtnTtbGgGQFccbrEEUynQ2FfHIiUGjxnJPeVfUkBWyzt32BXSzLtHUe8+d5/EVMnQvoIoIIaeg7C8W7R3umMR/au2UHJeACA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E6m6Jr3P; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E6m6Jr3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLyg0VP4z3c4v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:54:02 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ9NBK4001887;
	Wed, 19 Nov 2025 12:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RUkFnK
	Fn/OE/Pv+QE71cglYHh9/NYz4niGoSXEaodwE=; b=E6m6Jr3PuHFotopv/QNxXy
	RcnXIIfSNyIwFDVLAl5xBRzmNOEQ7Suglm8iGivziuuEVq5IiQUEmzG1qscO1xrd
	UvoxYp4TDKddpsANWvivTnDCEzpeIOX6EVdZYzIgVauiF90jbTCesbbUQ8DumRnJ
	mEtYErZ5v2OeRHanYbkLoVjw5jWD7XgRjsmMY8sZa6bjAAsaclFeBcF+WOHx8tYy
	2DkMlw6B30xl1rfnwQiQbdAdWZnScIYMYCVrJj3/L32U0TOGnmuwlRw+KnUAgyWv
	XwQk73KO3RA9yrkXonh8q/gGWQwjDjVEBhDw5A4LdWb39v+4kaJsjnuwVn3JT4CQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtymep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:53:42 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCrgd1010627;
	Wed, 19 Nov 2025 12:53:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtymem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:53:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJB9HtP010506;
	Wed, 19 Nov 2025 12:53:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3us8txn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:53:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCrbb025297276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:53:37 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8728420040;
	Wed, 19 Nov 2025 12:53:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5F3520043;
	Wed, 19 Nov 2025 12:53:33 +0000 (GMT)
Received: from [9.39.25.220] (unknown [9.39.25.220])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:53:33 +0000 (GMT)
Message-ID: <b609cb77-a64e-4743-b1b6-ec043f8174a0@linux.ibm.com>
Date: Wed, 19 Nov 2025 18:23:33 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org, christophe.leroy@csgroup.eu
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, pbonzini@redhat.com,
        seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
        iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jNM7PZpv00Dfc7PPG9KvyQC4p4AvRGBC
X-Proofpoint-ORIG-GUID: wh1nhdpadEQFd8dGH0QXNTHWScvNvbyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX2iW4gQ4pUNtW
 n6B/i2d6o/W8wT11Dw7L4mgpNuZrDJfMajENMMRVWHZIsqwoRNyHF2/6BWuILghUB7cChkKgD7s
 y2JIdi6JoOIz1dMOkqTu/dCnHsSIirmMjRASApGJMSgxiilskmh7UR406g9GTdAz2j4bIry9R0Z
 4iATnUCFf3WCxeEiq/u24+VqmURMHAfHftzdYPByR4EMRJTyUig5hL0hC4q7Mg76GKvZsjUyl0t
 LA7YvzDB7i/NRXxv4C+bRy9sBM9E4G3coMU0jjYaNzV+HVXIyJQ7HPnvwlKO/2PGvqP+gXrxVCq
 OyzcT300iRlEVDV2v7bz0yrW9wGfHPEdojOtGuzAaegG/+qJB1/JmBOSnu1mkjoRg2J3Mlo57bJ
 XS3gIOTDEuYHTdvt9DLVPq11i/8TTQ==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691dbdd6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Pi4crXe-Rn3qxXpBZEsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/19/25 11:50 AM, Shrikanth Hegde wrote:
> Detailed problem statement and some of the implementation choices were
> discussed earlier[1].
> 
> [1]: https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/
> 
> This is likely the version which would be used for LPC2025 discussion on
> this topic. Feel free to provide your suggestion and hoping for a solution
> that works for different architectures and it's use cases.
> 
> All the existing alternatives such as cpu hotplug, creating isolated
> partitions etc break the user affinity. Since number of CPUs to use change
> depending on the steal time, it is not driven by User. Hence it would be
> wrong to break the affinity. This series allows if the task is pinned
> only paravirt CPUs, it will continue running there.
> 
> Changes compared v3[1]:
> 
> - Introduced computation of steal time in powerpc code.
> - Derive number of CPUs to use and mark the remaining as paravirt based
>    on steal values.
> - Provide debugfs knobs to alter how steal time values being used.
> - Removed static key check for paravirt CPUs (Yury)
> - Removed preempt_disable/enable while calling stopper (Prateek)
> - Made select_idle_sibling and friends aware of paravirt CPUs.
> - Removed 3 unused schedstat fields and introduced 2 related to paravirt
>    handling.
> - Handled nohz_full case by enabling tick on it when there is CFS/RT on
>    it.
> - Updated helper patch to override arch behaviour for easier debugging
>    during development.

Sorry for creating confusion around last two patches. Sent out new version.

https://lore.kernel.org/all/20251119124449.1149616-1-sshegde@linux.ibm.com/

