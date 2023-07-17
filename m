Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA6F7569C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 19:00:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H9zzieJ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4SxX2vdFz2yW0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 03:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H9zzieJ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Swf5JGJz2xW7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 02:59:13 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36HGlVG8008734
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=s0RwxTSSzNkXt1j4bxmdMBrM44PJ0w2feHmLpPx+N9E=;
 b=H9zzieJ65AwwetNPVdaEc35+G2A+wkEDVQpFerjP4OgsAB4g5Yr0OVjpG4AKjb+nN37/
 fEIP1JsfAuwQOQ10o52VTY+OgxN7xAUa2t4iWTAy3lcazp18URPFFjcf5OE3rXsnfU9t
 DllBiUBRuqxRO+Ul1hMd20ioE3hNv6xdalTPaAzJX3KAGy798o5VQ1xAWViKBQjB6aJ4
 VpNTpt9yIbcIIz2ZfWEA5OfwDTXnh/3cy0DWAGK1MqUOIeUuWRFx1oLW4Y4JWsEpbru5
 YzUjV7AG3NJUqpHbfPaXf925gimdGYLvDUszI02J+HAGj8zz9WIuxEPl54Sco0HaxjiK rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw9fq08ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:59:10 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36HGlS5u008674
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:59:10 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw9fq08t7-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 16:59:10 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36HDwpma008046;
	Mon, 17 Jul 2023 16:38:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv80j0e6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 16:38:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36HGcc8Q25952888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 16:38:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 809922004B;
	Mon, 17 Jul 2023 16:38:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F9EB20043;
	Mon, 17 Jul 2023 16:38:37 +0000 (GMT)
Received: from in.ibm.com (unknown [9.171.30.176])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 17 Jul 2023 16:38:37 +0000 (GMT)
Date: Mon, 17 Jul 2023 22:08:34 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel Crash Dump (kdump) broken with 6.5
Message-ID: <udbe6orsg6jpzkwppupzekfwxjvn7e5q3rlzyqvm4xl3k44w7t@e7m2zjjwmh5c>
References: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nLAZXF4GPYKAPPfdGSj_p-Z1hzwJkFzW
X-Proofpoint-ORIG-GUID: MXTF_HNzal5tRHQX-dKNNV3JQmsTRUQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_13,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=896
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307170152
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-17 20:15:53 Mon, Sachin Sant wrote:
> Kdump seems to be broken with 6.5 for ppc64le.
> 
> [ 14.200412] systemd[1]: Starting dracut pre-pivot and cleanup hook...
> [[0;32m OK [0m] Started dracut pre-pivot and cleanup hook.
> Starting Kdump Vmcore Save Service...
> [ 14.231669] systemd[1]: Started dracut pre-pivot and cleanup hook.
> [ 14.231801] systemd[1]: Starting Kdump Vmcore Save Service...
> [ 14.341035] kdump.sh[297]: kdump: saving to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
> [ 14.350053] EXT4-fs (sda2): re-mounted e971a335-1ef8-4295-ab4e-3940f28e53fc r/w. Quota mode: none.
> [ 14.345979] kdump.sh[297]: kdump: saving vmcore-dmesg.txt to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
> [ 14.348742] kdump.sh[331]: Cannot open /proc/vmcore: No such file or directory
> [ 14.348845] kdump.sh[297]: kdump: saving vmcore-dmesg.txt failed
> [ 14.349014] kdump.sh[297]: kdump: saving vmcore
> [ 14.443422] kdump.sh[332]: open_dump_memory: Can't open the dump memory(/proc/vmcore). No such file or directory
> [ 14.456413] kdump.sh[332]: makedumpfile Failed.
> [ 14.456662] kdump.sh[297]: kdump: saving vmcore failed, _exitcode:1
> [ 14.456822] kdump.sh[297]: kdump: saving the /run/initramfs/kexec-dmesg.log to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
> [ 14.487002] kdump.sh[297]: kdump: saving vmcore failed
> [[0;1;31mFAILED[0m] Failed to start Kdump Vmcore Save Service.

Thanks Sachin for catching this.

> 
> 6.4 was good. Git bisect points to following patch
> 
> commit 606787fed7268feb256957872586370b56af697a
>     powerpc/64s: Remove support for ELFv1 little endian userspace
> 
> Reverting this patch allows a successful capture of vmcore.
> 
> Does this change require any corresponding change to kdump
> and/or kexec tools?

Need to investigate that. It looks like vmcore_elf64_check_arch(&ehdr)
check from fs/proc/vmcore.c is failing after above commit.

static int __init parse_crash_elf64_headers(void)
{
[...]

        /* Do some basic Verification. */
        if (memcmp(ehdr.e_ident, ELFMAG, SELFMAG) != 0 ||
                (ehdr.e_type != ET_CORE) ||
                !vmcore_elf64_check_arch(&ehdr) ||
[...]

It looks like ehdr->e_flags are not set properly while generating vmcore
ELF header. I see that in kexec_file_load, ehdr->e_flags left set to 0
irrespective of IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) is true or false.

-Mahesh
