Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05786ADE4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 12:45:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lwg4viNU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCGC0PKcz3dXL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:45:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lwg4viNU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCFS529xz2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 22:44:44 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41SBHQon011592;
	Wed, 28 Feb 2024 11:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=Z5K7fUou+KwvaalBncisFM+ytSyN2cQGMx2nKOs9wDw=;
 b=Lwg4viNUYAPCHOEQ9fbejnhozQkNPkyItdkkQe2lvBqNadjgEAtEPEY5wjlSnOEM20wr
 9fPFTat5fTvQ4pFiUyhuoX5L4TBvMTpcHQ4OCL7UQGSzoJZTSCtpFvzNO7es9lgZCyCH
 pE1p38SVIxygMR9XS63q1o1QkQcA+aa0+/fJ4aI1h1kMuKaa9y2c4pAQjLnwp5dNfE8A
 Odb435XytkkfwMxPKmz/7ENRT3z6mYr/dg6IVOSLFQz214IVobAK912TLG2Dq9ADs0sv
 UhCSkwdKyE+Kov6QEFG3Wl1UNIkgSA4W4phFiwKJX8nMbfxKjH/rCRRqlLJKD1vAb3We aA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj3tqrp5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 11:44:37 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41SBhDX7006349;
	Wed, 28 Feb 2024 11:44:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj3tqrp4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 11:44:36 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41SBAZah021728;
	Wed, 28 Feb 2024 11:44:35 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu6065sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 11:44:35 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41SBiWQ027984626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Feb 2024 11:44:34 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A90685805B;
	Wed, 28 Feb 2024 11:44:32 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCAAA58059;
	Wed, 28 Feb 2024 11:44:28 +0000 (GMT)
Received: from [9.43.45.154] (unknown [9.43.45.154])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Feb 2024 11:44:28 +0000 (GMT)
Message-ID: <8294bf9a-d175-4d86-b6df-9c409108cbf1@linux.vnet.ibm.com>
Date: Wed, 28 Feb 2024 17:14:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: [netdev] Build failure on powerpc
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sB7oaBKyB0QfzAL5ytvTvrKIWe3Jnk3v
X-Proofpoint-GUID: mlQc1Cm4oFgyPceiBkfLwVDU6_PF-NoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxscore=0 mlxlogscore=710 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402280093
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
Cc: venkat88@linux.vnet.ibm.com, vadim.fedorenko@linux.dev, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, edumazet@google.com, jiri@nvidia.com, kuba@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

[netdev] Build failure on powerpc
latest netdev 6.8.0-rc5-auto-g1ce7d306ea63 fails to build on powerpc 
below traces

--- Traces---

./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
incomplete type ‘struct dpll_pin’
   typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
          ^
./include/linux/rcupdate.h:587:2: note: in expansion of macro 
‘__rcu_dereference_check’
   __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
   ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
‘rcu_dereference_check’
   rcu_dereference_check(p, lockdep_rtnl_is_held())
   ^~~~~~~~~~~~~~~~~~~~~
./include/linux/dpll.h:175:9: note: in expansion of macro 
‘rcu_dereference_rtnl’
   return rcu_dereference_rtnl(dev->dpll_pin);
          ^~~~~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] Error 1
make[4]: *** Waiting for unfinished jobs....
   AR      net/mpls/built-in.a
   AR      net/l3mdev/built-in.a
In file included from ./include/linux/rbtree.h:24,
                  from ./include/linux/mm_types.h:11,
                  from ./include/linux/mmzone.h:22,
                  from ./include/linux/gfp.h:7,
                  from ./include/linux/umh.h:4,
                  from ./include/linux/kmod.h:9,
                  from ./include/linux/module.h:17,
                  from drivers/dpll/dpll_netlink.c:9:
./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
incomplete type ‘struct dpll_pin’
   typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
          ^
./include/linux/rcupdate.h:587:2: note: in expansion of macro 
‘__rcu_dereference_check’
   __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
   ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
‘rcu_dereference_check’
   rcu_dereference_check(p, lockdep_rtnl_is_held())
   ^~~~~~~~~~~~~~~~~~~~~
./include/linux/dpll.h:175:9: note: in expansion of macro 
‘rcu_dereference_rtnl’
   return rcu_dereference_rtnl(dev->dpll_pin);
          ^~~~~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o] 
Error 1
make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
make[3]: *** Waiting for unfinished jobs....
In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                  from ./include/linux/compiler.h:251,
                  from ./include/linux/instrumented.h:10,
                  from ./include/linux/uaccess.h:6,
                  from net/core/dev.c:71:
net/core/dev.c: In function ‘netdev_dpll_pin_assign’:
./include/linux/rcupdate.h:462:36: error: dereferencing pointer to 
incomplete type ‘struct dpll_pin’
  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
                                     ^~~~
./include/asm-generic/rwonce.h:55:33: note: in definition of macro 
‘__WRITE_ONCE’
   *(volatile typeof(x) *)&(x) = (val);    \
                                  ^~~
./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro 
‘WRITE_ONCE’
   WRITE_ONCE(*p, v);      \
   ^~~~~~~~~~
./include/asm-generic/barrier.h:172:55: note: in expansion of macro 
‘__smp_store_release’
  #define smp_store_release(p, v) do { kcsan_release(); 
__smp_store_release(p, v); } while (0)
^~~~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:503:3: note: in expansion of macro 
‘smp_store_release’
    smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
    ^~~~~~~~~~~~~~~~~
./include/linux/rcupdate.h:503:25: note: in expansion of macro 
‘RCU_INITIALIZER’
    smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                          ^~~~~~~~~~~~~~~
net/core/dev.c:9081:2: note: in expansion of macro ‘rcu_assign_pointer’
   rcu_assign_pointer(dev->dpll_pin, dpll_pin);
   ^~~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
make[4]: *** Waiting for unfinished jobs....
   AR      drivers/net/ethernet/built-in.a
   AR      drivers/net/built-in.a
   AR      net/dcb/built-in.a
   AR      net/netlabel/built-in.a
   AR      net/strparser/built-in.a
   AR      net/handshake/built-in.a
   GEN     lib/test_fortify.log
   AR      net/8021q/built-in.a
   AR      net/nsh/built-in.a
   AR      net/unix/built-in.a
   CC      lib/string.o
   AR      net/packet/built-in.a
   AR      net/switchdev/built-in.a
   AR      lib/lib.a
   AR      net/mptcp/built-in.a
   AR      net/devlink/built-in.a
In file included from ./include/linux/rbtree.h:24,
                  from ./include/linux/mm_types.h:11,
                  from ./include/linux/mmzone.h:22,
                  from ./include/linux/gfp.h:7,
                  from ./include/linux/umh.h:4,
                  from ./include/linux/kmod.h:9,
                  from ./include/linux/module.h:17,
                  from net/core/rtnetlink.c:17:
./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
incomplete type ‘struct dpll_pin’
   typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
          ^
./include/linux/rcupdate.h:587:2: note: in expansion of macro 
‘__rcu_dereference_check’
   __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
   ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
‘rcu_dereference_check’
   rcu_dereference_check(p, lockdep_rtnl_is_held())
   ^~~~~~~~~~~~~~~~~~~~~
./include/linux/dpll.h:175:9: note: in expansion of macro 
‘rcu_dereference_rtnl’
   return rcu_dereference_rtnl(dev->dpll_pin);
          ^~~~~~~~~~~~~~~~~~~~
In file included from net/core/rtnetlink.c:60:
./include/linux/dpll.h:179:1: error: control reaches end of non-void 
function [-Werror=return-type]
  }


Reverting the below commit fixes the problem

commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
     dpll: rely on rcu for netdev_dpll_pin()

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

