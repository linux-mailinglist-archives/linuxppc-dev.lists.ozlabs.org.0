Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A931661E6B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 06:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nr2PJ1Xrmz3cFJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 16:21:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rtn7FQwa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rtn7FQwa;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr2NN30lmz2yfg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 16:21:08 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3091LYt9005579;
	Mon, 9 Jan 2023 05:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6AZ7MMyDzIH6MS2KDjBbHW4VImfdBxKDb57aWuEHLN0=;
 b=Rtn7FQwau8o1jSUmat38y7sYMQ512RoT4cB+cxCrCWzFUL+0BuGvy1i204uau2FWne/x
 7dyYfRozSzCqgRhjhiZtZIPcyvdLyQOF+/y5KOyd3x3cy1CPuTcGh1SLkHcCbOV+M//M
 HWIQXXHl05Cyfb8bHcCItdzKgV/iJadip3wZS8FF4Sfy5Q6wIcdVBZNDf/0qhybHt2Gg
 1cFAPf5PNxeiEVEuug2WCn7roE4I8AuKrkIEpbyOifO9DI31GAcuBbo1ixbFooihQCp4
 QWXcEsvB/SDHizXFGMNKDQagFR4jL0Hkae/FpXYbCQP9KoBl9xBgFZs75Ln1RskLbQB6 Mw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjgdceyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 05:21:00 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3084cmxA023308;
	Mon, 9 Jan 2023 05:20:58 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3my0c6spsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 05:20:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3095Ktou37159386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Jan 2023 05:20:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B702D20043;
	Mon,  9 Jan 2023 05:20:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39E7420040;
	Mon,  9 Jan 2023 05:20:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Jan 2023 05:20:55 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0983B600D2;
	Mon,  9 Jan 2023 16:20:52 +1100 (AEDT)
Message-ID: <cca49d1e5da01e9ccdee50d710045fd09005459c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 7/7] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, Michael Ellerman
 <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org
Date: Mon, 09 Jan 2023 16:20:51 +1100
In-Reply-To: <b4b23fb8a56fdcfffe28c38ac3f4f89e0c488486.camel@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
	 <20221230042014.154483-8-ruscur@russell.cc>
	 <87zgawgcpa.fsf@mpe.ellerman.id.au>
	 <b4b23fb8a56fdcfffe28c38ac3f4f89e0c488486.camel@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i2LBh1VeUFY3WIKwJGdKFpTyqNTtpmDJ
X-Proofpoint-ORIG-GUID: i2LBh1VeUFY3WIKwJGdKFpTyqNTtpmDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-08_19,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=823 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090034
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
Cc: nayna@linux.ibm.com, gregkh@linuxfoundation.org, gcwilson@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-01-09 at 14:34 +1100, Russell Currey wrote:
>=20
> > > +static int plpks_secvar_init(void)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!plpks_is_available())
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set_secvar_ops(&plpks_secv=
ar_ops);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set_secvar_config_attrs(co=
nfig_attrs);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > +}
> > > +device_initcall(plpks_secvar_init);
> >=20
> > That must be a machine_device_initcall(pseries, ...), otherwise we
> > will
> > blow up doing a hcall on powernv in plpks_is_available().
>=20
> OK, can do.=C2=A0 I don't understand your case of how powernv could hit
> this, but I think I to have to move plpks_is_available() into
> include/,
> so it's going to be even more possible anyway.

Kernels can be compiled with both pseries and powernv support, in which
case plpks_secvar_init() will be called unconditionally even when
booting on a powernv machine.

I can confirm that as it is, booting this on powernv qemu causes a
panic.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
