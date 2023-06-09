Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04439728CBE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 03:00:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcjS25t2Wz3f16
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 11:00:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=FMN3dhDu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3fnmczaykdkudzemftlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=FMN3dhDu;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcjR56RZdz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 10:59:45 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ba87bd29e9dso1724483276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 17:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686272383; x=1688864383;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfRq4neZrPjb9Lck7talXrCmxVTayuyWN8AeTYnUB40=;
        b=FMN3dhDuy89W3YL34iGrOcxlPjg1bzMkLLXo1TdyO66RGSvbHlps7gdvHr44ss3LGk
         MR0VFD1DRCFTNC9tyqK5ReMEOiPx2JNiCbTUTyUv9FMGeK9nCNoAU6WnXWYbBC+Dw27V
         niwud/7XN7pCGjqFT4B3VS+EBw+uLus4pO0EQ6k6SszjrU1zFcD9yQh/qzHLrmZknfvX
         XuK4cXbAzi1gsEYKdbrLfMfylLB6JTl2vYXAwWR55yMmpFjT1Lojk1XODC7sstmSmHo4
         uXWebCC18fjzj/uapeQiZlzXqVxfdSytOTcShko5dqCAeC6bbLhPv2RLA/d/FJo+pzzy
         govw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686272383; x=1688864383;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kfRq4neZrPjb9Lck7talXrCmxVTayuyWN8AeTYnUB40=;
        b=VLg1lmMcwKgsmWKTUA9t4CfBcMLywIv3wR91E0yA4exRX/PuzJf17tBE4n0ls6HgZf
         excs28RgvOeOmNRC8wd59tzcBpQmTitlZsBDmXGI8kovGIlZxi46K5VM4M/+XAWOthhs
         hMnIy6VyqWoXUos3PNGSPS0kcRkmZXZ1IZ3Ab86QrEcDwPrpM1ZoXwkOkWsQCClYXZOc
         lFcON8YsjBg8rL9jf3msDd5jzEYEi1QIIU0mpJ7xu9dBMXCGoEjseeo+eQbsWwAqyWb2
         sQP4iVvlYYFq9Ug9MOCKyJ2DgB5Y5gYWtNYnuk1llyBqe26/yppQLDkrF6lH7s/RV5P5
         Zx+Q==
X-Gm-Message-State: AC+VfDxPVdv235qEebW4YYNpbVTgUygzyhdGLtY8FbS0xqjWAsCRaSKy
	uOG5Qs1IpMwuGtMki1ulewgadzrlJBA=
X-Google-Smtp-Source: ACHHUZ6QOfrw0l3bdpvvlmXUNnamszuXXqEgiHjhlXZ1bthx0t+lBEyPW/rr7RnEuOk5SiS3J1yRldpoYHg=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:f582:c9e5:6c95:4461])
 (user=yuzhao job=sendgmr) by 2002:a5b:784:0:b0:bad:99d:f087 with SMTP id
 b4-20020a5b0784000000b00bad099df087mr697256ybq.6.1686272382836; Thu, 08 Jun
 2023 17:59:42 -0700 (PDT)
Date: Thu,  8 Jun 2023 18:59:39 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230609005940.42722-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: kvm/powerpc: memcached benchmark
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TLDR
====
Memcached achieved 10% more operations per second (in ~4 hours) after this patchset [1].

Hardware
========
HOST $ lscpu
Architecture:          ppc64le
  Byte Order:          Little Endian
CPU(s):                184
  On-line CPU(s) list: 0-183
Model name:            POWER9 (raw), altivec supported
  Model:               2.2 (pvr 004e 1202)
  Thread(s) per core:  4
  Core(s) per socket:  23
  Socket(s):           2
  CPU max MHz:         3000.0000
  CPU min MHz:         2300.0000
Caches (sum of all):
  L1d:                 1.4 MiB (46 instances)
  L1i:                 1.4 MiB (46 instances)
  L2:                  12 MiB (24 instances)
  L3:                  240 MiB (24 instances)
NUMA:
  NUMA node(s):        2
  NUMA node0 CPU(s):   0-91
  NUMA node1 CPU(s):   92-183
Vulnerabilities:
  Itlb multihit:       Not affected
  L1tf:                Mitigation; RFI Flush, L1D private per thread
  Mds:                 Not affected
  Meltdown:            Mitigation; RFI Flush, L1D private per thread
  Mmio stale data:     Not affected
  Retbleed:            Not affected
  Spec store bypass:   Mitigation; Kernel entry/exit barrier (eieio)
  Spectre v1:          Mitigation; __user pointer sanitization, ori31 speculation barrier enabled
  Spectre v2:          Mitigation; Indirect branch serialisation (kernel only), Indirect branch cache disabled, Software link stack flush
  Srbds:               Not affected
  Tsx async abort:     Not affected

HOST $ numactl -H
available: 2 nodes (0-1)
node 0 cpus: 0-91
node 0 size: 261659 MB
node 0 free: 259152 MB
node 1 cpus: 92-183
node 1 size: 261713 MB
node 1 free: 261076 MB
node distances:
node   0   1
  0:  10  40
  1:  40  10

HOST $ cat /sys/class/nvme/nvme0/model
INTEL SSDPF21Q800GB

HOST $ cat /sys/class/nvme/nvme0/numa_node
0

Software
========
HOST $ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04 LTS"

HOST $ uname -a
Linux ppc 6.3.0 #1 SMP Sun Jun  4 18:26:37 UTC 2023 ppc64le ppc64le ppc64le GNU/Linux

HOST $ cat /proc/swaps
Filename          Type         Size         Used    Priority
/dev/nvme0n1p2    partition	    466838272    0       -2

HOST $ cat /sys/kernel/mm/lru_gen/enabled
0x0009

HOST $ cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]

HOST $ cat /sys/kernel/mm/transparent_hugepage/defrag
always defer defer+madvise madvise [never]

HOST $ qemu-system-ppc64 --version
QEMU emulator version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.6)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

GUEST $ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.1 LTS"

GUEST $ cat /etc/memcached.conf
...
-t 92
-m 262144
-B binary
-s /var/run/memcached/memcached.sock
-a 0766

GUEST $ memtier_benchmark -v
memtier_benchmark 1.4.0
Copyright (C) 2011-2022 Redis Ltd.
This is free software.  You may redistribute copies of it under the terms of
the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
There is NO WARRANTY, to the extent permitted by law.

Procedure
=========
HOST $ sudo numactl -N 0 -m 0 qemu-system-ppc64 \
    -M pseries,accel=kvm,kvm-type=HV -cpu host -smp 92 -m 270g
    -nographic -nic user \
    -drive if=virtio,format=raw,file=/dev/nvme0n1p1

GUEST $ memtier_benchmark -S /var/run/memcached/memcached.sock \
    -P memcache_binary -c 1 -t 92 --pipeline 1 --ratio 1:0 \
    --key-minimum=1 --key-maximum=120000000 --key-pattern=P:P \
    -n allkeys -d 2000

GUEST $ memtier_benchmark -S /var/run/memcached/memcached.sock \
    -P memcache_binary -c 1 -t 92 --pipeline 1 --ratio 0:1 \
    --key-minimum=1 --key-maximum=120000000 --key-pattern=R:R \
    -n allkeys --randomize --distinct-client-seed

Results
=======
                Before [1]    After        Change
-------------------------------------------------
Ops/sec         721586.10     800210.12    +10%
Avg. Latency    0.12546       0.11260      -10%
p50 Latency     0.08700       0.08700      N/C
p99 Latency     0.28700       0.24700      -13%

Notes
=====
[1] "mm: rmap: Don't flush TLB after checking PTE young for page
    reference" was included so that the comparison is apples to
    Apples.
    https://lore.kernel.org/r/20220706112041.3831-1-21cnbao@gmail.com/
