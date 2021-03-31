Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D57BF35029C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Tfj6J9Xz3cbF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:46:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TdD1sTzz301t
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:45:35 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VEhDml027262; Wed, 31 Mar 2021 10:45:22 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mt98j1yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 10:45:21 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VEgLUA017277;
 Wed, 31 Mar 2021 14:45:19 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 37matt0nnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 14:45:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12VEjHfu18809212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:45:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FD1552052;
 Wed, 31 Mar 2021 14:45:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id E0C2F52051;
 Wed, 31 Mar 2021 14:45:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.101])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 355E9220059;
 Wed, 31 Mar 2021 16:45:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/9] powerpc/xive: Map one IPI interrupt per node
Date: Wed, 31 Mar 2021 16:45:05 +0200
Message-Id: <20210331144514.892250-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i8xOEhpQdpqJNfUNQAoAVvytD22pih2s
X-Proofpoint-ORIG-GUID: i8xOEhpQdpqJNfUNQAoAVvytD22pih2s
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_06:2021-03-31,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1034 bulkscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2103300000 definitions=main-2103310105
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
                        Mint/s                    Mint/s=20=20=20
 chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys=20=20=20=20=
=20
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
                        Mint/s                    Mint/s=20=20=20
 chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys=20=20=20=20=
=20
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

Changes in v3:

  - improved commit log for the misuse of "ibm,chip-id"
  - better error handling of xive_request_ipi()
  - use of a fwnode_handle to name the new domain=20
  - increased IPI name length
  - use of early_cpu_to_node() for hotplugged CPUs
  - filter CPU-less nodes

Changes in v2:

  - extra simplification on xmon
  - fixes on issues reported by the kernel test robot

C=C3=A9dric Le Goater (9):
  powerpc/xive: Use cpu_to_node() instead of "ibm,chip-id" property
  powerpc/xive: Introduce an IPI interrupt domain
  powerpc/xive: Remove useless check on XIVE_IPI_HW_IRQ
  powerpc/xive: Simplify xive_core_debug_show()
  powerpc/xive: Drop check on irq_data in xive_core_debug_show()
  powerpc/xive: Simplify the dump of XIVE interrupts under xmon
  powerpc/xive: Fix xmon command "dxi"
  powerpc/xive: Map one IPI interrupt per node
  powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler

 arch/powerpc/include/asm/xive.h          |   1 +
 arch/powerpc/sysdev/xive/xive-internal.h |   2 -
 arch/powerpc/sysdev/xive/common.c        | 211 +++++++++++++++--------
 arch/powerpc/xmon/xmon.c                 |  28 +--
 4 files changed, 139 insertions(+), 103 deletions(-)

--=20
2.26.3

