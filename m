Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3E363FF43
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:54:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNfFV56JFz3bfM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 14:54:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kyUmij4P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kyUmij4P;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNfDW4FGVz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 14:53:14 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B231NJ4001684;
	Fri, 2 Dec 2022 03:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=M84laHatoYgt9t3f4COpI+woRzRZNREcBdPZMJuuHfE=;
 b=kyUmij4PG9rD3nTQjyh9qv5fF418tqgSz3Tz+59WvmpSkaANJR+TcCBtrTZh05hXISZy
 0TQSyxJ32lgBiexrmZDxGqTLk8Fw0X5Xtfg3dHFlqC76NIdmqWX559juYoOE0mfIXwTg
 RoAzrhUHNyNwGQirKsiESKz27lDyT6sRg7vsqF2SBIhBzUdjl9K0wX9CDRW4YVr2x2SJ
 aZ2ZKSUl5Oonl9/QxnyiigDZMnhXyHuu+bIRbK0Ts7YrV2kQvKbTngxxx/pm0Tr7phC4
 2eajGGOGL1WDQ/Xr50EMGD7aX5rDiRS38Mtex/KfG+78N4BVKhw++dMcXE7/9EFPfdrI zQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m793g0vha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Dec 2022 03:53:11 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B22ZeMp002714;
	Fri, 2 Dec 2022 03:53:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3m3ae96368-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Dec 2022 03:53:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B23r7Vg11272860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Dec 2022 03:53:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7387DA4054;
	Fri,  2 Dec 2022 03:53:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E57DA405C;
	Fri,  2 Dec 2022 03:53:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  2 Dec 2022 03:53:07 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E9166602FD;
	Fri,  2 Dec 2022 14:52:58 +1100 (AEDT)
Message-ID: <42ea8c518ce1db9bd09c7fc48e21aa16a468d138.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/7] selftests/powerpc: Add ptrace
 setup_core_pattern() null-terminator
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 02 Dec 2022 14:52:58 +1100
In-Reply-To: <20221128041948.58339-3-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
	 <20221128041948.58339-3-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gY3j70P-LcxDtRcSsuEg7gVrJ31YjNIR
X-Proofpoint-ORIG-GUID: gY3j70P-LcxDtRcSsuEg7gVrJ31YjNIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_14,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020018
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-11-28 at 15:19 +1100, Benjamin Gray wrote:
> - malloc() does not zero the buffer,
> - fread() does not null-terminate it's output,
> - `cat /proc/sys/kernel/core_pattern | hexdump -C` shows the file is
> =C2=A0 not inherently null-terminated
>=20
> So using string operations on the buffer is risky. Explicitly add a
> null
> character to the end to make it safer.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0tools/testing/selftests/powerpc/ptrace/core-pkey.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> index bbc05ffc5860..5c82ed9e7c65 100644
> --- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> +++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
> @@ -383,7 +383,7 @@ static int setup_core_pattern(char
> **core_pattern_, bool *changed_)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D fread(core_pattern, 1,=
 PATH_MAX, f);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D fread(core_pattern, 1,=
 PATH_MAX - 1, f);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fclose(f);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ret) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0perror("Error reading core_pattern file");
> @@ -391,6 +391,8 @@ static int setup_core_pattern(char
> **core_pattern_, bool *changed_)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0core_pattern[ret] =3D '\0';
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Check whether we can p=
redict the name of the core file. */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strcmp(core_pattern,=
 "core") || !strcmp(core_pattern,
> "core.%p"))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0*changed_ =3D false;

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
