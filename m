Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6256386D807
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 00:46:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kX4brMjo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm7Cc6vk6z3vc6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 10:46:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kX4brMjo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mpe@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tm7Bq2cLWz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 10:45:39 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41TNWlOH010226;
	Thu, 29 Feb 2024 23:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=lQZDwo7pNYetMYwpB3CLHJ/+PW0KEucA/7RaMYYnuTc=;
 b=kX4brMjoz9GU4Ua7wF7C3LO3d0+LpWRXWcHL979m82x2aYuGyQsMayFihDQbBqihP0Qh
 dM9OkKHAi+YwngaZBX5C5jGLRk2/dBWq/jUV/4lacEntPIPtgl7/IUVWCMAFCD2nNTjf
 4lQiNffnATGq/ASD6r81bXFpaZzy3RTzmzblqEyUcoZOc9oS6iu8Yr52NtqwxcKNxQmE
 28rhRpTGvht0OUKtp/EHDX8cPMVysF7Zm2Oz0aGEtQuqhn+dgwOmd/Z/Fvc2w/11wVio
 KCdPCgyAS77P6EQOmN/YnwihW3DCM5mCGWRZ4pMZ3Hz/nWn+Bwt7tiuBlaLS/OxExmYm WA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wk3pkr7vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 23:45:36 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41TMA2D6021267;
	Thu, 29 Feb 2024 23:45:35 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfuspgxdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 23:45:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41TNjVfK000648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 23:45:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CDBC20043;
	Thu, 29 Feb 2024 23:45:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8B6E2004B;
	Thu, 29 Feb 2024 23:45:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 23:45:30 +0000 (GMT)
Received: from localhost (unknown [9.66.77.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DCE2A60064;
	Fri,  1 Mar 2024 10:45:26 +1100 (AEDT)
From: Michael Ellerman <mpe@linux.ibm.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [netdev] Build failure on powerpc
In-Reply-To: <916F09F9-FC10-4248-BE64-9E01AA264CBA@linux.ibm.com>
References: <8294bf9a-d175-4d86-b6df-9c409108cbf1@linux.vnet.ibm.com>
 <875xy8103a.fsf@mail.lhotse>
 <916F09F9-FC10-4248-BE64-9E01AA264CBA@linux.ibm.com>
Date: Fri, 01 Mar 2024 10:45:23 +1100
Message-ID: <87il26g7ho.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vHsBYj5vATN-KdEmopV5fJmGr-eMjc2A
X-Proofpoint-GUID: vHsBYj5vATN-KdEmopV5fJmGr-eMjc2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_06,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=669 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402290185
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
Cc: Tasmiya Nalatwad <tasmiya@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:
>> On 29-Feb-2024, at 7:52=E2=80=AFAM, Michael Ellerman <mpe@linux.ibm.com>=
 wrote:
>> Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com> writes:
>>> Greetings,
>>>=20
>>> [netdev] Build failure on powerpc
>>> latest netdev 6.8.0-rc5-auto-g1ce7d306ea63 fails to build on powerpc=20
>>> below traces
>>=20
>> Please include the defconfig you're building, and the toolchain
>> versions, in reports like this.
>>=20
>> I wasn't able to reproduce this failure here.
>
> I believe this is tied to gcc version.=20
>
> Build failure is seen while using gcc-8.5.x but not with gcc-11.4.x

Thanks. Yes, I see it here with 8.4, and 9.5, but not 10.5.

cheers
