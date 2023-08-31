Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56A578F09A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 17:53:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dbz5EujJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc5Kd3Rq0z3bmj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 01:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dbz5EujJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc5Jj4zrDz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 01:52:21 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37VFn73C020447;
	Thu, 31 Aug 2023 15:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=kcyuTaq/VxhmuNRdxTMMNnQ5l/rBz/6JCfsMOxCa70E=;
 b=dbz5EujJ9J7kM68kIAd3O0KPu/05Zpt22I717qBOVJs7E5lBxwztGCX3QGbE+sqRiLDH
 Rr7nqsckPLd0w2nq8blmkQ8qa+eixEH16IbdzcpluG3Q/Pd76I9W7P1kuK7L//5usd6u
 1oSexz/ELRaOmHoK3M+CuumjduSumn7CsZQPbDsiqltSofe9VzC86KlxNGDVVq8BRo6R
 0tET+S37d/pBiJkvWDzVpilNgyQpK+ZFxYoQ1Sry1Rao3PcdN4kEQwmsqB8AHk4NCcvf
 cpht3u+vOGdD3fIvCTOucr80SLQ5BgOiV1KDiJWAM5mTS8hDkjvW+G+FVWtDY3o+RIZm 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sttctqmge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 15:52:14 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37VFEg3p016648;
	Thu, 31 Aug 2023 15:52:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sttctqmfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 15:52:14 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37VFO7I7020514;
	Thu, 31 Aug 2023 15:52:12 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqv3ywv5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 15:52:12 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37VFqBDN60031320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Aug 2023 15:52:12 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 960F65803F;
	Thu, 31 Aug 2023 15:52:11 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74CDF58055;
	Thu, 31 Aug 2023 15:52:11 +0000 (GMT)
Received: from localhost (unknown [9.61.100.38])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 31 Aug 2023 15:52:11 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
In-Reply-To: <20230830072801.GC8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz>
Date: Thu, 31 Aug 2023 10:52:11 -0500
Message-ID: <878r9ryztg.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FGuSXsJDMw0Wj17JKad6wWTgx94dpAWe
X-Proofpoint-ORIG-GUID: LHKaVnDYP6nhj4BhdLfBDCyGuV2CO87x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=551
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310140
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>
> thanks for working on this.

Thanks for reviewing!


> On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay wrote:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>=20
>> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
>> components using the ibm,get-vpd RTAS function.
>>=20
>> We can expose this to user space with a /dev/papr-vpd character
>> device, where the programming model is:
>>=20
>>   struct papr_location_code plc =3D { .str =3D "", }; /* obtain all VPD =
*/
>>   int devfd =3D open("/dev/papr-vpd", O_WRONLY);
>>   int vpdfd =3D ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
>>   size_t size =3D lseek(vpdfd, 0, SEEK_END);
>>   char *buf =3D malloc(size);
>>   pread(devfd, buf, size, 0);
>>=20
>> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
>> the file contains the result of a complete ibm,get-vpd sequence. The
>
> Could this be somewhat less obfuscated?
>
> What the caller wants is the result of "ibm,get-vpd", which is a
> well-known string identifier of the rtas call.
>
> Yet this identifier is never passed in. Instead we have this new
> PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specific to
> this call only as is the /dev/papr-vpd device name, another new
> identifier.
>
> Maybe the interface could provide a way to specify the service name?
>
>> file contents are immutable from the POV of user space. To get a new
>> view of VPD, clients must create a new handle.
>
> Which is basically the same as creating a file descriptor with open().
>
> Maybe creating a directory in sysfs or procfs with filenames
> corresponding to rtas services would do the same job without extra
> obfuscation?

Michael has already said most of what I would have on these points. I'll
add that my experience with user space software that interacts closely
with RTAS leads me to believe that the kernel can and should expose
these platform features in higher-level ways that address fundamental
needs while encapsulating complexities such as caller serialization and
the mechanism (RTAS vs hcall vs DT). In this case, the fact that the
ibm,get-vpd RTAS function is the PAPR-specified interface for the OS to
retrieve VPD is much less essential to vpdupdate/libvpd than the format
of the VPD returned.


>> * The only way to discover the size of a VPD buffer is
>>   lseek(SEEK_END). fstat() doesn't work for anonymous fds like
>>   this. Is this OK, or should the buffer length be discoverable some
>>   other way?
>
> So long as users have /rtas/ibm,vpd-size as the top bound of the data
> they can receive I don't think it's critical to know the current VPD
> size.

OK, well I want to be transparent that the spec language says it's the
"estimated" max size, so I would hesitate to use it to size buffers
without some fallback for when it's wrong.
