Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71E1AE566
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 21:03:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493lqk1zjDzDrPj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 05:03:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=PCK2CWPB; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493lcD5NkGzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 04:53:48 +1000 (AEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HIqHgt124145;
 Fri, 17 Apr 2020 18:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=gYVwjW9uIr3S+PxyOOpBOdl7Nnodqy4JmhYGCNmfQWM=;
 b=PCK2CWPBOxDZpbIRlSU/o+jYUMdyVvyKxjAMbW+oUxjYTSaHIambzyU7BFyZHbzeF4L9
 jaKxiLm80n8l4nnHnZPGPepMUpf+V4l11YuMmLQTgL/OLSY2Mz2vAHKWucWhtfR0llkY
 l6FnrY9EjQzQknGNZpicgor/igM+VAitMhMbeYS+Ljh1G29ma/aYl84zvZNDQqNvFV1T
 I0DqNzDqA385q7pXjl+nwBs8ea8SGWdQYBnLwrPWWfNbrGTBulSYfDmkAUXiA0aLipGE
 aN2SOyDIr6aERMsWJLNV0utldXu2OdLE9KOASoTm/CY2HsDa4VHth5atxrHeASpUqunP xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 30e0aae8rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 18:53:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03HIcJ0Z118535;
 Fri, 17 Apr 2020 18:51:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 30dn9ks84n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 18:51:10 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03HIotrG025242;
 Fri, 17 Apr 2020 18:50:55 GMT
Received: from monkey.oracle.com (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 17 Apr 2020 11:50:55 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 0/4] Clean up hugetlb boot command line processing
Date: Fri, 17 Apr 2020 11:50:45 -0700
Message-Id: <20200417185049.275845-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9594
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004170142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9594
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170142
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Longpeng <longpeng2@huawei.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v3 -
   Used weak attribute method of defining arch_hugetlb_valid_size.
     This eliminates changes to arch specific hugetlb.h files (Peter)
   Updated documentation (Peter, Randy)
   Fixed handling of implicitly specified gigantic page preallocation
     in existing code and removed documentation of such.  There is now
     no difference between handling of gigantic and non-gigantic pages.
     (Peter, Nitesh).
     This requires the most review as there is a small change to
     undocumented behavior.  See patch 4 commit message for details.
   Added Acks and Reviews (Mina, Peter)

v2 -
   Fix build errors with patch 1 (Will)
   Change arch_hugetlb_valid_size arg to unsigned long and remove
     irrelevant 'extern' keyword (Christophe)
   Documentation and other misc changes (Randy, Christophe, Mina)
   Do not process command line options if !hugepages_supported()
     (Dave, but it sounds like we may want to additional changes to
      hugepages_supported() for x86?  If that is needed I would prefer
      a separate patch.)

Longpeng(Mike) reported a weird message from hugetlb command line processing
and proposed a solution [1].  While the proposed patch does address the
specific issue, there are other related issues in command line processing.
As hugetlbfs evolved, updates to command line processing have been made to
meet immediate needs and not necessarily in a coordinated manner.  The result
is that some processing is done in arch specific code, some is done in arch
independent code and coordination is problematic.  Semantics can vary between
architectures.

The patch series does the following:
- Define arch specific arch_hugetlb_valid_size routine used to validate
  passed huge page sizes.
- Move hugepagesz= command line parsing out of arch specific code and into
  an arch independent routine.
- Clean up command line processing to follow desired semantics and
  document those semantics.

[1] https://lore.kernel.org/linux-mm/20200305033014.1152-1-longpeng2@huawei.com

Mike Kravetz (4):
  hugetlbfs: add arch_hugetlb_valid_size
  hugetlbfs: move hugepagesz= parsing to arch independent code
  hugetlbfs: remove hugetlb_add_hstate() warning for existing hstate
  hugetlbfs: clean up command line processing

 .../admin-guide/kernel-parameters.txt         |  40 ++--
 Documentation/admin-guide/mm/hugetlbpage.rst  |  35 ++++
 arch/arm64/mm/hugetlbpage.c                   |  30 +--
 arch/powerpc/mm/hugetlbpage.c                 |  30 +--
 arch/riscv/mm/hugetlbpage.c                   |  24 +--
 arch/s390/mm/hugetlbpage.c                    |  24 +--
 arch/sparc/mm/init_64.c                       |  43 +---
 arch/x86/mm/hugetlbpage.c                     |  23 +--
 include/linux/hugetlb.h                       |   2 +-
 mm/hugetlb.c                                  | 190 +++++++++++++++---
 10 files changed, 271 insertions(+), 170 deletions(-)

-- 
2.25.2

