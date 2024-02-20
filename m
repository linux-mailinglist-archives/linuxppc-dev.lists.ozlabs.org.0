Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA6C85CAB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:26:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=TCM9V8XE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfYt24Dv9z3vYV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 09:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=TCM9V8XE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.148.104; helo=mx0a-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfXvY6CT1z2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 08:43:03 +1100 (AEDT)
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KJDXCa003915;
	Tue, 20 Feb 2024 20:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	from:to:cc:subject:date:message-id; s=DKIM202306; bh=apTduRvBWpk
	BsoALNYmwCiUzyclrqb5Qqfle8axRCBQ=; b=TCM9V8XExFWvbGVqBcf32wkNxb+
	BrfAh7wITVBSxO18Poqt5IgDbcjXMCl/VaVDbZwOEwbvOj7EeUlK1f/xMJAq6Sdc
	U8QWrc+4tRL0xT+xN/vq8GeuVulsDE7m4je2OFTbm2gRlF/OPCrOB74ewg75HmSq
	KStzACWZEXUh7ExFSOYMLkmXAzp0vHx6eSCSNPVrTlGhW9oCqqspLFSNQARFJ3MJ
	b/ucayKYZxdIAU6650Bjwzwsehfvo+FtpOaVoAzEMD8elDEbBgTzG2f0TlICEgen
	HJ/O8kdJxYrtUK9S/mJWn97aDSgo4e3PxZM/wYKwKpMNdV1HTjda54mLMvQ==
Received: from ilclpfpp01.lenovo.com ([144.188.128.67])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 3wd21w05e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 20:33:15 +0000 (GMT)
Received: from ilclmmrp01.lenovo.com (ilclmmrp01.mot.com [100.65.83.165])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ilclpfpp01.lenovo.com (Postfix) with ESMTPS id 4TfWLy1rvZzdDsy;
	Tue, 20 Feb 2024 20:33:14 +0000 (UTC)
Received: from ilclasset01.mot.com (ilclasset01.mot.com [100.64.7.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp01.lenovo.com (Postfix) with ESMTPSA id 4TfWLy0zLHz3n3fr;
	Tue, 20 Feb 2024 20:33:14 +0000 (UTC)
From: Maxwell Bland <mbland@motorola.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] arm64: mm: support dynamic vmalloc/pmd configuration
Date: Tue, 20 Feb 2024 14:32:52 -0600
Message-Id: <20240220203256.31153-1-mbland@motorola.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: doXRsqZ8zYPmc1DRvfdxdFLT0EPlBuO3
X-Proofpoint-ORIG-GUID: doXRsqZ8zYPmc1DRvfdxdFLT0EPlBuO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=509 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402200146
X-Mailman-Approved-At: Wed, 21 Feb 2024 09:21:41 +1100
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
Cc: mark.rutland@arm.com, linux-efi@vger.kernel.org, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ast@kernel.org, linux@armlinux.org.uk, linux-mm@kvack.org, ryabinin.a.a@gmail.com, glider@google.com, kasan-dev@googlegroups.com, yonghong.song@linux.dev, wuqiang.matt@bytedance.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, will@kernel.org, ardb@kernel.org, michael.christie@oracle.com, quic_nprakash@quicinc.com, linux-arch@vger.kernel.org, hch@infradead.org, gor@linux.ibm.com, daniel@iogearbox.net, mst@redhat.com, john.fastabend@gmail.com, andrii@kernel.org, aneesh.kumar@kernel.org, urezki@gmail.com, samitolvanen@google.com, zlim.lnx@gmail.com, naveen.n.rao@linux.ibm.com, dennis@kernel.org, borntraeger@linux.ibm.com, cl@linux.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, arnd@arndb.de, linux-s390@vger.kernel.org, hca@linux.ibm.com, mbland@motorola.com, npiggin@gmail.com, kpsingh@kernel.org, meted@linux.ibm.com, quic_pkondeti@quicinc.com, paul.walm
 sley@sifive.com, surenb@google.com, akpm@linux-foundation.org, dvyukov@google.com, andreyknvl@gmail.com, haoluo@google.com, brauner@kernel.org, mjguzik@gmail.com, lstoakes@gmail.com, song@kernel.org, gregkh@linuxfoundation.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org, awheeler@motorola.com, martin.lau@linux.dev, linux-riscv@lists.infradead.org, palmer@dabbelt.com, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, guoren@kernel.org, bpf@vger.kernel.org, rick.p.edgecombe@intel.com, linuxppc-dev@lists.ozlabs.org, sdf@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reworks ARM's virtual memory allocation infrastructure to support
dynamic enforcement of page middle directory PXNTable restrictions
rather than only during the initial memory mapping. Runtime enforcement
of this bit prevents write-then-execute attacks, where malicious code is
staged in vmalloc'd data regions, and later the page table is changed to
make this code executable.

Previously the entire region from VMALLOC_START to VMALLOC_END was
vulnerable, but now the vulnerable region is restricted to the 2GB
reserved by module_alloc, a region which is generally read-only and more
difficult to inject staging code into, e.g., data must pass the BPF
verifier. These changes also set the stage for other systems, such as
KVM-level (EL2) changes to mark page tables immutable and code page
verification changes, forging a path toward complete mitigation of
kernel exploits on ARM.

Implementing this required minimal changes to the generic vmalloc
interface in the kernel to allow architecture overrides of some vmalloc
wrapper functions, refactoring vmalloc calls to use a standard interface
in the generic kernel, and passing the address parameter already passed
into PTE allocation to the pte_allocate child function call.

The new arm64 vmalloc wrapper functions ensure vmalloc data is not
allocated into the region reserved for module_alloc. arm64 BPF and
kprobe code also see a two-line-change ensuring their allocations abide
by the segmentation of code from data. Finally, arm64's pmd_populate
function is modified to set the PXNTable bit appropriately.

Signed-off-by: Maxwell Bland <mbland@motorola.com>

---

After Mark Rutland's feedback last week on my more minimal patch, see

<CAP5Mv+ydhk=Ob4b40ZahGMgT-5+-VEHxtmA=-LkJiEOOU+K6hw@mail.gmail.com>

I adopted a more sweeping and more correct overhaul of ARM's virtual
memory allocation infrastructure to support these changes. This patch
guarantees our ability to write future systems with a strong and
accessible distinction between code and data at the page allocation
layer, bolstering the guarantees of complementary contributions, i.e.
W^X and kCFI.

The current patch minimally reduces available vmalloc space, removing
the 2GB that should be reserved for code allocations regardless, and I
feel really benefits the kernel by making several memory allocation
interfaces more uniform, and providing hooks for non-ARM architectures
to follow suit.

I have done some minimal runtime testing using Torvald's test-tlb script
on a QEMU VM, but maybe more extensive benchmarking is needed?

Size: Before Patch -> After Patch
4k: 4.09ns  4.15ns  4.41ns  4.43ns -> 3.68ns  3.73ns  3.67ns  3.73ns 
8k: 4.22ns  4.19ns  4.30ns  4.15ns -> 3.99ns  3.89ns  4.12ns  4.04ns 
16k: 3.97ns  4.31ns  4.30ns  4.28ns -> 4.03ns  3.98ns  4.06ns  4.06ns 
32k: 3.82ns  4.51ns  4.25ns  4.31ns -> 3.99ns  4.09ns  4.07ns  5.17ns 
64k: 4.50ns  5.59ns  6.13ns  6.14ns -> 4.23ns  4.26ns  5.91ns  5.93ns 
128k: 5.06ns  4.47ns  6.75ns  6.69ns -> 4.47ns  4.71ns  6.54ns  6.44ns 
256k: 4.83ns  4.43ns  6.62ns  6.21ns -> 4.39ns  4.62ns  6.71ns  6.65ns 
512k: 4.45ns  4.75ns  6.19ns  6.65ns -> 4.86ns  5.26ns  7.77ns  6.68ns 
1M: 4.72ns  4.73ns  6.74ns  6.47ns -> 4.29ns  4.45ns  6.87ns  6.59ns 
2M: 4.66ns  4.86ns  14.49ns  15.00ns -> 4.53ns  4.57ns  15.91ns  15.90ns 
4M: 4.85ns  4.95ns  15.90ns  15.98ns -> 4.48ns  4.74ns  17.27ns  17.36ns 
6M: 4.94ns  5.03ns  17.19ns  17.31ns -> 4.70ns  4.93ns  18.02ns  18.23ns 
8M: 5.05ns  5.18ns  17.49ns  17.64ns -> 4.96ns  5.07ns  18.84ns  18.72ns 
16M: 5.55ns  5.79ns  20.99ns  23.70ns -> 5.46ns  5.72ns  22.76ns  26.51ns
32M: 8.54ns  9.06ns  124.61ns 125.07ns -> 8.43ns  8.59ns  116.83ns 138.83ns
64M: 8.42ns  8.63ns  196.17ns 204.52ns -> 8.26ns  8.43ns  193.49ns 203.85ns
128M: 8.31ns  8.58ns  230.46ns 242.63ns -> 8.22ns  8.39ns  227.99ns 240.29ns
256M: 8.80ns  8.80ns  248.24ns 261.68ns -> 8.35ns  8.55ns  250.18ns 262.20ns

Note I also chose to enforce PXNTable at the PMD layer only (for now),
since the 194 descriptors which are affected by this change on my
testing setup are not sufficient to warrant enforcement at a coarser
granularity.

The architecture-independent changes (I term "generic") can be
classified only as refactoring, but I feel are also major improvements
in that they standardize most uses of the vmalloc interface across the
kernel.

Note this patch reduces the arm64 allocated region for BPF and kprobes,
but only to match with the existing allocation choices made by the
generic kernel. I will admit I do not understand why BPF JIT allocation
code was duplicated into arm64, but I also feel that this was either an
artifact or that these overrides for generic allocation should require a
specific KConfig as they trade off between security and space. That
said, I have chosen not to wrap this patch in a KConfig interface, as I
feel the changes provide significant benefit to the arm64 kernel's
baseline security, though a KConfig could certainly be added if the
maintainers see the need.

Maxwell Bland (4):
  mm/vmalloc: allow arch-specific vmalloc_node overrides
  mm: pgalloc: support address-conditional pmd allocation
  arm64: separate code and data virtual memory allocation
  arm64: dynamic enforcement of pmd-level PXNTable

 arch/arm/kernel/irq.c               |  2 +-
 arch/arm64/include/asm/pgalloc.h    | 11 +++++-
 arch/arm64/include/asm/vmalloc.h    |  8 ++++
 arch/arm64/include/asm/vmap_stack.h |  2 +-
 arch/arm64/kernel/efi.c             |  2 +-
 arch/arm64/kernel/module.c          |  7 ++++
 arch/arm64/kernel/probes/kprobes.c  |  2 +-
 arch/arm64/mm/Makefile              |  3 +-
 arch/arm64/mm/trans_pgd.c           |  2 +-
 arch/arm64/mm/vmalloc.c             | 57 +++++++++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c       |  5 ++-
 arch/powerpc/kernel/irq.c           |  2 +-
 arch/riscv/include/asm/irq_stack.h  |  2 +-
 arch/s390/hypfs/hypfs_diag.c        |  2 +-
 arch/s390/kernel/setup.c            |  6 +--
 arch/s390/kernel/sthyi.c            |  2 +-
 include/asm-generic/pgalloc.h       | 18 +++++++++
 include/linux/mm.h                  |  4 +-
 include/linux/vmalloc.h             | 15 +++++++-
 kernel/bpf/syscall.c                |  4 +-
 kernel/fork.c                       |  4 +-
 kernel/scs.c                        |  3 +-
 lib/objpool.c                       |  2 +-
 lib/test_vmalloc.c                  |  6 +--
 mm/hugetlb_vmemmap.c                |  4 +-
 mm/kasan/init.c                     | 22 ++++++-----
 mm/memory.c                         |  4 +-
 mm/percpu.c                         |  2 +-
 mm/pgalloc-track.h                  |  3 +-
 mm/sparse-vmemmap.c                 |  2 +-
 mm/util.c                           |  3 +-
 mm/vmalloc.c                        | 39 +++++++-------------
 32 files changed, 176 insertions(+), 74 deletions(-)
 create mode 100644 arch/arm64/mm/vmalloc.c


base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
-- 
2.39.2

