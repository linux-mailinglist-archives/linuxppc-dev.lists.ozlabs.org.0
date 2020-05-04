Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9EA1C37BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 13:09:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0W42CDwzDqWZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 21:09:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GEbv5vv9; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=GEbv5vv9; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0NM1xPZzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 21:04:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O4DmrSc+xMbcVDzXV1cUbzCZGLWFfEMx6jA/j7MIbLE=;
 b=GEbv5vv9ocUXzwWV/aoguj8CLDoBpfhBRtaxRa6D1OIsQgOEEm9aLHX8dvyV2HZ1TWmYLn
 KTep2rnC8x4pItTvDtd1UCdk/G0h9H0XWCIQlx8QxqAaYeVXKWDStRHPk1T1rl0Jo6FeHZ
 Dcf2x5yDPVUtEnLDmoJw/hGSNNf7yUc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O4DmrSc+xMbcVDzXV1cUbzCZGLWFfEMx6jA/j7MIbLE=;
 b=GEbv5vv9ocUXzwWV/aoguj8CLDoBpfhBRtaxRa6D1OIsQgOEEm9aLHX8dvyV2HZ1TWmYLn
 KTep2rnC8x4pItTvDtd1UCdk/G0h9H0XWCIQlx8QxqAaYeVXKWDStRHPk1T1rl0Jo6FeHZ
 Dcf2x5yDPVUtEnLDmoJw/hGSNNf7yUc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-VsLVn3-7PzqSsSJ0JtsKGA-1; Mon, 04 May 2020 07:03:52 -0400
X-MC-Unique: VsLVn3-7PzqSsSJ0JtsKGA-1
Received: by mail-wr1-f72.google.com with SMTP id m5so10538366wru.15
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 04:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ICTWiD14DGnWtt5uuvQA1CMZKfEw+J2p/55HnpIvnTw=;
 b=lTSukI4W0b9VgZLsnJzSTjYtZDg0BCqfcfQmQKnqiLnHN4nzDlDCXDWJUVX+DUNAzg
 7hl6/beN7r4x9Zwk+WSC57cVkvY0HQ75qeDUGxZrCFVKHJQqy4RzOVsztTAMDoZ9s1LL
 ae4qljlZd0P/U3yEeEfkAvCH/swvej+BDeop1s7xyodHhzJGa/GrywpbSehlo02x+cGX
 pc1U33EIJdJQqkai2NAmvcCtDRhY9aOeJLygDVhm6lZmoyH2xZkVxmqtQ4WsvKhX9BEl
 /EKmXBf/kwPr9CTfrFdoAEF58HANMI3clx6vfYmcdE1Cw/FM4ThDruII2dejx0jV7aXR
 WEJw==
X-Gm-Message-State: AGi0PuYEhls4bqXPjPD7LQd95iwJDP6D8qrMH7qwR6sGkk20RdRbnOea
 qFBazCcWt6jnXoK1JbQIs5wG9ouccb1+ajpnLa2nCw1VUN/d0Sbzw9JIVUxvT++aeg9ZnnkPGba
 d2qP94JtegF8Zdrarh56afL4IpQ==
X-Received: by 2002:adf:a2d7:: with SMTP id t23mr4327204wra.402.1588590231209; 
 Mon, 04 May 2020 04:03:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypIx2aIz7stykmwXWJf7C80Kf95sM7YNOTZKj0BHeE5ekaM3LQpRAivT6MmqN7PrZv1JcZDMtA==
X-Received: by 2002:adf:a2d7:: with SMTP id t23mr4327156wra.402.1588590230858; 
 Mon, 04 May 2020 04:03:50 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.213])
 by smtp.gmail.com with ESMTPSA id a13sm10885750wrv.67.2020.05.04.04.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:03:50 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux kernel
 statistics
Date: Mon,  4 May 2020 13:03:39 +0200
Message-Id: <20200504110344.17560-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is currently no common way for Linux kernel subsystems to expose
statistics to userspace shared throughout the Linux kernel; subsystems
have to take care of gathering and displaying statistics by themselves,
for example in the form of files in debugfs. For example KVM has its own
code section that takes care of this in virt/kvm/kvm_main.c, where it sets
up debugfs handlers for displaying values and aggregating them from
various subfolders to obtain information about the system state (i.e.
displaying the total number of exits, calculated by summing all exits of
all cpus of all running virtual machines).

Allowing each section of the kernel to do so has two disadvantages. First,
it will introduce redundant code. Second, debugfs is anyway not the right
place for statistics (for example it is affected by lockdown)

In this patch series I introduce statsfs, a synthetic ram-based virtual
filesystem that takes care of gathering and displaying statistics for the
Linux kernel subsystems.

The file system is mounted on /sys/kernel/stats and would be already used
by kvm. Statsfs was initially introduced by Paolo Bonzini [1].

Statsfs offers a generic and stable API, allowing any kind of
directory/file organization and supporting multiple kind of aggregations
(not only sum, but also average, max, min and count_zero) and data types
(all unsigned and signed types plus boolean). The implementation, which is
a generalization of KVM=E2=80=99s debugfs statistics code, takes care of ga=
thering
and displaying information at run time; users only need to specify the
values to be included in each source.

Statsfs would also be a different mountpoint from debugfs, and would not
suffer from limited access due to the security lock down patches. Its main
function is to display each statistics as a file in the desired folder
hierarchy defined through the API. Statsfs files can be read, and possibly
cleared if their file mode allows it.

Statsfs has two main components: the public API defined by
include/linux/statsfs.h, and the virtual file system which should end up
in /sys/kernel/stats.

The API has two main elements, values and sources. Kernel subsystems like
KVM can use the API to create a source, add child
sources/values/aggregates and register it to the root source (that on the
virtual fs would be /sys/kernel/statsfs).

Sources are created via statsfs_source_create(), and each source becomes a
directory in the file system. Sources form a parent-child relationship;
root sources are added to the file system via statsfs_source_register().
Every other source is added to or removed from a parent through the
statsfs_source_add_subordinate and statsfs_source_remote_subordinate APIs.
Once a source is created and added to the tree (via add_subordinate), it
will be used to compute aggregate values in the parent source.

Values represent quantites that are gathered by the statsfs user. Examples
of values include the number of vm exits of a given kind, the amount of
memory used by some data structure, the length of the longest hash table
chain, or anything like that. Values are defined with the
statsfs_source_add_values function. Each value is defined by a struct
statsfs_value; the same statsfs_value can be added to many different
sources. A value can be considered "simple" if it fetches data from a
user-provided location, or "aggregate" if it groups all values in the
subordinates sources that include the same statsfs_value.

For more information, please consult the kerneldoc documentation in patch
2 and the sample uses in the kunit tests and in KVM.

This series of patches is based on my previous series "libfs: group and
simplify linux fs code" and the single patch sent to kvm "kvm_host: unify
VM_STAT and VCPU_STAT definitions in a single place". The former
simplifies code duplicated in debugfs and tracefs (from which statsfs is
based on), the latter groups all macros definition for statistics in kvm
in a single common file shared by all architectures.

Patch 1 adds a new refcount and kref destructor wrappers that take a
semaphore, as those are used later by statsfs. Patch 2 introduces the
statsfs API, patch 3 provides extensive tests that can also be used as
example on how to use the API and patch 4 adds the file system support.
Finally, patch 5 provides a real-life example of statsfs usage in KVM.

[1] https://lore.kernel.org/kvm/5d6cdcb1-d8ad-7ae6-7351-3544e2fa366d@redhat=
.com/?fbclid=3DIwAR18LHJ0PBcXcDaLzILFhHsl3qpT3z2vlG60RnqgbpGYhDv7L43n0ZXJY8=
M

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

v1->v2 remove unnecessary list_foreach_safe loops, fix wrong indentation,
change statsfs in stats_fs

Emanuele Giuseppe Esposito (5):
  refcount, kref: add dec-and-test wrappers for rw_semaphores
  stats_fs API: create, add and remove stats_fs sources and values
  kunit: tests for stats_fs API
  stats_fs fs: virtual fs to show stats to the end-user
  kvm_main: replace debugfs with stats_fs

 MAINTAINERS                     |    7 +
 arch/arm64/kvm/Kconfig          |    1 +
 arch/arm64/kvm/guest.c          |    2 +-
 arch/mips/kvm/Kconfig           |    1 +
 arch/mips/kvm/mips.c            |    2 +-
 arch/powerpc/kvm/Kconfig        |    1 +
 arch/powerpc/kvm/book3s.c       |    6 +-
 arch/powerpc/kvm/booke.c        |    8 +-
 arch/s390/kvm/Kconfig           |    1 +
 arch/s390/kvm/kvm-s390.c        |   16 +-
 arch/x86/include/asm/kvm_host.h |    2 +-
 arch/x86/kvm/Kconfig            |    1 +
 arch/x86/kvm/Makefile           |    2 +-
 arch/x86/kvm/debugfs.c          |   64 --
 arch/x86/kvm/stats_fs.c         |   56 ++
 arch/x86/kvm/x86.c              |    6 +-
 fs/Kconfig                      |   12 +
 fs/Makefile                     |    1 +
 fs/stats_fs/Makefile            |    6 +
 fs/stats_fs/inode.c             |  337 ++++++++++
 fs/stats_fs/internal.h          |   35 +
 fs/stats_fs/stats_fs-tests.c    | 1088 +++++++++++++++++++++++++++++++
 fs/stats_fs/stats_fs.c          |  773 ++++++++++++++++++++++
 include/linux/kref.h            |   11 +
 include/linux/kvm_host.h        |   39 +-
 include/linux/refcount.h        |    2 +
 include/linux/stats_fs.h        |  304 +++++++++
 include/uapi/linux/magic.h      |    1 +
 lib/refcount.c                  |   32 +
 tools/lib/api/fs/fs.c           |   21 +
 virt/kvm/arm/arm.c              |    2 +-
 virt/kvm/kvm_main.c             |  314 ++-------
 32 files changed, 2772 insertions(+), 382 deletions(-)
 delete mode 100644 arch/x86/kvm/debugfs.c
 create mode 100644 arch/x86/kvm/stats_fs.c
 create mode 100644 fs/stats_fs/Makefile
 create mode 100644 fs/stats_fs/inode.c
 create mode 100644 fs/stats_fs/internal.h
 create mode 100644 fs/stats_fs/stats_fs-tests.c
 create mode 100644 fs/stats_fs/stats_fs.c
 create mode 100644 include/linux/stats_fs.h

--=20
2.25.2

