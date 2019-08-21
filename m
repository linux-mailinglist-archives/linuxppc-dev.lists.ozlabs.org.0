Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D027A96EB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 03:15:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CqVP2h2YzDqdX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 11:15:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CqPQ4NczzDqyY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 11:11:38 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7L170JO030151
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 21:11:35 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ugnuqpkmg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 21:11:35 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Wed, 21 Aug 2019 02:11:34 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 21 Aug 2019 02:11:31 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7L1BUJl41812260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 01:11:30 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2767A112064;
 Wed, 21 Aug 2019 01:11:30 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E59EB112063;
 Wed, 21 Aug 2019 01:11:28 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.187.8])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 21 Aug 2019 01:11:28 +0000 (GMT)
References: <20190715082702.27308-1-svens@stackframe.org>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: kexec@lists.infradead.org
Subject: Re: [PATCH v4 0/7] kexec: add generic support for elf kernel images
In-reply-to: <20190715082702.27308-1-svens@stackframe.org>
Date: Tue, 20 Aug 2019 22:11:25 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19082101-0072-0000-0000-00000453F8BF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011626; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01249763; UDB=6.00659776; IPR=6.01031312; 
 MB=3.00028251; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-21 01:11:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082101-0073-0000-0000-00004CC51A18
Message-Id: <87pnkzmif6.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=13 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=916 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210007
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


Sven Schnelle <svens@stackframe.org> writes:

> Changes to v3:
>  - add support for 32-bit ELF files
>
> Changes to v2:
>  - use git format-patch -C
>
> Changes to v1:
>  - split up patch into smaller pieces
>  - rebase onto powerpc/next
>  - remove unused variable in kexec_elf_load()
>
> Changes to RFC version:
>  - remove unused Elf_Rel macro
>  - remove section header parsing
>  - remove PURGATORY_STACK_SIZE
>  - change order of elf_*_to_cpu() functions
>  - remove elf_addr_to_cpu macro
>
> Sven Schnelle (7):
>   kexec: add KEXEC_ELF
>   kexec_elf: change order of elf_*_to_cpu() functions
>   kexec_elf: remove parsing of section headers
>   kexec_elf: remove PURGATORY_STACK_SIZE
>   kexec_elf: remove Elf_Rel macro
>   kexec_elf: remove unused variable in kexec_elf_load()
>   kexec_elf: support 32 bit ELF files
>
>  arch/Kconfig                       |   3 +
>  arch/powerpc/Kconfig               |   1 +
>  arch/powerpc/kernel/kexec_elf_64.c | 551 +----------------------------
>  include/linux/kexec.h              |  23 ++
>  kernel/Makefile                    |   1 +
>  kernel/kexec_elf.c                 | 418 ++++++++++++++++++++++
>  6 files changed, 456 insertions(+), 541 deletions(-)
>  create mode 100644 kernel/kexec_elf.c

The series applies on v5.1 but not newer kernels, so it needs to be
rebased.

I tested with v5.1 in ppc64le kexecing to both little-endian and
big-endian kernels, and also in ppc64 kexecing to both big-endian and
little-endian kernels so:

Tested-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

--
Thiago Jung Bauermann
IBM Linux Technology Center

