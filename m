Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F287196EB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 03:12:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CqQt69L4zDqcT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 11:12:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CqDM45YjzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 11:03:47 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7L11xVs115062; Tue, 20 Aug 2019 21:03:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugu9csd5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2019 21:03:42 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7L122q1115444;
 Tue, 20 Aug 2019 21:03:42 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugu9csd5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2019 21:03:42 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7L0uQdC020596;
 Wed, 21 Aug 2019 00:58:41 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 2ue9761cyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 00:58:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7L0wfG122348276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 00:58:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09B5EAE05C;
 Wed, 21 Aug 2019 00:58:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC2F8AE062;
 Wed, 21 Aug 2019 00:58:39 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.187.8])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 21 Aug 2019 00:58:39 +0000 (GMT)
References: <20190715082702.27308-1-svens@stackframe.org>
 <20190715082702.27308-2-svens@stackframe.org>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: kexec@lists.infradead.org
Subject: Re: [PATCH v4 1/7] kexec: add KEXEC_ELF
In-reply-to: <20190715082702.27308-2-svens@stackframe.org>
Date: Tue, 20 Aug 2019 21:58:35 -0300
Message-ID: <87zhk3mj0k.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=13 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210006
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
Cc: linuxppc-dev@lists.ozlabs.org, deller@gmx.de,
 Sven Schnelle <svens@stackframe.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello Sven,

Just a few small comments below. Regardless of them:

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Sven Schnelle <svens@stackframe.org> writes:

> Right now powerpc provides an implementation to read elf files
> with the kexec_file() syscall. Make that available as a public

Nit: the syscall is kexec_file_load()

> kexec interface so it can be re-used on other architectures.
>
> Signed-off-by: Sven Schnelle <svens@stackframe.org>
> ---
>  arch/Kconfig                                  |   3 +
>  arch/powerpc/Kconfig                          |   1 +
>  arch/powerpc/kernel/kexec_elf_64.c            | 551 +-----------------
>  include/linux/kexec.h                         |  24 +
>  kernel/Makefile                               |   1 +
>  .../kexec_elf_64.c => kernel/kexec_elf.c      | 199 ++-----
>  6 files changed, 75 insertions(+), 704 deletions(-)
>  copy arch/powerpc/kernel/kexec_elf_64.c => kernel/kexec_elf.c (71%)

<snip>

> diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec_elf_64.c
> index ba4f18a43ee8..30bd57a93c17 100644
> --- a/arch/powerpc/kernel/kexec_elf_64.c
> +++ b/arch/powerpc/kernel/kexec_elf_64.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Load ELF vmlinux file for the kexec_file_load syscall.
>   *
> @@ -10,15 +11,6 @@
>   * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
>   * Heavily modified for the kernel by
>   * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation (version 2 of the License).
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
>
>  #define pr_fmt(fmt)	"kexec_elf: " fmt
> @@ -39,532 +31,6 @@
>  #define Elf_Rel		Elf64_Rel
>  #endif /* Elf_Rel */

Perhaps this patch could remove the #define for elf_addr_to_cpu since
it's not used anymore in this file?

> diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/kernel/kexec_elf.c
> similarity index 71%
> copy from arch/powerpc/kernel/kexec_elf_64.c
> copy to kernel/kexec_elf.c
> index ba4f18a43ee8..6e9f52171ede 100644
> --- a/arch/powerpc/kernel/kexec_elf_64.c
> +++ b/kernel/kexec_elf.c
> @@ -1,33 +1,10 @@
> -/*
> - * Load ELF vmlinux file for the kexec_file_load syscall.
> - *
> - * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
> - * Copyright (C) 2004  IBM Corp.
> - * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
> - * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
> - * Copyright (C) 2016  IBM Corporation
> - *
> - * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
> - * Heavily modified for the kernel by
> - * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation (version 2 of the License).
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - */
> +// SPDX-License-Identifier: GPL-2.0-only

I may be wrong, but my understanding of the SPDX license identifier is
that it substitutes the license text (i.e., the last two paragraphs
above), but not the copyright statements. Is it ok to have a file with a
SPDX license identifier but no copyright statement?

--
Thiago Jung Bauermann
IBM Linux Technology Center
