Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC43153B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:23:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZp9j0cHmzDshX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:23:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZp531z4KzDspJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 03:19:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 119GD3SR108452; Tue, 9 Feb 2021 11:19:42 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36kwqc067u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:19:42 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119GEtwZ031718;
 Tue, 9 Feb 2021 16:19:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 36hjr8bj0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 16:19:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 119GJcqT40632748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Feb 2021 16:19:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51BCCA405B;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26960A4054;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.88.237])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8E40F220155;
 Tue,  9 Feb 2021 17:19:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] powerpc/xive: Map one IPI interrupt per node
Date: Tue,  9 Feb 2021 17:19:31 +0100
Message-Id: <20210209161936.377760-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090080
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

ipistorm [*] can be used to benchmark the raw interrupt rate of an
interrupt controller by measuring the number of IPIs a system can
sustain. When applied to the XIVE interrupt controller of POWER9 and
POWER10 systems, a significant drop of the interrupt rate can be
observed when crossing the second node boundary.

This is due to the fact that a single IPI interrupt is used for all
CPUs of the system. The structure is shared and the cache line updates
impact greatly the traffic between nodes and the overall IPI
performance.

As a workaround, the impact can be reduced by deactivating the IRQ
lockup detector ("noirqdebug") which does a lot of accounting in the
Linux IRQ descriptor structure and is responsible for most of the
performance penalty.

As a fix, this proposal allocates an IPI interrupt per node, to be
shared by all CPUs of that node. It solves the scaling issue, the IRQ
lockup detector still has an impact but the XIVE interrupt rate scales
linearly. It also improves the "noirqdebug" case as showed in the
tables below.=20

 * P9 DD2.2 - 2s * 64 threads

                                               "noirqdebug"
                        Mint/s                    Mint/s  =20
 chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys    =20
 --------------------------------------------------------------
 1      0-15     4.984023   4.875405       4.996536   5.048892
        0-31    10.879164  10.544040      10.757632  11.037859
        0-47    15.345301  14.688764      14.926520  15.310053
        0-63    17.064907  17.066812      17.613416  17.874511
 2      0-79    11.768764  21.650749      22.689120  22.566508
        0-95    10.616812  26.878789      28.434703  28.320324
        0-111   10.151693  31.397803      31.771773  32.388122
        0-127    9.948502  33.139336      34.875716  35.224548


 * P10 DD1 - 4s (not homogeneous) 352 threads

                                               "noirqdebug"
                        Mint/s                    Mint/s  =20
 chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys    =20
 --------------------------------------------------------------
 1      0-15     2.409402   2.364108       2.383303   2.395091
        0-31     6.028325   6.046075       6.089999   6.073750
        0-47     8.655178   8.644531       8.712830   8.724702
        0-63    11.629652  11.735953      12.088203  12.055979
        0-79    14.392321  14.729959      14.986701  14.973073
        0-95    12.604158  13.004034      17.528748  17.568095
 2      0-111    9.767753  13.719831      19.968606  20.024218
        0-127    6.744566  16.418854      22.898066  22.995110
        0-143    6.005699  19.174421      25.425622  25.417541
        0-159    5.649719  21.938836      27.952662  28.059603
        0-175    5.441410  24.109484      31.133915  31.127996
 3      0-191    5.318341  24.405322      33.999221  33.775354
        0-207    5.191382  26.449769      36.050161  35.867307
        0-223    5.102790  29.356943      39.544135  39.508169
        0-239    5.035295  31.933051      42.135075  42.071975
        0-255    4.969209  34.477367      44.655395  44.757074
 4      0-271    4.907652  35.887016      47.080545  47.318537
        0-287    4.839581  38.076137      50.464307  50.636219
        0-303    4.786031  40.881319      53.478684  53.310759
        0-319    4.743750  43.448424      56.388102  55.973969
        0-335    4.709936  45.623532      59.400930  58.926857
        0-351    4.681413  45.646151      62.035804  61.830057

[*] https://github.com/antonblanchard/ipistorm

Thanks,

C.

C=C3=A9dric Le Goater (5):
  powerpc/xive: Use cpu_to_node() instead of ibm,chip-id property
  powerpc/xive: Introduce an IPI interrupt domain
  powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
  powerpc/xive: Simplify xive_core_debug_show()
  powerpc/xive: Map one IPI interrupt per node

 arch/powerpc/sysdev/xive/xive-internal.h |   2 -
 arch/powerpc/sysdev/xive/common.c        | 114 +++++++++++------------
 2 files changed, 56 insertions(+), 60 deletions(-)

--=20
2.26.2

