Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497B2356AC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 13:17:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKJQC6B6yzDqLl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 21:17:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKJMg5BhqzDqKh
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 21:15:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 072B1mp1093532
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 2 Aug 2020 07:15:07 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32nv5m09ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 07:15:07 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 072BBMbG004105
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 2 Aug 2020 11:15:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 32n017rp7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 11:15:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 072BF2MK59637830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 Aug 2020 11:15:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E79F4C050;
 Sun,  2 Aug 2020 11:15:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C91C64C04E;
 Sun,  2 Aug 2020 11:15:01 +0000 (GMT)
Received: from [9.102.0.90] (unknown [9.102.0.90])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  2 Aug 2020 11:15:01 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: [merge] Build failure selftest/powerpc/mm/pkey_exec_prot
Message-Id: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
Date: Sun, 2 Aug 2020 16:45:00 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-02_06:2020-07-31,
 2020-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=1 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008020080
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
Cc: sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pkey_exec_prot test from linuxppc merge branch (3f68564f1f5a) fails to
build due to following error:

gcc -std=3Dgnu99 -O2 -Wall -Werror =
-DGIT_VERSION=3D'"v5.8-rc7-1276-g3f68564f1f5a"' =
-I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    =
pkey_exec_prot.c =
/home/sachin/linux/tools/testing/selftests/kselftest_harness.h =
/home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c =
../utils.c  -o =
/home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot
In file included from pkey_exec_prot.c:18:
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: =
error: "SYS_pkey_mprotect" redefined [-Werror]
 #define SYS_pkey_mprotect 386
=20
In file included from /usr/include/sys/syscall.h:31,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
                 from =
/home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
                 from pkey_exec_prot.c:18:
/usr/include/bits/syscall.h:1583: note: this is the location of the =
previous definition
 # define SYS_pkey_mprotect __NR_pkey_mprotect

commit 128d3d021007 introduced this error.
selftests/powerpc: Move pkey helpers to headers

Possibly the # defines for sys calls can be retained in pkey_exec_prot.c =
or


Thanks
-Sachin=
