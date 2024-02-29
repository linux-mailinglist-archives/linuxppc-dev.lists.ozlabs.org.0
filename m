Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD486C810
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 12:32:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rOA+FWPX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlpx54w3bz3vZS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 22:32:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rOA+FWPX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlpwM3Fgdz3d39
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 22:32:03 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41TBS1vP029525;
	Thu, 29 Feb 2024 11:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yXMYcn46WQg2IAoU+vRKr+bgdvbywAYSXIjWDqnHLhQ=;
 b=rOA+FWPX2cgnz+79VrLGJET3UEV4BIbCuQbnxQshAALQouBJxNjwxU3qT7LpphHw5jNs
 PxxNb/10eu3nr98214jRi5GpuHMnRZhIEGQQVHLFetxNNkBGaJKrtj2xViHWJ5+njBXR
 I8UwuuiO/GWTlSvLsboSlIwiXvQJ8r8wE+hMu2+G51bra27IoJW9eHtLOF0+W0uerB2H
 RxrVDuZ8UYQrvxTYRf+TYGbIgqEOcz2lbcaqHlb7kDfYZksyBRcxlrJbgvsWlmmSevqa
 410XElUbzQzw3RBRSUpRM5V44izuHzQqI4kJpR4nFn8W3yDtw2GDlUbq4mAh9PTBCa82 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjs2x04q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 11:31:48 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41TBU7Xs006311;
	Thu, 29 Feb 2024 11:31:48 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjs2x04pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 11:31:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41T9X1o7023777;
	Thu, 29 Feb 2024 11:31:47 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0kmmeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 11:31:47 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41TBViqQ20644374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 11:31:46 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AEA75805A;
	Thu, 29 Feb 2024 11:31:44 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2A8C58054;
	Thu, 29 Feb 2024 11:31:39 +0000 (GMT)
Received: from [9.43.32.108] (unknown [9.43.32.108])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 11:31:39 +0000 (GMT)
Message-ID: <072f95dd-89d7-47e5-9ea0-da60d8acb5a7@linux.vnet.ibm.com>
Date: Thu, 29 Feb 2024 17:01:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
Content-Language: en-US
To: Eric Dumazet <edumazet@google.com>
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
 <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev>
 <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
 <a1fdd2c2-4443-458e-86db-280e7cbd4a36@linux.vnet.ibm.com>
 <CANn89iKdaMFCKnGRL4ffnbyrr2PUaKn1hoiu4VZ=sRyX=Vy0Wg@mail.gmail.com>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <CANn89iKdaMFCKnGRL4ffnbyrr2PUaKn1hoiu4VZ=sRyX=Vy0Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ivM5Lfj7WGSw8rYsorEaoA4U8fPgXrI1
X-Proofpoint-GUID: WgsAg0sjrxPqJdQOP0VCWseMYQUjkMi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402290088
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
Cc: venkat88@linux.vnet.ibm.com, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiri@nvidia.com, kuba@kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Latest changes suggested below works, and the issue is not seen.

Tested-by: Tasmiya Nalatwad <tasmiya at linux.vnet.ibm.com>

On 2/29/24 14:25, Eric Dumazet wrote:
> On Thu, Feb 29, 2024 at 9:04 AM Tasmiya Nalatwad
> <tasmiya@linux.vnet.ibm.com> wrote:
>> Greetings,
>>
>> I have tried the patch provided below. Moving struct to file
>> "net/core/rtnetlink.c" is not resolving the problem. Please find the
>> below traces.
>>
>> --- Traces ---
>>
>> In file included from ./include/linux/rbtree.h:24,
>>                    from ./include/linux/mm_types.h:11,
>>                    from ./include/linux/mmzone.h:22,
>>                    from ./include/linux/gfp.h:7,
>>                    from ./include/linux/umh.h:4,
>>                    from ./include/linux/kmod.h:9,
>>                    from ./include/linux/module.h:17,
>>                    from net/core/rtnetlink.c:17:
>> net/core/rtnetlink.c: In function ‘netdev_dpll_pin’:
>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
>> incomplete type ‘struct dpll_pin’
>>     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>>            ^
>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
>> ‘__rcu_dereference_check’
>>     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>>     ^~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
>> ‘rcu_dereference_check’
>>     rcu_dereference_check(p, lockdep_rtnl_is_held())
>>     ^~~~~~~~~~~~~~~~~~~~~
>> net/core/rtnetlink.c:1059:15: note: in expansion of macro
>> ‘rcu_dereference_rtnl’
>>           return rcu_dereference_rtnl(dev->dpll_pin);
>>                  ^~~~~~~~~~~~~~~~~~~~
>>     CC      crypto/algboss.o
>> net/core/rtnetlink.c:1063:1: error: control reaches end of non-void
>> function [-Werror=return-type]
>>    }
>>    ^
>>     CC      crypto/authenc.o
>>     CC      crypto/authencesn.o
>>     CC      crypto/af_alg.o
>>     CC      crypto/algif_hash.o
>>     CC      crypto/algif_skcipher.o
>>     CC      crypto/algif_rng.o
>>     CC      crypto/algif_aead.o
>>     AR      arch/powerpc/kernel/built-in.a
>> cc1: some warnings being treated as errors
>> make[4]: *** [scripts/Makefile.build:243: net/core/rtnetlink.o] Error 1
>> make[4]: *** Waiting for unfinished jobs....
>>     CC      lib/kobject_uevent.o
>>     AR      drivers/net/mdio/built-in.a
>>     AR      net/802/built-in.a
>>     AR      drivers/connector/built-in.a
>>     CC      lib/vsprintf.o
>>     AR      ipc/built-in.a
>>     AR      net/nsh/built-in.a
>>     CC      lib/dynamic_debug.o
>> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>>                    from ./include/linux/compiler.h:251,
>>                    from ./include/linux/instrumented.h:10,
>>                    from ./include/linux/uaccess.h:6,
>>                    from net/core/dev.c:71:
>> net/core/dev.c: In function ‘netdev_dpll_pin_assign’:
>> ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to
>> incomplete type ‘struct dpll_pin’
>>    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>>                                       ^~~~
>> ./include/asm-generic/rwonce.h:55:33: note: in definition of macro
>> ‘__WRITE_ONCE’
>>     *(volatile typeof(x) *)&(x) = (val);    \
>>                                    ^~~
>> ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro
>> ‘WRITE_ONCE’
>>     WRITE_ONCE(*p, v);      \
>>     ^~~~~~~~~~
>> ./include/asm-generic/barrier.h:172:55: note: in expansion of macro
>> ‘__smp_store_release’
>>    #define smp_store_release(p, v) do { kcsan_release();
>> __smp_store_release(p, v); } while (0)
>> ^~~~~~~~~~~~~~~~~~~
>> ./include/linux/rcupdate.h:503:3: note: in expansion of macro
>> ‘smp_store_release’
>>      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>>      ^~~~~~~~~~~~~~~~~
>> ./include/linux/rcupdate.h:503:25: note: in expansion of macro
>> ‘RCU_INITIALIZER’
>>      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>>                            ^~~~~~~~~~~~~~~
>> net/core/dev.c:9081:2: note: in expansion of macro ‘rcu_assign_pointer’
>>     rcu_assign_pointer(dev->dpll_pin, dpll_pin);
>>     ^~~~~~~~~~~~~~~~~~
>>
>> On 2/28/24 20:13, Eric Dumazet wrote:
>>> On Wed, Feb 28, 2024 at 3:07 PM Vadim Fedorenko
>>> <vadim.fedorenko@linux.dev> wrote:
>>>> On 28/02/2024 11:09, Tasmiya Nalatwad wrote:
>>>>> Greetings,
>>>>>
>>>>> [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
>>>>>
>>>>> Reverting below commit fixes the issue
>>>>>
>>>>> commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
>>>>>        dpll: rely on rcu for netdev_dpll_pin()
>>>>>
>>>>> --- Traces ---
>>>>>
>>>>> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
>>>>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
>>>>> incomplete type ‘struct dpll_pin’
>>>>>      typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>>>>>             ^
>>>>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
>>>>> ‘__rcu_dereference_check’
>>>>>      __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>>>>>      ^~~~~~~~~~~~~~~~~~~~~~~
>>>>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
>>>>> ‘rcu_dereference_check’
>>>>>      rcu_dereference_check(p, lockdep_rtnl_is_held())
>>>>>      ^~~~~~~~~~~~~~~~~~~~~
>>>>> ./include/linux/dpll.h:175:9: note: in expansion of macro
>>>>> ‘rcu_dereference_rtnl’
>>>>>      return rcu_dereference_rtnl(dev->dpll_pin);
>>>>>             ^~~~~~~~~~~~~~~~~~~~
>>>>> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] Error 1
>>>>> make[4]: *** Waiting for unfinished jobs....
>>>>>      AR      net/mpls/built-in.a
>>>>>      AR      net/l3mdev/built-in.a
>>>>> In file included from ./include/linux/rbtree.h:24,
>>>>>                     from ./include/linux/mm_types.h:11,
>>>>>                     from ./include/linux/mmzone.h:22,
>>>>>                     from ./include/linux/gfp.h:7,
>>>>>                     from ./include/linux/umh.h:4,
>>>>>                     from ./include/linux/kmod.h:9,
>>>>>                     from ./include/linux/module.h:17,
>>>>>                     from drivers/dpll/dpll_netlink.c:9:
>>>>> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
>>>>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
>>>>> incomplete type ‘struct dpll_pin’
>>>>>      typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>>>>>             ^
>>>>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
>>>>> ‘__rcu_dereference_check’
>>>>>      __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>>>>>      ^~~~~~~~~~~~~~~~~~~~~~~
>>>>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
>>>>> ‘rcu_dereference_check’
>>>>>      rcu_dereference_check(p, lockdep_rtnl_is_held())
>>>>>      ^~~~~~~~~~~~~~~~~~~~~
>>>>> ./include/linux/dpll.h:175:9: note: in expansion of macro
>>>>> ‘rcu_dereference_rtnl’
>>>>>      return rcu_dereference_rtnl(dev->dpll_pin);
>>>>>             ^~~~~~~~~~~~~~~~~~~~
>>>>> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o]
>>>>> Error 1
>>>>> make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
>>>>> make[3]: *** Waiting for unfinished jobs....
>>>>> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>>>>>                     from ./include/linux/compiler.h:251,
>>>>>                     from ./include/linux/instrumented.h:10,
>>>>>                     from ./include/linux/uaccess.h:6,
>>>>>                     from net/core/dev.c:71:
>>>>> net/core/dev.c: In function ‘netdev_dpll_pin_assign’:
>>>>> ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to
>>>>> incomplete type ‘struct dpll_pin’
>>>>>     #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>>>>>                                        ^~~~
>>>>> ./include/asm-generic/rwonce.h:55:33: note: in definition of macro
>>>>> ‘__WRITE_ONCE’
>>>>>      *(volatile typeof(x) *)&(x) = (val);    \
>>>>>                                     ^~~
>>>>> ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro
>>>>> ‘WRITE_ONCE’
>>>>>      WRITE_ONCE(*p, v);      \
>>>>>      ^~~~~~~~~~
>>>>> ./include/asm-generic/barrier.h:172:55: note: in expansion of macro
>>>>> ‘__smp_store_release’
>>>>>     #define smp_store_release(p, v) do { kcsan_release();
>>>>> __smp_store_release(p, v); } while (0)
>>>>> ^~~~~~~~~~~~~~~~~~~
>>>>> ./include/linux/rcupdate.h:503:3: note: in expansion of macro
>>>>> ‘smp_store_release’
>>>>>       smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>>>>>       ^~~~~~~~~~~~~~~~~
>>>>> ./include/linux/rcupdate.h:503:25: note: in expansion of macro
>>>>> ‘RCU_INITIALIZER’
>>>>>       smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>>>>>                             ^~~~~~~~~~~~~~~
>>>>> net/core/dev.c:9081:2: note: in expansion of macro ‘rcu_assign_pointer’
>>>>>      rcu_assign_pointer(dev->dpll_pin, dpll_pin);
>>>>>      ^~~~~~~~~~~~~~~~~~
>>>>> make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
>>>>> make[4]: *** Waiting for unfinished jobs....
>>>>>      AR      drivers/net/ethernet/built-in.a
>>>>>      AR      drivers/net/built-in.a
>>>>>      AR      net/dcb/built-in.a
>>>>>      AR      net/netlabel/built-in.a
>>>>>      AR      net/strparser/built-in.a
>>>>>      AR      net/handshake/built-in.a
>>>>>      GEN     lib/test_fortify.log
>>>>>      AR      net/8021q/built-in.a
>>>>>      AR      net/nsh/built-in.a
>>>>>      AR      net/unix/built-in.a
>>>>>      CC      lib/string.o
>>>>>      AR      net/packet/built-in.a
>>>>>      AR      net/switchdev/built-in.a
>>>>>      AR      lib/lib.a
>>>>>      AR      net/mptcp/built-in.a
>>>>>      AR      net/devlink/built-in.a
>>>>> In file included from ./include/linux/rbtree.h:24,
>>>>>                     from ./include/linux/mm_types.h:11,
>>>>>                     from ./include/linux/mmzone.h:22,
>>>>>                     from ./include/linux/gfp.h:7,
>>>>>                     from ./include/linux/umh.h:4,
>>>>>                     from ./include/linux/kmod.h:9,
>>>>>                     from ./include/linux/module.h:17,
>>>>>                     from net/core/rtnetlink.c:17:
>>>>> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
>>>>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
>>>>> incomplete type ‘struct dpll_pin’
>>>>>      typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>>>>>             ^
>>>>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
>>>>> ‘__rcu_dereference_check’
>>>>>      __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>>>>>      ^~~~~~~~~~~~~~~~~~~~~~~
>>>>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
>>>>> ‘rcu_dereference_check’
>>>>>      rcu_dereference_check(p, lockdep_rtnl_is_held())
>>>>>      ^~~~~~~~~~~~~~~~~~~~~
>>>>> ./include/linux/dpll.h:175:9: note: in expansion of macro
>>>>> ‘rcu_dereference_rtnl’
>>>>>      return rcu_dereference_rtnl(dev->dpll_pin);
>>>>>             ^~~~~~~~~~~~~~~~~~~~
>>>>> In file included from net/core/rtnetlink.c:60:
>>>>> ./include/linux/dpll.h:179:1: error: control reaches end of non-void
>>>>> function [-Werror=return-type]
>>>>>     }
>>>>>
>>>> Hi, Eric!
>>>>
>>>> Looks like we have to move struct dpll_pin definition to
>>>> include/linux/dpll.h to have this fixed, right?
>>>>
>>> No idea what is wrong. Is it powerpc specific ? Some compiler version ?
>>>
>>> netdev_dpll_pin() could be moved to net/core/rtnetlink.c, this is the only user.
> OK, it seems netdev_dpll_pin() has to be moved in a place the
> structure is known,
> because rcu_dereference() needs to know its size.
>
> I do not see other solution than this, otherwise we have to add more
> pollution to include/linux/netdevice.h
>
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index a9c973b92294bb110cf3cd336485972127b01b58..40797ea80bc6273cae6b7773d0a3e47459a72150
> 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -2469,7 +2469,7 @@ struct net_device {
>          struct devlink_port     *devlink_port;
>
>   #if IS_ENABLED(CONFIG_DPLL)
> -       struct dpll_pin __rcu   *dpll_pin;
> +       void __rcu *dpll_pin;
>   #endif
>   #if IS_ENABLED(CONFIG_PAGE_POOL)
>          /** @page_pools: page pools created for this netdevice */

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

