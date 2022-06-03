Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A9653C8FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 12:58:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF0HG1vHsz3bs4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 20:58:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ChZO6X+y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ChZO6X+y;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF0GV5Dw8z3blB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 20:57:53 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 253AEgLJ035589
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Jun 2022 10:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mgeg++xePPca3nYPHLnZjnQjvSVDi35onYMxHjtePCc=;
 b=ChZO6X+yGI9ZzD2hkEVwpNTSwUYl8hi8qZuwSotQuyZt7ZoQ2cvUrdO849rUMR5bLDxB
 TajmqxSl3gimClV0JmMz7BnFVGxdLwn542wPUU49n3HIhDtA6iVJcyY9t8iI20R4icrk
 sMYFnqapUo2XsUQ8v89OjmWwe36nwzVtoFA2s0+nZa1ANYDRYEDrw3QnWsGnDnC5Um9Z
 Y/T/yHbRW8FjK54pp/4APV8kji5KkBBinqPPk3NvAqiTPP8AMb2FpklQ31KJe/n/cWiA
 lKKXLnC3ay5dGOibgETwPS5RitR9fEGN+rSnfEoJikJ0J/hkQbTaq9MuiSy2pkAqoz5J fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gfdx13685-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 10:57:50 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 253ArGaD035066
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Jun 2022 10:57:50 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gfdx13681-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 10:57:50 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 253AakBG030058;
	Fri, 3 Jun 2022 10:57:49 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03dal.us.ibm.com with ESMTP id 3gd3yn7t4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jun 2022 10:57:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 253Avm1u41026000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jun 2022 10:57:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7113B112063;
	Fri,  3 Jun 2022 10:57:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB59F112061;
	Fri,  3 Jun 2022 10:57:46 +0000 (GMT)
Received: from [9.160.86.228] (unknown [9.160.86.228])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  3 Jun 2022 10:57:46 +0000 (GMT)
Message-ID: <1d8e53bf-4ea8-e8fa-72c6-62f2ab85738a@linux.vnet.ibm.com>
Date: Fri, 3 Jun 2022 16:27:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] powerpc/pseries: Implement
 CONFIG_PARAVIRT_TIME_ACCOUNTING
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220518133935.3878954-1-npiggin@gmail.com>
 <20220518133935.3878954-4-npiggin@gmail.com>
From: shrikanth suresh hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20220518133935.3878954-4-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xx0xurNWWXji6nKkhWRhp4rL3JYOzwWx
X-Proofpoint-GUID: awcmBjQB6aM5Zg7WP7QavyzumAtSlrBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_03,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206030046
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/18/22 7:09 PM, Nicholas Piggin wrote:
> CONFIG_VIRT_CPU_ACCOUNTING_GEN under pseries does not implement
> stolen time accounting. Implement it with the paravirt time
> accounting option.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Patch fails to compile with CONFIG_PARAVIRT=y with below error.
In file included from kernel/sched/core.c:81:
kernel/sched/sched.h:87:11: fatal error: asm/paravirt_api_clock.h: No
such file or directory
    87 | # include <asm/paravirt_api_clock.h>
compilation terminated.

after adding the file, it compiled. Please add the file as well. patch i did.

diff --git a/arch/powerpc/include/asm/paravirt_api_clock.h
b/arch/powerpc/include/asm/paravirt_api_clock.h
new file mode 100644
index 000000000000..65ac7cee0dad
--- /dev/null
+++ b/arch/powerpc/include/asm/paravirt_api_clock.h
@@ -0,0 +1 @@
+#include <asm/paravirt.h>


After successful compilation, it was tested on Power10 Shared LPAR. system has
two LPAR. we will call first one LPAR1 and second one as LPAR2.  Test was
carried out in SMT=1. Similar observation was seen in SMT=8 as well.

LPAR config header from each LPAR is below. LPAR1 is twice as big as LPAR2.
Since Both are sharing the same underlying hardware, work stealing will happen
when both the LPAR's are contending for the same resource.
LPAR1:
type=Shared mode=Uncapped smt=Off lcpu=40 mem=2094637056 kB cpus=40 ent=20.00
LPAR2:
type=Shared mode=Uncapped smt=Off lcpu=20 mem=2083908608 kB cpus=40 ent=10.00

mpstat was used to check for the utilization. stress-ng has been used as the
workload. Few cases are tested. when the both LPAR are idle there is no steal
time. when LPAR1 starts running at 100% which consumes all of the physical
resource, steal time starts to get accounted.  With LPAR1 running at 100% and
LPAR2 starts running, steal time starts increasing. This is as expected. When
the LPAR2 Load is increased further, steal time increases further.

Case 1: 0% LPAR1; 0% LPAR2
CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest %gnice   %idle
all    0.00    0.00    0.05    0.00    0.00    0.00    0.00    0.00    0.00   99.95

Case 2: 100% LPAR1; 0% LPAR2
CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest %gnice   %idle
all   97.68    0.00    0.00    0.00    0.00    0.00    2.32    0.00  0.00    0.00

Case 3: 100% LPAR1; 50% LPAR2
CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest %gnice   %idle
all   86.34    0.00    0.10    0.00    0.00    0.03   13.54    0.00  0.00    0.00

Case 4: 100% LPAR1; 100% LPAR2
CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest %gnice   %idle
all   78.54    0.00    0.07    0.00    0.00    0.02   21.36    0.00  0.00    0.00

Case 5: 50% LPAR1; 100% LPAR2
CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest %gnice   %idle
all   49.37    0.00    0.00    0.00    0.00    0.00    1.17    0.00  0.00    49.47

Patch is accounting for the steal time and basic tests are holding good.

-- Shrikanth Hegde
