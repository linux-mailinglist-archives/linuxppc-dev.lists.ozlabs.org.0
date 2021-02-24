Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36845323B24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 12:16:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DltWs6Tjzz3cc3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 22:11:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PCXsKfi6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PCXsKfi6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DltWP0zgbz30Kw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 22:10:40 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OB37Zl109048; Wed, 24 Feb 2021 06:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=qF3WKuUeNTqAk4Botp58PL619d0IfkcI45oKnKpBrmw=;
 b=PCXsKfi6K0nbcRhcDqaImJYtA9XI9xc5U24sUma7UZ8XRsdweo1PmmHWH79O5kcbTAGD
 hlSoG/rRjpHwaUJiLvfP13ITgXGF+8GjLeyD/DsLKLvyNeezl4jImGD1lJZznz7514y7
 4M0rcEAf8L0P9l2ZcxTtDUtgdqoOVghGcbJeh4KaRAfqR259FVwhPjlxrPCcm2sAuqdR
 hH7owQWNmc7t2ywa//I2MyoPB61T0WZsPMApANdZ/mg5ZXK8h2LRicsYy3ltvhf6VQYT
 1d2m6Vw0V1WS+8ZTul743h5iLbx7iEIgQ++ZeW3+sgrLuWrtn6UkUEWdfNi48EhUvEdc 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wk3te0kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 06:10:26 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11OB3QLn110455;
 Wed, 24 Feb 2021 06:10:26 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wk3te0jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 06:10:25 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OB2One018873;
 Wed, 24 Feb 2021 11:10:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 36tt28bg5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:10:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OBALIV42074608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 11:10:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7875311C050;
 Wed, 24 Feb 2021 11:10:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9949811C04A;
 Wed, 24 Feb 2021 11:10:19 +0000 (GMT)
Received: from [9.195.40.186] (unknown [9.195.40.186])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Feb 2021 11:10:19 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] powerpc/perf: Fix handling of privilege level checks in
 perf interrupt context
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87czwrt057.fsf@mpe.ellerman.id.au>
Date: Wed, 24 Feb 2021 16:40:17 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <58E4DBFF-0B7C-4853-AD8D-8C937C34F78C@linux.vnet.ibm.com>
References: <1614061909-1734-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YDTg99xsVolE+sv+@hirez.programming.kicks-ass.net>
 <87czwrt057.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240086
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, omosnace@redhat.com, acme@kernel.org,
 Jiri Olsa <jolsa@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 23-Feb-2021, at 6:24 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Peter Zijlstra <peterz@infradead.org> writes:
>> On Tue, Feb 23, 2021 at 01:31:49AM -0500, Athira Rajeev wrote:
>>> Running "perf mem record" in powerpc platforms with selinux enabled
>>> resulted in soft lockup's. Below call-trace was seen in the logs:
> ...
>>>=20
>>> Since the purpose of this security hook is to control access to
>>> perf_event_open, it is not right to call this in interrupt context.
>>> But in case of powerpc PMU, we need the privilege checks for =
specific
>>> samples from branch history ring buffer and sampling register =
values.
>>=20
>> I'm confused... why would you need those checks at event time? Either
>> the event has perf_event_attr::exclude_kernel and it then isn't =
allowed
>> to expose kernel addresses, or it doesn't and it is.
>=20
> Well one of us is confused that's for sure ^_^
>=20
> I missed/forgot that we had that logic in open.
>=20
> I think the reason we got here is that in the past we didn't have the
> event in the low-level routines where we want to check,
> power_pmu_bhrb_read() and perf_get_data_addr(), so we hacked in a
> perf_paranoid_kernel() check. Which was wrong.
>=20
> Then Joel's patch plumbed the event through and switched those =
paranoid
> checks to perf_allow_kernel().
>=20
> Anyway, we'll just switch those to exclude_kernel checks.
>=20
>> There should never be an event-time question of permission like this. =
If
>> you allow creation of an event, you're allowing the data it =
generates.
>=20
> Ack.

Thanks for all the reviews. I will send a V2 with using =
'event->attr.exclude_kernel' in the checks.

Athira=20
>=20
> cheers
