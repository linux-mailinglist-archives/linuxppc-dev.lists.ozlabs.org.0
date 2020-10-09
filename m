Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0950287FF9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 03:22:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6r0Y2ggkzDqXW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 12:22:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YjylQrWG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6qyn31LBzDqMH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 12:21:03 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09911rh4021445; Thu, 8 Oct 2020 21:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=uF8fs5jp9NKhNTm/2bRa7cgMgIdF+dgMy600hHy9/LQ=;
 b=YjylQrWGOHKr95XNu1buKk/6nUjARFcKmIB+5plreqiz1y3692GEvfqCi6/8w1nzsVUL
 FzyBsFhNu44RNKbvfhle5wTmXxDiaQYcgBhvCo0OLtor6luYHipuXU5CgBEZLfGRo/ex
 29H9GQJfUFPre09ydSw5zhig/1Mj15CgqQWpvo5JXo31yzwizIIqGTsQJPXgkaKN/nii
 4wkgfXmQAw5pCHe+ZOoU8iZczDlJARnBa/0KJMCudpW8oJMyrd42CEXcnx8N7Fq3pYxg
 Ta8quEN8AY9QlniCfPQjGOZ3xSyuXYaVVWqDhFhmqim8z9Q5fCuGNXnzxt0t+CSLL4Yv WQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 342dsargxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 21:20:45 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0991JFue008111;
 Fri, 9 Oct 2020 01:20:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3429hrg2ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 01:20:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0991Kekk32244024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Oct 2020 01:20:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1A58A405B;
 Fri,  9 Oct 2020 01:20:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3544EA4054;
 Fri,  9 Oct 2020 01:20:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Oct 2020 01:20:40 +0000 (GMT)
Received: from [9.206.219.109] (unknown [9.206.219.109])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 00FECA01DA;
 Fri,  9 Oct 2020 12:20:38 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Linux kernel: powerpc: RTAS calls can be used to compromise kernel
 integrity
To: oss-security@lists.openwall.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <09cb1e1e-c71b-83a3-4c04-4e47e7c85342@linux.ibm.com>
Date: Fri, 9 Oct 2020 12:20:38 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_15:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 clxscore=1034 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010090003
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Linux kernel for powerpc has an issue with the Run-Time Abstraction 
Services (RTAS) interface, allowing root (or CAP_SYS_ADMIN users) in a 
VM to overwrite some parts of memory, including kernel memory.

This issue impacts guests running on top of PowerVM or KVM hypervisors 
(pseries platform), and does *not* impact bare-metal machines (powernv 
platform).

Description
===========

The RTAS interface, defined in the Power Architecture Platform 
Reference, provides various platform hardware services to operating 
systems running on PAPR platforms (e.g. the "pseries" platform in Linux, 
running in a LPAR/VM on PowerVM or KVM).

Some userspace daemons require access to certain RTAS calls for system 
maintenance and monitoring purposes.

The kernel exposes a syscall, sys_rtas, that allows root (or any user 
with CAP_SYS_ADMIN) to make arbitrary RTAS calls. For the RTAS calls 
which require a work area, it allocates a buffer (the "RMO buffer") and 
exposes the physical address in /proc so that the userspace tool can 
pass addresses within that buffer as an argument to the RTAS call.

The syscall doesn't check that the work area arguments to RTAS calls are 
within the RMO buffer, which makes it trivial to read and write to any 
guest physical address within the LPAR's Real Memory Area, including 
overwriting the guest kernel's text.

At the time the RTAS syscall interface was first developed, it was 
generally assumed that root had unlimited ability to modify system 
state, so this would not have been considered an integrity violation. 
However, with the advent of Secure Boot, Lockdown etc, root should not 
be able to arbitrarily modify the kernel text or read arbitrary kernel data.

Therefore, while this issue impacts all kernels since the RTAS interface 
was first implemented, we are only considering it a vulnerability for 
upstream kernels from 5.3 onwards, which is when the Lockdown LSM was 
merged. Lockdown was widely included in pre-5.3 distribution kernels, so 
distribution vendors should consider whether they need to backport the 
patch to their pre-5.3 distro trees.

(A CVE for this issue is pending; we requested one some time ago but it 
has not yet been assigned.)

Fixes
=====

A patch is currently in powerpc-next[0] and is expected to be included 
in mainline kernel 5.10. The patch has not yet been backported to 
upstream stable trees.

The approach taken by the patch is to maintain the existing RTAS 
interface, but restrict requests to the list of RTAS calls actually used 
by the librtas userspace library, and restrict work area pointer 
arguments to the region within the RMO buffer.

All RTAS-using applications that we are aware of are system 
management/monitoring tools, maintained by IBM, that use the librtas 
library. We don't anticipate there being any real world legitimate 
applications that require an RTAS call that isn't in the librtas list, 
however if such an application exists, the filtering can be disabled by 
a Kconfig option specified during kernel build.

Credit
======

Thanks to Daniel Axtens (IBM) for initial discovery of this issue.

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=bd59380c5ba4147dcbaad3e582b55ccfd120b764

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
