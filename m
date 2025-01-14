Return-Path: <linuxppc-dev+bounces-5257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55517A10F89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 19:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXchT6Pv4z3bTH;
	Wed, 15 Jan 2025 05:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736878441;
	cv=none; b=h3/dbKPV5/+d5fNJSMlyKlKpUZDjWbNpn29sC1NLjhqPdxk1imIzqez7/jGUKTuJFCKU17g2ztHfSJyhLoH+glO+H6F9OZvk7nVUUAxMizaFjAsZJUpdBpB0pgHxsUcGYS0ZJnFn4XtNly/lHkxi4/qddzopf395VI1JXwdQCXPTyou1I4gUhQQFIIw+sAT5rDHBu3SC2aOyX/QDSMnMzi3UCWyJXvKt/1k7RVhC2nrsvCs61LUZl89G0Uyt0oT8/yCjfzWpA1qs+Nq0447GfJKbK+fqBdI55QGDltn2l7V8XdrHJP3gNwiDcbB7dsIi+SZ8wF2c91de7XBFaUc1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736878441; c=relaxed/relaxed;
	bh=WU5eqS9yPmgNSXNtxqTWkw+t7NKW6A6IxA3jZh2luO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZN3TuETgiRJScVyg1U9RbdXOyDcGUuGEXLDm9oRy9vZiNcsbmsxxoVkcRIWLYrZ/rqIhZ4er62gFcoWB/2aw7gOBmRJhbyMdULBYnT/ELA+rNTGhKCnPovF6Ly64ahqh8Bt3YAQQrv+NhIc8mI67OpcXJ+mz+HP91EEPdepNfzr8P2cD6i3JTMF8PK7G30y3vk7c1oKqSQ0dlV6KgUrJomAYu4bZWrnxlT8ELX4D5ktqSk1Of36bJWkLwzOibGPn9Qy02lpu5Hcjsh4r5kquXFHB0oec6YKTcXLNe0ZLAe/M0fuwik2yGM9Ym0pkGzEaxppUWz8AYXuJslv16uKc0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FMlLVILh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FMlLVILh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXchS3Jpjz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 05:13:59 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EFUiYS020468;
	Tue, 14 Jan 2025 18:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WU5eqS
	9yPmgNSXNtxqTWkw+t7NKW6A6IxA3jZh2luO8=; b=FMlLVILhQ8DfAPhbYP3Jko
	Xoi+Gr7B+LVNYN3rZkaddp6fVALGGaYXctJxXAFHri+CtL6lEimfriwGwJl9mIqy
	Pmkw9hJ0LsSWpo5SnLeIknlGyH2awMpdhUvUWvArigerb/VraX/VJywnzTIw53A/
	xpAp1J53sLAkeoemP5LrNupRCeXKxxKgpeGuqeku55hrAd5m+Wh3OmRiK8+OzLUg
	YfnAbfwkTOTWRqbp8JAmiVuwoRNfl+Ck7KQANvUy7zL+cttqsfrQCUceJeXd3rDs
	ZEMskyQsQLn0bSYKZunZ2wNTrGuk1MXVf9zqjGMlyOTAi+nnyWlw2hgzVDAlX/xA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445tmggr5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 18:13:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50EIDmqO018601;
	Tue, 14 Jan 2025 18:13:48 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445tmggr5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 18:13:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50EEVIsa000874;
	Tue, 14 Jan 2025 18:13:47 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44456jv63m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 18:13:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50EIDjI827525666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 18:13:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 787D02004B;
	Tue, 14 Jan 2025 18:13:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D579C20040;
	Tue, 14 Jan 2025 18:13:44 +0000 (GMT)
Received: from [9.171.42.120] (unknown [9.171.42.120])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 14 Jan 2025 18:13:44 +0000 (GMT)
Message-ID: <15851309-1c3b-4506-b094-fd445941f142@linux.ibm.com>
Date: Tue, 14 Jan 2025 19:13:51 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] sched/fair: introduce new scheduler group type
 group_parked
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
 <543d376c-85a7-4628-a38e-52bc117258a5@linux.ibm.com>
 <27c4288d-5617-4195-8424-e6e346acefd0@linux.ibm.com>
 <4f3b49cb-15bc-43ef-b4cb-3af98c8a1c5f@linux.ibm.com>
From: Tobias Huschle <huschle@linux.ibm.com>
In-Reply-To: <4f3b49cb-15bc-43ef-b4cb-3af98c8a1c5f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nRId5-1n2RdAPYyt4nCB0oiHTy_FuuSC
X-Proofpoint-ORIG-GUID: kB6aX6py6Kjj-SFrbM2KnNW7rKSDMazq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxlogscore=833 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140138
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/12/2024 21:24, Shrikanth Hegde wrote:
> On 12/9/24 13:35, Tobias Huschle wrote:
[...]
> 
> It was happening with 100% stress-ng case. I was wondering since i dont 
> have no-hz full enabled.
> I found out the reason why and one way to do is to trigger active load 
> balance if there are any parked cpus
> in the group. That probably needs a IS_ENABLED check not to hurt the 
> regular case.
> 
> Also, I gave a try to include arch_cpu_parked in idle_cpu and friends. 
> It seems to working for me.
> I will attach the code below. It simplifies code quite a bit.
> 
> Also, I am thinking to rely on active balance codepath more than the 
> regular pull model.
> so this would be akin to asym packing codepaths. The below code does 
> that too.
> 
> Feel free to take the bits as necessary if it works.
> 

Thanks a lot for your your comments and proposals. I was working through 
them and have a v2 almost ready. I'll be offline for the next 4 weeks 
though and will post my v2 once I'm back.


[...]


