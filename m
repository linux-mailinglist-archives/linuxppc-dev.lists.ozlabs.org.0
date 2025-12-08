Return-Path: <linuxppc-dev+bounces-14690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46DCADB34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 17:09:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ6P56bnxz2xKx;
	Tue, 09 Dec 2025 03:09:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765210153;
	cv=none; b=kEvFwyRbJ1TLw8Ou75lGVh56tDWGvfMEDyffEbnX2jmvaxofSPVePBxaWci8nNKzSVBOUMUay1SkzBcxDhwP4ocs7PrZ3hmrmguYLgtgETkHp/bKrWzBahDAM9KcfLDnT0lVwbmrU2hzWCVz/7OWI6kFiwy07qeB9FXTAONikgqT+WD15b2o1/UbaDsiUlXmaCXUwTVgHJWVTdS4f+oNvbD6LrdOzwUmaHjD9xRm0S1HCUToQZfY8TooHwDBFVwgNZk358x6wqbVY1LuwbXSJwT6KMDmP6WFwkKWz7Ttg2zNTWZAo8lyGxj7TsCFJsH+0OIBC8RewOLm56PZkSPS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765210153; c=relaxed/relaxed;
	bh=iilKg18ysnmI4ONROC9vF2l+9+u4XZIiuBwCGpbDEgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vcxyd2C76l1LxBfACdLnTpCaoqtYp+yP77hVKGE0PSuH9tqVdxpqmtGVgvBt8tZe8zf35RF202a4xDD8G+vo6LAHXvz2XJPu//a4hieP4gwIaTAHAoO5ELmv/jEocHVTLXJYAba+b29vv0+ZjyecRDqufRuBwD7W7tD1+eyZB1Dp5q+z9lAb+VrIxUttuatz7Pr2RTb2Fbj6HTiZvA/NLZcIu415KOEQK8FdqMXbftNpbm4N0uy6erPVC7Dy9KVswmzGYGabAj0HQd4C/0dSN0BTWFBwITDLFdNq/Pq8sMtiZcLOgOjheQZW+j9Uy+t4Szo9Ptx9kQbWYOF8MLwQuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=giBTBVFx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=giBTBVFx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ6P45gBqz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 03:09:12 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B86DSJx014598;
	Mon, 8 Dec 2025 16:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iilKg1
	8ysnmI4ONROC9vF2l+9+u4XZIiuBwCGpbDEgg=; b=giBTBVFxTzhTFiCP2XdhJ1
	CR1fit3AmQJqI1y/nNr9hb/jKW8odZM3EIt4kn8IZzIhiIEkSxG0B+FtE9/VbFG+
	SKzws/a+lV/js3DYIyJFKhnYTRa2INkCaqC9ROuPmj8lMQLcBy2DJFzhHxVibtCz
	nz1aodxs3vMaK/+IvpPNcaw6BFgjBYFMi+m3yHpzU/WaqsJVKhSHpp/QZhcW0IqZ
	KB2TGtD1VgXPx/jfIYcJvwKcQYGAPfxLCF/gGABxFhEQRBf89K440C52bGRJ2TGn
	L9WRBVUM5OSCoAtTU2gfGPE5BZukphlVXUe0S4e3UU3J5CO1KrnY8SKffhdpQeSw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc5383fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 16:08:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8FdFEG001998;
	Mon, 8 Dec 2025 16:08:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw11j6a7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 16:08:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B8G8nEX55836948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 16:08:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C60E20043;
	Mon,  8 Dec 2025 16:08:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C4D220040;
	Mon,  8 Dec 2025 16:08:47 +0000 (GMT)
Received: from [9.43.1.23] (unknown [9.43.1.23])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Dec 2025 16:08:47 +0000 (GMT)
Message-ID: <874f8ec4-4f3f-402d-a9f2-4267d37a5bc9@linux.ibm.com>
Date: Mon, 8 Dec 2025 21:38:46 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] powerpc64/ftrace: workaround clang recording GEP in
 __patchable_function_entries
To: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-trace-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev,
        Maryam Moghadas <maryammo@ca.ibm.com>
References: <20251108210405.2375472-1-hbathini@linux.ibm.com>
 <20251108210405.2375472-4-hbathini@linux.ibm.com>
 <sjheprnafkraauotmi2fwjz6l6fha5te7jdp74t4zfh3jvs2if@vjpey276fsti>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <sjheprnafkraauotmi2fwjz6l6fha5te7jdp74t4zfh3jvs2if@vjpey276fsti>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX9VNsTMEkm0V3
 acsg7v1LTpLHtW9U1nkuRwh/sSfQ49XoY6HPI2267UdlTK7KkOM1vN7aRVq9IzbGlxSDf7iFNgr
 VYgv/k7Mstt68u3/Xa2UlCWSyYER6IDKDxjItOVdT7MBzN0kfY7j7DGbWUEbSHuKUZw8cqMN4RM
 VPRqb+diMMxpw2/3aXXfQvA7+IFN+HAdnCVOETLOz3iMTZ32DCpoUc/yJHsFV831aE9WN0tBgA/
 3CL06XiUmzNVWu92c+MAzm1zgZuWnyY+RbPodBqI0NJUqHc2xHExyZJ2KRN0ahJN/eX8KIaO4h9
 LJWQL3o4+7mOQM7tuy46q+MvJ883LTsrtzmr0A2W6W2+Ugw0a74+N5aqwKlId8ywLIS3hlaiZO0
 VVD6jffw16hRmjvkomzbisHCbFlmRA==
X-Authority-Analysis: v=2.4 cv=S/DUAYsP c=1 sm=1 tr=0 ts=6936f815 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cFmaXs7E2_rN6eu18uoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nQw_vPY9gvYZw9Fvk4z581Q2D8Yku0B-
X-Proofpoint-GUID: nQw_vPY9gvYZw9Fvk4z581Q2D8Yku0B-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 24/11/25 11:25 am, Naveen N Rao wrote:
> On Sun, Nov 09, 2025 at 02:34:05AM +0530, Hari Bathini wrote:
>> Support for -fpatchable-function-entry on ppc64le was added in Clang
>> with [1]. However, when no prefix NOPs are specified - as is the case
>> with CONFIG_PPC_FTRACE_OUT_OF_LINE - the first NOP is emitted at LEP,
>> but Clang records the Global Entry Point (GEP) unlike GCC which does
>> record the Local Entry Point (LEP). Issue [2] has been raised to align
>> Clang's behavior with GCC. As a temporary workaround to ensure ftrace
> 
> Any reason to put in a "temporary" workaround rather than waiting for
> this to be fixed?

Pushing for this temporary workaround as the fix ETA for clang is not
available at the moment and the temporary workaround is likely
harmless even on a clang version with the fix included..

- Hari

