Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2C1A71B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:22:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491W4Q6Tw0zDqS3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:21:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491VzP5spVzDqS1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 13:17:37 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E34x6o142964
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:17:34 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cwkyu8dp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:17:34 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 14 Apr 2020 04:17:15 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Apr 2020 04:17:10 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03E3HQIH60096710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 03:17:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7033D52054;
 Tue, 14 Apr 2020 03:17:26 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.60.157])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DE98652067;
 Tue, 14 Apr 2020 03:17:11 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 00/16] powerpc/watchpoint: Preparation for more than one
 watchpoint
Date: Tue, 14 Apr 2020 08:46:43 +0530
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041403-0012-0000-0000-000003A410A8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041403-0013-0000-0000-000021E1457A
Message-Id: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_11:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=639 phishscore=0
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004140024
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
Cc: apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far, powerpc Book3S code has been written with an assumption of only
one watchpoint. But future power architecture is introducing second
watchpoint register (DAWR). Even though this patchset does not enable
2nd DAWR, it make the infrastructure ready so that enabling 2nd DAWR
should just be a matter of changing count.

Existing functionality works fine with the patchset. I've tested it with
perf, ptrace(gdb), xmon. All hw-breakpoint selftests are passing as well.
And I've build tested for 8xx and 'AMCC 44x, 46x or 47x'.

Note: kvm or PowerVM guest is not enabled yet.

v2:
  https://lore.kernel.org/linuxppc-dev/20200401061309.92442-1-ravi.bangoria@linux.ibm.com

v2->v3:
 - Few minor improvements as suggested by Christophe
 - Rebased to powerpc/next

Ravi Bangoria (16):
  powerpc/watchpoint: Rename current DAWR macros
  powerpc/watchpoint: Add SPRN macros for second DAWR
  powerpc/watchpoint: Introduce function to get nr watchpoints
    dynamically
  powerpc/watchpoint/ptrace: Return actual num of available watchpoints
  powerpc/watchpoint: Provide DAWR number to set_dawr
  powerpc/watchpoint: Provide DAWR number to __set_breakpoint
  powerpc/watchpoint: Get watchpoint count dynamically while disabling
    them
  powerpc/watchpoint: Disable all available watchpoints when
    !dawr_force_enable
  powerpc/watchpoint: Convert thread_struct->hw_brk to an array
  powerpc/watchpoint: Use loop for thread_struct->ptrace_bps
  powerpc/watchpoint: Introduce is_ptrace_bp() function
  powerpc/watchpoint: Use builtin ALIGN*() macros
  powerpc/watchpoint: Prepare handler to handle more than one
    watcnhpoint
  powerpc/watchpoint: Don't allow concurrent perf and ptrace events
  powerpc/watchpoint/xmon: Don't allow breakpoint overwriting
  powerpc/watchpoint/xmon: Support 2nd dawr

 arch/powerpc/include/asm/cputable.h       |   6 +-
 arch/powerpc/include/asm/debug.h          |   2 +-
 arch/powerpc/include/asm/hw_breakpoint.h  |  32 +-
 arch/powerpc/include/asm/processor.h      |   6 +-
 arch/powerpc/include/asm/reg.h            |   6 +-
 arch/powerpc/include/asm/sstep.h          |   2 +
 arch/powerpc/kernel/dawr.c                |  23 +-
 arch/powerpc/kernel/hw_breakpoint.c       | 646 ++++++++++++++++++----
 arch/powerpc/kernel/process.c             |  85 +--
 arch/powerpc/kernel/ptrace/ptrace-noadv.c |  72 ++-
 arch/powerpc/kernel/ptrace/ptrace32.c     |   4 +-
 arch/powerpc/kernel/signal.c              |  12 +-
 arch/powerpc/kvm/book3s_hv.c              |  12 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   |  18 +-
 arch/powerpc/xmon/xmon.c                  |  99 +++-
 kernel/events/hw_breakpoint.c             |  16 +
 16 files changed, 814 insertions(+), 227 deletions(-)

-- 
2.21.1

