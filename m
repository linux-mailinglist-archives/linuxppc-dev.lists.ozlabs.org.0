Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82C78F241
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 20:00:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZbahgKD6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc88S1zcQz3c53
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 04:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZbahgKD6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc87W0XYkz309t
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 03:59:34 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37VHkEkS016325;
	Thu, 31 Aug 2023 17:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=A0b0+foA7mgr3PWlE/aZHhsY5BPCPxkEYBB+oOhSggQ=;
 b=ZbahgKD6a3ac9sO2KQDn4Z0CxoeFz3w1zdA1pykK3cGoj65lbJIgUNy7OZaA9RWT2ysU
 2SoO5LfVmQ1LPhAl50vEmbydDYsz3F/A2DZWNu1QnxxwYJ/H9Y+Sf6pfDav/fQzcJa8v
 sVxdft+fEOlo0j0E7eSrN0G67ZMlFxqp/9RtUHC0YoraAaSpo9vJKlOeo+Z3dSCXv/+S
 Yern9TigkGszTaroR6VP+uqL6qilJ2CyVyeeHuhab1yAdBx4gYFJfPzQv7kVXyjvgTI3
 Hdp7iXieAyFdMLa4L/S7at2/UdtJn3FevwwQCsPoP6Qdq9a3kpj5vyaz4IUAIP7iZlUw jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sty82rqj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 17:59:27 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37VHuFAN022785;
	Thu, 31 Aug 2023 17:59:27 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sty82rqhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 17:59:27 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37VHeEom014107;
	Thu, 31 Aug 2023 17:59:26 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sqwxke2gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 17:59:26 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37VHxPiQ5767930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Aug 2023 17:59:25 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8106458056;
	Thu, 31 Aug 2023 17:59:25 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C56C58055;
	Thu, 31 Aug 2023 17:59:25 +0000 (GMT)
Received: from localhost (unknown [9.61.100.223])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 31 Aug 2023 17:59:25 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
In-Reply-To: <20230831114431.GH8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz> <8734zz3hci.fsf@mail.lhotse>
 <20230831103811.GF8826@kitsune.suse.cz> <87r0nj1lzr.fsf@mail.lhotse>
 <20230831114431.GH8826@kitsune.suse.cz>
Date: Thu, 31 Aug 2023 12:59:25 -0500
Message-ID: <875y4vytxe.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7S1kuWECv7ZEXfwdxir2WYDJ18MNW0un
X-Proofpoint-GUID: Wpi4JPKpBsKJ5T21NZ_kX0PxNUtD5vzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_15,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=682 bulkscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308310157
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
Cc: tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Thu, Aug 31, 2023 at 09:37:12PM +1000, Michael Ellerman wrote:
>> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> > On Thu, Aug 31, 2023 at 03:34:37PM +1000, Michael Ellerman wrote:
>> >> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> >> > On Tue, Aug 22, 2023 at 04:33:39PM -0500, Nathan Lynch via B4 Relay=
 wrote:
>> >> >> From: Nathan Lynch <nathanl@linux.ibm.com>
>> >> >>=20
>> >> >> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
>> >> >> components using the ibm,get-vpd RTAS function.
>> >> >>=20
>> >> >> We can expose this to user space with a /dev/papr-vpd character
>> >> >> device, where the programming model is:
>> >> >>=20
>> >> >>   struct papr_location_code plc =3D { .str =3D "", }; /* obtain al=
l VPD */
>> >> >>   int devfd =3D open("/dev/papr-vpd", O_WRONLY);
>> >> >>   int vpdfd =3D ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
>> >> >>   size_t size =3D lseek(vpdfd, 0, SEEK_END);
>> >> >>   char *buf =3D malloc(size);
>> >> >>   pread(devfd, buf, size, 0);
>> >> >>=20
>> >> >> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HAND=
LE),
>> >> >> the file contains the result of a complete ibm,get-vpd sequence. T=
he
>> >> >
>> >> > Could this be somewhat less obfuscated?
>> >> >
>> >> > What the caller wants is the result of "ibm,get-vpd", which is a
>> >> > well-known string identifier of the rtas call.
>> >>=20
>> >> Not really. What the caller wants is *the VPD*. Currently that's done
>> >> by calling the RTAS "ibm,get-vpd" function, but that could change in
>> >> future. There's RTAS calls that have been replaced with a "version 2"=
 in
>> >> the past, that could happen here too. Or the RTAS call could be repla=
ced
>> >> by a hypercall (though unlikely).
>> >>=20
>> >> But hopefully if the underlying mechanism changed the kernel would be
>> >> able to hide that detail behind this new API, and users would not need
>> >> to change at all.
>> >>=20
>> >> > Yet this identifier is never passed in. Instead we have this new
>> >> > PAPR_VPD_CREATE_HANDLE. This is a completely new identifier, specif=
ic to
>> >> > this call only as is the /dev/papr-vpd device name, another new
>> >> > identifier.
>> >> >
>> >> > Maybe the interface could provide a way to specify the service name?
>> >> >
>> >> >> file contents are immutable from the POV of user space. To get a n=
ew
>> >> >> view of VPD, clients must create a new handle.
>> >> >
>> >> > Which is basically the same as creating a file descriptor with open=
().
>> >>=20
>> >> Sort of. But much cleaner becuase you don't need to create a file in =
the
>> >> filesystem and tell userspace how to find it.
>> >
>> > You very much do. There is the /dev/papr-vpd and PAPR_VPD_CREATE_HANDLE
>> > which userspace has to know about, the PAPR_VPD_CREATE_HANDLE is not
>> > even possible to find at all.
>>=20
>> Well yeah you need the device itself :)
>
> And as named it's specific to this call, and new devices will be needed
> for any additional rtas called implemented.
>
>>=20
>> And yes the ioctl is defined in a header, not in the filesystem, but
>> that's entirely normal for an ioctl based API.
>
> Of course, because the ioctl API has no safe way of passing a string
> identifier for the function. Then it needs to create these obscure IDs.
>
> Other APIs that don't have this problem exist.

Looking at the cover letter for the series, I wonder if my framing and
word choice is confusing? Instead of "new character devices for RTAS
functions", what I would really like to convey is "new character devices
for platform features that are currently only accessible through the
rtas() syscall". But that's too long :-)

You (Michal) seem to favor a kernel-user ABI where user space is allowed
to invoke arbitrary RTAS functions by name. But we already have that in
the form of the rtas() syscall. (User space looks up function tokens by
name in the DT.) The point of the series is that we need to move away
from that. It's too low-level and user space has to use /dev/mem when
invoking any of the less-simple RTAS functions.
