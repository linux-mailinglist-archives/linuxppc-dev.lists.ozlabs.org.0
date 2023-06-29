Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0278274276E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:32:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f2nihmCB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsKBc6fd5z3bfK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 23:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f2nihmCB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsK9h6Pqpz30h8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 23:31:52 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TDSkeu011219;
	Thu, 29 Jun 2023 13:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ZwvJ0eEbncN/kOCHI+wZaTlZPHMLkO5x//AAsn1W7tw=;
 b=f2nihmCB0lv1o6hd0yn36xLbBfrjudJSsnmBK+uxpj9/AGaa+gMA2O3rfhTEZGhRQ5bo
 e98bJF4vKIfIqVKrDfSz/3mhrneJplKoD9jgSeeBgbnpw2wK3j6+F/cBlVnPByqNoKwX
 vgFJo2kpvkPD6WXGjUhyplSOotHQ7IiV90Hg/JrGLL3E7dz8unjOPWdJOvfas0ABzUrG
 qTQgtc3AmOlvOrdZSOH+0ykRGOT8TVSoz1o9IQjH+aphdwSm4o+CMdfiI7VH1PzmrpVE
 e7vg7/XbpSguo8arfAb6KYe5JrajatVsbdSI7nr1KRsf8BidBdOzlhrqGwOfMQtIJ0hi sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhavhg1q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 13:31:41 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35TDU8dt015383;
	Thu, 29 Jun 2023 13:31:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhavhg1nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 13:31:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35T9H6GI002392;
	Thu, 29 Jun 2023 13:31:38 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rdr453c4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 13:31:38 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35TDVaG662193990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jun 2023 13:31:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02F0520043;
	Thu, 29 Jun 2023 13:31:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6C8120040;
	Thu, 29 Jun 2023 13:31:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.91.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Jun 2023 13:31:33 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 0/9]  Introduce SMT level and add PowerPC support
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <87edluh6ce.fsf@mail.lhotse>
Date: Thu, 29 Jun 2023 19:01:22 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <E68433D6-F103-4B58-A0DC-AD1099F8CC05@linux.ibm.com>
References: <20230628100558.43482-1-ldufour@linux.ibm.com>
 <88E208A6-F4E0-4DE9-8752-C9652B978BC6@linux.ibm.com>
 <87edluh6ce.fsf@mail.lhotse>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p9fIrhzuknG-wZ6s0tbFa0qN0XHpWfsu
X-Proofpoint-ORIG-GUID: bil4KbMF-Z02xwvfg-W4hlsa2BwW-7Kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306290122
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, open list <linux-kernel@vger.kernel.org>, npiggin@gmail.com, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, tglx@linutronix.de, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>=20
>> Without this option but changing SMT level during runtime using
>> ppc64_cpu =E2=80=94smt=3D<level>, the SMT level is not retained after
>> cpu core add.
>=20
> That's because ppc64_cpu is not using the sysfs SMT control file, it's
> just onlining/offlining threads manually.
>=20
> If you run:
> $ ppc64_cpu --smt=3D4=20
>=20
> And then also do:
>=20
> $ echo 4 > /sys/devices/system/cpu/smt/control
>=20
> It should work as expected?

Thanks Michael. Yes this works. The SMT level is preserved
after a core add.

- Sachin
