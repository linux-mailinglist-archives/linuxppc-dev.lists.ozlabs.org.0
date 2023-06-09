Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA891728CC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 03:01:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcjSz4cd8z3ffG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 11:01:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BDzc1aMR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3e3mczaykdkiawbjcqiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BDzc1aMR;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcjR56j4Rz3cB1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 10:59:44 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-561eb6c66f6so16449867b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 17:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686272379; x=1688864379;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0D7F9pDbG9FXqs6+iQJrvOEyVDkJYxW5kzmn8NxTXSM=;
        b=BDzc1aMRHWXMiLk4E+pANQvv85EBP8Fbmqip6g4XnCghOWEy+T3hHMA98y7gu3MrzJ
         m9ZUmOHYqjH9lz2cLAdIslB62deMkVm5FAytrF1l0ADpuk18V34OtWN8S0hJyOMsYZKG
         DZ3FeQwAgU/HrpcxXBWW2H8tt/UuIX4ypLlLVKfqSh3rXART4r4Tw/QKjnEtg7JS8CHS
         CWcIW0q6hoRoggptEjKDZYq373BjG6IuT0/lhqlLaPYC66B04C52gE09wIc5hlW88owA
         Gr5feq82Y0tlKosId/vUE/V228jTsXcOxUsj2CaGmnAfl6wsi8uq3/SNbii3CwrF5QN8
         PobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686272379; x=1688864379;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0D7F9pDbG9FXqs6+iQJrvOEyVDkJYxW5kzmn8NxTXSM=;
        b=QsqDIyRKBo3KKQfJQRMoguQx8npNVBq+AOO6pQq72UM92d+1364ArXyNjMPEGpQ8FC
         tqKg8EurSEiRuR9lDYLD+zG8Aky0gwr3gDhhuTjXO+R5m6JB5kaHSZMnM/zi7EIRbX9y
         YnuNpKhzJTHaqplfy9ThIk5GoaI+P7UDLrtvEA1bO2jiKLg0Bau94r9bf5hDQOBTDMbq
         Qsmar0BSRm2ARE9O2wLN1QFlCdXsbz3VeTE7+4774p4S03F/udPVm2KtE2053w/UzpA5
         290bmEtqP9NeELFIOewUfVVNK4zg0sU2o8xBnNBvZZeFlPmT98ZW8SEmw0g/z2D9ErTV
         itZw==
X-Gm-Message-State: AC+VfDyCi/BIeej9ToPIosflVh8SzpOXK2flkEqLBa+zhzOiNuFwfHBf
	gflENzTuPEm3emeCODLIL0gFK3NNQ2I=
X-Google-Smtp-Source: ACHHUZ4+oKNZvW2k4pUHaG+wjpqVYAXO5ZmY9/JryBcaWXlbxmXfyr05oUuxiW1jF2Vui38QPi/ByPbILxk=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:f582:c9e5:6c95:4461])
 (user=yuzhao job=sendgmr) by 2002:a81:ae60:0:b0:565:e712:422c with SMTP id
 g32-20020a81ae60000000b00565e712422cmr809562ywk.1.1686272379675; Thu, 08 Jun
 2023 17:59:39 -0700 (PDT)
Date: Thu,  8 Jun 2023 18:59:35 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230609005935.42390-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: kvm/arm64: Spark benchmark
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
Apache Spark spent 12% less time sorting four billion random integers twenty times (in ~4 hours) after this patchset [1].

Hardware
========
HOST $ lscpu
Architecture:           aarch64
  CPU op-mode(s):       32-bit, 64-bit
  Byte Order:           Little Endian
CPU(s):                 128
  On-line CPU(s) list:  0-127
Vendor ID:              ARM
  Model name:           Neoverse-N1
    Model:              1
    Thread(s) per core: 1
    Core(s) per socket: 64
    Socket(s):          2
    Stepping:           r3p1
    Frequency boost:    disabled
    CPU max MHz:        2800.0000
    CPU min MHz:        1000.0000
    BogoMIPS:           50.00
    Flags:              fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
Caches (sum of all):
  L1d:                  8 MiB (128 instances)
  L1i:                  8 MiB (128 instances)
  L2:                   128 MiB (128 instances)
NUMA:
  NUMA node(s):         2
  NUMA node0 CPU(s):    0-63
  NUMA node1 CPU(s):    64-127
Vulnerabilities:
  Itlb multihit:        Not affected
  L1tf:                 Not affected
  Mds:                  Not affected
  Meltdown:             Not affected
  Mmio stale data:      Not affected
  Retbleed:             Not affected
  Spec store bypass:    Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:           Mitigation; __user pointer sanitization
  Spectre v2:           Mitigation; CSV2, BHB
  Srbds:                Not affected
  Tsx async abort:      Not affected

HOST $ numactl -H
available: 2 nodes (0-1)
node 0 cpus: 0-63
node 0 size: 257730 MB
node 0 free: 1447 MB
node 1 cpus: 64-127
node 1 size: 256877 MB
node 1 free: 256093 MB
node distances:
node   0   1
  0:  10  20
  1:  20  10

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
Linux arm 6.4.0-rc4 #1 SMP Sat Jun  3 05:30:06 UTC 2023 aarch64 aarch64 aarch64 GNU/Linux

HOST $ cat /proc/swaps
Filename				Type		Size		Used		Priority
/dev/nvme0n1p2                          partition	466838356	116922112	-2

HOST $ cat /sys/kernel/mm/lru_gen/enabled
0x000b

HOST $ cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]

HOST $ cat /sys/kernel/mm/transparent_hugepage/defrag
always defer defer+madvise madvise [never]

HOST $ qemu-system-aarch64 --version
QEMU emulator version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.6)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

GUEST $ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.2 LTS"

GUEST $ java --version
openjdk 17.0.7 2023-04-18
OpenJDK Runtime Environment (build 17.0.7+7-Ubuntu-0ubuntu122.04.2)
OpenJDK 64-Bit Server VM (build 17.0.7+7-Ubuntu-0ubuntu122.04.2, mixed mode, sharing)

GUEST $ spark-shell --version
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.4.0
      /_/

Using Scala version 2.12.17, OpenJDK 64-Bit Server VM, 17.0.7
Branch HEAD
Compiled by user xinrong.meng on 2023-04-07T02:18:01Z
Revision 87a5442f7ed96b11051d8a9333476d080054e5a0
Url https://github.com/apache/spark
Type --help for more information.

Procedure
=========
HOST $ sudo numactl -N 0 -m 0 qemu-system-aarch64 \
    -M virt,accel=kvm -cpu host -smp 64 -m 300g -nographic -nic user \
    -bios /usr/share/qemu-efi-aarch64/QEMU_EFI.fd \
    -drive if=virtio,format=raw,file=/dev/nvme0n1p1

GUEST $ cat gen.scala
import java.io._
import scala.collection.mutable.ArrayBuffer

object GenData {
    def main(args: Array[String]): Unit = {
        val file = new File("/dev/shm/dataset.txt")
        val writer = new BufferedWriter(new FileWriter(file))
        val buf = ArrayBuffer(0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L)
        for(_ <- 0 until 400000000) {
            for (i <- 0 until 10) {
                buf.update(i, scala.util.Random.nextLong())
            }
            writer.write(s"${buf.mkString(",")}\n")
        }
        writer.close()
    }
}
GenData.main(Array())

GUEST $ cat sort.scala
import java.time.temporal.ChronoUnit
import org.apache.spark.sql.SparkSession

object SparkSort {
    def main(args: Array[String]): Unit = {
        val spark = SparkSession.builder().getOrCreate()
        val file = sc.textFile("/dev/shm/dataset.txt", 64)
        val results = file.flatMap(_.split(",")).map(x => (x, 1)).sortByKey().takeOrdered(10)
        results.foreach(println)
        spark.stop()
    }
}
SparkSort.main(Array())

GUEST $ cat run_spark.sh
export SPARK_LOCAL_DIRS=/dev/shm/

spark-shell <gen.scala

start=$SECONDS

for ((i=0; i<20; i++))
do
	spark-3.4.0-bin-hadoop3/bin/spark-shell --master "local[64]" --driver-memory 160g <sort.scala
done

echo "wall time: $((SECONDS - start))"

Results
=======
                       Before [1]    After    Change
----------------------------------------------------
Wall time (seconds)    14455         12865    -12%

Notes
=====
[1] "mm: rmap: Don't flush TLB after checking PTE young for page
    reference" was included so that the comparison is apples to
    Apples.
    https://lore.kernel.org/r/20220706112041.3831-1-21cnbao@gmail.com/
