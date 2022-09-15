Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D25B9406
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 07:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSmSl4TXTz3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 15:47:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kvfq91Id;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kvfq91Id;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSmS41T9yz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 15:47:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F59He6000848
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=/0CwPM5ENUM1ZVgNZacpt8SP2XaBsutL6YYFHMtGvTg=;
 b=kvfq91Id86O1/ZbNFiUTSBiNmCmniDfkFtqFvvbkE5iDeqNObo+gVCdFB4VOC658cJo6
 KIWl+itoTnM75NGCRzaPpW150hpFdNGRrIzDdJmtxc9HuV1hkXjjQGtAV1vW3r/OkuWI
 zYio0BSuTTMkwMNz2x/2rtw8if3+UKXY+hnujWf49qh07/URAkxQxPAK49pbT38nKYr3
 aWd25mf9uv/9chd/lk3U6Ksc1p3gJOwModLcS6h3y2dEPcuKK2eeIXssGWWTSk1UHl5b
 S2uH51/rGB3XSDLwghgLrpHJUJbRv3V9MlDd0COw5QGesGUaNrGiz66R2yYF6ww/XYb0 qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkvn6anj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:47:13 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28F439bC028712
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:47:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkvn6anh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 05:47:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28F5ahxS003825;
	Thu, 15 Sep 2022 05:47:10 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3jjytx1vk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 05:47:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28F5l84r41877884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 05:47:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41E8CA405F;
	Thu, 15 Sep 2022 05:47:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E132DA4054;
	Thu, 15 Sep 2022 05:47:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 05:47:07 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.192.255.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3530B6016C;
	Thu, 15 Sep 2022 15:47:05 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 11/20] powerpc: Add ZEROIZE_GPRS macros for register
 clears
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CMUDK23FKG34.12SMOO6QFJ50R@bobo>
Date: Thu, 15 Sep 2022 15:47:04 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <79671045-7D84-4454-B835-346A3F4F175B@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-12-rmclure@linux.ibm.com>
 <CMUDK23FKG34.12SMOO6QFJ50R@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TmYWebuEPqLgFzi3UvYxng_GI_WYYD1N
X-Proofpoint-ORIG-GUID: 8rs7Gk_OaI20sBhrpw79aErwWDbBtQfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209150028
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12 Sep 2022, at 9:09 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
>> Macros for restoring and saving registers to and from the stack =
exist.
>> Provide macros with the same interface for clearing a range of gprs =
by
>> setting each register's value in that range to zero.
>=20
> Can I bikeshed this a bit more and ask if you would change the order?
>=20
> Saving and restoring macros are incidental, and are neither the change
> nor the reson for it. I think the changelog reads better if you state
> the change (or the problem) up front.
>=20
> Provid register zeroing macros ... follow the same convention as
> existing register stack save/restore macros ... will be used in later
> change to zero registers.

Thanks for the suggestion, that should read better.

>=20
> Or not, if you disagree.
>=20
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>=20
>> The resulting macros are called ZEROIZE_GPRS and ZEROIZE_NVGPRS, =
keeping
>> with the naming of the accompanying restore and save macros, and =
usage
>> of zeroize to describe this operation elsewhere in the kernel.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Change 'ZERO' usage in naming to 'NULLIFY', a more obvious =
verb
>> V2 -> V3: Change 'NULLIFY' usage in naming to 'ZEROIZE', which has
>> precedent in kernel and explicitly specifies that we are zeroing.
>> V3 -> V4: Update commit message to use zeroize.
>> ---
>> arch/powerpc/include/asm/ppc_asm.h | 22 ++++++++++++++++++++++
>> 1 file changed, 22 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/ppc_asm.h =
b/arch/powerpc/include/asm/ppc_asm.h
>> index 83c02f5a7f2a..b95689ada59c 100644
>> --- a/arch/powerpc/include/asm/ppc_asm.h
>> +++ b/arch/powerpc/include/asm/ppc_asm.h
>> @@ -33,6 +33,20 @@
>> 	.endr
>> .endm
>>=20
>> +/*
>> + * This expands to a sequence of register clears for regs start to =
end
>> + * inclusive, of the form:
>> + *
>> + *   li rN, 0
>> + */
>> +.macro ZEROIZE_REGS start, end
>> +	.Lreg=3D\start
>> +	.rept (\end - \start + 1)
>> +	li	.Lreg, 0
>> +	.Lreg=3D.Lreg+1
>> +	.endr
>> +.endm
>> +
>> /*
>>  * Macros for storing registers into and loading registers from
>>  * exception frames.
>> @@ -49,6 +63,14 @@
>> #define REST_NVGPRS(base)		REST_GPRS(13, 31, base)
>> #endif
>>=20
>> +#define	ZEROIZE_GPRS(start, end)	ZEROIZE_REGS start, end
>> +#ifdef __powerpc64__
>> +#define	ZEROIZE_NVGPRS()		ZEROIZE_GPRS(14, 31)
>> +#else
>> +#define	ZEROIZE_NVGPRS()		ZEROIZE_GPRS(13, 31)
>> +#endif
>> +#define	ZEROIZE_GPR(n)			ZEROIZE_GPRS(n, n)
>> +
>> #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
>> #define REST_GPR(n, base)		REST_GPRS(n, n, base)
>>=20
>> --=20
>> 2.34.1
>=20

