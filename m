Return-Path: <linuxppc-dev+bounces-12677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965FBBE2B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 15:21:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgKf36mkkz2xnk;
	Tue,  7 Oct 2025 00:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759756859;
	cv=none; b=kR3zh5PoObEygY8Azfok0l5UCd8dIUsxlEOh8pLi7WHgj06R4JjKKHdBaYo3JKahcIic5Wl/p18oonEH3Qehs4kNd0/E4X1zkd3mMX0xRsC2yPXVbZv0HygYTlUP7FCOT/HpM65q/fCxki83nRZRzonEe74/pz1NgPr+CNX0LTyTMpw9BUnkxaZpfzcAnsokbnvbzOwuYttlTc5sc2YqR40WzENEXdsP4b4gjlJipq1rYj1FSCfi9JZaYthuiBbLORDJbRyYx3DtalBw5HcX0GBfvqbdy64DppxvSGQhSLfycrFLCGCWfdI1nnjmibphOzRQE1f54F+m2X+NP2znmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759756859; c=relaxed/relaxed;
	bh=Adyqo2RDwH7Ji7GzTgMHXn7nNzgmOFeaUC9MXOMqYWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyOrz09lSlVE8Foj6KiLZzX1v0KWJUUphz0VCAHAVDj44fGDJA8LVU5/dsAg9iAljS8BVw3C9WH6ltmgbbYZdZgAc1hpBdyddZkfJHyHSNWGmJc0KoyVJvri8dbt2uSa6dRd6zQBaJYL+RuLpFechNVg1yhbK374GFxnr/Dt3Q+sU4KK9hXpDNP234UwESMLocYyqUCe1glj4ZMn/Si9urtf5PAI+fY4FZWxJTIwnlKElGIXDViRCR29PeOOZ8rwiXM/HfDhPANG0Iv2p4OS6Bj5yzc4wH43d0dPUgUGToeQwLWoV4oYMLO9YGtLitGty9iQMISi5VLKr+jgzyUGHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nwJi8nhR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nwJi8nhR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgKf24KXlz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 00:20:58 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5967RPwa007333;
	Mon, 6 Oct 2025 13:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Adyqo2
	RDwH7Ji7GzTgMHXn7nNzgmOFeaUC9MXOMqYWQ=; b=nwJi8nhRYJhBd+wR+MBQEb
	d1naO4IL/m8uyNsy3cYmE2TE2Cqc2pIhpnUEfdAEALgPWg/xouAxVDKCoZRgcsUM
	2o2OCdSX9qfPzDBurB15letIjfVwd66MQNC/AQgdRRKg0y7Lyw5vdouy9mP8xYUh
	M8aYGL4fjXKLFveLCXgKZSGiFqCRmt1IpfDyzMUN4qV6zs6fTnxuzpSgiNlxi8Uk
	14Mdv7h2hIOvyS9lLogqMIJqk2bKX7q1hFAZXefjiX17PRjynONzaJVNAMgZiXga
	mKmlHRbErVpAO4Shd49DSIQgSbaA5pNNe2dlo47z/9oC8210NMnggIYi8F2fI6hw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49js0s9d5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 13:20:29 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 596DIfI4026620;
	Mon, 6 Oct 2025 13:20:28 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49js0s9d5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 13:20:28 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 596DCq4S028041;
	Mon, 6 Oct 2025 13:20:27 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49kewmx54p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 13:20:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 596DKPhY10289608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Oct 2025 13:20:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF31220043;
	Mon,  6 Oct 2025 13:20:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5230420040;
	Mon,  6 Oct 2025 13:20:21 +0000 (GMT)
Received: from [9.43.4.184] (unknown [9.43.4.184])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Oct 2025 13:20:21 +0000 (GMT)
Message-ID: <17f49a63-eccb-4075-91dd-b1f37aa762c7@linux.ibm.com>
Date: Mon, 6 Oct 2025 18:50:20 +0530
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
Subject: Re: [PATCH] powerpc64/bpf: support direct_call on livepatch function
To: Naveen N Rao <naveen@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
        Jiri Olsa <jolsa@kernel.org>, Viktor Malik <vmalik@redhat.com>,
        live-patching@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
        Joe Lawrence
 <joe.lawrence@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-trace-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shung-Hsi Yu <shung-hsi.yu@suse.com>
References: <20251002192755.86441-1-hbathini@linux.ibm.com>
 <amwerofvasp7ssmq3zlrjakqj5aygyrgplcqzweno4ef42tiav@uex2ildqjvx2>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <amwerofvasp7ssmq3zlrjakqj5aygyrgplcqzweno4ef42tiav@uex2ildqjvx2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e3c21d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=DZLZDooBFCjsWUrdwfsA:9
 a=QEXdDO2ut3YA:10 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: 9bb_aLzmcPSvXKCGBvozPZOBFqkT_dAR
X-Proofpoint-ORIG-GUID: D8iz1VRdcHOatwH3KohDk0_uNtOhiBB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDIwMSBTYWx0ZWRfX7YUmjwQnbUqn
 HhX64a7FtyNfRjw7FAh71FGVGr2iK2omaWPyAloKuVOkG4qnZTq05EOUKkDy46nMvPX+0GdLUsC
 iJCQHHunmA7M4C8/a3q8Ewpl83hrxCagjLEsIvZ6hFXT4fOMM7m8yVgqeeMMcMpTyR/fY+F9d4R
 u1V76Fligboasrgt7YTbSMuDeqOJszb4y1hLy5ASJnOk5UohnYja5NyJuwnbpXrxFoagzG2CaLp
 O88T2ZCPLmgbm2Lk/gaSA3DDRnr9Yp9jOW/ATQHH9ESlp9KcEPXZHCHzZyNVAz7oupILU4ggrkj
 EGlz3YZaTXElefqikE0AAXp2QCwHpGinhLyDEOy1kPNXWVUGQjeTL/KTGlCWgm2HG7oUFlMJ9vS
 YVWW7Gvb3N1asuzkYinYMNStadk+Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030201
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 06/10/25 1:22 pm, Naveen N Rao wrote:
> On Fri, Oct 03, 2025 at 12:57:54AM +0530, Hari Bathini wrote:
>> Today, livepatch takes precedence over direct_call. Instead, save the
>> state and make direct_call before handling livepatch.
> 
> If we call into the BPF trampoline first and if we have
> BPF_TRAMP_F_CALL_ORIG set, does this result in the BPF trampoline
> calling the new copy of the live-patched function or the old one?

Naveen, calls the new copy of the live-patched function..

- Hari

