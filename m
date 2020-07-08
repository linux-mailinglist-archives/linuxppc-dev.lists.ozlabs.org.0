Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657021851F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 12:40:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1wmY6xfYzDqvP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 20:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1wkb0518zDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 20:38:14 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068AXn7q003831; Wed, 8 Jul 2020 06:38:10 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3258nxq222-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 06:38:10 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 068AVSOQ027961;
 Wed, 8 Jul 2020 10:38:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3251dw09wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 10:38:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068Ac5Bl46661818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 10:38:05 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E4FF4203F;
 Wed,  8 Jul 2020 10:38:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D9884204B;
 Wed,  8 Jul 2020 10:38:04 +0000 (GMT)
Received: from [9.85.88.68] (unknown [9.85.88.68])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 10:38:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH] selftests/powerpc: Purge extra count_pmc() calls of ebb
 selftests
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20200626164737.21943-1-desnesn@linux.ibm.com>
Date: Wed, 8 Jul 2020 16:08:03 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0DC61BE-076E-4977-812F-532C6F76CFBB@linux.vnet.ibm.com>
References: <20200626164737.21943-1-desnesn@linux.ibm.com>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_07:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 cotscore=-2147483648
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007080073
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
Cc: shuah@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Jun-2020, at 10:17 PM, Desnes A. Nunes do Rosario =
<desnesn@linux.ibm.com> wrote:
>=20
> An extra count on ebb_state.stats.pmc_count[PMC_INDEX(pmc)] is being =
per-
> formed when count_pmc() is used to reset PMCs on a few selftests. This
> extra pmc_count can occasionally invalidate results, such as the ones =
from
> cycles_test shown hereafter. The ebb_check_count() failed with an =
above
> the upper limit error due to the extra value on =
ebb_state.stats.pmc_count.
>=20
> Furthermore, this extra count is also indicated by extra PMC1 =
trace_log on
> the output of the cycle test (as well as on pmc56_overflow_test):
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   ...
>   [21]: counter =3D 8
>   [22]: register SPRN_MMCR0 =3D 0x0000000080000080
>   [23]: register SPRN_PMC1  =3D 0x0000000080000004
>   [24]: counter =3D 9
>   [25]: register SPRN_MMCR0 =3D 0x0000000080000080
>   [26]: register SPRN_PMC1  =3D 0x0000000080000004
>   [27]: counter =3D 10
>   [28]: register SPRN_MMCR0 =3D 0x0000000080000080
>   [29]: register SPRN_PMC1  =3D 0x0000000080000004
>>> [30]: register SPRN_PMC1  =3D 0x000000004000051e
> PMC1 count (0x280000546) above upper limit 0x2800003e8 (+0x15e)
> [FAIL] Test FAILED on line 52
> failure: cycles
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
> ---

I too have run into similar failure with cycles_test. I will add that =
the failure
is inconsistent. I have run into this issue 1 out of 25 times. The =
failure always
happen at first instance. Subsequent tries work correctly.

With this patch applied the test completes successfully 25 out of 25 =
times.

# ./cycles_test=20
test: cycles
=E2=80=A6..
=E2=80=A6..
  [25]: register SPRN_MMCR0 =3D 0x0000000080000080
  [26]: register SPRN_PMC1  =3D 0x0000000080000004
  [27]: counter =3D 10
  [28]: register SPRN_MMCR0 =3D 0x0000000080000080
  [29]: register SPRN_PMC1  =3D 0x0000000080000004
  [30]: register SPRN_PMC1  =3D 0x000000004000048f
PMC1 count (0x2800004b7) above upper limit 0x2800003e8 (+0xcf)
[FAIL] Test FAILED on line 52
failure: cycles

With the patch

# ./cycles_test=20
test: cycles
=E2=80=A6..
=E2=80=A6..
  [25]: register SPRN_MMCR0 =3D 0x0000000080000080
  [26]: register SPRN_PMC1  =3D 0x0000000080000004
  [27]: counter =3D 10
  [28]: register SPRN_MMCR0 =3D 0x0000000080000080
  [29]: register SPRN_PMC1  =3D 0x0000000080000004
PMC1 count (0x280000028) is between 0x27ffffc18 and 0x2800003e8 delta =
+0x410/-0x3c0
success: cycles
#=20

FWIW   Tested-by : Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin=
