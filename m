Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653511A14B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 03:23:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XghD5kD5zDqfH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 13:23:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XgfC04nhzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 13:21:22 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBB2CJdO029625; Tue, 10 Dec 2019 21:20:41 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtf6xrv2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 21:20:41 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBB2KEfK007296;
 Wed, 11 Dec 2019 02:20:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 2wr3q7hafe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 02:20:40 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBB2KdHR53084632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 02:20:39 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49E806E050;
 Wed, 11 Dec 2019 02:20:39 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B11DB6E054;
 Wed, 11 Dec 2019 02:20:34 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.39.208])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 02:20:33 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Romain Dolbeau <romain@dolbeau.org>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: Found the commit for: 5.3.7 64-bits kernel doesn't boot on G5
 Quad [regression]
In-Reply-To: <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
References: <CADuzgbqYpv40NvAMGjo1cU2cNnij-2p4SYpWgM-Xn0v-8Qapsg@mail.gmail.com>
 <e87e2397-a8d4-c928-d3d4-7ae700603770@physik.fu-berlin.de>
 <CA+7wUsxBkmG-jW_UVBUuMriZbDkJko3kg0hzmMrVMoJLu2+rPw@mail.gmail.com>
 <CADuzgbqoX3DQ6OVqdR6dw1oqnNn-Q0zLPshDi23DwDtYukDYdg@mail.gmail.com>
 <CADuzgboWQtVqp7-Ru4uQQaPerkhLnaS9=WiwX2dD4-5VypT2MA@mail.gmail.com>
 <CADuzgboYv69FQxQRvJ_Bd563OPO0e=USd+cTChfDK60D5x75hw@mail.gmail.com>
 <b2256437-efe1-909d-1488-174b6522f9e0@physik.fu-berlin.de>
Date: Wed, 11 Dec 2019 07:50:31 +0530
Message-ID: <87eexbk3gw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_08:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=895 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110019
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
Cc: PowerPC List Debian <debian-powerpc@lists.debian.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:

> Hi!
>
> On 12/10/19 9:35 AM, Romain Dolbeau wrote:
>> Le sam. 16 nov. 2019 =C3=A0 17:34, Romain Dolbeau <romain@dolbeau.org> a=
 =C3=A9crit :
>>> So it seems to me that 0034d395f89d9c092bb15adbabdca5283e258b41
>>> introduced the bug that crashes the PowerMac G5
>>=20
>> There's been some commits in that subsystem, so I tried again; as of
>> 6794862a16ef41f753abd75c03a152836e4c8028, the kernel still crashes
>> when trying to boot my PowerMac G5.
>
> If Aneesh is currently unable to look at the problem, I would suggest rev=
erting
> the commit in question since I don't think it's acceptable that users are=
 unable
> to boot their machines anymore after a kernel upgrade.
>

The PowerMac system we have internally was not able to recreate this.
Hence we have not been able to make progress on this.

At this point, I am not sure what would cause the Machine check with
that patch series because we have not changed the VA bits in that patch.

-aneesh
