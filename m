Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA67759D1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 20:09:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqgCexK4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5kNs2MVMz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 04:09:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqgCexK4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5kMw1D7Xz2yDQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 04:08:43 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36JI8Wur018320;
	Wed, 19 Jul 2023 18:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=JFJzGfz4JyDPsMoSDPId1ECrwFof8XpIghEHNtnXWUY=;
 b=gqgCexK4ttytXH8wTeaYrEvwSg+GoK2T8evpr8hs3PGFDH9AeItKdQ7sAug5u/zz1uwu
 SIu+EJ9iwI++USdkXRV4C4WQaX7aDM155bvzLpWWpNEiuC0UvzGK+9MNnoHiovh6CPRN
 Yy0hjwrTz6ZVI0tPadAtgztr/PRLk5kfGbbj6YVrSFlVI/hm7FeLeAkeIfKNa4uhYWVv
 2LWaxDg/8l5ABfRFL9L+JqGyyqbUR1uDKL61k77vD1RlsU7kAb87mfDTNlwRD++2o8MM
 Iwktth+A+nrgQMDA+3JvncNZ/trgsq9im0t9W6w1HPGVjKAwt1k18SxZtDQpxslQMVKA JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxm21955r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 18:08:36 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36JI8Ze0018364;
	Wed, 19 Jul 2023 18:08:35 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxm2193fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 18:08:35 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36JHDibe004156;
	Wed, 19 Jul 2023 18:03:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv8g13n09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 18:03:35 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36JI3W0B34734488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jul 2023 18:03:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA34A20043;
	Wed, 19 Jul 2023 18:03:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59CC720040;
	Wed, 19 Jul 2023 18:03:31 +0000 (GMT)
Received: from in.ibm.com (unknown [9.171.84.46])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 19 Jul 2023 18:03:31 +0000 (GMT)
Date: Wed, 19 Jul 2023 23:33:28 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Kernel Crash Dump (kdump) broken with 6.5
Message-ID: <2ogfzwjumrd44kxv7njfpot6fhtkzpqu77qv3bspfixdmsxcwc@umt35y2hmslm>
References: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
 <udbe6orsg6jpzkwppupzekfwxjvn7e5q3rlzyqvm4xl3k44w7t@e7m2zjjwmh5c>
 <87wmyxich0.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmyxich0.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nYhcQyCNGWW2I7QjdrUesawwXC5tYyqb
X-Proofpoint-GUID: qPUVm8gsdKI8HDyls3DTtQ1Qy07cyg4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_12,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190163
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
Reply-To: mahesh@linux.ibm.com
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-18 23:19:23 Tue, Michael Ellerman wrote:
> Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:
> > On 2023-07-17 20:15:53 Mon, Sachin Sant wrote:
> >> Kdump seems to be broken with 6.5 for ppc64le.
> >> 
> >> [ 14.200412] systemd[1]: Starting dracut pre-pivot and cleanup hook...
> >> [[0;32m OK [0m] Started dracut pre-pivot and cleanup hook.
> >> Starting Kdump Vmcore Save Service...
> >> [ 14.231669] systemd[1]: Started dracut pre-pivot and cleanup hook.
> >> [ 14.231801] systemd[1]: Starting Kdump Vmcore Save Service...
> >> [ 14.341035] kdump.sh[297]: kdump: saving to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
> >> [ 14.350053] EXT4-fs (sda2): re-mounted e971a335-1ef8-4295-ab4e-3940f28e53fc r/w. Quota mode: none.
> >> [ 14.345979] kdump.sh[297]: kdump: saving vmcore-dmesg.txt to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
> >> [ 14.348742] kdump.sh[331]: Cannot open /proc/vmcore: No such file or directory
> >> [ 14.348845] kdump.sh[297]: kdump: saving vmcore-dmesg.txt failed
> >> [ 14.349014] kdump.sh[297]: kdump: saving vmcore
> >> [ 14.443422] kdump.sh[332]: open_dump_memory: Can't open the dump memory(/proc/vmcore). No such file or directory
> >> [ 14.456413] kdump.sh[332]: makedumpfile Failed.
> >> [ 14.456662] kdump.sh[297]: kdump: saving vmcore failed, _exitcode:1
> >> [ 14.456822] kdump.sh[297]: kdump: saving the /run/initramfs/kexec-dmesg.log to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
> >> [ 14.487002] kdump.sh[297]: kdump: saving vmcore failed
> >> [[0;1;31mFAILED[0m] Failed to start Kdump Vmcore Save Service.
> >
> > Thanks Sachin for catching this.
> >
> >> 
> >> 6.4 was good. Git bisect points to following patch
> >> 
> >> commit 606787fed7268feb256957872586370b56af697a
> >>     powerpc/64s: Remove support for ELFv1 little endian userspace
> >> 
> >> Reverting this patch allows a successful capture of vmcore.
> >> 
> >> Does this change require any corresponding change to kdump
> >> and/or kexec tools?
> >
> > Need to investigate that. It looks like vmcore_elf64_check_arch(&ehdr)
> > check from fs/proc/vmcore.c is failing after above commit.
> >
> > static int __init parse_crash_elf64_headers(void)
> > {
> > [...]
> >
> >         /* Do some basic Verification. */
> >         if (memcmp(ehdr.e_ident, ELFMAG, SELFMAG) != 0 ||
> >                 (ehdr.e_type != ET_CORE) ||
> >                 !vmcore_elf64_check_arch(&ehdr) ||
> > [...]
> 
> Where vmcore_elf64_check_arch() calls elf_check_arch(), which was
> modified by the commit, so that makes sense.
> 
> > It looks like ehdr->e_flags are not set properly while generating vmcore
> > ELF header. I see that in kexec_file_load, ehdr->e_flags left set to 0
> > irrespective of IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) is true or false.
> 
> Does initialising it in crash_prepare_elf64_headers() fix the issue?

Yes, the bellow change fixes the issue. Can't use
IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2)i check in common code. I see that
fs/proc/kcore.c uses ELF_CORE_EFLAGS to set e_flags. Will send out
formal patch.

From 2d12fe7dff5dfe9035a75b1fe8d7da7da3000b90 Mon Sep 17 00:00:00 2001
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Date: Wed, 19 Jul 2023 20:36:37 +0530
Subject: [PATCH] kdump fix

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 kernel/kexec_file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 881ba0d1714cc..be51560509128 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -1279,6 +1279,7 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	ehdr->e_phoff = sizeof(Elf64_Ehdr);
 	ehdr->e_ehsize = sizeof(Elf64_Ehdr);
 	ehdr->e_phentsize = sizeof(Elf64_Phdr);
+	ehdr->e_flags = ELF_CORE_EFLAGS;
 
 	/* Prepare one phdr of type PT_NOTE for each present CPU */
 	for_each_present_cpu(cpu) {
-- 
2.41.0

-- 
Mahesh J Salgaonkar
