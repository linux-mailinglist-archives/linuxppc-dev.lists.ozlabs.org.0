Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199388D6726
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 18:47:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=htIUEOik;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrTYV1wtWz3frR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 02:47:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=htIUEOik;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrTXM1HRNz3fqc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 02:46:10 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VGZIJ1006114;
	Fri, 31 May 2024 16:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=ZjFK/pokSH1u/vjIDLWUHiBWlhTGV4J55bhEWPGFW50=;
 b=htIUEOiknGi0RBj+R9w8NAAiSH3mCCvngLmzk4o/zzJuSYb4Iccw02dQdilI9KsaGNuy
 /KTBIZKxmcWFRGJLgKdqFg33qg2nU0MjQIjHlJVcqru2xggXpxp0tUnQurEDfTuuJ+4t
 a7kp7PM/DEIgUKHN2qvpZxAY5UeMybbZUKKM/pdOq8Cvbn0hMXB7wDmFxPdPQL5eT9tK
 Q6cHTSHOpeE2imC09RpiQCtX5JAfAWnQ0gdqrLPcun65INb5Vxo5CzGVjnEhnabp71QE
 fnlh3k7ENjgVPeqsM9/ECOauGNIwrMjusuwCzIomRIOYReMGqQQSvy1zaiNuXOMqT1yi VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfhvcg20c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:53 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44VGjqAM021936;
	Fri, 31 May 2024 16:45:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yfhvcg20a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:52 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44VGEop3006900;
	Fri, 31 May 2024 16:45:51 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ydpebrxyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:45:51 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44VGjnOr57475554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 16:45:51 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52F9958065;
	Fri, 31 May 2024 16:45:49 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FE2458051;
	Fri, 31 May 2024 16:45:49 +0000 (GMT)
Received: from localhost (unknown [9.67.105.183])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 May 2024 16:45:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] powerpc/rtas: Prevent Spectre v1 gadget construction in
 sys_rtas()
In-Reply-To: <ZlnUaZiXM3Fuy+0g@gmail.com>
References: <20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com>
 <ZlnUaZiXM3Fuy+0g@gmail.com>
Date: Fri, 31 May 2024 11:45:48 -0500
Message-ID: <87le3q3p6r.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mN-QNzJyZ8-VD9LK-8SHyVmYoAuee8-i
X-Proofpoint-GUID: y6BiRMtiPmAFoVVn1afSp6U2KgrM6VXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=774 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405310126
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Breno Leitao <leitao@debian.org> writes:

> On Thu, May 30, 2024 at 07:44:12PM -0500, Nathan Lynch via B4 Relay wrote:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>> 
>> Smatch warns:
>> 
>>   arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
>>   spectre issue 'args.args' [r] (local cap)
>> 
>> The 'nargs' and 'nret' locals come directly from a user-supplied
>> buffer and are used as indexes into a small stack-based array and as
>> inputs to copy_to_user() after they are subject to bounds checks.
>> 
>> Use array_index_nospec() after the bounds checks to clamp these values
>> for speculative execution.
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> Reported-by: Breno Leitao <leitao@debian.org>
>
> Thanks for working on it. 
>
> Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks!

>
>> +	nargs = array_index_nospec(nargs, ARRAY_SIZE(args.args));
>> +	nret = array_index_nospec(nret, ARRAY_SIZE(args.args) - nargs);
>
> On an unrelated note, can nargs and nret are integers and could be
> eventually negative. Is this a valid use case?

No, it's not valid for a caller to provide negative nargs or nret. I
convinced myself that this bounds check:

	nargs = be32_to_cpu(args.nargs);
	nret  = be32_to_cpu(args.nret);

	if (nargs >= ARRAY_SIZE(args.args)
	    || nret > ARRAY_SIZE(args.args)
	    || nargs + nret > ARRAY_SIZE(args.args))
		return -EINVAL;

rejects negative values of nargs or nret due to C's "usual arithmetic
conversions", where nargs and nret are implicitly converted to size_t
for the comparisons.

However I don't see any value in keeping them as signed int. I have some
changes in progress in this area and I'll plan on making these unsigned.
