Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8554F1C492B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 23:39:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GGTp0Yq4zDqWg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 07:39:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=rientjes@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KnjlfyKS; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GGR92fNxzDqVZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 07:37:24 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t16so316136plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 14:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=H5adPMRT8U6m0WDenVCh3aT5hmgtU4v7OZcwI4P6ZEM=;
 b=KnjlfyKScJvUJ7shJ7XF079YoEZGsha4sYhEALul+DCumi8SI2gEXSIDp1+DHfn6G+
 JJU1FTX/KOSrhilY9Xc5SYyPKl3GZSpNLNdYJohVprIV/UiBKUfmUXt9m0qAxs1gL5E3
 PNvD3J1txjN1/mL0HOqyZr0wJMf2W05NH7Bub6fREB0D0ToHvIxVARb9kETZcwHdsGkc
 FQFzf4UKIm5O+SMpMZTqp3tWlg419T+mBvJk6oxMqVeyji1ZVbQArMYQRhchCdUdWqyJ
 mKYWVqTiT2WZEP32VWW9xwxrSIrREvlHcsOkn6Tqq2LNYqIgvfzGVBR7wGX3H1AJOMp8
 lxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=H5adPMRT8U6m0WDenVCh3aT5hmgtU4v7OZcwI4P6ZEM=;
 b=GQnrsypYkzyswmpU5rUFa1l+YKtFG8/9wN7Wo0URur+sPz/bxTfrTppeK4TBmDQLEY
 yBl4est1hDulgIrAKG9rf07jwYQe+Kybbsr/BljXJ1+s0Rgvg+KGmr3wSkBqOqdR2ETt
 LrbpKEPNqKC2bM6HKsIItcA/1kOSQPcP5FZ8blyA+t1XgU5IQK8b6JR4iMd4AJihSCYx
 1BlPIMuJNXgUCfAp38pbIu3y9eXY4rHl9QkTHcmgoA0GYf4sJJNckwyM5p1fTyGpxh+w
 44FOfsWV+2wcF3PEdqV5a6ZvurBmCnsUkECHCPCJUjt78hMggZOPEb1MNr5C1JTBiWXQ
 eWkw==
X-Gm-Message-State: AGi0Pub5RA7P0nwCWMI9PwSqLDNQC8Te1QtbRoZEJlkFzVyjK+muGzAe
 Ozfx66R8rcWzTPdvMCISCtpyhQ==
X-Google-Smtp-Source: APiQypKPRIa0A/V3Fd5/Lnpn3+cGaKBHc2mWimLD813JkWf2GKs8k1yI6ajvs+mmO4rFofsC7yMeiQ==
X-Received: by 2002:a17:902:c3d3:: with SMTP id
 j19mr61083plj.340.1588628242060; 
 Mon, 04 May 2020 14:37:22 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id f76sm21697pfa.167.2020.05.04.14.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 14:37:21 -0700 (PDT)
Date: Mon, 4 May 2020 14:37:20 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Jonathan Adams <jwadams@google.com>
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
In-Reply-To: <20200504110344.17560-1-eesposit@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2005041429210.224786@chino.kir.corp.google.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1482994552-23947810-1588628241=:224786"
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1482994552-23947810-1588628241=:224786
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 4 May 2020, Emanuele Giuseppe Esposito wrote:

> There is currently no common way for Linux kernel subsystems to expose
> statistics to userspace shared throughout the Linux kernel; subsystems
> have to take care of gathering and displaying statistics by themselves,
> for example in the form of files in debugfs. For example KVM has its own
> code section that takes care of this in virt/kvm/kvm_main.c, where it sets
> up debugfs handlers for displaying values and aggregating them from
> various subfolders to obtain information about the system state (i.e.
> displaying the total number of exits, calculated by summing all exits of
> all cpus of all running virtual machines).
> 
> Allowing each section of the kernel to do so has two disadvantages. First,
> it will introduce redundant code. Second, debugfs is anyway not the right
> place for statistics (for example it is affected by lockdown)
> 
> In this patch series I introduce statsfs, a synthetic ram-based virtual
> filesystem that takes care of gathering and displaying statistics for the
> Linux kernel subsystems.
> 

This is exciting, we have been looking in the same area recently.  Adding 
Jonathan Adams <jwadams@google.com>.

In your diffstat, one thing I notice that is omitted: an update to 
Documentation/* :)  Any chance of getting some proposed Documentation/ 
updates with structure of the fs, the per subsystem breakdown, and best 
practices for managing the stats from the kernel level?

> The file system is mounted on /sys/kernel/stats and would be already used
> by kvm. Statsfs was initially introduced by Paolo Bonzini [1].
> 
> Statsfs offers a generic and stable API, allowing any kind of
> directory/file organization and supporting multiple kind of aggregations
> (not only sum, but also average, max, min and count_zero) and data types
> (all unsigned and signed types plus boolean). The implementation, which is
> a generalization of KVM’s debugfs statistics code, takes care of gathering
> and displaying information at run time; users only need to specify the
> values to be included in each source.
> 
> Statsfs would also be a different mountpoint from debugfs, and would not
> suffer from limited access due to the security lock down patches. Its main
> function is to display each statistics as a file in the desired folder
> hierarchy defined through the API. Statsfs files can be read, and possibly
> cleared if their file mode allows it.
> 
> Statsfs has two main components: the public API defined by
> include/linux/statsfs.h, and the virtual file system which should end up
> in /sys/kernel/stats.
> 
> The API has two main elements, values and sources. Kernel subsystems like
> KVM can use the API to create a source, add child
> sources/values/aggregates and register it to the root source (that on the
> virtual fs would be /sys/kernel/statsfs).
> 
> Sources are created via statsfs_source_create(), and each source becomes a
> directory in the file system. Sources form a parent-child relationship;
> root sources are added to the file system via statsfs_source_register().
> Every other source is added to or removed from a parent through the
> statsfs_source_add_subordinate and statsfs_source_remote_subordinate APIs.
> Once a source is created and added to the tree (via add_subordinate), it
> will be used to compute aggregate values in the parent source.
> 
> Values represent quantites that are gathered by the statsfs user. Examples
> of values include the number of vm exits of a given kind, the amount of
> memory used by some data structure, the length of the longest hash table
> chain, or anything like that. Values are defined with the
> statsfs_source_add_values function. Each value is defined by a struct
> statsfs_value; the same statsfs_value can be added to many different
> sources. A value can be considered "simple" if it fetches data from a
> user-provided location, or "aggregate" if it groups all values in the
> subordinates sources that include the same statsfs_value.
> 

This seems like it could have a lot of overhead if we wanted to 
periodically track the totality of subsystem stats as a form of telemetry 
gathering from userspace.  To collect telemetry for 1,000 different stats, 
do we need to issue lseek()+read() syscalls for each of them individually 
(or, worse, open()+read()+close())?

Any thoughts on how that can be optimized?  A couple of ideas:

 - an interface that allows gathering of all stats for a particular
   interface through a single file that would likely be encoded in binary
   and the responsibility of userspace to disseminate, or

 - an interface that extends beyond this proposal and allows the reader to
   specify which stats they are interested in collecting and then the
   kernel will only provide these stats in a well formed structure and 
   also be binary encoded.

We've found that the one-file-per-stat method is pretty much a show 
stopper from the performance view and we always must execute at least two 
syscalls to obtain a single stat.

Since this is becoming a generic API (good!!), maybe we can discuss 
possible ways to optimize gathering of stats in mass? 

> For more information, please consult the kerneldoc documentation in patch
> 2 and the sample uses in the kunit tests and in KVM.
> 
> This series of patches is based on my previous series "libfs: group and
> simplify linux fs code" and the single patch sent to kvm "kvm_host: unify
> VM_STAT and VCPU_STAT definitions in a single place". The former
> simplifies code duplicated in debugfs and tracefs (from which statsfs is
> based on), the latter groups all macros definition for statistics in kvm
> in a single common file shared by all architectures.
> 
> Patch 1 adds a new refcount and kref destructor wrappers that take a
> semaphore, as those are used later by statsfs. Patch 2 introduces the
> statsfs API, patch 3 provides extensive tests that can also be used as
> example on how to use the API and patch 4 adds the file system support.
> Finally, patch 5 provides a real-life example of statsfs usage in KVM.
> 
> [1] https://lore.kernel.org/kvm/5d6cdcb1-d8ad-7ae6-7351-3544e2fa366d@redhat.com/?fbclid=IwAR18LHJ0PBcXcDaLzILFhHsl3qpT3z2vlG60RnqgbpGYhDv7L43n0ZXJY8M
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> v1->v2 remove unnecessary list_foreach_safe loops, fix wrong indentation,
> change statsfs in stats_fs
> 
> Emanuele Giuseppe Esposito (5):
>   refcount, kref: add dec-and-test wrappers for rw_semaphores
>   stats_fs API: create, add and remove stats_fs sources and values
>   kunit: tests for stats_fs API
>   stats_fs fs: virtual fs to show stats to the end-user
>   kvm_main: replace debugfs with stats_fs
> 
>  MAINTAINERS                     |    7 +
>  arch/arm64/kvm/Kconfig          |    1 +
>  arch/arm64/kvm/guest.c          |    2 +-
>  arch/mips/kvm/Kconfig           |    1 +
>  arch/mips/kvm/mips.c            |    2 +-
>  arch/powerpc/kvm/Kconfig        |    1 +
>  arch/powerpc/kvm/book3s.c       |    6 +-
>  arch/powerpc/kvm/booke.c        |    8 +-
>  arch/s390/kvm/Kconfig           |    1 +
>  arch/s390/kvm/kvm-s390.c        |   16 +-
>  arch/x86/include/asm/kvm_host.h |    2 +-
>  arch/x86/kvm/Kconfig            |    1 +
>  arch/x86/kvm/Makefile           |    2 +-
>  arch/x86/kvm/debugfs.c          |   64 --
>  arch/x86/kvm/stats_fs.c         |   56 ++
>  arch/x86/kvm/x86.c              |    6 +-
>  fs/Kconfig                      |   12 +
>  fs/Makefile                     |    1 +
>  fs/stats_fs/Makefile            |    6 +
>  fs/stats_fs/inode.c             |  337 ++++++++++
>  fs/stats_fs/internal.h          |   35 +
>  fs/stats_fs/stats_fs-tests.c    | 1088 +++++++++++++++++++++++++++++++
>  fs/stats_fs/stats_fs.c          |  773 ++++++++++++++++++++++
>  include/linux/kref.h            |   11 +
>  include/linux/kvm_host.h        |   39 +-
>  include/linux/refcount.h        |    2 +
>  include/linux/stats_fs.h        |  304 +++++++++
>  include/uapi/linux/magic.h      |    1 +
>  lib/refcount.c                  |   32 +
>  tools/lib/api/fs/fs.c           |   21 +
>  virt/kvm/arm/arm.c              |    2 +-
>  virt/kvm/kvm_main.c             |  314 ++-------
>  32 files changed, 2772 insertions(+), 382 deletions(-)
>  delete mode 100644 arch/x86/kvm/debugfs.c
>  create mode 100644 arch/x86/kvm/stats_fs.c
>  create mode 100644 fs/stats_fs/Makefile
>  create mode 100644 fs/stats_fs/inode.c
>  create mode 100644 fs/stats_fs/internal.h
>  create mode 100644 fs/stats_fs/stats_fs-tests.c
>  create mode 100644 fs/stats_fs/stats_fs.c
>  create mode 100644 include/linux/stats_fs.h
> 
> -- 
> 2.25.2
> 
> 
--1482994552-23947810-1588628241=:224786--
