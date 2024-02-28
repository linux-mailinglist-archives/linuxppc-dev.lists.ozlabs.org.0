Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E286ACE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 12:23:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mYT74anl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlBnS1jlDz3dV4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mYT74anl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlBmk1FGsz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 22:23:17 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41SBHW2a001982;
	Wed, 28 Feb 2024 11:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lHzt+IUluZRo+JmobreS7RB3BUE1Du5bKe2w1NvM27s=;
 b=mYT74anljuvv/nYUCgqrYmAaIJeVB5nJDEkej2OJBWHlmNa4JxauvfWUg8d2j8NOLgFa
 XeCqFjqkG45aDziZyk9451ZtQnYBJ1Wum16lXCt/azZxUbN10S4uLlRQ+tp7CA0Euy3v
 hA+agO3rKMiCSB2qOZ19vJcalN1+/CYnJt4joG6GD7a/IBCd6N+t0wZcidzWP1VrmxrD
 4LpQCleiqwt8YhQ+Wox531XYdDvall2yFquJgGG/6UlA7Vj8WgsGTiMSeFICz3K52y/T
 RAP0ImS+YezmXZLzkSV9Tq067IDQgRazUvrCldwWZPhcBcsBa6jyS46IX/hs9B1lZgva ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj3tsg4b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 11:23:03 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41SBJ9MM006358;
	Wed, 28 Feb 2024 11:23:03 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj3tsg4a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 11:23:02 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41S8t12k008170;
	Wed, 28 Feb 2024 11:23:01 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9mdsb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 11:23:01 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41SBMxqR61669752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Feb 2024 11:23:01 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38D0E58055;
	Wed, 28 Feb 2024 11:22:59 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33E845804B;
	Wed, 28 Feb 2024 11:22:55 +0000 (GMT)
Received: from [9.43.45.154] (unknown [9.43.45.154])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Feb 2024 11:22:54 +0000 (GMT)
Message-ID: <f0e8f4a7-5f6b-4a2f-be77-6c120cd460a4@linux.vnet.ibm.com>
Date: Wed, 28 Feb 2024 16:52:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [revert 0d60d8df6f49] [netdev/net] [6.8-rc5] Build Failure
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
Content-Language: en-US
In-Reply-To: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 07h8QLKeEPjrxJgsiKD2CgVVFDD6oJ6t
X-Proofpoint-GUID: n2SX99bqPVdkaO69DKMJfdS3ledkKBwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=801
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402280090
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

> Greetings,
>
> [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
>
> Reverting below commit fixes the issue
>
> commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
>     dpll: rely on rcu for netdev_dpll_pin()
>
> --- Traces ---
>
> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>   typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>          ^
> ./include/linux/rcupdate.h:587:2: note: in expansion of macro 
> ‘__rcu_dereference_check’
>   __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>   ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
> ‘rcu_dereference_check’
>   rcu_dereference_check(p, lockdep_rtnl_is_held())
>   ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/dpll.h:175:9: note: in expansion of macro 
> ‘rcu_dereference_rtnl’
>   return rcu_dereference_rtnl(dev->dpll_pin);
>          ^~~~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] 
> Error 1
> make[4]: *** Waiting for unfinished jobs....
>   AR      net/mpls/built-in.a
>   AR      net/l3mdev/built-in.a
> In file included from ./include/linux/rbtree.h:24,
>                  from ./include/linux/mm_types.h:11,
>                  from ./include/linux/mmzone.h:22,
>                  from ./include/linux/gfp.h:7,
>                  from ./include/linux/umh.h:4,
>                  from ./include/linux/kmod.h:9,
>                  from ./include/linux/module.h:17,
>                  from drivers/dpll/dpll_netlink.c:9:
> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>   typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>          ^
> ./include/linux/rcupdate.h:587:2: note: in expansion of macro 
> ‘__rcu_dereference_check’
>   __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>   ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
> ‘rcu_dereference_check’
>   rcu_dereference_check(p, lockdep_rtnl_is_held())
>   ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/dpll.h:175:9: note: in expansion of macro 
> ‘rcu_dereference_rtnl’
>   return rcu_dereference_rtnl(dev->dpll_pin);
>          ^~~~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o] 
> Error 1
> make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>                  from ./include/linux/compiler.h:251,
>                  from ./include/linux/instrumented.h:10,
>                  from ./include/linux/uaccess.h:6,
>                  from net/core/dev.c:71:
> net/core/dev.c: In function ‘netdev_dpll_pin_assign’:
> ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>  #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>                                     ^~~~
> ./include/asm-generic/rwonce.h:55:33: note: in definition of macro 
> ‘__WRITE_ONCE’
>   *(volatile typeof(x) *)&(x) = (val);    \
>                                  ^~~
> ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro 
> ‘WRITE_ONCE’
>   WRITE_ONCE(*p, v);      \
>   ^~~~~~~~~~
> ./include/asm-generic/barrier.h:172:55: note: in expansion of macro 
> ‘__smp_store_release’
>  #define smp_store_release(p, v) do { kcsan_release(); 
> __smp_store_release(p, v); } while (0)
> ^~~~~~~~~~~~~~~~~~~
> ./include/linux/rcupdate.h:503:3: note: in expansion of macro 
> ‘smp_store_release’
>    smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>    ^~~~~~~~~~~~~~~~~
> ./include/linux/rcupdate.h:503:25: note: in expansion of macro 
> ‘RCU_INITIALIZER’
>    smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>                          ^~~~~~~~~~~~~~~
> net/core/dev.c:9081:2: note: in expansion of macro ‘rcu_assign_pointer’
>   rcu_assign_pointer(dev->dpll_pin, dpll_pin);
>   ^~~~~~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>   AR      drivers/net/ethernet/built-in.a
>   AR      drivers/net/built-in.a
>   AR      net/dcb/built-in.a
>   AR      net/netlabel/built-in.a
>   AR      net/strparser/built-in.a
>   AR      net/handshake/built-in.a
>   GEN     lib/test_fortify.log
>   AR      net/8021q/built-in.a
>   AR      net/nsh/built-in.a
>   AR      net/unix/built-in.a
>   CC      lib/string.o
>   AR      net/packet/built-in.a
>   AR      net/switchdev/built-in.a
>   AR      lib/lib.a
>   AR      net/mptcp/built-in.a
>   AR      net/devlink/built-in.a
> In file included from ./include/linux/rbtree.h:24,
>                  from ./include/linux/mm_types.h:11,
>                  from ./include/linux/mmzone.h:22,
>                  from ./include/linux/gfp.h:7,
>                  from ./include/linux/umh.h:4,
>                  from ./include/linux/kmod.h:9,
>                  from ./include/linux/module.h:17,
>                  from net/core/rtnetlink.c:17:
> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to 
> incomplete type ‘struct dpll_pin’
>   typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>          ^
> ./include/linux/rcupdate.h:587:2: note: in expansion of macro 
> ‘__rcu_dereference_check’
>   __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>   ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro 
> ‘rcu_dereference_check’
>   rcu_dereference_check(p, lockdep_rtnl_is_held())
>   ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/dpll.h:175:9: note: in expansion of macro 
> ‘rcu_dereference_rtnl’
>   return rcu_dereference_rtnl(dev->dpll_pin);
>          ^~~~~~~~~~~~~~~~~~~~
> In file included from net/core/rtnetlink.c:60:
> ./include/linux/dpll.h:179:1: error: control reaches end of non-void 
> function [-Werror=return-type]
>  } 

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

