Return-Path: <linuxppc-dev+bounces-15253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E8CF3128
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 11:53:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlB3r6kM2z2yY9;
	Mon, 05 Jan 2026 21:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767610408;
	cv=none; b=EeFXywMArw8RzZ2TT9EtiZim+dy5KLrJKHpJjZyU1pa8aMqF6ec55Cr3WCddvjENusKBl3iYFpOCOGRGBwNPzatz1c30xIMTU2T+SUel0LLm/8Ok8pkfIYFs9G9+jjxqDeB5yKQV4ybWPelM+yrbWHdRkp3WxXNl0wfu02wyfPMVV/VUdgct0pneLJnsAphAwT+Ax2HQ92jO4Y8hJQoAieM7up4VQEPbUb9gLoo/VyJn0ngcTgzREjs/XiRdVEva2tdSIdI0bRn8YXhdun2GW9NVSAuRETXx9sQlgNzXH1PwgOXx35VdGOZ4VJF4SnLxgCTKw0F4IDTcki2XIlBT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767610408; c=relaxed/relaxed;
	bh=Bm4RfhUpdp6KtoJB1Eu6dcjHsYV4t7EKxArXs/WCiQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C4fqFKkb3TyvysElyrfETj+URn136AaHEdhE6RjDkWIZQGDbGRL907ye4zZdTr/UkUaGLhRdwoGy3O0BiVahIrcviaRhOabstCH647f0E9m1AjS+KR95C/+eRE8Hq5T4mCHuC6gBylerbkhd3Li4twxJJcIU9703F6i9i6eS1DLyR7nY98sbT6C2z/LHyuA7P51n+QlXUOX8iClu5XQQ+MIJElaBr74og9+qSmltmhoevOUYVvnXchaBvssaL9u61jJHOaub9i5Ir9lB1pWQUWDc/Qr+ECqy20yzK8DOrsNEJV5jnK/8vtSWqu8uOC0TD1rcHCvg5wos3x9mGJ8a4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ENeuR1Bb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ENeuR1Bb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlB3r0vQtz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 21:53:27 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 604LvvuS029317;
	Mon, 5 Jan 2026 10:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Bm4RfhUpdp6KtoJB1Eu6dcjHsYV4
	t7EKxArXs/WCiQc=; b=ENeuR1BbdlLmRAdbrXRhVfIJ2FBvrehMfNuMFldQKbhk
	vVtRfT+aOhFqI7AvVupj+QFn9RGIoM4deYId+AAwLu18YKPnYzExJ0Oywq3V9Js2
	ra9gskW7RMcKjQV4me9ogVKTjzaalDk0WPp0MVqBhn2IR7XYquCuv6cVE2D1OMuE
	qA2RjFmwyZXCAcc23dkcIML2e/uyICaan0XzFMyOGxcKGTr6dJ/i2NiqB8A/3GVP
	KaurtscxRIpbyPupWbfvnl9gA7gY7P7OrVh2SrqLmQZBXeyEC5Tn84bK3FcErEX3
	1Yz8PX17L+CWNURNDaNnLL5Vn0Lvw7CGuX2RB6VgzQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betspxstr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:52:29 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 605AoGlh032464;
	Mon, 5 Jan 2026 10:52:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betspxstn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:52:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60586CdL012568;
	Mon, 5 Jan 2026 10:52:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bffnj528p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 10:52:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 605AqNWh42991890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jan 2026 10:52:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1D4B2004B;
	Mon,  5 Jan 2026 10:52:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C5BF20040;
	Mon,  5 Jan 2026 10:52:18 +0000 (GMT)
Received: from abhi.. (unknown [9.124.213.127])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jan 2026 10:52:17 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 0/6] powerpc64/bpf: Support tailcalls with subprogs & BPF exceptions
Date: Mon,  5 Jan 2026 16:22:06 +0530
Message-ID: <20260105105212.136645-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J7e01teizZ9lzAMRnA5pnt6q5T5s5OwO
X-Authority-Analysis: v=2.4 cv=Jvf8bc4C c=1 sm=1 tr=0 ts=695b97ed cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=MRERCuqDcDvvmCxgsmsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wYwGirMy3Sc4e7w_THFGzlIL_slcPqpa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA5NSBTYWx0ZWRfX80OUoMmdW0bC
 DPy/vLctMfiUQmeqV3Amasr1PWTLeDXyNmz2l8J+nacETM8gpwJVvzZW1dRSDC0lIQ+YgM7eCOr
 C80v+MiUzV9Mo9x8CMcJKc9pp6ffjSaHbl/J0pWP9k2woB1riwBK2LybH+pi/TxxZiN2hBn0W4y
 aqc7+fDH5rd6OB9iARjH+UP/U+m0Tup6KpsiLc0oGDeeJW7r6m9Dp6wqLLcvmQ8PrLOunwuGSpw
 SjWxx/88aMZONUrXQrS6CSiz3JQMDaAEGTc9PPp0C/KgH1bDVVU8LKJ4z0wnxS/0YG4DVB1ZTbC
 fXAzwpVFsbjxaa2q8UagrZQzzPg7cSGKKtURZTbb4o2sNTN1KArfW9BfhWGY7g0k0ROgwHTW/nB
 NMjiAL0uidOww2wLcHBgz7E1cMI2tOQOiEzWki/ogGWK4zCta7cPFhdpa2DFvs/qTDV4YPScHeU
 WMh2iTVB7WlDU0mYACA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601050095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

This patch series enables support for two BPF JIT features
on powerpc64. The first three patches target support for
tail calls with subprogram combinations. The third patch
includes an optimization in which NVRs are accommodated in
the stack save area of the trampoline frame. Implementation
details are provided in the commit messages.

The last three patches add support for BPF exceptions. An
architecture-specific stack walker is implemented to assist
with stack walk during exceptions. BPF selftest results and
implementation details are presented in the corresponding
commits.

Abhishek Dubey (6):
  powerpc64/bpf: Support tailcalls with subprogs
  powerpc64/bpf: Tailcall handling with trampolines
  powerpc/bpf: use BPF_PPC_STACK_SAVE to spill trampoline NVRs
  powerpc64/bpf: Add arch_bpf_stack_walk() for BPF JIT
  powerpc64/bpf: Support exceptions
  powerpc64/bpf: Additional NVR handling for bpf_throw

 arch/powerpc/net/bpf_jit.h        |  16 ++-
 arch/powerpc/net/bpf_jit_comp.c   |  90 +++++++++----
 arch/powerpc/net/bpf_jit_comp64.c | 214 ++++++++++++++++++++++++------
 3 files changed, 256 insertions(+), 64 deletions(-)

-- 
2.48.1


