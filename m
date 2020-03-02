Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76D1759F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 13:04:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WJj24nlxzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 23:04:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WJfX58FMzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 23:02:12 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022Bx8HO189172; Mon, 2 Mar 2020 07:02:07 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfm5182d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 07:02:07 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 022C1M1g031007;
 Mon, 2 Mar 2020 12:02:05 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2yffk6e7mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 12:02:05 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 022C24we50921818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 12:02:04 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10C736E056;
 Mon,  2 Mar 2020 12:02:04 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 921A56E050;
 Mon,  2 Mar 2020 12:02:01 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.1.4])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  2 Mar 2020 12:02:01 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Subject: Re: [PATCH v3 1/5] mm/memremap_pages: Introduce
 memremap_compat_align()
In-Reply-To: <158291747142.1609624.18276461572536139551.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <158291746615.1609624.7591692546429050845.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158291747142.1609624.18276461572536139551.stgit@dwillia2-desk3.amr.corp.intel.com>
Date: Mon, 02 Mar 2020 17:31:58 +0530
Message-ID: <87lfojrmmh.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_03:2020-03-02,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=965 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020091
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> The "sub-section memory hotplug" facility allows memremap_pages() users
> like libnvdimm to compensate for hardware platforms like x86 that have a
> section size larger than their hardware memory mapping granularity.  The
> compensation that sub-section support affords is being tolerant of
> physical memory resources shifting by units smaller (64MiB on x86) than
> the memory-hotplug section size (128 MiB). Where the platform
> physical-memory mapping granularity is limited by the number and
> capability of address-decode-registers in the memory controller.
>
> While the sub-section support allows memremap_pages() to operate on
> sub-section (2MiB) granularity, the Power architecture may still
> require 16MiB alignment on "!radix_enabled()" platforms.
>
> In order for libnvdimm to be able to detect and manage this per-arch
> limitation, introduce memremap_compat_align() as a common minimum
> alignment across all driver-facing memory-mapping interfaces, and let
> Power override it to 16MiB in the "!radix_enabled()" case.
>
> The assumption / requirement for 16MiB to be a viable
> memremap_compat_align() value is that Power does not have platforms
> where its equivalent of address-decode-registers never hardware remaps a
> persistent memory resource on smaller than 16MiB boundaries. Note that I
> tried my best to not add a new Kconfig symbol, but header include
> entanglements defeated the #ifndef memremap_compat_align design pattern
> and the need to export it defeats the __weak design pattern for arch
> overrides.
>
> Based on an initial patch by Aneesh.
>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Link: http://lore.kernel.org/r/CAPcyv4gBGNP95APYaBcsocEa50tQj9b5h__83vgngjq3ouGX_Q@mail.gmail.com
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reported-by: Jeff Moyer <jmoyer@redhat.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/powerpc/Kconfig      |    1 +
>  arch/powerpc/mm/ioremap.c |   21 +++++++++++++++++++++
>  drivers/nvdimm/pfn_devs.c |    2 +-
>  include/linux/memremap.h  |    8 ++++++++
>  include/linux/mmzone.h    |    1 +
>  lib/Kconfig               |    3 +++
>  mm/memremap.c             |   23 +++++++++++++++++++++++
>  7 files changed, 58 insertions(+), 1 deletion(-)
>
