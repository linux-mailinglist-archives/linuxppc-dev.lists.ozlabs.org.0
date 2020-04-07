Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4820A1A09BE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 11:07:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xM493BKpzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 19:07:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xM2643FhzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 19:05:34 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03794Cgx003846
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 05:05:31 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 308eu830qx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 05:05:31 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 7 Apr 2020 10:05:17 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 10:05:16 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03795Qat53870734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 09:05:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 950CD52057;
 Tue,  7 Apr 2020 09:05:26 +0000 (GMT)
Received: from localhost (unknown [9.85.74.108])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2653952051;
 Tue,  7 Apr 2020 09:05:25 +0000 (GMT)
Date: Tue, 07 Apr 2020 14:35:22 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/5] Track and expose idle PURR and SPURR ticks
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Kamalesh Babulal
 <kamalesh@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Vaidyanathan Srinivasan
 <svaidy@linux.vnet.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
References: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
In-Reply-To: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040709-0012-0000-0000-0000039FDFFF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040709-0013-0000-0000-000021DD0087
Message-Id: <1586250289.bjlqf3xvt0.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070072
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R. Shenoy wrote:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>=20
> Hi,
>=20
> This is the fifth version of the patches to track and expose idle PURR
> and SPURR ticks. These patches are required by tools such as lparstat
> to compute system utilization for capacity planning purposes.
>=20
> The previous versions can be found here:
> v4: https://lkml.org/lkml/2020/3/27/323
> v3: https://lkml.org/lkml/2020/3/11/331
> v2: https://lkml.org/lkml/2020/2/21/21
> v1: https://lore.kernel.org/patchwork/cover/1159341/
>=20
> They changes from v4 are:
>=20
>    - As suggested by Naveen, moved the functions read_this_idle_purr()
>      and read_this_idle_spurr() from Patch 2 and Patch 3 respectively
>      to Patch 4 where it is invoked.
>=20
>    - Dropped Patch 6 which cached the values of purr, spurr,
>      idle_purr, idle_spurr in order to minimize the number of IPIs
>      sent.
>=20
>    - Updated the dates for the idle_purr, idle_spurr in the
>      Documentation Patch 5.
>=20
> Motivation:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> On PSeries LPARs, the data centers planners desire a more accurate
> view of system utilization per resource such as CPU to plan the system
> capacity requirements better. Such accuracy can be obtained by reading
> PURR/SPURR registers for CPU resource utilization.
>=20
> Tools such as lparstat which are used to compute the utilization need
> to know [S]PURR ticks when the cpu was busy or idle. The [S]PURR
> counters are already exposed through sysfs.  We already account for
> PURR ticks when we go to idle so that we can update the VPA area. This
> patchset extends support to account for SPURR ticks when idle, and
> expose both via per-cpu sysfs files.
>=20
> These patches are required for enhancement to the lparstat utility
> that compute the CPU utilization based on PURR and SPURR which can be
> found here :
> https://groups.google.com/forum/#!topic/powerpc-utils-devel/fYRo69xO9r4
>=20
>=20
> With the patches, when lparstat is run on a LPAR running CPU-Hogs,
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> sudo ./src/lparstat -E 1 3
>=20
> System Configuration
> type=3DDedicated mode=3DCapped smt=3D8 lcpu=3D2 mem=3D4834112 kB cpus=3D0=
 ent=3D2.00=20
>=20
> ---Actual---                 -Normalized-
> %busy  %idle   Frequency     %busy  %idle
> ------ ------  ------------- ------ ------
> 1  99.99   0.00  3.35GHz[111%] 110.99   0.00
> 2 100.00   0.00  3.35GHz[111%] 111.01   0.00
> 3 100.00   0.00  3.35GHz[111%] 111.00   0.00
>=20
> With patches, when lparstat is run on and idle LPAR
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> System Configuration
> type=3DDedicated mode=3DCapped smt=3D8 lcpu=3D2 mem=3D4834112 kB cpus=3D0=
 ent=3D2.00=20
> ---Actual---                 -Normalized-
> %busy  %idle   Frequency     %busy  %idle
> ------ ------  ------------- ------ ------
> 1   0.15  99.84  2.17GHz[ 72%]   0.11  71.89
> 2   0.24  99.76  2.11GHz[ 70%]   0.18  69.82
> 3   0.24  99.75  2.11GHz[ 70%]   0.18  69.81
>=20
> Gautham R. Shenoy (5):
>   powerpc: Move idle_loop_prolog()/epilog() functions to header file
>   powerpc/idle: Store PURR snapshot in a per-cpu global variable
>   powerpc/pseries: Account for SPURR ticks on idle CPUs
>   powerpc/sysfs: Show idle_purr and idle_spurr for every CPU
>   Documentation: Document sysfs interfaces purr, spurr, idle_purr,
>     idle_spurr

Thanks, LGTM. For the series:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

