Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F8231276
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 21:21:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGRP443lszDqYj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 05:21:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGRLW4VmNzDr1N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 05:19:14 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SJ2aFu195957
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 15:19:10 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32hrnn4gt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 15:19:10 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SJG07p005024
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 19:19:09 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 32gcyckva5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 19:19:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06SJJ6PQ9831076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jul 2020 19:19:06 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A157E7805C;
 Tue, 28 Jul 2020 19:19:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69BC078064;
 Tue, 28 Jul 2020 19:19:08 +0000 (GMT)
Received: from localhost (unknown [9.65.227.150])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jul 2020 19:19:08 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: explicitly reschedule during drmem_lmb
 list traversal
In-Reply-To: <bd9225f2-40c9-0460-ba45-c29c920b5f91@linux.ibm.com>
References: <20200728173741.717372-1-nathanl@linux.ibm.com>
 <bd9225f2-40c9-0460-ba45-c29c920b5f91@linux.ibm.com>
Date: Tue, 28 Jul 2020 14:19:07 -0500
Message-ID: <878sf31m8k.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_15:2020-07-28,
 2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=1
 mlxlogscore=999 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280131
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Le 28/07/2020 =C3=A0 19:37, Nathan Lynch a =C3=A9crit=C2=A0:
>> The drmem lmb list can have hundreds of thousands of entries, and
>> unfortunately lookups take the form of linear searches. As long as
>> this is the case, traversals have the potential to monopolize the CPU
>> and provoke lockup reports, workqueue stalls, and the like unless
>> they explicitly yield.
>>=20
>> Rather than placing cond_resched() calls within various
>> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
>> expression of the loop macro itself so users can't omit it.
>
> Is that not too much to call cond_resched() on every LMB?
>
> Could that be less frequent, every 10, or 100, I don't really know ?

Everything done within for_each_drmem_lmb is relatively heavyweight
already. E.g. calling dlpar_remove_lmb()/dlpar_add_lmb() can take dozens
of milliseconds. I don't think cond_resched() is an expensive check in
this context.
