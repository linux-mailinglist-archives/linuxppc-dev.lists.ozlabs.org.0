Return-Path: <linuxppc-dev+bounces-1683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1832989A2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 07:34:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH8sC1sMxz2yLg;
	Mon, 30 Sep 2024 15:34:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727674478;
	cv=none; b=j94SN/79t0DzuO9tg0Gw6buyG7VPcuL2Q6N/GWtkaw28pUWPM/PgFUL0Zm8A5RPpcngSeG4Rcva8zBCnv13B66fqch12OYIYUwA3tQItsJBKaCtdpMXiC7gN5CqGAikundxMkbIeKEbJaq9sNThPr2VFaPzst5MBRueGET5kdWrjHzxQx8wcE/QCiS8Elnr6Gzp7Ehx4UfVPDqbZ5Z/16TP/vTJ/4RTyz8WbE1x8WoSpef2B5YRsNLTY8Fsh7JYJpRw5fU9NdTV0pBTI11Oaj0RxuT7yhBDRvkjnVKkaIEoTFT4JDhjF3/e2BHkrkCPKjzKHHJu0iDDG4+7dxPkvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727674478; c=relaxed/relaxed;
	bh=cgkgCdD8MJY3Rd/1F//mH53/BFW4BMvD0+YrzQ8BWS8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nh0FmaQpLJFXG2svc+OZZTYK17w0LEaid980gBa6jqLEzFRu+zFX2/xBXkayKzThRaga4cuyxsA7paS93LlubI8cOeT/j4/sX9oXM1ZpLhYHFSFyZ/jeItMneLqV36UDpfzm9bCpeG8St6Sk0SkRm79tYp3yjsBCN/dsBH9t/ZhlFD07iq3vqZbFcFFn19l2vFy6S+WibPa7JezqmUGptQrO59Jt5hqIbgKRJhti7/NCh/R67j423pUQjEdzrOQj+EzKZ314EBJ/XSLxTqx17vSGpBFBUJSB1GZMQDGnBkwOiVDpfiD6or070vc64IpTzvSnVW15aTx4Xvf/GyBl5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lAtGeCiL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lAtGeCiL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH8s923JQz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 15:34:36 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T9wpCw010857;
	Mon, 30 Sep 2024 05:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	cgkgCdD8MJY3Rd/1F//mH53/BFW4BMvD0+YrzQ8BWS8=; b=lAtGeCiLfDF5ICoA
	W/mu48Lb0LwwBNe1SEUwx+ycS2Sln7JFrWdAEvMWcIBZfe8VVSCb5NxFDff5Ki29
	46vTBKPxNg2OTEv0kjS/JG5MBcqoJnnhGIoplKIiGRGjIreCL7gn9H2l+9VdFJcU
	mh/0+j6mfJjQPmU3VlZbmxaK+DGFiL3ZZcpy9sdmg6zdnQLxUC2YH/YoTvnRZlu7
	4cmDSioTImUy6N4nfiFFI4NHpmw8dCdHLjZcjpyZUks1cm1YpAIAD+KUHd03r8Iq
	axtFCJQyMLrDNqGGQ868hFDMJvw5TjlK85eFGNXzHHOTbKs2rTtbATHwUWAwhbTq
	XTw5Aw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41x9f7ydhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:33:48 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48U5Xl2g008425;
	Mon, 30 Sep 2024 05:33:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41x9f7ydha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:33:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48U5ALJC002386;
	Mon, 30 Sep 2024 05:33:46 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41xxu0vekq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:33:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48U5XhcJ47644978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 05:33:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34AF920043;
	Mon, 30 Sep 2024 05:33:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9959D20040;
	Mon, 30 Sep 2024 05:33:39 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Sep 2024 05:33:39 +0000 (GMT)
Message-ID: <32249e74-633d-4757-8931-742b682a63d3@linux.ibm.com>
Date: Mon, 30 Sep 2024 11:03:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf <bpf@vger.kernel.org>,
        linux-trace-kernel <linux-trace-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
 <20240915205648.830121-18-hbathini@linux.ibm.com>
 <CAADnVQL60XXW95tgwKn3kVgSQAN7gr1STy=APuO1xQD7mz-aXA@mail.gmail.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAADnVQL60XXW95tgwKn3kVgSQAN7gr1STy=APuO1xQD7mz-aXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wetF4buMaLPTrBakXdZ-howbEduaj1dN
X-Proofpoint-ORIG-GUID: qkAqFR7ZS0h1tu3GBp6zr4aPrEqa9AXK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-30_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 adultscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=910 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300035
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 17/09/24 1:20 pm, Alexei Starovoitov wrote:
> On Sun, Sep 15, 2024 at 10:58 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>
>> +
>> +       /*
>> +        * Generated stack layout:
>> +        *
>> +        * func prev back chain         [ back chain        ]
>> +        *                              [                   ]
>> +        * bpf prog redzone/tailcallcnt [ ...               ] 64 bytes (64-bit powerpc)
>> +        *                              [                   ] --
> ...
>> +
>> +       /* Dummy frame size for proper unwind - includes 64-bytes red zone for 64-bit powerpc */
>> +       bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
> 
> What is the goal of such a large "red zone" ?
> The kernel stack is a limited resource.
> Why reserve 64 bytes ?
> tail call cnt can probably be optional as well.

Hi Alexei, thanks for reviewing.
FWIW, the redzone on ppc64 is 288 bytes. BPF JIT for ppc64 was using
a redzone of 80 bytes since tailcall support was introduced [1].
It came down to 64 bytes thanks to [2]. The red zone is being used
to save NVRs and tail call count when a stack is not setup. I do
agree that we should look at optimizing it further. Do you think
the optimization should go as part of PPC64 trampoline enablement
being done here or should that be taken up as a separate item, maybe?

[1] 
https://lore.kernel.org/all/40b65ab2bb3a48837ab047a70887de3ccd70c56b.1474661927.git.naveen.n.rao@linux.vnet.ibm.com/
[2] https://lore.kernel.org/all/20180503230824.3462-11-daniel@iogearbox.net/

Thanks
Hari

