Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7521A07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 16:50:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455B735BHGzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 00:50:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455B5Z3DHdzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 00:49:34 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HEjkdg010353
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 10:49:30 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2shvn3f7n0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 10:49:29 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.vnet.ibm.com>;
 Fri, 17 May 2019 15:49:28 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 15:49:26 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4HEnPBm58654892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 14:49:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1240A4055;
 Fri, 17 May 2019 14:49:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FA92A404D;
 Fri, 17 May 2019 14:49:23 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 17 May 2019 14:49:23 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Fri, 17 May 2019 20:19:22 +0530
From: Vaibhav Jain <vaibhav@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com
Subject: Re: [PATCH] mm/nvdimm: Pick the right alignment default when creating
 dax devices
In-Reply-To: <20190514025449.9416-1-aneesh.kumar@linux.ibm.com>
References: <20190514025449.9416-1-aneesh.kumar@linux.ibm.com>
Date: Fri, 17 May 2019 20:19:22 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19051714-0028-0000-0000-0000036EC8A4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051714-0029-0000-0000-0000242E6839
Message-Id: <875zq9m8zx.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170091
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
Cc: linux-mm@kvack.org, linux-nvdimm@lists.01.org,
 linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

Apart from a minor review comment for changes to nd_pfn_validate() the
patch looks good to me.

Also, I Tested this patch on a PPC64 qemu guest with virtual nvdimm and
verified that default alignment of newly created devdax namespace was
64KiB instead of 16MiB. Below are the test results:

* Without the patch creating a devdax namespace results in namespace
  with 16MiB default alignment. Using daxio to zero out the dax device
  results in a SIGBUS and a hashing failure.

  $ sudo ndctl create-namespace --mode=devdax  | grep align
    "align":16777216,
  "align":16777216

  $ sudo cat /sys/devices/ndbus0/region0/dax0.0/supported_alignments
  65536 16777216

  $ sudo daxio.static-debug  -z -o /dev/dax0.0
  Bus error (core dumped)

  $ dmesg | tail
  [  438.738958] lpar: Failed hash pte insert with error -4
  [  438.739412] hash-mmu: mm: Hashing failure ! EA=0x7fff17000000 access=0x8000000000000006 current=daxio
  [  438.739760] hash-mmu:     trap=0x300 vsid=0x22cb7a3 ssize=1 base psize=2 psize 10 pte=0xc000000501002b86
  [  438.740143] daxio[3860]: bus error (7) at 7fff17000000 nip 7fff973c007c lr 7fff973bff34 code 2 in libpmem.so.1.0.0[7fff973b0000+20000]
  [  438.740634] daxio[3860]: code: 792945e4 7d494b78 e95f0098 7d494b78 f93f00a0 4800012c e93f0088 f93f0120 
  [  438.741015] daxio[3860]: code: e93f00a0 f93f0128 e93f0120 e95f0128 <f9490000> e93f0088 39290008 f93f0110 

* With the patch creating a devdax namespace results in namespace
  with 64KiB default alignment. Using daxio to zero out the dax device
  succeeds:
  
  $ sudo ndctl create-namespace --mode=devdax  | grep align
    "align":65536,
  "align":65536

  $ sudo cat /sys/devices/ndbus0/region0/dax0.0/supported_alignments
  65536

  $ daxio -z -o /dev/dax0.0
  daxio: copied 2130706432 bytes to device "/dev/dax0.0"

Hence,

Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Allow arch to provide the supported alignments and use hugepage alignment only
> if we support hugepage. Right now we depend on compile time configs whereas this
> patch switch this to runtime discovery.
>
> Architectures like ppc64 can have THP enabled in code, but then can have
> hugepage size disabled by the hypervisor. This allows us to create dax devices
> with PAGE_SIZE alignment in this case.
>
> Existing dax namespace with alignment larger than PAGE_SIZE will fail to
> initialize in this specific case. We still allow fsdax namespace initialization.
>
> With respect to identifying whether to enable hugepage fault for a dax device,
> if THP is enabled during compile, we default to taking hugepage fault and in dax
> fault handler if we find the fault size > alignment we retry with PAGE_SIZE
> fault size.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/libnvdimm.h |  9 ++++++++
>  arch/powerpc/mm/Makefile             |  1 +
>  arch/powerpc/mm/nvdimm.c             | 34 ++++++++++++++++++++++++++++
>  arch/x86/include/asm/libnvdimm.h     | 19 ++++++++++++++++
>  drivers/nvdimm/nd.h                  |  6 -----
>  drivers/nvdimm/pfn_devs.c            | 32 +++++++++++++++++++++++++-
>  include/linux/huge_mm.h              |  7 +++++-
>  7 files changed, 100 insertions(+), 8 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/libnvdimm.h
>  create mode 100644 arch/powerpc/mm/nvdimm.c
>  create mode 100644 arch/x86/include/asm/libnvdimm.h
>
> diff --git a/arch/powerpc/include/asm/libnvdimm.h b/arch/powerpc/include/asm/libnvdimm.h
> new file mode 100644
> index 000000000000..d35fd7f48603
> --- /dev/null
> +++ b/arch/powerpc/include/asm/libnvdimm.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_LIBNVDIMM_H
> +#define _ASM_POWERPC_LIBNVDIMM_H
> +
> +#define nd_pfn_supported_alignments nd_pfn_supported_alignments
> +extern unsigned long *nd_pfn_supported_alignments(void);
> +extern unsigned long nd_pfn_default_alignment(void);
> +
> +#endif
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 0f499db315d6..42e4a399ba5d 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -20,3 +20,4 @@ obj-$(CONFIG_HIGHMEM)		+= highmem.o
>  obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
>  obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
>  obj-$(CONFIG_KASAN)		+= kasan/
> +obj-$(CONFIG_NVDIMM_PFN)		+= nvdimm.o
> diff --git a/arch/powerpc/mm/nvdimm.c b/arch/powerpc/mm/nvdimm.c
> new file mode 100644
> index 000000000000..a29a4510715e
> --- /dev/null
> +++ b/arch/powerpc/mm/nvdimm.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <asm/pgtable.h>
> +#include <asm/page.h>
> +
> +#include <linux/mm.h>
> +/*
> + * We support only pte and pmd mappings for now.
> + */
> +const unsigned long *nd_pfn_supported_alignments(void)
> +{
> +	static unsigned long supported_alignments[3];
> +
> +	supported_alignments[0] = PAGE_SIZE;
> +
> +	if (has_transparent_hugepage())
> +		supported_alignments[1] = HPAGE_PMD_SIZE;
> +	else
> +		supported_alignments[1] = 0;
> +
> +	supported_alignments[2] = 0;
> +	return supported_alignments;
> +}
> +
> +/*
> + * Use pmd mapping if supported as default alignment
> + */
> +unsigned long nd_pfn_default_alignment(void)
> +{
> +
> +	if (has_transparent_hugepage())
> +		return HPAGE_PMD_SIZE;
> +	return PAGE_SIZE;
> +}
> diff --git a/arch/x86/include/asm/libnvdimm.h b/arch/x86/include/asm/libnvdimm.h
> new file mode 100644
> index 000000000000..3d5361db9164
> --- /dev/null
> +++ b/arch/x86/include/asm/libnvdimm.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_LIBNVDIMM_H
> +#define _ASM_X86_LIBNVDIMM_H
> +
> +static inline unsigned long nd_pfn_default_alignment(void)
> +{
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	return HPAGE_PMD_SIZE;
> +#else
> +	return PAGE_SIZE;
> +#endif
> +}
> +
> +static inline unsigned long nd_altmap_align_size(unsigned long nd_align)
> +{
> +	return PMD_SIZE;
> +}
> +
> +#endif
> diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
> index a5ac3b240293..44fe923b2ee3 100644
> --- a/drivers/nvdimm/nd.h
> +++ b/drivers/nvdimm/nd.h
> @@ -292,12 +292,6 @@ static inline struct device *nd_btt_create(struct nd_region *nd_region)
>  struct nd_pfn *to_nd_pfn(struct device *dev);
>  #if IS_ENABLED(CONFIG_NVDIMM_PFN)
>
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -#define PFN_DEFAULT_ALIGNMENT HPAGE_PMD_SIZE
> -#else
> -#define PFN_DEFAULT_ALIGNMENT PAGE_SIZE
> -#endif
> -
>  int nd_pfn_probe(struct device *dev, struct nd_namespace_common *ndns);
>  bool is_nd_pfn(struct device *dev);
>  struct device *nd_pfn_create(struct nd_region *nd_region);
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index 01f40672507f..347cab166376 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -18,6 +18,7 @@
>  #include <linux/slab.h>
>  #include <linux/fs.h>
>  #include <linux/mm.h>
> +#include <asm/libnvdimm.h>
>  #include "nd-core.h"
>  #include "pfn.h"
>  #include "nd.h"
> @@ -111,6 +112,8 @@ static ssize_t align_show(struct device *dev,
>  	return sprintf(buf, "%ld\n", nd_pfn->align);
>  }
>
> +#ifndef nd_pfn_supported_alignments
> +#define nd_pfn_supported_alignments nd_pfn_supported_alignments
>  static const unsigned long *nd_pfn_supported_alignments(void)
>  {
>  	/*
> @@ -133,6 +136,7 @@ static const unsigned long *nd_pfn_supported_alignments(void)
>
>  	return data;
>  }
> +#endif
>
>  static ssize_t align_store(struct device *dev,
>  		struct device_attribute *attr, const char *buf, size_t len)
> @@ -310,7 +314,7 @@ struct device *nd_pfn_devinit(struct nd_pfn *nd_pfn,
>  		return NULL;
>
>  	nd_pfn->mode = PFN_MODE_NONE;
> -	nd_pfn->align = PFN_DEFAULT_ALIGNMENT;
> +	nd_pfn->align = nd_pfn_default_alignment();
>  	dev = &nd_pfn->dev;
>  	device_initialize(&nd_pfn->dev);
>  	if (ndns && !__nd_attach_ndns(&nd_pfn->dev, ndns, &nd_pfn->ndns)) {
> @@ -420,6 +424,20 @@ static int nd_pfn_clear_memmap_errors(struct nd_pfn *nd_pfn)
>  	return 0;
>  }
>
> +static bool nd_supported_alignment(unsigned long align)
> +{
> +	int i;
> +	const unsigned long *supported = nd_pfn_supported_alignments();
> +
> +	if (align == 0)
> +		return false;
> +
> +	for (i = 0; supported[i]; i++)
> +		if (align == supported[i])
> +			return true;
> +	return false;
> +}
> +
>  int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>  {
>  	u64 checksum, offset;
> @@ -474,6 +492,18 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>  		align = 1UL << ilog2(offset);
>  	mode = le32_to_cpu(pfn_sb->mode);
>
> +	/*
> +	 * Check whether the we support the alignment. For Dax if the
> +	 * superblock alignment is not matching, we won't initialize
> +	 * the device.
> +	 */
> +	if (!nd_supported_alignment(align) &&
> +	    memcmp(pfn_sb->signature, DAX_SIG, PFN_SIG_LEN)) {
Suggestion to change this check to:

if (memcmp(pfn_sb->signature, DAX_SIG, PFN_SIG_LEN) &&
   !nd_supported_alignment(align))

It would look  a bit more natural i.e. "If the device has dax signature and alignment is
not supported". 


> +		dev_err(&nd_pfn->dev, "init failed, settings mismatch\n");
> +		dev_dbg(&nd_pfn->dev, "align: %lx:%lx\n", nd_pfn->align, align);
> +		return -EINVAL;
> +	}
> +
>  	if (!nd_pfn->uuid) {
>  		/*
>  		 * When probing a namepace via nd_pfn_probe() the uuid
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 381e872bfde0..d5cfea3d8b86 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -110,7 +110,12 @@ static inline bool __transparent_hugepage_enabled(struct vm_area_struct *vma)
>
>  	if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_FLAG))
>  		return true;
> -
> +	/*
> +	 * For dax let's try to do hugepage fault always. If we don't support
> +	 * hugepages we will not have enabled namespaces with hugepage alignment.
> +	 * This also means we try to handle hugepage fault on device with
> +	 * smaller alignment. But for then we will return with VM_FAULT_FALLBACK
> +	 */
>  	if (vma_is_dax(vma))
>  		return true;
>
> -- 
> 2.21.0
>

-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.

