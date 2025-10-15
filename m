Return-Path: <linuxppc-dev+bounces-12924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5DBDF8A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 18:04:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmws25flSz3dRg;
	Thu, 16 Oct 2025 03:04:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760544294;
	cv=none; b=i47RVnfibS0kyhQOIpTVQCu4MAG3DiXrFILEaQan13BlM54ePJeaHfh+ChWdwpd3J6tgJrnEeuhmPpANCeMx4TyV3MtRIluYtTXAyk8Hy+xhDFT58WojhuupHt4PScleOOeu5ROAEWkzS9rVUS+r7Ec5ZR020AU3ALFSfBT9s14WR4ygo8ZkFl1wnfzbrd+NFsf7p50N218KQoquJQZhFJIRDN47BEzJLwiY9sMnphHlBjDh/ZB9h1WespQa0syUWpXc9u1Nxerq4ueTZuAPwpkAmFquxvpnC21jxe3lxvBF6eonrNnfWD/e2pEg7Ezg8ry+j62CS+YOuxolc0xXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760544294; c=relaxed/relaxed;
	bh=5opmQQrcs+iQAYIWBtfey0J/RoSdwtl4mYe2y0r2Ztg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKR8kc2+hT9fLq+EhATW5wNYbSc3I5lG4DnKgeuox6WNOE+2BaOaB2n8b9ypE7le8nilfbZaNrQbEEXmAw1Yixrpje1lKJykiJyYJUz8NrLZzo83bEkrZFAvzXlfszKd9liKvuFl8zowXJGhuJ8Ti9Y4ffwKkt7Ml1T+E3gU1jGyK02MplN56SHh616cSUAk6nrQaOY4FTYxUMj1rAMSPp8m6MWTBXB86X86GKOcxxJRfNhKtepDf+4khv88md8Ce6lxboKfxRDYMc4uFzjuVzgFuk1wCsGzezF6+37Rs9dATWbyWFf4qy9JHJL3dKNsdWkM5DmYwSHD4Qq/tQWkbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTMYRDGb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTMYRDGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmws14MF1z3dRb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 03:04:52 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FDhs4b001980;
	Wed, 15 Oct 2025 16:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5opmQQ
	rcs+iQAYIWBtfey0J/RoSdwtl4mYe2y0r2Ztg=; b=DTMYRDGbbruCsK1hiGXePi
	NbuXJV52I8gbDdNY9W5EKuZLmSAQBDEHUcH2r6peMBVF2Oh/kCdqsMc6mxNJQeGk
	Aw/B6GpRKQu9tbPPJPJ5RcRbuXlQxkNIz3azQRk3KPsJdXHGfHlzxPt5XjgVOFvx
	BQ0/nhlzIIbQQbXnf7MtSdlfo00TmjjfcvDlThYf6U71fY5o3fDsIjTJh+vcOdIU
	dYavP4hNgCW5L+atWQrgXhGeac0cJhNwANNxfuvecdQnBk3x2YFd+dKpK2iMiVYX
	HZrFxNrwGZjChtL00YRH1UN34CxwbVQLSiBfOUaLpbw6E+d0LxTAOcF+Z6tH/v8Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp80e96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 16:02:30 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59FFxv93008767;
	Wed, 15 Oct 2025 16:02:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp80e90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 16:02:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59FDu6dv003626;
	Wed, 15 Oct 2025 16:02:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r1xy1a38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 16:02:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59FG2Pc631261170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 16:02:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D48E200E6;
	Wed, 15 Oct 2025 16:02:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34465200DB;
	Wed, 15 Oct 2025 16:02:11 +0000 (GMT)
Received: from [9.124.218.242] (unknown [9.124.218.242])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Oct 2025 16:02:10 +0000 (GMT)
Message-ID: <9901f2e8-653e-42f4-9344-03b2f70846bb@linux.ibm.com>
Date: Wed, 15 Oct 2025 21:32:10 +0530
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
Subject: Re: [PATCH v3 05/21] paravirt: Remove asm/paravirt_api_clock.h
To: Juergen Gross <jgross@suse.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Russell King
 <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, virtualization@lists.linux.dev,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-6-jgross@suse.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20251006074606.1266-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9ZUK4UeNEA3M63-5xIUdjnNRJmI9KQSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA4NCBTYWx0ZWRfX90a/KFqHOFA4
 3LTXuANmdsGxWyQx7Ukevm3RyFSkQJ9pXc2oVr8K5uv/q7SJflj3vhk6rgQPg5a2e4JMHRcokhT
 E+w6CfzUtDgCzNqO7x7Qz0iPi2Udyp1mB5qOlV79KYdYo8wEkzexJTGI0NvxBMb9zp2anqktjy6
 x7dXmTESXxwuIWmKuQwlY9VJQdv5AweqVNhod++KR+c5UndqULhfyI4H+V7In+JTOm9GWN4E92e
 bZgooNZopePk7kVmv+pt2VQaWzIRRgwHx3+Ivefade+IPstSVao1M49g8pQuFBZku8ozOWBjVco
 XGxbdE4m67DWVP6wWkyIRV4aUp8gC4N6DdEGT4oMISQu4RWJ20yslN8ham/g8aBzCSTrxBcUSHp
 17smtvjqfZzcfkxRb2PzijiKsYbetw==
X-Proofpoint-GUID: dV8tQT4HDH7j4wsc4MFx6qXJyZuneU1L
X-Authority-Analysis: v=2.4 cv=af5sXBot c=1 sm=1 tr=0 ts=68efc596 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iox4zFpeAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=RR7mTWzPQ-4l2d7n_HwA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/6/25 1:15 PM, Juergen Gross wrote:
> All architectures supporting CONFIG_PARAVIRT share the same contents
> of asm/paravirt_api_clock.h:
> 
>    #include <asm/paravirt.h>
> 
> So remove all incarnations of asm/paravirt_api_clock.h and remove the
> only place where it is included, as there asm/paravirt.h is included
> anyway.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   arch/arm/include/asm/paravirt_api_clock.h       | 1 -
>   arch/arm64/include/asm/paravirt_api_clock.h     | 1 -
>   arch/loongarch/include/asm/paravirt_api_clock.h | 1 -
>   arch/powerpc/include/asm/paravirt_api_clock.h   | 2 --
>   arch/riscv/include/asm/paravirt_api_clock.h     | 1 -
>   arch/x86/include/asm/paravirt_api_clock.h       | 1 -
>   kernel/sched/sched.h                            | 1 -
>   7 files changed, 8 deletions(-)
>   delete mode 100644 arch/arm/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/arm64/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/loongarch/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/x86/include/asm/paravirt_api_clock.h
> 

For powerpc, scheduler bits

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

