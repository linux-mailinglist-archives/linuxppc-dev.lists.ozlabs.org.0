Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB826333D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 04:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGV233sdPz3cZp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 14:22:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EPkLRjaA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EPkLRjaA;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGV175dRVz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 14:22:03 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM1VZP8026592
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Eaot04oK1Qa/WbKhI9z8h4wU/5KiO3B5Dpn9FUwkVi4=;
 b=EPkLRjaAPBQvriRAiUsrmUboC6BvlxqegseB4FClvWH1lu/9QJoDDnF7T3wy9JOhzSBe
 5itz4bMftnq3CJKUHVbhhDLMdfh6UtEpZeqAXh7Aw1EUeD9aPw87pLTA7bQp0oUOLeOL
 IHjrOMpDNUQrcD4a1gOyqTLOT3wlSXxgZhK3aLacKyfY+9aXzVXqPbIBaH4tpnd/idtj
 TArAczD/ZtRqpuL7oXyvUI/9RVNRRt2ui7xb/Xy6/YbkT4OAv6WvWOvmsFegmzVuF6ST
 JkzBSflOJsUfaxIRlvkG4bACNrX8hGjQEavTxACrTt/1LAiGsFf/eZLIwh4tIshpJhVE sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0mu7hwbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:22:01 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM3M0mc007749
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:22:00 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0mu7hwbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:22:00 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM3L56J007167;
	Tue, 22 Nov 2022 03:21:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma05fra.de.ibm.com with ESMTP id 3kxps8jk26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 03:21:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM3LtFR4194850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 03:21:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D473A405B;
	Tue, 22 Nov 2022 03:21:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACB03A4054;
	Tue, 22 Nov 2022 03:21:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 03:21:54 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9088D60151;
	Tue, 22 Nov 2022 14:21:53 +1100 (AEDT)
Message-ID: <062d064cbf64be465b6fe553f8ea31e977e80297.camel@linux.ibm.com>
Subject: Re: [PATCH 05/13] powerpc/pseries/eeh: use correct API for error
 log size
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 14:21:53 +1100
In-Reply-To: <20221118150751.469393-6-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-6-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gkPymxe_rND_hQo35-67U6w_eB7hpEFT
X-Proofpoint-ORIG-GUID: 6VDrpVwRkYKlilNyOZXJMPe8sZyOER-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_18,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=975 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220020
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

On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> rtas-error-log-max is not the name of an RTAS function, so
> rtas_token() is not the appropriate API for retrieving its value. We
> already have rtas_get_error_log_max() which returns a sensible value
> if the property is absent for any reason, so use that instead.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: 8d633291b4fc ("powerpc/eeh: pseries platform EEH error log
> retrieval")
> ---
> =C2=A0arch/powerpc/platforms/pseries/eeh_pseries.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c
> b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 8e40ccac0f44..e5e4f4aa5afd 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -848,7 +848,7 @@ static int __init eeh_pseries_init(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Initialize error log s=
ize */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eeh_error_buf_size =3D rtas_to=
ken("rtas-error-log-max");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eeh_error_buf_size =3D rtas_ge=
t_error_log_max();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (eeh_error_buf_size =
=3D=3D RTAS_UNKNOWN_SERVICE) {

This is now impossible, and the whole block makes little sense after
the next patch

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_info("%s: unknown EEH error log size\n",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__f=
unc__);

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
