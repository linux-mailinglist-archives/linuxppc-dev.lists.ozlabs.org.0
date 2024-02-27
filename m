Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C6869DD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 18:37:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqP4E4Rb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkl7N6qv4z3dWg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 04:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqP4E4Rb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkl6h4kSSz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 04:37:16 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41RHHHqW015676;
	Tue, 27 Feb 2024 17:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=F+orPlb7sL76QAM7MCRm1kNb9leUjjvRJjF3oh//XTM=;
 b=kqP4E4RbIpUf2ycrkhO12VdLCQREUXFhdIs64tAXpWEGY3XYZ+vRgwKugQKcxKx646fR
 WM6Sh6kuoThxHpj7BsJukZLcx3HzLTcuPah6w2bdtv4yN/7dTno3+dpfD0Qe+2wgmJ6a
 pz2FUB7wOJ7YHmpxfFw4UiEMyW2rTIjYNxNF7NDJ/zsTRd1kR6AGxB5NLmjpfwCyl3E5
 yZ4EzM5iqBdInwyH9pqfj0hv+GMPTT8DDbNkTHojzXpwJuOGub92yGeR+qafYEBt3h3z
 Za/WMJ/gYl78/yVjSjeNuF0FEKFxMsKsGZl0NVCGg1JvCHtgtCrLtsx/dDMebdy5MiRl 1w== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3whm0ggkkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 17:37:12 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41RFNfmH021756;
	Tue, 27 Feb 2024 17:37:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu601b7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 17:37:11 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41RHb7Px16712386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 17:37:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 220D92004F;
	Tue, 27 Feb 2024 17:37:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6932F20043;
	Tue, 27 Feb 2024 17:37:06 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.112.249])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Feb 2024 17:37:06 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: Kernel WARNING at lib/vsprintf.c:2721 while running ftrace kernel
 selftests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20240227120842.0d5ffb46@gandalf.local.home>
Date: Tue, 27 Feb 2024 23:06:55 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A881D5E8-77E1-4881-AF47-3CA535AFFAC3@linux.ibm.com>
References: <C7E7AF1A-D30F-4D18-B8E5-AF1EF58004F5@linux.ibm.com>
 <20240226122208.344447f1@gandalf.local.home>
 <129D90CC-6DEB-4953-8061-EAA89F1ED514@linux.ibm.com>
 <20240227091858.7b66f8cc@gandalf.local.home>
 <1F8D4E65-4E23-49FD-B092-980BB1203E19@linux.ibm.com>
 <20240227112443.0bd9f4b8@gandalf.local.home>
 <4A3F2F8E-15D2-48F3-8D59-C11EB0BC7F14@linux.ibm.com>
 <20240227115614.3572872e@gandalf.local.home>
 <20240227120842.0d5ffb46@gandalf.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U39RMU67VH3OLjmwPBxIvRWEpWsYZ33I
X-Proofpoint-ORIG-GUID: U39RMU67VH3OLjmwPBxIvRWEpWsYZ33I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_05,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402270136
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Feb-2024, at 10:38=E2=80=AFPM, Steven Rostedt =
<rostedt@goodmis.org> wrote:
>=20
> On Tue, 27 Feb 2024 11:56:14 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
>=20
>> On Tue, 27 Feb 2024 22:08:18 +0530
>> Sachin Sant <sachinp@linux.ibm.com> wrote:
>>=20
>>>> Can you apply this, and see if it triggers and if it does, print =
the line
>>>> that has the max size?
>>>>=20
>>>=20
>>> With this I see following trace
>>>=20
>>> [   61.327138] ------------[ cut here ]------------
>>> [   61.327159] MAX OUT OF RANGE 63492 =20
>>=20
>> Well I guess there you have it ;-)
>>=20
>> vsprintf() doesn't like a precision of 63492!
>>=20
>> I'll look to see what the best way to deal with this is.
>=20
> Does this fix it?
>=20
Thank You. Yup this fixes the reported problem.

# ./ftracetest test.d/00basic/trace_marker.tc=20
=3D=3D=3D Ftrace unit tests =3D=3D=3D
[1] Basic tests on writing to trace_marker [PASS]
[2] (instance)  Basic tests on writing to trace_marker [PASS]


# of passed:  2
# of failed:  0
# of unresolved:  0
# of untested:  0
# of unsupported:  0
# of xfailed:  0
# of undefined(test bug):  0
#=20

Remaining test also completed without any issues. Based on the test =
results

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

Thanks
=E2=80=94 Sachin
