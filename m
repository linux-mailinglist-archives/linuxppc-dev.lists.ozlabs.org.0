Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A425864027
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 06:52:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k6H305gCzDqcg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 14:51:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k6FT0TBdzDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 14:50:35 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6A4mZlc122375
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:50:32 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tn7rkayy5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:50:31 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 10 Jul 2019 05:50:30 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Jul 2019 05:50:28 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6A4oRhf49938626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 04:50:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 087C7A4051;
 Wed, 10 Jul 2019 04:50:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F705A4040;
 Wed, 10 Jul 2019 04:50:26 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.124.35.64])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jul 2019 04:50:26 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: Re: [PATCH v4 0/6] Fixes related namespace alignment/page size/big
 endian
In-Reply-To: <20190620091626.31824-1-aneesh.kumar@linux.ibm.com>
References: <20190620091626.31824-1-aneesh.kumar@linux.ibm.com>
Date: Wed, 10 Jul 2019 10:20:24 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19071004-0012-0000-0000-00000330D993
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071004-0013-0000-0000-0000216A40BD
Message-Id: <87o9221oj3.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=896 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100058
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Dan,

Can you merge this to your tree?

-aneesh
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This series handle configs where hugepage support is not enabled by defau=
lt.
> Also, we update some of the information messages to make sure we use PAGE=
_SIZE instead
> of SZ_4K. We now store page size and struct page size in pfn_sb and do ex=
tra check
> before enabling namespace. There also an endianness fix.
>
> The patch series is on top of subsection v10 patchset
>
> http://lore.kernel.org/linux-mm/156092349300.979959.17603710711957735135.=
stgit@dwillia2-desk3.amr.corp.intel.com
>
> Changes from V3:
> * Dropped the change related PFN_MIN_VERSION
> * for pfn_sb minor version < 4, we default page_size to PAGE_SIZE instead=
 of SZ_4k.
>
> Aneesh Kumar K.V (6):
>   nvdimm: Consider probe return -EOPNOTSUPP as success
>   mm/nvdimm: Add page size and struct page size to pfn superblock
>   mm/nvdimm: Use correct #defines instead of open coding
>   mm/nvdimm: Pick the right alignment default when creating dax devices
>   mm/nvdimm: Use correct alignment when looking at first pfn from a
>     region
>   mm/nvdimm: Fix endian conversion issues=C2=A0
>
>  arch/powerpc/include/asm/libnvdimm.h |  9 ++++
>  arch/powerpc/mm/Makefile             |  1 +
>  arch/powerpc/mm/nvdimm.c             | 34 +++++++++++++++
>  arch/x86/include/asm/libnvdimm.h     | 19 +++++++++
>  drivers/nvdimm/btt.c                 |  8 ++--
>  drivers/nvdimm/bus.c                 |  4 +-
>  drivers/nvdimm/label.c               |  2 +-
>  drivers/nvdimm/namespace_devs.c      | 13 +++---
>  drivers/nvdimm/nd-core.h             |  3 +-
>  drivers/nvdimm/nd.h                  |  6 ---
>  drivers/nvdimm/pfn.h                 |  5 ++-
>  drivers/nvdimm/pfn_devs.c            | 62 ++++++++++++++++++++++++++--
>  drivers/nvdimm/pmem.c                | 26 ++++++++++--
>  drivers/nvdimm/region_devs.c         | 27 ++++++++----
>  include/linux/huge_mm.h              |  7 +++-
>  kernel/memremap.c                    |  8 ++--
>  16 files changed, 194 insertions(+), 40 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/libnvdimm.h
>  create mode 100644 arch/powerpc/mm/nvdimm.c
>  create mode 100644 arch/x86/include/asm/libnvdimm.h
>
> --=20
> 2.21.0

