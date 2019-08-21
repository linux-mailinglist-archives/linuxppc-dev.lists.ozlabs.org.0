Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA998565
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:17:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DJqy3V8SzDqW6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 06:17:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DJnz1WfCzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 06:16:05 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LKCm9d051565; Wed, 21 Aug 2019 16:15:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhawhmbcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 16:15:59 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7LKENbX064511;
 Wed, 21 Aug 2019 16:15:58 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhawhmbc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 16:15:58 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7LKFiwq010568;
 Wed, 21 Aug 2019 20:15:57 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 2ue976xdme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 20:15:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LKFuFA59572482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 20:15:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F120BE053;
 Wed, 21 Aug 2019 20:15:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6619ABE051;
 Wed, 21 Aug 2019 20:15:54 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.170.169])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 21 Aug 2019 20:15:54 +0000 (GMT)
References: <20190715082702.27308-1-svens@stackframe.org>
 <20190715082702.27308-2-svens@stackframe.org>
 <87zhk3mj0k.fsf@morokweng.localdomain>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: kexec@lists.infradead.org
Subject: Re: [PATCH v4 1/7] kexec: add KEXEC_ELF
In-reply-to: <87zhk3mj0k.fsf@morokweng.localdomain>
Date: Wed, 21 Aug 2019 17:15:49 -0300
Message-ID: <877e76w9ze.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=13 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210196
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


Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:

>> diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/kernel/kexec_elf.c
>> similarity index 71%
>> copy from arch/powerpc/kernel/kexec_elf_64.c
>> copy to kernel/kexec_elf.c
>> index ba4f18a43ee8..6e9f52171ede 100644
>> --- a/arch/powerpc/kernel/kexec_elf_64.c
>> +++ b/kernel/kexec_elf.c
>> @@ -1,33 +1,10 @@
>> -/*
>> - * Load ELF vmlinux file for the kexec_file_load syscall.
>> - *
>> - * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
>> - * Copyright (C) 2004  IBM Corp.
>> - * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
>> - * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
>> - * Copyright (C) 2016  IBM Corporation
>> - *
>> - * Based on kexec-tools' kexec-elf-exec.c and kexec-elf-ppc64.c.
>> - * Heavily modified for the kernel by
>> - * Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>.
>> - *
>> - * This program is free software; you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation (version 2 of the License).
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> - * GNU General Public License for more details.
>> - */
>> +// SPDX-License-Identifier: GPL-2.0-only
>
> I may be wrong, but my understanding of the SPDX license identifier is
> that it substitutes the license text (i.e., the last two paragraphs
> above), but not the copyright statements. Is it ok to have a file with a
> SPDX license identifier but no copyright statement?

Answering my own question: I just came accross commit b24413180f56
("License cleanup: add SPDX GPL-2.0 license identifier to files with no
license") which adds SPDX license identifiers to a lot of files without
any copyright statement so I conclude that it is indeed ok to not have
copyright statements in a file.

In this instance the new file is heavily based on the old one though, so
IMHO it makes sense for it to inherit the copyright statements from the
original file.

--
Thiago Jung Bauermann
IBM Linux Technology Center
