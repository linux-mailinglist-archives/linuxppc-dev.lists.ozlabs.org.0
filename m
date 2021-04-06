Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF83556F6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 16:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF9Pl4133z304Z
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 00:48:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TIAIa38J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TIAIa38J; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF9PJ3jbhz2yYZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 00:48:03 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136EXZm4088271; Tue, 6 Apr 2021 10:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=cxGfkH5KTh5bW09+nyDmxK51xI9Etu4dGYuEt71IZyA=;
 b=TIAIa38JAPrsYg76rk5DbNeiKAguY76C6FNvHcNzM4VDhfLMxSu52v7UJYPewJ1VEHjV
 1rMJiHESc48oHgH8yU+iFc4QCZsE2vM/XpWmrAYMz0xLv4YEPB73rmvE5rD/Qt3kVv8T
 pyO85NrHw//X8hK8wwolvgqDhnqlJ7JU9Zq3f1ZoMCi/GWfV2ki7aRa6RKoqqr08JI4v
 veBS3BxQ86IjsJVqcmlOR4L/nAaEaGByx0IdvYrXizPdIser9LyXhJrawMzJMaTNXjhI
 3Eou8xFymvI7Egmc5S9RHSCjIaMsJuB3aTPoEkSfw0H3vDiArriyV8Yi3ZJpj4CvC/yk xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5kxy964-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 10:47:57 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 136EXeEK088754;
 Tue, 6 Apr 2021 10:47:57 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5kxy94y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 10:47:57 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136Eh5vq025562;
 Tue, 6 Apr 2021 14:47:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 37q2y9j7vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 14:47:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 136ElowS46924254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 14:47:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADA314C04E;
 Tue,  6 Apr 2021 14:47:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1940E4C046;
 Tue,  6 Apr 2021 14:47:46 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.212.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 14:47:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Clear pending PMI in ppmu callbacks
Date: Tue,  6 Apr 2021 10:47:43 -0400
Message-Id: <1617720464-1651-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mrOcTccAOd1IFhBkrHSSV_FTCSl8jGjf
X-Proofpoint-GUID: HkpUUhx-8BLts9WD54yx1Dcm3D_5mNPQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_03:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060102
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
Cc: nasastry@in.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running perf fuzzer testsuite popped up below messages
in the dmesg logs:

"Can't find PMC that caused IRQ"

This means a PMU exception happened, but none of the PMC's (Performance
Monitor Counter) were found to be overflown. Perf interrupt handler checks
the PMC's to see which PMC has overflown and if none of the PMCs are
overflown ( counter value not >= 0x80000000 ), it throws warning:
"Can't find PMC that caused IRQ".

Powerpc has capability to mask and replay a performance monitoring
interrupt (PMI). In case of replayed PMI, there are some corner cases
that clears the PMCs after masking. In such cases, the perf interrupt
handler will not find the active PMC values that had caused the overflow
and thus leading to this message. This patchset attempts to fix those
corner cases.

However there is one more case in PowerNV where these messages are
emitted during system wide profiling or when a specific CPU is monitored
for an event. That is, when a counter overflow just before entering idle
and a PMI gets triggered after wakeup from idle. Since PMCs
are not saved in the idle path, perf interrupt handler will not
find overflown counter value and emits the "Can't find PMC" messages.
This patch documents this race condition in powerpc core-book3s.

Patch fixes the ppmu callbacks to disable pending interrupt before clearing
the overflown PMC and documents the race condition in idle path.

Athira Rajeev (1):
  powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting
    an overflown PMC

 arch/powerpc/include/asm/pmc.h  | 11 +++++++++
 arch/powerpc/perf/core-book3s.c | 55 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

-- 
1.8.3.1

