Return-Path: <linuxppc-dev+bounces-12057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEDB54147
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 05:57:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNLGL2TRHz3cns;
	Fri, 12 Sep 2025 13:56:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757649418;
	cv=none; b=niR4WDSYusJvjJzLeUB/0tI13l2sVFN5rjAvypDK3shYiAB+HyIZ+Itr+ORKhE+C3nT2Uaq1LklX7AylGpto1ba5l+yVK3PwuB/9JLJnrhIBQTXx2TZrtK5bM2MxrRS8X/1Yh03E3NzGsVCcepY7PylCC9UxCZqfqEF6OPkuosN2nw48Hn0i+WiWle0iPxllyItwnOv0OOm45XYKT5lSIJC1u15jNNHDSmdAmMWRMKAaSgCmNxfhw0Ml7qFUWVCEUeppIfWafRRQ+bF8JcYRdNc0BRZs71qtTxdL0D++UtfBGTJJjsve4Dg4PZRND4aXn1EZV0Ti7pgacdffeqEdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757649418; c=relaxed/relaxed;
	bh=PrHogMU41dlBVB//0xF9JvxaxOCwljW7x6kJLn9nQ3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nhwayzSgh2JcRsMrbfDXLx5WunYQuV+wEp6et8wZHYP4UBUhr5yje73CN//GHmEJgUzPCP/0DQ0Y26rVqUxxUj/lQDuyZdak9pMqqz6OQjw9y2jntJgphQIDzsUdKBuowj7xohCby93xIXwvknfTZi2UsNk/+c2kSoHwFC4vzou/H4L/hHG4P7Ke2rdfz4+A4GZjXmPFT1gB0KTRqaT0PyayOFHLUqXnjX/MXHSw+pUrNwKMWRKBF4smNyqn3nweH4XZqa8+j2x6Mi+LuxsL13pWMroSnnvmvelPvbvNdIbN7FuxEut2DqGnT8+vw7D18/M+4N5m020Pc/sJIx325Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LX0Sr5GC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LX0Sr5GC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNLGK436Hz3cZx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 13:56:57 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BMC9vx020534;
	Fri, 12 Sep 2025 03:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PrHogM
	U41dlBVB//0xF9JvxaxOCwljW7x6kJLn9nQ3g=; b=LX0Sr5GCZbMVn/g+LauJIY
	qL6OwuSBv7xy68rFOqL6BX2anRbsl8ixWcqZzLcHgXyyq5OicCeghLiYAhGIl1I5
	Y/OlJcGZyf1BTKBGSsPeGVEQ8g2BF63NsMObLR+YmPfchdJ6HV5cKxclzU1YxOmF
	UQpY9inLGM15XuQbIoUVLhcceF0gYh7rBxdE6OTofNLlatA+yzR0tMbziKFLeV3X
	e05Y0P5NJBkOxyQDnYhNvS9f8Z68YI0M98sqxS8qq7qG/dbWv69ao9U6loRrEZUH
	g8q7FzgcfVMw81Woj8KGC7fYnOTruhZheRxL7RPQnCIYPjaEKpAiL1is4Trxe2Ng
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx9013-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:26 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58C3t4vJ023762;
	Fri, 12 Sep 2025 03:56:25 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmx900x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1ifaZ007895;
	Fri, 12 Sep 2025 03:56:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109q11e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 03:56:24 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C3uKn456230360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 03:56:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B8FA2004B;
	Fri, 12 Sep 2025 03:56:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEBF520040;
	Fri, 12 Sep 2025 03:56:13 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 03:56:13 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, mpe@ellerman.id.au,
        npiggin@gmail.com, memxor@gmail.com, iii@linux.ibm.com,
        shuah@kernel.org
Subject: Re: [PATCH bpf-next v3 0/4] powerpc64/bpf: Add support for bpf arena and arena atomics
Date: Fri, 12 Sep 2025 09:26:12 +0530
Message-ID: <175764920910.610338.6618492148160203933.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904100835.1100423-1-skb99@linux.ibm.com>
References: <20250904100835.1100423-1-skb99@linux.ibm.com>
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
X-Proofpoint-GUID: RZT36PBqIzol4GxpIGDrRZZfvntecn7l
X-Proofpoint-ORIG-GUID: CCQzVuEKXN62e_0pPcEIHssxkogmdAnM
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c399ea cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=PIuWED_YQay8gXFd4KMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfXxCDChkiMf+hS
 OMWFchcLm2q4tXL4Yzv9pYOwuZJxO/WnLI4dHsPxfmnA9Mb9SU/jBdfHnQJxcTZRGaYDlxMt0w1
 fx0mkII9CB7aGcJRL0JQZkGKd9Jqx6ZXlWjjNfdGgyYDF1DAwZgMIwadryP3D8LGcrz+cUJy2Np
 4qhHx4nwvE22E/l8vrzjofrlce4jfIiJcOr1TlMwdvldfOfJg+A4umyT3lbjLvXWkdqF0NerwkE
 HLmKUV+67QzYHQhORLdzrnGWhft3l84uevjHaLYxCfNCw2uYXFyEOmu7qogOIFtRU+DwxX2h1kH
 IHK2WRuoZeKq3mUKdmcAxrtptkmTB+yPXTJZFIUDC/gF7ueJZL9CrywrUjlp5FgTVWPTLh5eC0J
 7W4RXILw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 04 Sep 2025 15:38:31 +0530, Saket Kumar Bhaskar wrote:
> This patch series introduces support for the PROBE_MEM32,
> bpf_addr_space_cast and PROBE_ATOMIC instructions in the powerpc BPF JIT,
> facilitating the implementation of BPF arena and arena atomics.
> 
> All selftests related to bpf_arena, bpf_arena_atomic(except
> load_acquire/store_release) enablement are passing:
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc64/bpf: Implement PROBE_MEM32 pseudo instructions
      https://git.kernel.org/powerpc/c/47c7f3b7038787ee42cb9ed69825e6790dba9410
[2/4] powerpc64/bpf: Implement bpf_addr_space_cast instruction
      https://git.kernel.org/powerpc/c/a2485d06cad3741303b9414e44f9b6d76d3713f2
[3/4] powerpc64/bpf: Introduce bpf_jit_emit_atomic_ops() to emit atomic instructions
      https://git.kernel.org/powerpc/c/45ed2e8b0591eb6211d79f436f76c3af31e626af
[4/4] powerpc64/bpf: Implement PROBE_ATOMIC instructions
      https://git.kernel.org/powerpc/c/0c1da35b0188dd565cec907a16cb5d1bd425e0e4

Thanks

