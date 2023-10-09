Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 504867BD2E6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:55:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZaiZ52G/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pCq195sz3cWp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZaiZ52G/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pBv4bFnz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:54:31 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3995kJLm028631;
	Mon, 9 Oct 2023 05:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ggDeTe7U4EoWI97QgqL+TinWadvspyYvqsE4tpGPPwg=;
 b=ZaiZ52G/AF4lnnm3pwT1QX5oHjlsgeAl0y5CPvfmccIhn6T9ZZekgllM05mhtaDX1i+W
 a+wg/babpniF7HR+b/wvkEBbRYWXaQJ4/zDpd4qKNyHQvDL4dWIjwJrDh5wA4sZSR4hL
 hIpNrtgkEP8lrRShyGsMCW07HJf66+JpbMFvgqAgjxQkuzbU4fY2DilRgwYqtlfgEIWx
 AEXVLqgJ3rARTO/eh1UBmdcp5dFGtRKuO0uQ0yJiNblDcrkHul1a782+4O4KDs5BSJVv
 wGcAzxrnD7ud9g6uqVrKakbXlObeJPHPDYprzIscFreVBmcqYOn4ZQabmSmEKYAulB2g Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmb880nw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:26 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3995m9xL004642;
	Mon, 9 Oct 2023 05:54:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmb880nvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39956auh024439;
	Mon, 9 Oct 2023 05:54:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhns78py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3995sN2t44434126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 05:54:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F77D20043;
	Mon,  9 Oct 2023 05:54:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DDDF20040;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A6AF560419;
	Mon,  9 Oct 2023 16:54:20 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/6] Add dynamic DEXCR support
Date: Mon,  9 Oct 2023 16:54:00 +1100
Message-ID: <20231009055406.142940-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qJZwQixvS6i0cljnemKWqx31Ll0vezpY
X-Proofpoint-GUID: RKUEkz1ZJwHAsT3N_iLQMjDa8TPkqCz4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_04,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090051
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(This RFC is mainly to get feedback on the user interface. Tests and
documentation will be added to the non-rfc followups. This builds but
is otherwise untested.)

In the "Add static DEXCR support" series[1] the kernel was made to
initialise the DEXCR to a static value on all CPUs when they online.

This series allows the DEXCR value to be changed at runtime with a
per-thread granularity. It provides a prctl interface to set and query
this configuration. It also provides a system wide sysctl override for
the SBHE aspect, which specifically has effects that can bleed over to
other CPUs (temporarily after changing it) and certain tracing tools
may require it be set globally across all threads.

Some notes on the patches/changes from the original RFC:

1. We don't need all the aspects to use feature bits, but the
   aspect information is in the device tree and this is the
   simplest mechanism to access it. Adding some kind of callback
   support to the feature detector would also work.

   The dexcr_supported variable introduced in patch 4 is a half-hearted
   example of how the callbacks could just update that variable, and
   no more CPU features would be necessary.

2. The thread used to track 'default' as a separate state (way back in
   the original RFC before the split into static/dynamic). This RFC
   simplifies it away, as it is only useful if there is a system wide
   default that can be changed. The current system wide default is
   decided at compile time, so we just initialise the thread config
   to that.

   If the 'default' state were added in future though, would that be
   a userspace ABI concern? I guess it could just return a 'default'
   flag as well as the current 'on' and 'off' flags to indicate what
   the default is.

3. The prctl controls are reduced to what I expect to be most useful.
   Default state is removed as above, and so is 'force' (where the aspect
   would no longer be configurable). 'inherit' remains as a way to control
   the DEXCR of child process trees that may not be aware of it.

4. The prctl set interface is privileged. The concern is a non-privileged
   process disabling NPHIE (HASHCHK enabler) and then invoking a setuid
   binary which doesn't set NPHIE itself. It seems that kind of 
   information about the exec target is not available in arch specific
   code.

5. A lot of the synchonization of the sysctl interface is removed.
   Apparently the kernfs system that manages these files enforces
   exclusive access to a given sysctl file. Additionally, the 
   proc_dointvec_minmax() function was made to store the result with 
   WRITE_ONCE(), so we can assume a regular atomic store of an aligned
   word.

6. The ROP protection enforcement is refactored a bit. The idea is to
   allow baking into the kernel at compile time that NPHIE cannot be
   changed by a thread. Seems to allow making the system more secure on
   paper, not sure how useful it is in practice.

7. The prctl interface tries to stay separate from the DEXCR structure.
   This makes it a little contorted (having to convert the prctl value to
   an aspect), but I think makes the interface more robust against future
   changes to the DEXCR. E.g., if all 32 aspect bits were exhausted and a
   second DEXCR added, the current interface could still handle that.


[1]: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20230616034846.311705-1-bgray@linux.ibm.com/


Benjamin Gray (6):
  powerpc/dexcr: Make all aspects CPU features
  powerpc/dexcr: Add thread specific DEXCR configuration
  prctl: Define PowerPC DEXCR interface
  powerpc/dexcr: Add prctl implementation
  powerpc/dexcr: Add sysctl entry for SBHE system override
  powerpc/dexcr: Add enforced userspace ROP protection config

 arch/powerpc/Kconfig                 |   5 +
 arch/powerpc/include/asm/cputable.h  |   6 +-
 arch/powerpc/include/asm/processor.h |  22 +++
 arch/powerpc/kernel/Makefile         |   1 +
 arch/powerpc/kernel/dexcr.c          | 218 +++++++++++++++++++++++++++
 arch/powerpc/kernel/process.c        |  24 +++
 arch/powerpc/kernel/prom.c           |   3 +
 include/uapi/linux/prctl.h           |  13 ++
 kernel/sys.c                         |  16 ++
 9 files changed, 307 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/kernel/dexcr.c

-- 
2.41.0
