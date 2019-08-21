Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0FA97F92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 18:01:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DC7v4X20zDr0d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 02:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DC5m0WPLzDqp5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:59:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LFvbJ1101780; Wed, 21 Aug 2019 11:59:15 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uh85fjvvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 11:59:14 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7LFtfZZ031485;
 Wed, 21 Aug 2019 15:59:14 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2ue9764w89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 15:59:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LFxDHc15925572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 15:59:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EAEBAC065;
 Wed, 21 Aug 2019 15:59:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 691A3AC05B;
 Wed, 21 Aug 2019 15:59:13 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Aug 2019 15:59:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/vdso64: inline __get_datapage()
In-Reply-To: <3724e1ba-d0f8-7247-73c2-6d83a3dbd040@c-s.fr>
References: <6662919bd80773aaf339e85b14af1ea1ddbfd841.camel@kernel.crashing.org>
 <20190821092959.16066-1-santosh@fossix.org>
 <3724e1ba-d0f8-7247-73c2-6d83a3dbd040@c-s.fr>
Date: Wed, 21 Aug 2019 10:58:57 -0500
Message-ID: <87lfvmse66.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210166
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 21/08/2019 =C3=A0 11:29, Santosh Sivaraj a =C3=A9crit=C2=A0:
>> __get_datapage() is only a few instructions to retrieve the
>> address of the page where the kernel stores data to the VDSO.
>>=20
>> By inlining this function into its users, a bl/blr pair and
>> a mflr/mtlr pair is avoided, plus a few reg moves.
>>=20
>> clock-gettime-monotonic: syscall: 514 nsec/call  396 nsec/call
>> clock-gettime-monotonic:    libc: 25 nsec/call   24 nsec/call
>> clock-gettime-monotonic:    vdso: 20 nsec/call   20 nsec/call
>> clock-getres-monotonic: syscall: 347 nsec/call   372 nsec/call
>> clock-getres-monotonic:    libc: 19 nsec/call    19 nsec/call
>> clock-getres-monotonic:    vdso: 10 nsec/call    10 nsec/call
>> clock-gettime-monotonic-coarse: syscall: 511 nsec/call   396 nsec/call
>> clock-gettime-monotonic-coarse:    libc: 23 nsec/call    21 nsec/call
>> clock-gettime-monotonic-coarse:    vdso: 15 nsec/call    13 nsec/call
>> clock-gettime-realtime: syscall: 526 nsec/call   405 nsec/call
>> clock-gettime-realtime:    libc: 24 nsec/call    23 nsec/call
>> clock-gettime-realtime:    vdso: 18 nsec/call    18 nsec/call
>> clock-getres-realtime: syscall: 342 nsec/call    372 nsec/call
>> clock-getres-realtime:    libc: 19 nsec/call     19 nsec/call
>> clock-getres-realtime:    vdso: 10 nsec/call     10 nsec/call
>> clock-gettime-realtime-coarse: syscall: 515 nsec/call    373 nsec/call
>> clock-gettime-realtime-coarse:    libc: 23 nsec/call     22 nsec/call
>> clock-gettime-realtime-coarse:    vdso: 14 nsec/call     13 nsec/call
>
> I think you should only put the measurements on vdso calls, and only the=
=20
> ones that are impacted by the change. For exemple, getres function=20
> doesn't use __get_datapage so showing it here is pointless.

I agree with this point, but also, I would caution against using
vdsotest's benchmark function for anything like rigorous performance
analysis. The intention was to roughly confirm the VDSO's relative
performance vs the in-kernel implementations. Not to compare one VDSO
implementation of (say) clock_gettime to another.

I suggest using perf to confirm the expected effects of the change, if
possible.
