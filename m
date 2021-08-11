Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1103E9704
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 19:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlHR24lNjz3cKF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 03:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nxc2IWMa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Nxc2IWMa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHQF11Kjz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 03:49:40 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BHblkK173299; Wed, 11 Aug 2021 13:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 message-id : cc : subject : from : to : references : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wOCBNZT7h2wguzeyfPx2oSQhVbbFAU+yuYGcFPsRE9U=;
 b=Nxc2IWMacCqtIqV1zNqDGCY6584ajG8fCFlH/6dSGb06+J+cXv+UI/N/8Wa06BaOpHVg
 6V0ldeQc6YgBaRCaglK0FZxZdMALaSU+X8Apo8pmM9ZtRgF756zXpBM6Y94I7mWmYpN2
 YpxoXs+YvFTKFM9n9WKW5MRmmK8nCloz7f4jXZzfJLVVCyp+g/kv5UkahSPgF5NHzuB5
 15sy+xixg0vqufqrZxIWgzbSCi/PgsCCwf+6eYGeX0PJRin7NoJEe/DPSfCz+Kqz4BSU
 wRVbFzV+BWSQLI6yxSg/nqOPY6NCZa8ruPfwpacGddjc73WDF8Scw9HMpi42/UzjFahz dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acby5vk87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:49:09 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BHc7S2178600;
 Wed, 11 Aug 2021 13:49:09 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acby5vk7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:49:09 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BHgpHm008102;
 Wed, 11 Aug 2021 17:49:08 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3a9htemke3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 17:49:08 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BHn7wE44106078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 17:49:07 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D89CB206B;
 Wed, 11 Aug 2021 17:49:07 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1235B2065;
 Wed, 11 Aug 2021 17:49:06 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.57.193])
 by b01ledav003.gho.pok.ibm.com (Postfix) with SMTP;
 Wed, 11 Aug 2021 17:49:06 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 5941ABC0CFB;
 Wed, 11 Aug 2021 12:49:04 -0500 (CDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Aug 2021 12:49:04 -0500
Message-Id: <CDGVFMNUW01K.2JJR622LILQPD@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 0/8] Use per-CPU temporary mappings for patching on
 Radix MMU
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <0c3cb140-23ad-0eb6-7df9-633aa51a097c@csgroup.eu>
In-Reply-To: <0c3cb140-23ad-0eb6-7df9-633aa51a097c@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1RqKTUp-uvMi9FWaf8Hf1XV4N7bYB0jG
X-Proofpoint-ORIG-GUID: 7QLrl4vPvLIh_yy5J8Ho5Kjkz4umN_D8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110120
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Aug 5, 2021 at 4:03 AM CDT, Christophe Leroy wrote:
>
>
> Le 13/07/2021 =C3=A0 07:31, Christopher M. Riedl a =C3=A9crit :
> > When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
> > temporary mappings when patching itself. These mappings temporarily
> > override the strict RWX text protections to permit a write. Currently,
> > powerpc allocates a per-CPU VM area for patching. Patching occurs as
> > follows:
> >=20
> > 	1. Map page in per-CPU VM area w/ PAGE_KERNEL protection
> > 	2. Patch text
> > 	3. Remove the temporary mapping
> >=20
> > While the VM area is per-CPU, the mapping is actually inserted into the
> > kernel page tables. Presumably, this could allow another CPU to access
> > the normally write-protected text - either malicously or accidentally -
> > via this same mapping if the address of the VM area is known. Ideally,
> > the mapping should be kept local to the CPU doing the patching [0].
> >=20
> > x86 introduced "temporary mm" structs which allow the creation of mappi=
ngs
> > local to a particular CPU [1]. This series intends to bring the notion =
of a
> > temporary mm to powerpc's Book3s64 Radix MMU and harden it by using suc=
h a
> > mapping for patching a kernel with strict RWX permissions.
> >=20
> > The first four patches implement an LKDTM test "proof-of-concept" which
> > exploits the potential vulnerability (ie. the temporary mapping during =
patching
> > is exposed in the kernel page tables and accessible by other CPUs) usin=
g a
> > simple brute-force approach. This test is implemented for both powerpc =
and
> > x86_64. The test passes on powerpc Radix with this new series, fails on
> > upstream powerpc, passes on upstream x86_64, and fails on an older (anc=
ient)
> > x86_64 tree without the x86_64 temporary mm patches. The remaining patc=
hes add
> > support for and use a temporary mm for code patching on powerpc with th=
e Radix
> > MMU.
>
> I think four first patches (together with last one) are quite
> independent from the heart of the
> series itself which is patches 5, 6, 7. Maybe you should split that
> series it two series ? After all
> those selftests are nice to have but are not absolutely necessary, that
> would help getting forward I
> think.
>

Hmm you're probably right. The selftest at least proves there is a
potential attack which I think is necessary for any hardening related
series/patch. I'll split the series into separate powerpc temp mm and
LKDTM series for the next spin.

> >=20
> > Tested boot, ftrace, and repeated LKDTM "hijack":
> > 	- QEMU+KVM (host: POWER9 Blackbird): Radix MMU w/ KUAP
> > 	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU
> >=20
> > Tested repeated LKDTM "hijack":
> > 	- QEMU+KVM (host: AMD desktop): x86_64 upstream
> > 	- QEMU+KVM (host: AMD desktop): x86_64 w/o percpu temp mm to
> > 	  verify the LKDTM "hijack" test fails
> >=20
> > Tested boot and ftrace:
> > 	- QEMU+TCG: ppc44x (bamboo)
> > 	- QEMU+TCG: g5 (mac99)
> >=20
> > I also tested with various extra config options enabled as suggested in
> > section 12) in Documentation/process/submit-checklist.rst.
> >=20
> > v5:	* Only support Book3s64 Radix MMU for now. There are some issues wi=
th
> > 	  the previous implementation on the Hash MMU as pointed out by Nick
> > 	  Piggin. Fixing these is not trivial so we only support the Radix MMU
> > 	  for now. I tried using realmode (no data translation) to patch with
> > 	  Hash to at least avoid exposing the patch mapping to other CPUs but
> > 	  this doesn't reliably work either since we cannot access vmalloc'd
> > 	  space in realmode.
>
> So you now accept to have two different mode depending on the platform ?

By necessity yes.

> As far as I remember I commented some time ago that non SMP didn't need
> that feature and you were
> reluctant to have two different implementations. What made you change
> your mind ? (just curious).
>

The book3s64 hash mmu support is a pain ;) Supporting both the temp-mm
and vmalloc implementations turned out to be relatively simple - I
initially thought this would be messier. For now we will support both;
however, in the future I'd still like to implement the percpu temp-mm
support for the Hash MMU as well. I suppose we could re-evaluate then if
we want/need both implementations (I know you're in favor of keeping the
vmalloc-based approach for performance reasons on non-SMP).

>
> > 	* Use percpu variables for the patching_mm and patching_addr. This
> > 	  avoids the need for synchronization mechanisms entirely. Thanks to
> > 	  Peter Zijlstra for pointing out text_mutex which unfortunately didn't
> > 	  work out without larger code changes in powerpc. Also thanks to Dani=
el
> > 	  Axtens for comments about using percpu variables for the *percpu* te=
mp
> > 	  mm things off list.
> >=20
> > v4:	* It's time to revisit this series again since @jpn and @mpe fixed
> > 	  our known STRICT_*_RWX bugs on powerpc/64s.
> > 	* Rebase on linuxppc/next:
> >            commit ee1bc694fbaec ("powerpc/kvm: Fix build error when PPC=
_MEM_KEYS/PPC_PSERIES=3Dn")
> > 	* Completely rework how map_patch() works on book3s64 Hash MMU
> > 	* Split the LKDTM x86_64 and powerpc bits into separate patches
> > 	* Annotate commit messages with changes from v3 instead of
> > 	  listing them here completely out-of context...
> >=20
> > v3:	* Rebase on linuxppc/next: commit 9123e3a74ec7 ("Linux 5.9-rc1")
> > 	* Move temporary mm implementation into code-patching.c where it
> > 	  belongs
> > 	* Implement LKDTM hijacker test on x86_64 (on IBM time oof) Do
> > 	* not use address zero for the patching address in the
> > 	  temporary mm (thanks @dja for pointing this out!)
> > 	* Wrap the LKDTM test w/ CONFIG_SMP as suggested by Christophe
> > 	  Leroy
> > 	* Comments to clarify PTE pre-allocation and patching addr
> > 	  selection
> >=20
> > v2:	* Rebase on linuxppc/next:
> > 	  commit 105fb38124a4 ("powerpc/8xx: Modify ptep_get()")
> > 	* Always dirty pte when mapping patch
> > 	* Use `ppc_inst_len` instead of `sizeof` on instructions
> > 	* Declare LKDTM patching addr accessor in header where it belongs=09
> >=20
> > v1:	* Rebase on linuxppc/next (4336b9337824)
> > 	* Save and restore second hw watchpoint
> > 	* Use new ppc_inst_* functions for patching check and in LKDTM test
> >=20
> > rfc-v2:	* Many fixes and improvements mostly based on extensive feedback
> >            and testing by Christophe Leroy (thanks!).
> > 	* Make patching_mm and patching_addr static and move
> > 	  '__ro_after_init' to after the variable name (more common in
> > 	  other parts of the kernel)
> > 	* Use 'asm/debug.h' header instead of 'asm/hw_breakpoint.h' to
> > 	  fix PPC64e compile
> > 	* Add comment explaining why we use BUG_ON() during the init
> > 	  call to setup for patching later
> > 	* Move ptep into patch_mapping to avoid walking page tables a
> > 	  second time when unmapping the temporary mapping
> > 	* Use KUAP under non-radix, also manually dirty the PTE for patch
> > 	  mapping on non-BOOK3S_64 platforms
> > 	* Properly return any error from __patch_instruction
> >          * Do not use 'memcmp' where a simple comparison is appropriate
> > 	* Simplify expression for patch address by removing pointer maths
> > 	* Add LKDTM test
> >=20
> > [0]: https://github.com/linuxppc/issues/issues/224
> > [1]: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-na=
dav.amit@gmail.com/
> >=20
> > Christopher M. Riedl (8):
> >    powerpc: Add LKDTM accessor for patching addr
> >    lkdtm/powerpc: Add test to hijack a patch mapping
> >    x86_64: Add LKDTM accessor for patching addr
> >    lkdtm/x86_64: Add test to hijack a patch mapping
> >    powerpc/64s: Introduce temporary mm for Radix MMU
> >    powerpc: Rework and improve STRICT_KERNEL_RWX patching
> >    powerpc/64s: Initialize and use a temporary mm for patching on Radix
> >    lkdtm/powerpc: Fix code patching hijack test
> >=20
> >   arch/powerpc/include/asm/code-patching.h |   4 +
> >   arch/powerpc/include/asm/debug.h         |   1 +
> >   arch/powerpc/kernel/process.c            |   5 +
> >   arch/powerpc/lib/code-patching.c         | 240 ++++++++++++++++++++---
> >   arch/x86/include/asm/text-patching.h     |   4 +
> >   arch/x86/kernel/alternative.c            |   7 +
> >   drivers/misc/lkdtm/core.c                |   1 +
> >   drivers/misc/lkdtm/lkdtm.h               |   1 +
> >   drivers/misc/lkdtm/perms.c               | 143 ++++++++++++++
> >   9 files changed, 378 insertions(+), 28 deletions(-)
> >=20

