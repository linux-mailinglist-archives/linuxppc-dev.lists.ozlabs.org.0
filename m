Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7A70D440
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 08:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQPxb1m50z3f5v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 16:46:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jfBus6Fi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jfBus6Fi;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQPwg20Kvz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 16:46:10 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34N6JvZv006666;
	Tue, 23 May 2023 06:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jOjEhrSqJ4ajMojFBukdVtefFrr/K+41B67XpMYR6qQ=;
 b=jfBus6FiSd5q6r3P3n5kse+gBmOtj5J+DBC0wN0xZmstYFm5/lEIw/axSyydQJ5AKOcg
 lU7OfW71iTqjo0a000fEtuS3QuAEej1VFdMME+OaoRwbvDMn7OodXzWBRl1nIyTNbey6
 QLFagEYGdOveiAJnILbuRDK0emnSa0AF7FskrGTKuNu5F47s8g4JYFFhhE8idhe2wTXR
 Yj8e2skgodu8WXvKmQqwHc+lFBaRKLU2hXl4gMk2ZdRZD21qhB68dO9vLx6+Ym0MNe9X
 GrT/H7NywydW90ljyV34HplSpdLnsyaj7HAtzgewEj2ef2CYJGniqHF3oscOdzkX9JV6 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrq8222dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 06:46:07 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34N6JxUW006926;
	Tue, 23 May 2023 06:46:07 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrq8222cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 06:46:06 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34N56OtF000695;
	Tue, 23 May 2023 06:46:05 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qppa4s3k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 06:46:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34N6k2So53150122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 06:46:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB88320043;
	Tue, 23 May 2023 06:46:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 465D52004B;
	Tue, 23 May 2023 06:46:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 May 2023 06:46:02 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.192.255.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 166CB600BB;
	Tue, 23 May 2023 16:45:58 +1000 (AEST)
Message-ID: <0b70a6240c543822f358689b9e2ddaef58b6415b.camel@linux.ibm.com>
Subject: Re: [PATCH v3 01/12] powerpc/book3s: Add missing <linux/sched.h>
 include
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 23 May 2023 16:45:52 +1000
In-Reply-To: <20230519050236.144847-2-bgray@linux.ibm.com>
References: <20230519050236.144847-1-bgray@linux.ibm.com>
	 <20230519050236.144847-2-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2ON9pMpVZnO2KTxIMhklh-64NIGH4xEt
X-Proofpoint-GUID: 5oDb-Vz6d0xxa_VZsg2gQMoy-o0hrVRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_04,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230053
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
Cc: npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-05-19 at 15:02 +1000, Benjamin Gray wrote:
> The functions here use struct thread_struct fields, so need to import
> the full definition from <linux/sched.h>. The <asm/current.h> header
> that defines current only forward declares struct thread_struct.

AFAICT, struct thread_struct is defined in
arch/powerpc/include/asm/processor.h? I think you mean struct
task_struct (which is what's forward declared in asm/current.h, not
thread_struct).

>=20
> Failing to include this <linux/sched.h> header leads to a compilation
> error when a translation unit does not also include <linux/sched.h>
> indirectly.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: Russell Currey <ruscur@russell.cc>
>=20
> ---
>=20
> v3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add ruscur reviewed-by
> v1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Add npiggin reviewed-by
> ---
> =C2=A0arch/powerpc/include/asm/book3s/64/kup.h | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h
> b/arch/powerpc/include/asm/book3s/64/kup.h
> index 54cf46808157..84c09e546115 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -194,6 +194,7 @@
> =C2=A0#else /* !__ASSEMBLY__ */
> =C2=A0
> =C2=A0#include <linux/jump_label.h>
> +#include <linux/sched.h>
> =C2=A0
> =C2=A0DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
> =C2=A0

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
