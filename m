Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63C1AA462
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:29:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492NVk4s47zDr3M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 23:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Mht6NKpzDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 22:53:02 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FCXqaT086481
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 08:53:00 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnnfmjg9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 08:53:00 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Wed, 15 Apr 2020 13:52:30 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 15 Apr 2020 13:52:29 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03FCqtw357016478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Apr 2020 12:52:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E03BEA4054;
 Wed, 15 Apr 2020 12:52:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D01BA405F;
 Wed, 15 Apr 2020 12:52:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Apr 2020 12:52:55 +0000 (GMT)
Received: from [9.206.128.45] (unknown [9.206.128.45])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D0775A00A5;
 Wed, 15 Apr 2020 22:52:49 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
Subject: CVE-2020-11669: Linux kernel 4.10 to 5.1: powerpc: guest can cause
 DoS on POWER9 KVM hosts
To: oss-security@lists.openwall.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Wed, 15 Apr 2020 22:52:53 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20041512-0008-0000-0000-0000037122CF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041512-0009-0000-0000-00004A92D6B4
Message-Id: <2ff92392-30ec-d5c4-84c9-e6ba24f6b154@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_03:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004150091
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Linux kernel for powerpc from v4.10 to v5.1 has a bug where the 
Authority Mask Register (AMR), Authority Mask Override Register (AMOR) 
and User Authority Mask Override Register (UAMOR) are not correctly 
saved and restored when the CPU is going into/coming out of idle state.

On POWER9 CPUs, this means that a CPU may return from idle with the AMR 
value of another thread on the same core.

This allows a trivial Denial of Service attack against KVM hosts, by 
booting a guest kernel which makes use of the AMR, such as a v5.2 or 
later kernel with Kernel Userspace Access Prevention (KUAP) enabled.

The guest kernel will set the AMR to prevent userspace access, then the 
thread will go idle. At a later point, the hardware thread that the 
guest was using may come out of idle and start executing in the host, 
without restoring the host AMR value. The host kernel can get caught in 
a page fault loop, as the AMR is unexpectedly causing memory accesses to 
fail in the host, and the host is eventually rendered unusable.

The fix is to correctly save and restore the AMR in the idle state 
handling code.

The bug does not affect POWER8 or earlier Power CPUs.

CVE-2020-11669 has been assigned.

The bug has already been fixed upstream in kernels v5.2 onwards, by [0].

Fixes have been submitted for inclusion in upstream stable kernel trees 
for v4.19[1] and v4.14[2].

The bug is already fixed in Red Hat Enterprise Linux 8 kernels from 
4.18.0-147 onwards - see RHSA-2019:3517[3].

Thanks to David Gibson of Red Hat for the initial bug report.

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=53a712bae5dd919521a58d7bad773b949358add0

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208661.html

[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208660.html

[3] https://access.redhat.com/errata/RHSA-2019:3517

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

