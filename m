Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121254AB58A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 08:08:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jscgl4xm5z3bPJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 18:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PzTia2k6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PzTia2k6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jscg26bbDz2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 18:08:14 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2175bUJP017304; 
 Mon, 7 Feb 2022 07:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZYDab5FROxSoyR9tlQXDJapTMMqZzHE2FqriDiRNXBE=;
 b=PzTia2k6FLvFgHeB5ISkRENGHOqMzrF1Vk1Jp9u16wjthMUFcvqqdGd37wAANEJ8GdIM
 sc58um2Q1ioQnwQtoUfqVeZehB3JZ/GWB36QE6Flkp+7a/xl0UugE5q/TGQp/mNRP8gh
 796xrtKQRaSXnZA7BMWMOTG1Mc008EpPzvmTuz4Zqpj9byL+HaueLVK9T3nSRE4R8Lbx
 S43TmN2N6a2yurgOv3EzxRWUzizaWv45hqTMQBZ0cpWIzXrt+5H/a/BPno18pstM+E8f
 SaZE/tWanGAT3GQ2G6aAOIUnzVBGtZaHavwUxRH6MCljTHy+U6iyEzKUFPbhcCzxjFfN dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e1hux1fj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:42 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21775KUs007215;
 Mon, 7 Feb 2022 07:07:41 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e1hux1fhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:41 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21772oFg000932;
 Mon, 7 Feb 2022 07:07:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3e1gv9rqye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 07:07:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2176vYdi50200962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 06:57:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 730ECA4060;
 Mon,  7 Feb 2022 07:07:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB4D0A4054;
 Mon,  7 Feb 2022 07:07:33 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.33.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 07:07:33 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC PATCH 0/3] powerpc64/bpf: Add support for BPF Trampolines
Date: Mon,  7 Feb 2022 12:37:19 +0530
Message-Id: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3ruID0kvrUZ8BXvWVxcJoghY5QbjF2gX
X-Proofpoint-GUID: yfIzvwOreqEkqm6Pvu-db1moN4Ez-64z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_02,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=800 spamscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070046
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
Cc: Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an early RFC series that adds support for BPF Trampolines on 
powerpc64. Some of the selftests are passing for me, but this needs more
testing and I've likely missed a few things as well. A review of the
patches and feedback about the overall approach will be great.

This series depends on some of the other BPF JIT fixes and enhancements
posted previously, as well as on ftrace direct enablement on powerpc
which has also been posted in the past.


- Naveen


Naveen N. Rao (3):
  ftrace: Add ftrace_location_lookup() to lookup address of ftrace
    location
  powerpc/ftrace: Override ftrace_location_lookup() for MPROFILE_KERNEL
  powerpc64/bpf: Add support for bpf trampolines

 arch/powerpc/kernel/kprobes.c      |   8 +-
 arch/powerpc/kernel/trace/ftrace.c |  11 +
 arch/powerpc/net/bpf_jit.h         |   8 +
 arch/powerpc/net/bpf_jit_comp.c    |   5 +-
 arch/powerpc/net/bpf_jit_comp64.c  | 619 ++++++++++++++++++++++++++++-
 include/linux/ftrace.h             |   5 +
 kernel/bpf/trampoline.c            |  27 +-
 kernel/trace/ftrace.c              |  14 +
 8 files changed, 670 insertions(+), 27 deletions(-)


base-commit: 33ecb3e590194051dc57eee1125c1d372b14c946
-- 2.34.1

