Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA2A1BC55B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 18:38:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BS4S3m6zzDqv8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 02:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BRYD75H2zDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 02:14:24 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SG7i9M007012; Tue, 28 Apr 2020 12:14:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh33kwq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 12:14:15 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03SG7xhg008472;
 Tue, 28 Apr 2020 12:14:15 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh33kwpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 12:14:15 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SGAOgg015224;
 Tue, 28 Apr 2020 16:14:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5pfq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 16:14:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SGEA8F64028798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 16:14:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FCC752051;
 Tue, 28 Apr 2020 16:14:10 +0000 (GMT)
Received: from localhost (unknown [9.85.73.214])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DF05D5204F;
 Tue, 28 Apr 2020 16:14:09 +0000 (GMT)
Date: Tue, 28 Apr 2020 21:44:03 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 7/7] powerpc/selftest: reuse ppc-opcode macros to
 avoid redundancy
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200424070853.443969-1-bala24@linux.ibm.com>
 <20200424070853.443969-8-bala24@linux.ibm.com>
In-Reply-To: <20200424070853.443969-8-bala24@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1588090341.edjw0pyuex.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_11:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280126
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S wrote:
> Avoid redefining macros to encode ppc instructions instead reuse it from
> ppc-opcode.h, Makefile changes are necessary to compile memcmp_64.S with
> __ASSEMBLY__ defined from selftests.
>=20
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  .../selftests/powerpc/stringloops/Makefile    | 34 ++++++++++++++----
>  .../powerpc/stringloops/asm/asm-const.h       |  1 +
>  .../powerpc/stringloops/asm/ppc-opcode.h      | 36 +------------------
>  3 files changed, 29 insertions(+), 42 deletions(-)
>  create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-c=
onst.h
>  mode change 100644 =3D> 120000 tools/testing/selftests/powerpc/stringloo=
ps/asm/ppc-opcode.h
>=20
> diff --git a/tools/testing/selftests/powerpc/stringloops/Makefile b/tools=
/testing/selftests/powerpc/stringloops/Makefile
> index 7fc0623d85c3..efe76c5a5b94 100644
> --- a/tools/testing/selftests/powerpc/stringloops/Makefile
> +++ b/tools/testing/selftests/powerpc/stringloops/Makefile
> @@ -1,26 +1,44 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # The loops are all 64-bit code
> -CFLAGS +=3D -I$(CURDIR)
> +GIT_VERSION =3D $(shell git describe --always --long --dirty || echo "un=
known")
> +CFLAGS +=3D -DGIT_VERSION=3D'"$(GIT_VERSION)"' -I$(CURDIR) -I$(CURDIR)/.=
./include

I'm not sure why there are some extra flags added here. Not sure if it=20
is required for this change, or if they are separate changes. Trying to=20
build this from 'tools/testing/selftests/powerpc/' with 'make=20
stringloops' shows slightly different compile flags being used.

- Naveen

