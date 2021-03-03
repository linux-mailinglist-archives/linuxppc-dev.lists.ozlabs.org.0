Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A132B995
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 18:50:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrM3B5vmRz3dGh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:50:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrM250pCWz3cJY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 04:49:15 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123HWOgm055150; Wed, 3 Mar 2021 12:49:04 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372eusgjy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 12:49:04 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123HjQcL022155;
 Wed, 3 Mar 2021 17:49:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 36yj532134-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 17:49:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 123Hmj9x33358248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 17:48:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FE9CA405B;
 Wed,  3 Mar 2021 17:48:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B88AA4054;
 Wed,  3 Mar 2021 17:48:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  3 Mar 2021 17:48:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.87])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B43FC220423;
 Wed,  3 Mar 2021 18:48:58 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/8] powerpc/xive: Map one IPI interrupt per node
Date: Wed,  3 Mar 2021 18:48:49 +0100
Message-Id: <20210303174857.1760393-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1034 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030124
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
Cc: Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
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

Changes in v2:

  - extra simplification on xmon
  - fixes on issues reported by the kernel test robot

C=C3=A9dric Le Goater (8):
  powerpc/xive: Use cpu_to_node() instead of ibm,chip-id property
  powerpc/xive: Introduce an IPI interrupt domain
  powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
  powerpc/xive: Simplify xive_core_debug_show()
  powerpc/xive: Drop check on irq_data in xive_core_debug_show()
  powerpc/xive: Simplify the dump of XIVE interrupts under xmon
  powerpc/xive: Fix xmon command "dxi"
  powerpc/xive: Map one IPI interrupt per node

 arch/powerpc/include/asm/xive.h          |   1 +
 arch/powerpc/sysdev/xive/xive-internal.h |   2 -
 arch/powerpc/sysdev/xive/common.c        | 163 +++++++++++++----------
 arch/powerpc/xmon/xmon.c                 |  28 +---
 4 files changed, 93 insertions(+), 101 deletions(-)

--=20
2.26.2

