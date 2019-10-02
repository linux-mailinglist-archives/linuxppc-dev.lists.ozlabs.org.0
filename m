Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C081AC47C1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:28:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jmRQ009jzDqVT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:28:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltP1ykpzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:09 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262Luv189477
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:07 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbsjtea9b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:06 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:02:59 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:56 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262txK44761190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A09E1A405B;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 150D9A4065;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5110EA00F3;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 00/15] powerpc/eeh: Synchronize access to struct eeh_pe
Date: Wed,  2 Oct 2019 16:02:38 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-4275-0000-0000-0000036D389C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-4276-0000-0000-0000388039FD
Message-Id: <cover.1569996166.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020057
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
Cc: oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Everyone,

It's currently possible to cause a kernel crash by being (un)lucky while adding
or removing PCI devices during EEH recovery.  The cause of the problem is that
there are trees of objects (struct eeh_pe, implemented with pointers and kernel
linked lists) that are manipulated concurrently by the PCI core and the EEH
recovery system, without synchronization.  Unsurprisingly this allows the
kernel to hit list poison values or free'd memory, and crash.

Here's a first draft of a way to address this, and I would welcome feedback at
this stage: Does it make sense? Is it simple enough? Is it maintainable? Are
there other options I should explore?  etc...

The design:

We have to consider that:
- eeh_dev_check_failure() can be called in any context, so the only methods
  that are safe to use there are a spinlock or atomics.
- Some recovery operations are blocking (and can take a long time), so they
  can't be protected by a spinlock. These operations are performed while
  traversing lists of PEs.

The simplest solution might initially seem to be to hold the pci_rescan_remove
lock during EEH recovery, but it seems to have some significant problems:
- It's a mutex, and can't be used in eeh_dev_check_failure().
- If there is a crash during recovery, either in the core kernel or a driver's
  call-back function, the lock would be held forever and that would block a lot
  of the PCI core.
- The EEH code is quite recursive and it's very difficult to work out where to
  take the lock without causing deadlocks. If there are bugs, they would likely
  be deadlocks.

So instead, this proposal uses a spinlock (eeh_pe_lock) to protect access to
the list-membership fields of eeh_pe in combination with reference counting for
blocking operations.  Because the spinlock is only protecting the list fields
(and no state), the lock only needs to be used over small sections that can be
inspected easily.

For blocking operations I'm using the standard kernel refcounting. It only
involves one extra field on each PE but it does require tweaks to maintain the
refcount in most functions that use PEs and sometimes that can be tricky.

The way the refcount is used is fairly standard: it starts at 1 and is
incremented for each pointer pointing to the PE. The initial value of 1
represents the 'existance' of the PE and it's membership in the 'tree' under
it's PHB, regardless of where in that tree it is, or if it has children. A PE
is removed from those lists before it's inital reference is dropped.

The interaction of the spinlock and refcounting provides this property: If the
spinlock is held and a ref is held on a PE then it is safe to start from that
PE and traverse anywhere along the list fields or parent pointers to other PEs
without taking references to them.  (To keep a reference to a PE for use
outside of the spinlock, a ref must be taken before the spinlock is released.)

That property can be used to perform blocking operations while traversing the
lists by 'sliding' the reference along, only holding the spinlock while moving
to the next iteration.  It seems to work well but is not perfect: when the lock
is released, the current PE may be removed and there isn't any simple, safe way
to continue the traversal. The situation can be detected, so there won't be a
crash, but traversal can be left incomplete. Perhaps this could be fixed by
using a temporary list of struct eeh_pe that is collected while holding the
spinlock (I've experimented with this, and it works but seems a bit
complicated), or perhaps we can just work around it where it matters.  It
hasn't happened at all during my testing. I'll look at it if this proposal goes
ahead.

For clarity, I have also kept the scope very tightly on the lists of struct
eeh_pe and the parent pointer. This patchset does not protect the list of
eeh_dev in each eeh_pe or the pdev member of struct eeh_dev, both of which are
also affected by races. I've left a few 'this is unsafe' comments in the code
in those areas.  I'll look more at it if this proposal goes ahead, I don't
think that they will be difficult compared to eeh_pe.

Lastly, I've included an "orphan tracking system" that I used during
development to verify that reference couting was acting as expected, but I have
no idea if it should be included in the final version.  It keeps track of PEs
that have been removed from the PHB tree, but not yet freed and makes that list
available in debugfs.  Any PEs that remain orphans for very long are going to
be the result of bugs.  It's extra risk because it itself could contain bugs,
but it could also be useful during debugging.

Cheers,
Sam.

Sam Bobroff (15):
  powerpc/eeh: Introduce refcounting for struct eeh_pe
  powerpc/eeh: Rename eeh_pe_get() to eeh_pe_find()
  powerpc/eeh: Track orphaned struct eeh_pe
  powerpc/eeh: Sync eeh_pe_next(), eeh_pe_find() and early-out
    traversals
  powerpc/eeh: Sync eeh_pe_get_parent()
  powerpc/eeh: Sync eeh_phb_pe_get()
  powerpc/eeh: Sync eeh_add_to_parent_pe() and eeh_rmv_from_parent_pe()
  powerpc/eeh: Sync eeh_handle_normal_event()
  powerpw/eeh: Sync eeh_handle_special_event(), pnv_eeh_get_pe(),
    pnv_eeh_next_error()
  powerpc/eeh: Sync eeh_phb_check_failure()
  powerpc/eeh: Sync eeh_dev_check_failure()
  powerpc/eeh: Sync eeh_pe_get_state()
  powerpc/eeh: Sync pnv_eeh_ei_write()
  powerpc/eeh: Sync eeh_force_recover_write()
  powerpc/eeh: Sync pcibios_set_pcie_reset_state()

 arch/powerpc/include/asm/eeh.h               |  20 +-
 arch/powerpc/kernel/eeh.c                    |  65 +++++-
 arch/powerpc/kernel/eeh_driver.c             |  23 +-
 arch/powerpc/kernel/eeh_pe.c                 | 230 ++++++++++++++++---
 arch/powerpc/platforms/powernv/eeh-powernv.c |  43 +++-
 5 files changed, 329 insertions(+), 52 deletions(-)

-- 
2.22.0.216.g00a2a96fc9

