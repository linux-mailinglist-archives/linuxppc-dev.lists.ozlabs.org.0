Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486D63B0C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 19:09:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLYQp3NbVz3cMT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 05:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e07HRHk6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e07HRHk6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLYPp1LYRz3cGk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 05:09:01 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASGfDKB020877
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 18:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=WBG9seOVFyDGYAU6KuQH3a4JhG219aDqBhzg1TZr4m4=;
 b=e07HRHk6rlu9SCdA/wuxfjA5NM11GthN1/LJwSCB6TTRV9NbvtbH2ajUS37oe2mQG8E1
 iz7y/m9D/ArR1JNGxaz1eDimsBT7KeuQzaadhpNaxJ8VgP/BYijJKfbPQvSK6AwvmjH7
 tIbTYFq1i2H4ztPs5JM5CDk6UJq5Yecc6uQvnekbydn7f9KGdnKWCtSCjbkMLgnVrFnA
 +BuVSD13Ic0gPvE3YIC27mfqcKAhZ1UIV9pGa3P6Lu5FsUGOicv8mdwTqU8tZRnz413O
 Ivx1cOIwEs59swyMCB6Hmy+pmjjdQ9po2G/6CijxUEriLXQXerhn33yqWmxPPvcn0m/f 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vmrqgt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 18:08:58 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASHpDHg018946
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 18:08:58 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vmrqgsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 18:08:58 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASI5Mbv029357;
	Mon, 28 Nov 2022 18:08:57 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01dal.us.ibm.com with ESMTP id 3m3ae9twx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 18:08:57 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ASI8tLq10027646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 18:08:55 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F0395807E;
	Mon, 28 Nov 2022 18:08:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BFA75807D;
	Mon, 28 Nov 2022 18:08:55 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 18:08:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/13] powerpc/rtas: avoid device tree lookups in
 rtas_os_term()
In-Reply-To: <2bb6286d131fe34b4358a962f708ee0a9b85e166.camel@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-4-nathanl@linux.ibm.com>
 <2bb6286d131fe34b4358a962f708ee0a9b85e166.camel@linux.ibm.com>
Date: Mon, 28 Nov 2022 12:08:55 -0600
Message-ID: <878rjv9cjs.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cj5ow61IjzDYoeVG25lOKOzEQ632u3ZF
X-Proofpoint-ORIG-GUID: crIEYwMEVILwfKzpIjzh8T_622EjHmUA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_15,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=993 impostorscore=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280132
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index c12dd5ed5e00..81e4996012b7 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -947,6 +947,8 @@ void __noreturn rtas_halt(void)
>> =C2=A0
>> =C2=A0/* Must be in the RMO region, so we place it here */
>> =C2=A0static char rtas_os_term_buf[2048];
>> +static s32 ibm_os_term_token =3D RTAS_UNKNOWN_SERVICE;
>
> s32 and int are obviously identical, but rtas_token is declared using
> int, as are the other variables where we cache various tokens.

Right... I think it's better practice to use an explicitly sized type
where the data is directly derived from the device tree and ultimately
passed to the firmware call interface. Gradually enacting this while
tolerating some cosmetic inconsistency in the code seems OK to me, but
I'm open to other opinions.
