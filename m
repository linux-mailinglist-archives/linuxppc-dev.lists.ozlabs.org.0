Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344F6D3C47
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 06:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqckN63STz3cjP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 14:05:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cu4Nf8OU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cu4Nf8OU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqcjM4qF9z3c6X;
	Mon,  3 Apr 2023 14:04:39 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3333TWRL026367;
	Mon, 3 Apr 2023 04:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=2cyFMzj7OIzGUI+aoo1ILXF1HyL2LcHn+AT3UnZFLcI=;
 b=cu4Nf8OUgmHpFXRim/UID/MXu7Kp1bs9QZHCBtb+fmyyg/pP/tBGxjM2JOg6hV2Kstx3
 /ziY1RcOrr2Ds+8O/501m2hK6af+AsuGjOClqx/hSuvvOWTKIwoP4e34SOVB+NEqGlN3
 BWKKIM3vMjTyQuMuRHLyfcbRiCpMv4rRrD1sQxZjfOuWfpNeLDDhVJ3TztBIoecUjvr8
 3StcWik9i7cLmdma9LGaaa1Hk8spP5ghc7dMVevAUz5n1MerR/+gRnC0AMHjeLMNV4zi
 ri/JujOd3VMXmtiZGhnaO+bk5bPkt7zirsQLgDW6jRh+eXaaRtbjAgZUm9JOo9PygXfe rw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ppxj13s8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 04:04:29 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3333tEZw025925;
	Mon, 3 Apr 2023 04:04:27 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3ppc86rywb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 04:04:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33344Nmd14353044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Apr 2023 04:04:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A035820043;
	Mon,  3 Apr 2023 04:04:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1522D20040;
	Mon,  3 Apr 2023 04:04:22 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.66.108])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  3 Apr 2023 04:04:21 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [Skiboot] [PATCH V4 3/3] skiboot: Update IMC PMU node names for
 power10
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZBtomRWcK4ni49df@arbab-laptop.austin.ibm.com>
Date: Mon, 3 Apr 2023 09:34:19 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <E625D69C-60B7-44B6-850E-11622F8EFF39@linux.vnet.ibm.com>
References: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
 <20230306033913.80524-3-atrajeev@linux.vnet.ibm.com>
 <ZBtomRWcK4ni49df@arbab-laptop.austin.ibm.com>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zmqTSy_cefdoWgTYkBB2R0-LOqcFP5Le
X-Proofpoint-GUID: zmqTSy_cefdoWgTYkBB2R0-LOqcFP5Le
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_01,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304030029
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, Kajol Jain <kjain@linux.ibm.com>, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 23-Mar-2023, at 2:14 AM, Reza Arbab <arbab@linux.ibm.com> wrote:
>=20
> On Mon, Mar 06, 2023 at 09:09:13AM +0530, Athira Rajeev wrote:
>> +	} else if (proc_gen =3D=3D proc_gen_p10) {
>> +		int val;
>> +		char al[8], xl[8], otl[8], phb[8];
>=20
> Are four different variables needed here? I think you could just reuse =
one temporary variable.
>=20
> 		char name[8];

Hi Reza,

Thanks for checking the patch. I will send next version with this change

>=20
>> +		for (i=3D0; i<8; i++) {
>> +			val =3D ((avl_vec & (0x7ULL << (29 + (3 * i)))) =
>> (29 + (3 * i)));
>> +			switch (val) {
>> +			case 0x5: //xlink configured and functional
>> +
>> +				snprintf(al, sizeof(al), =
"alink%1d",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
al);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				snprintf(otl, =
sizeof(otl),"otl%1d_0",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
otl);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				=
snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
otl);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				break;
>> +			case 0x6: //alink configured and functional
>> +
>> +				=
snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
xl);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				=
snprintf(otl,sizeof(otl),"otl%1d_0",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
otl);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				=
snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
otl);
>> +				if (target)
>> +					dt_free(target);
>> +				break;
>> +
>> +			case 0x7: //CAPI configured and functional
>> +				=
snprintf(al,sizeof(al),"alink%1d",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
al);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				=
snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
xl);
>> +				if (target)
>> +					dt_free(target);
>> +				break;
>> +			default:
>> +				=
snprintf(xl,sizeof(xl),"xlink%1d",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
xl);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				=
snprintf(al,sizeof(al),"alink%1d",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
al);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				=
snprintf(otl,sizeof(otl),"otl%1d_0",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
otl);
>> +				if (target)
>> +					dt_free(target);
>> +
>> +				=
snprintf(otl,sizeof(otl),"otl%1d_1",(7-i));
>> +				target =3D dt_find_by_name_substr(dev, =
otl);
>> +				if (target)
>> +					dt_free(target);
>> +				break;
>=20
> As far as I know skiboot follows the kernel coding style. Would you =
mind fixing up the minor style nits checkpatch.pl reports for this =
patch?
Sure=20

Thanks
Athira
>=20
> --=20
> Reza Arbab

