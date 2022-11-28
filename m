Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C863B2F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 21:23:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLcNy4z3Mz3cMx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 07:23:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mxBRpL5r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mxBRpL5r;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLcMz0txqz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 07:22:38 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASJafaW038661
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 20:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=VIQ4NCljo4yevM6z78qrV+ZJNA8BD5IudaYrl55DgGs=;
 b=mxBRpL5rmBWJGNNHnJ2DDyA+dkFk8ipV7LMR9LhYvjjX3xqph17svlyf7aki4tlZTJTq
 qEGZo2vk9E0l8zBt+1vvZUNYdG6NoyOJTFLam57cLifQSBnBtnwJ5yGEe0Wa3LLhe5NO
 NSNEfGILuIeiBzhlXOurry0weecyIuQuDloq6DcHrhJGCx0M0T3T0GOViYrkQtc1+XiO
 tVggtt5WAeTheo6W6SvnFTL3NQ4BApS9CAOA7FsSLsmEuvSDfSYLHAabwsYXUwqpdrpL
 QwXaYWB4nEMb1IMr2KgJuQm+xePXesoUTKP4fi6y15NzHNWcfmMIpYcxNCEWkINm2tJq jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m51ss3cv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 20:22:35 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASJcJMo003552
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 20:22:35 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m51ss3cut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 20:22:35 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASKJs8x002968;
	Mon, 28 Nov 2022 20:22:34 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma04dal.us.ibm.com with ESMTP id 3m3ae9ushe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 20:22:34 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ASKMWlK10617544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 20:22:33 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEB7258071;
	Mon, 28 Nov 2022 20:22:31 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B49F658052;
	Mon, 28 Nov 2022 20:22:31 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 20:22:31 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/13] powerpc/pseries/eeh: use correct API for error
 log size
In-Reply-To: <062d064cbf64be465b6fe553f8ea31e977e80297.camel@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-6-nathanl@linux.ibm.com>
 <062d064cbf64be465b6fe553f8ea31e977e80297.camel@linux.ibm.com>
Date: Mon, 28 Nov 2022 14:22:31 -0600
Message-ID: <8735a2akxk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xk_KoiitwACEQMVO7gMil-X9Wm2KD-C1
X-Proofpoint-ORIG-GUID: yxA5pmb6nGIXbg4DFItCeQ6CF0KsnAdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280145
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
> On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
>> rtas-error-log-max is not the name of an RTAS function, so
>> rtas_token() is not the appropriate API for retrieving its value. We
>> already have rtas_get_error_log_max() which returns a sensible value
>> if the property is absent for any reason, so use that instead.
>>=20
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> Fixes: 8d633291b4fc ("powerpc/eeh: pseries platform EEH error log
>> retrieval")
>> ---
>> =C2=A0arch/powerpc/platforms/pseries/eeh_pseries.c | 2 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c
>> b/arch/powerpc/platforms/pseries/eeh_pseries.c
>> index 8e40ccac0f44..e5e4f4aa5afd 100644
>> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
>> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
>> @@ -848,7 +848,7 @@ static int __init eeh_pseries_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Initialize error log =
size */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eeh_error_buf_size =3D rtas_t=
oken("rtas-error-log-max");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eeh_error_buf_size =3D rtas_g=
et_error_log_max();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (eeh_error_buf_size =
=3D=3D RTAS_UNKNOWN_SERVICE) {
>
> This is now impossible, and the whole block makes little sense after
> the next patch

Indeed, will fix in v2, thanks.
