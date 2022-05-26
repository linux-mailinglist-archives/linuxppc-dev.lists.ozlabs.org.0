Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA39534E9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 13:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L85rk5fzsz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 21:52:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sGJ6FYY0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sGJ6FYY0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L85r34zGxz2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 21:51:31 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24QBhuvC022369;
	Thu, 26 May 2022 11:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=ynPlZyBaNKCcm0CiJDgThFxPrRBhCGbeVI8OA7nVc8o=;
 b=sGJ6FYY0ksdqK5Gilghmv3kKnIMhcL/jN7NS24uSiR2jRRy84JL2psZgB7bPAMz4ALRN
 7YMZGsiA0d0WfL8ZMrYHrNAwbpoU1fH945DGoKYYYt7J/qDKlV9FY35iN0g13TlfOAtL
 LK8UAckdDHDhw8frfEfd1pO2Jdkm5FAt5SJMVl8BWEdXVhJXHrbdcmHa3Dol+V/8Hom3
 xgtOdK1uMcP2IGsI3u8lCUqQYqPyISVeAoPPOVQrtf5ib0MCGs7MLH3qs+uSBJl7zryh
 Ny+BKUSWhZiD7yiwEm8cx+7pVWPb2bLrlosLdmbuh9ZlhnthOLKtipz7GAv9gIzNRzIi bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ga8x583xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 11:51:13 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24QBjwD7029256;
	Thu, 26 May 2022 11:51:12 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ga8x583wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 11:51:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24QBmWbP024191;
	Thu, 26 May 2022 11:51:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3g93ux2j5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 11:51:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24QBp88545678892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 May 2022 11:51:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 985C352050;
	Thu, 26 May 2022 11:51:08 +0000 (GMT)
Received: from localhost (unknown [9.43.88.34])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EFD345204F;
	Thu, 26 May 2022 11:51:07 +0000 (GMT)
Date: Thu, 26 May 2022 17:21:02 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 1/4] objtool: Add --mnop as an option to --mcount
To: Peter Zijlstra <peterz@infradead.org>
References: <20220523175548.922671-1-sv@linux.ibm.com>
	<20220523175548.922671-2-sv@linux.ibm.com>
	<26c7bfc8-3089-034a-70c0-8857d7cd3a99@csgroup.eu>
	<1653386854.o7nss9hzc9.naveen@linux.ibm.com>
	<d45030be-3f6b-ebeb-3d63-bf7a96d3ff3b@csgroup.eu>
	<1653388084.w21cyb07gc.naveen@linux.ibm.com>
	<Yo4UysC69UCwhlYp@hirez.programming.kicks-ass.net>
In-Reply-To: <Yo4UysC69UCwhlYp@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1653564857.f06fbbl3vg.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VqH70ghrPi37x42qUQ2pBbdsMKAQow1X
X-Proofpoint-ORIG-GUID: Peo3i2FCPjcZkXQWaKkjXDOKpPv7Iwnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_06,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=654
 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260054
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra wrote:
> On Tue, May 24, 2022 at 04:01:48PM +0530, Naveen N. Rao wrote:
>=20
>> We need to know for sure either way. Nop'ing out the _mcount locations a=
t
>> boot allows us to discover existing long branch trampolines. If we want =
to
>> avoid it, we need to note down those locations during build time.
>>=20
>> Do you have a different approach in mind?
>=20
> If you put _mcount in a separate section then the compiler cannot tell
> where it is and is forced to always emit a long branch trampoline.
>=20
> Does that help?

That's an interesting thought. Depending on the type of trampoline the=20
compiler emits, I might be able to use this approach. We will still need=20
objtool on powerpc  so that we can note down those trampoline locations.


Thanks,
Naveen
