Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EED728CC5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 03:02:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcjTw512Wz3fhj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 11:02:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2gQvv8El;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3gxmczaykdkggchpiwowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2gQvv8El;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcjR7573cz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 10:59:47 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-568a8704f6dso16185357b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 17:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686272385; x=1688864385;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddXgsJixIEMqGA5wc+jEsC/2PCjKU+k92CAoSHzENIQ=;
        b=2gQvv8Elto4XccdRwaHPDqIj9nLGBVTBNmb86njoPvqhsd0tjtN6HCelUzSemN7wyY
         71LauLyB1lnldzxzQTkfe6nQZecdjOxXtr/4StosXGI1CrlQDTJck4wzTXo8dKjjpnV4
         D20udOm2zFIzHEQ51hLEe5UarHwCpaC6lXinX2YwMS98bkU6dZgz2pBUAz+mzsFIorM8
         xdmbpgNfTyxvCAzBTy+SieKUu3Kw2LKLwSnetOswWodGDZgbdEkzkIsg0JKEhFrOZU8p
         T4WBKVoS8Yje74KiF7RZvIKnuSmaC0kPLDwvUqdU+Fm/Ozb38xa28j2ttI0hrtP0j54l
         z55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686272385; x=1688864385;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddXgsJixIEMqGA5wc+jEsC/2PCjKU+k92CAoSHzENIQ=;
        b=f7dlpU9EYYA7QNc88f/A61QdFuMmp/p0N75JRmH4i/z3lFeqW0BTQD7s7hb3BSnxV0
         OVx0uwtFVkTVyQSm+lKKXCTl6XYgoYweX4NTTLLXni+rZPptCpnlIcz7SObKIFHWe3t3
         WFnAafx2ESkU96ztDBq4RZblMItMVSENBiwfWSHPSeB518XnhxzJGRannNK/MeBQ6y1y
         bKm7eHXNV3ab7+vnm6Ac9M+dqW/WxOc4ajIR4kB59W/btdBL3V/VmItvfsdLGcRNrYta
         e5ekrq9l+rWPhqt3J7rYPuUHwxI7+Zj7osoSBgc6i6f6E3n32qOcekHFHoDm8nNuKADh
         oRug==
X-Gm-Message-State: AC+VfDxIjAItyfN5SfUKOVA4CqGBewA2rutYU6ScEuw13A72QlMCYrfu
	LTA5ZyGC1yTyn82a+wqqWqmoM0iSAvE=
X-Google-Smtp-Source: ACHHUZ48Ctq25/jOWo2nOrUYiTkPu+9cUUGT9KZFEWhgs36Jat11A7iC8UGGnM5T4c2tHVmOSHQ7ebLSwlw=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:f582:c9e5:6c95:4461])
 (user=yuzhao job=sendgmr) by 2002:a05:690c:702:b0:565:ebd4:304d with SMTP id
 bs2-20020a05690c070200b00565ebd4304dmr731769ywb.4.1686272385574; Thu, 08 Jun
 2023 17:59:45 -0700 (PDT)
Date: Thu,  8 Jun 2023 18:59:43 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230609005943.43041-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: kvm/x86: multichase benchmark
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
Multichase in 64 microVMs achieved 6% more total samples (in ~4 hours) after this patchset [1].

Hardware
========
HOST $ lscpu
Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         43 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  128
  On-line CPU(s) list:   0-127
Vendor ID:               AuthenticAMD
  Model name:            AMD Ryzen Threadripper PRO 3995WX 64-Cores
    CPU family:          23
    Model:               49
    Thread(s) per core:  2
    Core(s) per socket:  64
    Socket(s):           1
    Stepping:            0
    Frequency boost:     disabled
    CPU max MHz:         4308.3979
    CPU min MHz:         2200.0000
    BogoMIPS:            5390.20
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2
                         ...
Virtualization features:
  Virtualization:        AMD-V
Caches (sum of all):
  L1d:                   2 MiB (64 instances)
  L1i:                   2 MiB (64 instances)
  L2:                    32 MiB (64 instances)
  L3:                    256 MiB (16 instances)
NUMA:
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-127
Vulnerabilities:
  Itlb multihit:         Not affected
  L1tf:                  Not affected
  Mds:                   Not affected
  Meltdown:              Not affected
  Mmio stale data:       Not affected
  Retbleed:              Mitigation; untrained return thunk; SMT enabled with STIBP protection
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:            Mitigation; Retpolines, IBPB conditional, STIBP always-on, RSB filling, PBRSB-eIBRS Not affected
  Srbds:                 Not affected
  Tsx async abort:       Not affected

HOST $ numactl -H
available: 1 nodes (0)
node 0 cpus: 0-127
node 0 size: 257542 MB
node 0 free: 224855 MB
node distances:
node   0
  0:  10

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
DISTRIB_DESCRIPTION="Ubuntu 22.04.1 LTS"

HOST $ uname -a
Linux x86 6.4.0-rc5+ #1 SMP PREEMPT_DYNAMIC Wed Jun  7 22:17:47 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

HOST $ cat /proc/swaps
Filename          Type         Size         Used    Priority
/dev/nvme0n1p2    partition    466838356    0       -2

HOST $ cat /sys/kernel/mm/lru_gen/enabled
0x000f

HOST $ cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]

HOST $ cat /sys/kernel/mm/transparent_hugepage/defrag
always defer defer+madvise madvise [never]

Procedure
=========
HOST $ git clone https://github.com/google/multichase

HOST $ <Build multichase>
HOST $ <Unpack /boot/initrd.img into ./initrd/>

HOST $ cp multichase/multichase ./initrd/bin/
HOST $ sed -i \
    "/^maybe_break top$/i multichase -t 2 -m 4g -n 28800; poweroff" \
    ./initrd/init

HOST $ <Pack ./initrd/ into ./initrd.img>

HOST $ cat run_microvms.sh
memcgs=64

run() {
    path=/sys/fs/cgroup/memcg$1

    mkdir $path
    echo $BASHPID >$path/cgroup.procs

    qemu-system-x86_64 -M microvm,accel=kvm -cpu host -smp 2 -m 6g \
        -nographic -kernel /boot/vmlinuz -initrd ./initrd.img \
        -append "console=ttyS0 loglevel=0"
}

for ((memcg = 0; memcg < $memcgs; memcg++)); do
    run $memcg &
done

wait

Results
=======
                 Before [1]    After    Change
----------------------------------------------
Total samples    6824          7237     +6%

Notes
=====
[1] "mm: rmap: Don't flush TLB after checking PTE young for page
    reference" was included so that the comparison is apples to
    Apples.
    https://lore.kernel.org/r/20220706112041.3831-1-21cnbao@gmail.com/
