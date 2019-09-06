Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE5AC234
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 23:49:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QB6R2llWzDqpp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 07:49:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46QB4T00DlzDrB3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2019 07:47:52 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x86Lg4oq015538; Fri, 6 Sep 2019 17:47:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uutysaa5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2019 17:47:44 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x86LhDkD017509;
 Fri, 6 Sep 2019 17:47:44 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uutysaa51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2019 17:47:44 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x86Ldec9018940;
 Fri, 6 Sep 2019 21:47:43 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 2uqgh819w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2019 21:47:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x86LlgpL58655200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Sep 2019 21:47:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42280BE053;
 Fri,  6 Sep 2019 21:47:42 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA208BE04F;
 Fri,  6 Sep 2019 21:47:40 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.199.12])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Sep 2019 21:47:40 +0000 (GMT)
References: <20190823194919.30916-1-svens@stackframe.org>
 <22b40bb7-6f86-0a69-12b2-12d90124173d@gmx.de>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v5 0/7] kexec: add generic support for elf kernel images
In-reply-to: <22b40bb7-6f86-0a69-12b2-12d90124173d@gmx.de>
Date: Fri, 06 Sep 2019 18:47:35 -0300
Message-ID: <87blvxgkqw.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-06_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909060218
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
Cc: kexec@lists.infradead.org, Sven Schnelle <svens@stackframe.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Helge Deller <deller@gmx.de> writes:

> Hi all,
>
> This kexec patch series is the groundwork for kexec on the parisc architecture.
> Since we want kexec on parisc, I've applied it to my for-next-kexec tree [1],
> and can push it to Linus in the next merge window through the parisc tree [2].

I just had a look at this version and it looks fine to me. Identical to
the version I reviewed before except for the changes I suggested.
Thanks, Sven!

> If someone has any objections, or if you prefer to take it through
> a kexec or powerpc tree, please let me know.
>
> Helge
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next-kexec
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

I noticed that the first patch is the only one that doesn't have my
Reviewed-by. If you want, you can add it:

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

If it's inconvenient to add it now since it's already applied, that's
fine too of course.

> On 23.08.19 21:49, Sven Schnelle wrote:
>> Changes to v4:
>>  - rebase on current powerpc/merge tree
>>  - fix syscall name in commit message
>>  - remove a few unused #defines in arch/powerpc/kernel/kexec_elf_64.c
>>...
>>  arch/Kconfig                                  |   3 +
>>  arch/powerpc/Kconfig                          |   1 +
>>  arch/powerpc/kernel/kexec_elf_64.c            | 545 +-----------------
>>  include/linux/kexec.h                         |  23 +
>>  kernel/Makefile                               |   1 +
>>  .../kexec_elf_64.c => kernel/kexec_elf.c      | 394 +++----------
>>  6 files changed, 115 insertions(+), 852 deletions(-)
>>  copy arch/powerpc/kernel/kexec_elf_64.c => kernel/kexec_elf.c (50%)


-- 
Thiago Jung Bauermann
IBM Linux Technology Center
