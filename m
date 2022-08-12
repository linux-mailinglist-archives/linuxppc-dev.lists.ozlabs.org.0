Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B2F5915D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 21:15:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4Czt2gytz3blT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 05:15:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mj5SFhrl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mj5SFhrl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4Cz72csXz2xjl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 05:14:26 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CJ32TY029044
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 19:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Hp4cvLQEIEs1IWj9zu5SD/SRGbj/bKRNCNkMSqb/Pk8=;
 b=mj5SFhrlHEe7RUmEf1dmr/qTLgNyJGGTXTczjyRneBRnZuGMNYlbFHAxKsEmkwpvgpbi
 PZeUh4uQPPdoljmyhkVfFgXqPwH88GO2bMNOihy/4DaX+koNiyt2U78G8uMsBVnFHvND
 15HH8jKwjYSdkQlmuJ+ocHKK5pypHY+3rNz13s61mwXjxWtT72BK1HiP/MkgK+5v6WFs
 iC4MF5hXzi5iuuFAcxJ4n0yf1XBR65H3LPTLT9JyKCZz04JQwZO39Lav/PrKC+UEv3Bm
 fmnawbsVYza9sGhFYH9l1OnW6NODvLbl1754cBd3XT54qRjfH029IQWWlZvqFY8kLdZQ /w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwux41m8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 19:14:24 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CJ4qwE016833
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 19:14:22 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma05wdc.us.ibm.com with ESMTP id 3hvcmrpdwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 19:14:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27CJEMCi1376770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Aug 2022 19:14:22 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 290F6112061;
	Fri, 12 Aug 2022 19:14:22 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8839112064;
	Fri, 12 Aug 2022 19:14:21 +0000 (GMT)
Received: from localhost (unknown [9.163.23.167])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 12 Aug 2022 19:14:21 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: add lparctl driver for
 platform-specific functions
In-Reply-To: <0ead0cd1-f6f6-ecf0-65d9-f3d9366e258c@linux.ibm.com>
References: <20220730000458.130938-1-nathanl@linux.ibm.com>
 <0ead0cd1-f6f6-ecf0-65d9-f3d9366e258c@linux.ibm.com>
Date: Fri, 12 Aug 2022 14:14:21 -0500
Message-ID: <87k07dl1f6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1bWa-i8EmaaC0sPoVxWMfWHx7rAhGLcx
X-Proofpoint-GUID: 1bWa-i8EmaaC0sPoVxWMfWHx7rAhGLcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120050
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Le 30/07/2022 =C3=A0 02:04, Nathan Lynch a =C3=A9crit=C2=A0:
>> +static long lparctl_get_sysparm(struct lparctl_get_system_parameter __u=
ser *argp)
>> +{
>> +	struct lparctl_get_system_parameter *gsp;
>> +	long ret;
>> +	int fwrc;
>> +
>> +	/*
>> +	 * Special case to allow user space to probe the command.
>> +	 */
>> +	if (argp =3D=3D NULL)
>> +		return 0;
>> +
>> +	gsp =3D memdup_user(argp, sizeof(*gsp));
>> +	if (IS_ERR(gsp)) {
>> +		ret =3D PTR_ERR(gsp);
>> +		goto err_return;
>> +	}
>> +
>> +	ret =3D -EINVAL;
>> +	if (gsp->rtas_status !=3D 0)
>> +		goto err_free;
>> +
>> +	do {
>> +		static_assert(sizeof(gsp->data) <=3D sizeof(rtas_data_buf));
>> +
>> +		spin_lock(&rtas_data_buf_lock);
>> +		memset(rtas_data_buf, 0, sizeof(rtas_data_buf));
>> +		memcpy(rtas_data_buf, gsp->data, sizeof(gsp->data));
>> +		fwrc =3D rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
>> +				 NULL, gsp->token, __pa(rtas_data_buf),
>> +				 sizeof(gsp->data));
>> +		if (fwrc =3D=3D 0)
>> +			memcpy(gsp->data, rtas_data_buf, sizeof(gsp->data));
>
> May be the amount of data copied out to the user space could be
> gsp->length. This would prevent copying 4K bytes all the time.
>
> In a more general way, the size of the RTAS buffer is quite big, and I'm
> wondering if all the data need to be copied back and forth to the kernel.
>
> Unless there are a high frequency of calls this doesn't make sense, and
> keeping the code simple might be the best way. Otherwise limiting the byt=
es
> copied could help a bit.

This is not intended to be a high-bandwidth interface and I don't think
there's much of a performance concern here, so I'd rather just keep the
copy sizes involved constant.

>> +static long lparctl_set_sysparm(struct lparctl_set_system_parameter __u=
ser *argp)
>> +{
>> +	struct lparctl_set_system_parameter *ssp;
>> +	long ret;
>> +	int fwrc;
>> +
>> +	/*
>> +	 * Special case to allow user space to probe the command.
>> +	 */
>> +	if (argp =3D=3D NULL)
>> +		return 0;
>> +
>> +	ssp =3D memdup_user(argp, sizeof(*ssp));
>
> As for the get case, would it be nice to limit the amount of bytes copied
> to the interesting "length" ?

No, the intent is to pass the buffer contents straight to RTAS without
any validation by the kernel, which would duplicate work already
performed by firmware.
