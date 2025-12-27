Return-Path: <linuxppc-dev+bounces-15020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEECDF40C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 05:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddTsM3S7Xz2yFg;
	Sat, 27 Dec 2025 15:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766809479;
	cv=none; b=ZeUHQ0mueYJd0gv9j+Qt94jZwDtQDDmS4BXL7SzSjDToFJkueck/xN75slXrki+5yBtg7pt7FQf3EkHD5LiKOKdIGQN7o7sNDcK0wsjkrAluq3EXXn9e+LH3gCPA4lDetteyeXYbUxN3sRyfT827lpP0dfnp3pWBN3DD77HTwNceZPJIWWSgo572jQDc19a7D7xPgurWLiZkZTJfUiI4yWlR0OpM/sIAq+SeBelCWECJ9IAJU4IUdhCHd/jxGMTMiBOn6OcmnQS8w6Fr/OPY/+lfYsPVq/DopaKDpJ/3ezvwq/6t3sdoPjkPw158yvG2fhxgc5nNng8TKO0ety/npA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766809479; c=relaxed/relaxed;
	bh=ePhDfSshvlfo2Ir0eSdlg+kEMF2sd54yQxG4zxGlF2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltFq+adqrJBETN6D0Ykm/vwuv+MxtnWM0fmZu/Q0CFdv9Mas/cpZRMyIqi/2hDiqzVvZGEYjIqEbGZa1D7l+zw4c8Rpx5hliaVf282fslNP8SeQr8Uo9t27sRvHLMwm2WG2m4ocPX2O6zdXE4GuQVV3RUsLib0506P9hWnJ9x++nSiIEoFTu9B5QWFIVW4Opfl7IaOD7eFagwjFEz5qPWtiPbgGaKiIujxNwik1IId1oLFn2ZqDUBA+RMlFd/qaaKTi1WCz6qhsvtKlnEpGKpOTQNIKZt1WIAXr5NoL2qFpph5lnNZK+3R2KAZuEBQExQRLcNtW8t524pSxvMbjhDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BIA1799F; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BIA1799F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddTsL4sW2z2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 15:24:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR31nOL028470;
	Sat, 27 Dec 2025 04:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ePhDfS
	shvlfo2Ir0eSdlg+kEMF2sd54yQxG4zxGlF2s=; b=BIA1799FGhXa91S6TnkbkH
	S55q5EWf/9fVolpPfYtuj+t57hF6fsci/4sYfUAj9IEqsmwMWENDLt6+THeL4Vec
	7kJZOzD5DDEzgnnv8hogJwZnG87DpGWPatnOUL4ZlPTvzgt1HkvKjOG5/RAoioID
	w/P5TUKgYABLvcflhWECUlPwN/8kbjxgatdmk5jrfrfZmLxS728dMb5971BaNwCy
	fnkiItDUQo82pmhi57Qd6vxrgTsWpGqrqPDYTOkOCi4neitZP+FP0HCN2QBCRk//
	vP2gDNYuNB42ACWb63lZ/X3Xriy5EvgD4Hh2AejODj8YhGF2BqLzzsHqwDXy0slg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764g4td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:16 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BR4OFjq003551;
	Sat, 27 Dec 2025 04:24:15 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba764g4tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR2v5pU001095;
	Sat, 27 Dec 2025 04:24:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b664stnyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BR4OA7R27459848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Dec 2025 04:24:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D12920049;
	Sat, 27 Dec 2025 04:24:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B44220040;
	Sat, 27 Dec 2025 04:24:07 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.212.100])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Dec 2025 04:24:07 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Christophe Leroy <chleroy@kernel.org>,
        "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>, stable@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/kexec: Enable SMT before waking offline CPUs
Date: Sat, 27 Dec 2025 09:54:06 +0530
Message-ID: <176680916364.22434.16517409166672279903.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251028105516.26258-1-nysal@linux.ibm.com>
References: <20251025080512.85690-1-nysal@linux.ibm.com> <20251028105516.26258-1-nysal@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDAzNSBTYWx0ZWRfXzJgJaxsXzA9+
 ffV98M42/HwQ9SmTnuASeAi51Q3XcxXW6ZlIkUZwY8n5PtjSuL8LuMDrT5iqrsY4dNyi0D/xSBv
 c7lEGxpAAUraMwKXysEnjaOM2iCaypbGdOCEMZgUvhWIOnjVWT/xPY8dhWp03Ob+km4LYdDNto2
 2/G/tqzQGOVrWkQ3S5UhU3qxgNNvdGJtAVDN9z7hGf7SgZe8S/IkVrPPKH+F2Qhczt5ZF7mtxJq
 wIwvlaPz1jcC+4Ukb/7UdPzmM+OCaKfhi0S3EGChA/YUBFNE2qv0ouR2lyffQk+FHFXaH1P6cQJ
 KAVctCXytOrqLirqHvGt0GPyXYigCy1QiWAG6AMMm7i7iX5Z57zpLW0y18jD1+NyJQ3HKDChGUB
 zI6JMRhzmoINBUfsyhuhX8IgkNneLmK0mNZExU9AxEBae/bFnj75fFW+L7LnL4Pk8Sc9ROQrRd2
 YvWO1yvsFsQ/FI1ieBw==
X-Proofpoint-GUID: HQLyhqxDp4o88OLMzo7fqsYtK5z4IQRQ
X-Authority-Analysis: v=2.4 cv=B4+0EetM c=1 sm=1 tr=0 ts=694f5f70 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=_Tyy8SHsIPC3FbPClSgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: aFtEUnZ596LH-19Zm1x0XrXTKzmzB0KC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512270035
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 16:25:12 +0530, Nysal Jan K.A. wrote:
> If SMT is disabled or a partial SMT state is enabled, when a new kernel
> image is loaded for kexec, on reboot the following warning is observed:
> 
> kexec: Waking offline cpu 228.
> WARNING: CPU: 0 PID: 9062 at arch/powerpc/kexec/core_64.c:223 kexec_prepare_cpus+0x1b0/0x1bc
> [snip]
>  NIP kexec_prepare_cpus+0x1b0/0x1bc
>  LR  kexec_prepare_cpus+0x1a0/0x1bc
>  Call Trace:
>   kexec_prepare_cpus+0x1a0/0x1bc (unreliable)
>   default_machine_kexec+0x160/0x19c
>   machine_kexec+0x80/0x88
>   kernel_kexec+0xd0/0x118
>   __do_sys_reboot+0x210/0x2c4
>   system_call_exception+0x124/0x320
>   system_call_vectored_common+0x15c/0x2ec
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kexec: Enable SMT before waking offline CPUs
      https://git.kernel.org/powerpc/c/c2296a1e42418556efbeb5636c4fa6aa6106713a

cheers

