Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF051E20A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 13:07:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WWQB2v0SzDqCH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 21:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=I1fjp5Xg; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=g5ckhhR9; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WWKy1TBjzDqLD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 21:03:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590491025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YiHC1jSZ9odIhljl+OEk0Z9XTPo94KqwVQ3mMvdqhCY=;
 b=I1fjp5XgQW6FPaTls6PoNGs5V/mqK5DkHd2jHkW810kDdtPBYBylY+wB+LPqvzs565HYHR
 r4Be4nWecOeR8kjnxVzClG2ieZLrbdx0DgwgSZqp/U8gqKOrbmE+q5jLEmFct6lPKhrWTN
 e9WbXX/ovxy5eunR6qh1/eWk+RdQFWQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590491026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YiHC1jSZ9odIhljl+OEk0Z9XTPo94KqwVQ3mMvdqhCY=;
 b=g5ckhhR9Z+5mUvrsaEOOMiW0SetRBrtyZ1Bg/VCJJ5PKHGAl16OlAOFx2+T2KVAcGfkoVp
 pQ0ZTlCdxaccB1Tvs98MkdgjO5Q8dTwDymLzT6r/S/cZuc30vwp91IcmaTwQ3PfrAvaqHu
 1d5nRF5moJ0rAJnYfCHUe4lK4kJCrlY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-I4tRkAI1NqOHI9V66poeFQ-1; Tue, 26 May 2020 07:03:44 -0400
X-MC-Unique: I4tRkAI1NqOHI9V66poeFQ-1
Received: by mail-wr1-f70.google.com with SMTP id q24so4260065wra.14
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 04:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YiHC1jSZ9odIhljl+OEk0Z9XTPo94KqwVQ3mMvdqhCY=;
 b=FOCj2CgtOGxMHTHkaoT1RFG3uj3L9rf1n+MBb68wowBMu38vdTGw1azCrQDgvwt9EX
 wHQluHMw9pkjkcnEUc1kX2gIAkr4vil8OpTag8DafpR1qZtqry2YKLXzprmPqajs1tsQ
 mik5OTfc46loQXL/eaOHTkSx9Y9bq7gaCxtNWRcIQaKKH98RLv4y6cUrihJLh3QxE4fo
 hoxgCYz+uYyk8OKt8xfwM9OY88wusPAFRnnaPMa8tKnRN4iLej6M0u/PuOqBgFrxet5m
 iMMNVGQ8j/+yErLbfB7Hp15A1WzLCFE8aByQ5Bi+UVyQUabHahGFJz0aQrqQa0WDHQUC
 V5Mg==
X-Gm-Message-State: AOAM532KdmsCFleyk7r2JZwGY+DZnDzaD2C4pVB+IuzceF1O5pwN/68Y
 WfyR6IhWIoNbmJM0JWYq1OTEvgMOHmVgNcbG8jfxirIyemGxXFHnoMORS8nJDgNnvnI5OvN+o4z
 CP1nKaSzeiXUxp0JECyUjvEspQw==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr867246wml.108.1590491022744; 
 Tue, 26 May 2020 04:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+r1rjVk/6TMhaP3IgReV3uZsywmdIrm1MH7nDDpPZhbJkQGL0WqDauUTDI+FV3ViYCaqhZA==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr867213wml.108.1590491022381; 
 Tue, 26 May 2020 04:03:42 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.118])
 by smtp.gmail.com with ESMTPSA id d6sm22928240wrj.90.2020.05.26.04.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 04:03:31 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux kernel
 statistics
Date: Tue, 26 May 2020 13:03:10 +0200
Message-Id: <20200526110318.69006-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 linux-s390@vger.kernel.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is currently no common way for Linux kernel subsystems to expose
statistics to userspace shared throughout the Linux kernel; subsystems have
to take care of gathering and displaying statistics by themselves, for
example in the form of files in debugfs. For example KVM has its own code
section that takes care of this in virt/kvm/kvm_main.c, where it sets up
debugfs handlers for displaying values and aggregating them from various
subfolders to obtain information about the system state (i.e. displaying
the total number of exits, calculated by summing all exits of all cpus of
all running virtual machines).

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
(boolean, unsigned/signed and custom types). The implementation, which is
a generalization of KVM’s debugfs statistics code, takes care of gathering
and displaying information at run time; users only need to specify the
values to be included in each source.

Statsfs would also be a different mountpoint from debugfs, and would not
suffer from limited access due to the security lock down patches. Its main
function is to display each statistics as a file in the desired folder
hierarchy defined through the API. Statsfs files can be read, and possibly
cleared if their file mode allows it.

Statsfs has two main components: the public API defined by
include/linux/statsfs.h, and the virtual file system which should end up in
/sys/kernel/stats.

The API has two main elements, values and sources. Kernel subsystems like
KVM can use the API to create a source, add child sources/values/aggregates
and register it to the root source (that on the virtual fs would be
/sys/kernel/statsfs).

Sources are created via statsfs_source_create(), and each source becomes a
directory in the file system. Sources form a parent-child relationship;
root sources are added to the file system via statsfs_source_register().
Every other source is added to or removed from a parent through the
statsfs_source_add_subordinate and statsfs_source_remote_subordinate APIs.
Once a source is created and added to the tree (via add_subordinate), it
will be used to compute aggregate values in the parent source.
A source can optionally be hidden from the filesystem
but still considered in the aggregation operations if the corresponding
flag is set during initialization.

Values represent quantites that are gathered by the statsfs user. Examples
of values include the number of vm exits of a given kind, the amount of
memory used by some data structure, the length of the longest hash table
chain, or anything like that. Values are defined with the
statsfs_source_add_values function. Each value is defined by a struct
statsfs_value; the same statsfs_value can be added to many different
sources. A value can be considered "simple" if it fetches data from a
user-provided location, or "aggregate" if it groups all values in the
subordinates sources that include the same statsfs_value.
Each value has a stats_fs_type pointer in order to allow the user to
provide custom get and clear functions. The library, however, also
exports default stats_fs_type structs for the standard types
(all unsigned and signed types plus boolean).
A value can also provide a show function, that takes care
of displaying the value in a custom string format. This can be especially
useful when displaying enums.

For more information, please consult the kerneldoc documentation in patch 2
and the sample uses in the kunit tests, KVM and networking.

This series of patches is based on my previous series "libfs: group and
simplify linux fs code" and the single patch sent to kvm "kvm_host: unify
VM_STAT and VCPU_STAT definitions in a single place". The former simplifies
code duplicated in debugfs and tracefs (from which statsfs is based on),
the latter groups all macros definition for statistics in kvm in a single
common file shared by all architectures.

Patch 1 adds a new refcount and kref destructor wrappers that take a
semaphore, as those are used later by statsfs. Patch 2 introduces the
statsfs API, patch 3 provides extensive tests that can also be used as
example on how to use the API and patch 4 adds the file system support.
Finally, patch 5 provides a real-life example of statsfs usage in KVM,
with patch 6 providing a concrete example of the show function and
patch 7 another real-life example in the networking subsystem.

[1] https://lore.kernel.org/kvm/5d6cdcb1-d8ad-7ae6-7351-3544e2fa366d@redhat.com/?fbclid=IwAR18LHJ0PBcXcDaLzILFhHsl3qpT3z2vlG60RnqgbpGYhDv7L43n0ZXJY8M

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

v2 -> v3 move kconfig entry in the pseudo filesystem menu, add
documentation, get/clear function for value types, show function,
floating/cumulative and hidden flags. Also added the netstat
example

Emanuele Giuseppe Esposito (7):
  stats_fs API: create, add and remove stats_fs sources and values
  documentation for stats_fs
  kunit: tests for stats_fs API
  stats_fs fs: virtual fs to show stats to the end-user
  kvm_main: replace debugfs with stats_fs
  [not for merge] kvm: example of stats_fs_value show function
  [not for merge] netstats: example use of stats_fs API

 Documentation/filesystems/index.rst    |    1 +
 Documentation/filesystems/stats_fs.rst |  222 +++++
 MAINTAINERS                            |    7 +
 arch/arm64/kvm/Kconfig                 |    1 +
 arch/arm64/kvm/guest.c                 |    2 +-
 arch/mips/kvm/Kconfig                  |    1 +
 arch/mips/kvm/mips.c                   |    2 +-
 arch/powerpc/kvm/Kconfig               |    1 +
 arch/powerpc/kvm/book3s.c              |   12 +-
 arch/powerpc/kvm/booke.c               |    8 +-
 arch/s390/kvm/Kconfig                  |    1 +
 arch/s390/kvm/kvm-s390.c               |   16 +-
 arch/x86/include/asm/kvm_host.h        |    2 +-
 arch/x86/kvm/Kconfig                   |    1 +
 arch/x86/kvm/Makefile                  |    2 +-
 arch/x86/kvm/debugfs.c                 |   64 --
 arch/x86/kvm/stats_fs.c                |  114 +++
 arch/x86/kvm/x86.c                     |   11 +-
 fs/Kconfig                             |   20 +
 fs/Makefile                            |    1 +
 fs/stats_fs/Makefile                   |    7 +
 fs/stats_fs/inode.c                    |  461 ++++++++++
 fs/stats_fs/internal.h                 |   34 +
 fs/stats_fs/stats_fs-tests.c           | 1097 ++++++++++++++++++++++++
 fs/stats_fs/stats_fs.c                 |  642 ++++++++++++++
 fs/stats_fs/stub.c                     |   13 +
 include/linux/kvm_host.h               |   45 +-
 include/linux/netdevice.h              |    2 +
 include/linux/stats_fs.h               |  381 ++++++++
 include/uapi/linux/magic.h             |    1 +
 net/Kconfig                            |    1 +
 net/core/dev.c                         |   68 ++
 tools/lib/api/fs/fs.c                  |   21 +
 virt/kvm/arm/arm.c                     |    2 +-
 virt/kvm/kvm_main.c                    |  317 +------
 35 files changed, 3193 insertions(+), 388 deletions(-)
 create mode 100644 Documentation/filesystems/stats_fs.rst
 delete mode 100644 arch/x86/kvm/debugfs.c
 create mode 100644 arch/x86/kvm/stats_fs.c
 create mode 100644 fs/stats_fs/Makefile
 create mode 100644 fs/stats_fs/inode.c
 create mode 100644 fs/stats_fs/internal.h
 create mode 100644 fs/stats_fs/stats_fs-tests.c
 create mode 100644 fs/stats_fs/stats_fs.c
 create mode 100644 fs/stats_fs/stub.c
 create mode 100644 include/linux/stats_fs.h

-- 
2.25.4

