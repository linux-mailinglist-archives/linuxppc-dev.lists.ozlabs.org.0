Return-Path: <linuxppc-dev+bounces-5358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF5A14F32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 13:33:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZJzw52Wzz30h8;
	Fri, 17 Jan 2025 23:33:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737117196;
	cv=none; b=ZyZxM769ng0EEcNRYsM0IcqKR9l3cLQZE/HOtUPAhseqhW8SMB5qiy+57tHJETA6V5E0A2HTpJ6N+3fZ11JQLG2W3G0XyhPtpkdSTA5+6kxghpOrJcMDKOkYdpw53yaqqd7X/7+1Mpy5ZQvUxi2oSzgVS4rZLqkXhJF1gBKemN1ZWo8Q8wQSbb+MqaDGbjHv/5g555sGUG4atPADLw5Cn1so3t1m+6CsIger0dPWNbTcBUxiOwXM3es+x+e4ezxKj5joMdoGdCzEKsYLKMA3ZeqPtH/FR9ObW9Fwd5Gcell2TERWFNSXPBEOZEKofWOXUu6s5sPikBk8yUEghAIX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737117196; c=relaxed/relaxed;
	bh=zmN/heHJ8TVcTk/DO97KrJoQvqXuwecFtBt991cNvOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fphZ+dyUsvf1Q0YmVy1/Zo0SL8QllR+D9xpLSuTkmVLTpJFDBEIo2yjPm5HB8q2sYQvNVQzlFVrctKizOzF7zeWdZ9itBHGheSSMbWROwJ3FbR+60RaQqC41Gs4WgyOQcRIS75hQ97cqgHP7MjRr2gvgoKzDWiAd8h3e7DxCBNv54JJ5AGWiTBBhsY5t+SLpKHDyr2831Blvut+TN8PVsM6qjyjGNfeaJuIudtMxlAmDxU57Ncno9ogpzQmtYtiekZVSq5x/huFpmGUanPvt1BCZfBbb+8UQR7A2uuNbOCqQTDaNenTl++KV49ocSTt5HP5L7fycxYX/0e7/WQFLTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WaIQ3n2Z; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WaIQ3n2Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZJzv5Xdzz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 23:33:14 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HCP1tl009180;
	Fri, 17 Jan 2025 12:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zmN/he
	HJ8TVcTk/DO97KrJoQvqXuwecFtBt991cNvOw=; b=WaIQ3n2ZDhEUrbs7sp/VQ2
	TEOqD/J8O9e/62MnjGD/gv8uvUTsBk9JIlKxMiNNFf3bHLIaEnKk158SE7tYwToL
	Av4zOSknQiiGwzwPLRlsu3gOh4x6KBdHz7s7PU8wMcGxfj2vwAbCdsl3BI86faqw
	v23b5kmL05/MyOrYkIpKROvy59AMtBdSGLPZYyl0OwGp8sCQ5C6xSxZPXevn5AUl
	Mhdkp810BlLH9DbsD0qQObRukSJRI12V3GIPHfgtKoO9NnSu4SfM+x9HXJM4auQQ
	+u3y3zlBdh7bWOoMh45bMOR3TSwz0m7lhTxYcliyP8vu/8yUufnFZnejcSS9lQIA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 447c8jave3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 12:33:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50HCUfk7016824;
	Fri, 17 Jan 2025 12:33:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 447c8jave1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 12:33:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50H96wD6004526;
	Fri, 17 Jan 2025 12:33:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442yt32ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 12:33:02 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50HCWxSG55837026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 12:32:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 309B620043;
	Fri, 17 Jan 2025 12:32:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFE5820040;
	Fri, 17 Jan 2025 12:32:56 +0000 (GMT)
Received: from [9.43.91.217] (unknown [9.43.91.217])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Jan 2025 12:32:56 +0000 (GMT)
Message-ID: <6429f8de-91ba-442b-a39e-f12d666062f7@linux.ibm.com>
Date: Fri, 17 Jan 2025 18:02:55 +0530
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
Subject: Re: [PATCH v3 1/2] powerpc/fadump: allocate memory for additional
 parameters early
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20241113070618.75744-1-sourabhjain@linux.ibm.com>
 <e5e51680-0e66-49ce-a523-1eb9d570e43a@csgroup.eu>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <e5e51680-0e66-49ce-a523-1eb9d570e43a@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: be5ZqCnAAHR2ktiDNJgBSS00GkVhPI3L
X-Proofpoint-ORIG-GUID: TzkVbvhksyjFnNTzmkQ2boZ4Udu5Mud5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=731 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170100
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Christophe,

On 17/01/25 17:43, Christophe Leroy wrote:
>
>
> Le 13/11/2024 à 08:06, Sourabh Jain a écrit :
>> From: Hari Bathini <hbathini@linux.ibm.com>
>>
>> Memory for passing additional parameters to fadump capture kernel
>> is allocated during subsys_initcall level, using memblock. But
>> as slab is already available by this time, allocation happens via
>> the buddy allocator. This may work for radix MMU but is likely to
>> fail in most cases for hash MMU as hash MMU needs this memory in
>> the first memory block for it to be accessible in real mode in the
>> capture kernel (second boot). So, allocate memory for additional
>> parameters area as soon as MMU mode is obvious.
>>
>> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for 
>> dump capture kernel")
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>> Closes: 
>> https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> Version v2 of this series was applied.
>
> If needed, can you rebase this patch ?
>
Sorry, I didn't get that. Rebase on top of which tree/branch?

FYI, there was no functional change from v2 to v3. Only a
"Reviewed-by" tag was added.

Thanks,
Sourabh Jain


