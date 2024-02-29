Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744086C304
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:05:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YXEhbrYi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlkKn5f28z3vZs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:05:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YXEhbrYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlkK36Kz7z30fp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:04:39 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41T82PjR025147;
	Thu, 29 Feb 2024 08:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vNCloWa9rpkjDgB/cpjEFdYXPVzWq/UH1dD4hpZWK10=;
 b=YXEhbrYiYumGo0s0+qq3gTKDgMd5p5DmHMJx/g4YedGydPVZPC8k6BOHkAc4rvZIGZfu
 W4uAXTg9u714wGCRXFhK5M6tDLbOVGUo9JKCON5KTooPlumbOygUwVA/7QLfuMYB1AzZ
 SFIrW2KqR9A6dO47KgNwoANSGcVT00bAW2D5pSLtqpGfEJdEpLZ2nThEeNCcQ8YUWbDf
 gZsKOJctpWGWD0FgLTP4rQTHDzHzeOfMGSQ1J0WDjp2swiPGk+XEzBLciZMCKlNiWXVR
 RlZqJAzz86rtsFzumNentGL9mHqrJOizxkpOcTR7l0Nb04R/weRlfgZIbenB/OVkFnRe 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjp2hr44e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 08:04:26 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41T83DM8031184;
	Thu, 29 Feb 2024 08:04:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wjp2hr43e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 08:04:25 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41T5UpL8021316;
	Thu, 29 Feb 2024 08:04:25 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfuspbwfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 08:04:25 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41T84Mnh40042988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Feb 2024 08:04:24 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B18C5805C;
	Thu, 29 Feb 2024 08:04:22 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EB9958079;
	Thu, 29 Feb 2024 08:04:17 +0000 (GMT)
Received: from [9.43.32.108] (unknown [9.43.32.108])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Feb 2024 08:04:17 +0000 (GMT)
Message-ID: <a1fdd2c2-4443-458e-86db-280e7cbd4a36@linux.vnet.ibm.com>
Date: Thu, 29 Feb 2024 13:34:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
To: Eric Dumazet <edumazet@google.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
 <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev>
 <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
Content-Language: en-US
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OTJnR3xJPU91ToZ0GLSBpYQPlyNp7TsS
X-Proofpoint-ORIG-GUID: oWDAQZrahUGh0cNSPpMnHqHdCbHr77Qj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402290062
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
Cc: venkat88@linux.vnet.ibm.com, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arkadiusz.kubalewski@intel.com, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, jiri@nvidia.com, kuba@kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

I have tried the patch provided below. Moving struct to file 
"net/core/rtnetlink.c" is not resolving the problem. Please find the 
below traces.

--- Traces ---

In file included from ./include/linux/rbtree.h:24,
                  from ./include/linux/mm_types.h:11,
                  from ./include/linux/mmzone.h:22,
                  from ./include/linux/gfp.h:7,
                  from ./include/linux/umh.h:4,
                  from ./include/linux/kmod.h:9,
                  from ./include/linux/module.h:17,
                  from net/core/rtnetlink.c:17:
net/core/rtnetlink.c: In function ‘netdev_dpll_pin’:
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
net/core/rtnetlink.c:1059:15: note: in expansion of macro 
‘rcu_dereference_rtnl’
         return rcu_dereference_rtnl(dev->dpll_pin);
                ^~~~~~~~~~~~~~~~~~~~
   CC      crypto/algboss.o
net/core/rtnetlink.c:1063:1: error: control reaches end of non-void 
function [-Werror=return-type]
  }
  ^
   CC      crypto/authenc.o
   CC      crypto/authencesn.o
   CC      crypto/af_alg.o
   CC      crypto/algif_hash.o
   CC      crypto/algif_skcipher.o
   CC      crypto/algif_rng.o
   CC      crypto/algif_aead.o
   AR      arch/powerpc/kernel/built-in.a
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:243: net/core/rtnetlink.o] Error 1
make[4]: *** Waiting for unfinished jobs....
   CC      lib/kobject_uevent.o
   AR      drivers/net/mdio/built-in.a
   AR      net/802/built-in.a
   AR      drivers/connector/built-in.a
   CC      lib/vsprintf.o
   AR      ipc/built-in.a
   AR      net/nsh/built-in.a
   CC      lib/dynamic_debug.o
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

On 2/28/24 20:13, Eric Dumazet wrote:
> On Wed, Feb 28, 2024 at 3:07 PM Vadim Fedorenko
> <vadim.fedorenko@linux.dev> wrote:
>> On 28/02/2024 11:09, Tasmiya Nalatwad wrote:
>>> Greetings,
>>>
>>> [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
>>>
>>> Reverting below commit fixes the issue
>>>
>>> commit 0d60d8df6f493bb46bf5db40d39dd60a1bafdd4e
>>>       dpll: rely on rcu for netdev_dpll_pin()
>>>
>>> --- Traces ---
>>>
>>> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
>>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
>>> incomplete type ‘struct dpll_pin’
>>>     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>>>            ^
>>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
>>> ‘__rcu_dereference_check’
>>>     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
>>> ‘rcu_dereference_check’
>>>     rcu_dereference_check(p, lockdep_rtnl_is_held())
>>>     ^~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/dpll.h:175:9: note: in expansion of macro
>>> ‘rcu_dereference_rtnl’
>>>     return rcu_dereference_rtnl(dev->dpll_pin);
>>>            ^~~~~~~~~~~~~~~~~~~~
>>> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_core.o] Error 1
>>> make[4]: *** Waiting for unfinished jobs....
>>>     AR      net/mpls/built-in.a
>>>     AR      net/l3mdev/built-in.a
>>> In file included from ./include/linux/rbtree.h:24,
>>>                    from ./include/linux/mm_types.h:11,
>>>                    from ./include/linux/mmzone.h:22,
>>>                    from ./include/linux/gfp.h:7,
>>>                    from ./include/linux/umh.h:4,
>>>                    from ./include/linux/kmod.h:9,
>>>                    from ./include/linux/module.h:17,
>>>                    from drivers/dpll/dpll_netlink.c:9:
>>> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
>>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
>>> incomplete type ‘struct dpll_pin’
>>>     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>>>            ^
>>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
>>> ‘__rcu_dereference_check’
>>>     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
>>> ‘rcu_dereference_check’
>>>     rcu_dereference_check(p, lockdep_rtnl_is_held())
>>>     ^~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/dpll.h:175:9: note: in expansion of macro
>>> ‘rcu_dereference_rtnl’
>>>     return rcu_dereference_rtnl(dev->dpll_pin);
>>>            ^~~~~~~~~~~~~~~~~~~~
>>> make[4]: *** [scripts/Makefile.build:243: drivers/dpll/dpll_netlink.o]
>>> Error 1
>>> make[3]: *** [scripts/Makefile.build:481: drivers/dpll] Error 2
>>> make[3]: *** Waiting for unfinished jobs....
>>> In file included from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>>>                    from ./include/linux/compiler.h:251,
>>>                    from ./include/linux/instrumented.h:10,
>>>                    from ./include/linux/uaccess.h:6,
>>>                    from net/core/dev.c:71:
>>> net/core/dev.c: In function ‘netdev_dpll_pin_assign’:
>>> ./include/linux/rcupdate.h:462:36: error: dereferencing pointer to
>>> incomplete type ‘struct dpll_pin’
>>>    #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
>>>                                       ^~~~
>>> ./include/asm-generic/rwonce.h:55:33: note: in definition of macro
>>> ‘__WRITE_ONCE’
>>>     *(volatile typeof(x) *)&(x) = (val);    \
>>>                                    ^~~
>>> ./arch/powerpc/include/asm/barrier.h:76:2: note: in expansion of macro
>>> ‘WRITE_ONCE’
>>>     WRITE_ONCE(*p, v);      \
>>>     ^~~~~~~~~~
>>> ./include/asm-generic/barrier.h:172:55: note: in expansion of macro
>>> ‘__smp_store_release’
>>>    #define smp_store_release(p, v) do { kcsan_release();
>>> __smp_store_release(p, v); } while (0)
>>> ^~~~~~~~~~~~~~~~~~~
>>> ./include/linux/rcupdate.h:503:3: note: in expansion of macro
>>> ‘smp_store_release’
>>>      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>>>      ^~~~~~~~~~~~~~~~~
>>> ./include/linux/rcupdate.h:503:25: note: in expansion of macro
>>> ‘RCU_INITIALIZER’
>>>      smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
>>>                            ^~~~~~~~~~~~~~~
>>> net/core/dev.c:9081:2: note: in expansion of macro ‘rcu_assign_pointer’
>>>     rcu_assign_pointer(dev->dpll_pin, dpll_pin);
>>>     ^~~~~~~~~~~~~~~~~~
>>> make[4]: *** [scripts/Makefile.build:243: net/core/dev.o] Error 1
>>> make[4]: *** Waiting for unfinished jobs....
>>>     AR      drivers/net/ethernet/built-in.a
>>>     AR      drivers/net/built-in.a
>>>     AR      net/dcb/built-in.a
>>>     AR      net/netlabel/built-in.a
>>>     AR      net/strparser/built-in.a
>>>     AR      net/handshake/built-in.a
>>>     GEN     lib/test_fortify.log
>>>     AR      net/8021q/built-in.a
>>>     AR      net/nsh/built-in.a
>>>     AR      net/unix/built-in.a
>>>     CC      lib/string.o
>>>     AR      net/packet/built-in.a
>>>     AR      net/switchdev/built-in.a
>>>     AR      lib/lib.a
>>>     AR      net/mptcp/built-in.a
>>>     AR      net/devlink/built-in.a
>>> In file included from ./include/linux/rbtree.h:24,
>>>                    from ./include/linux/mm_types.h:11,
>>>                    from ./include/linux/mmzone.h:22,
>>>                    from ./include/linux/gfp.h:7,
>>>                    from ./include/linux/umh.h:4,
>>>                    from ./include/linux/kmod.h:9,
>>>                    from ./include/linux/module.h:17,
>>>                    from net/core/rtnetlink.c:17:
>>> ./include/linux/dpll.h: In function ‘netdev_dpll_pin’:
>>> ./include/linux/rcupdate.h:439:9: error: dereferencing pointer to
>>> incomplete type ‘struct dpll_pin’
>>>     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
>>>            ^
>>> ./include/linux/rcupdate.h:587:2: note: in expansion of macro
>>> ‘__rcu_dereference_check’
>>>     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
>>>     ^~~~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/rtnetlink.h:70:2: note: in expansion of macro
>>> ‘rcu_dereference_check’
>>>     rcu_dereference_check(p, lockdep_rtnl_is_held())
>>>     ^~~~~~~~~~~~~~~~~~~~~
>>> ./include/linux/dpll.h:175:9: note: in expansion of macro
>>> ‘rcu_dereference_rtnl’
>>>     return rcu_dereference_rtnl(dev->dpll_pin);
>>>            ^~~~~~~~~~~~~~~~~~~~
>>> In file included from net/core/rtnetlink.c:60:
>>> ./include/linux/dpll.h:179:1: error: control reaches end of non-void
>>> function [-Werror=return-type]
>>>    }
>>>
>> Hi, Eric!
>>
>> Looks like we have to move struct dpll_pin definition to
>> include/linux/dpll.h to have this fixed, right?
>>
> No idea what is wrong. Is it powerpc specific ? Some compiler version ?
>
> netdev_dpll_pin() could be moved to net/core/rtnetlink.c, this is the only user.
>
> diff --git a/include/linux/dpll.h b/include/linux/dpll.h
> index 4ec2fe9caf5a3f284afd0cfe4fc7c2bf42cbbc60..72d21e710d7f201d2fc57bb3a32b4bc0ff2b1749
> 100644
> --- a/include/linux/dpll.h
> +++ b/include/linux/dpll.h
> @@ -169,13 +169,4 @@ int dpll_device_change_ntf(struct dpll_device *dpll);
>
>   int dpll_pin_change_ntf(struct dpll_pin *pin);
>
> -static inline struct dpll_pin *netdev_dpll_pin(const struct net_device *dev)
> -{
> -#if IS_ENABLED(CONFIG_DPLL)
> -       return rcu_dereference_rtnl(dev->dpll_pin);
> -#else
> -       return NULL;
> -#endif
> -}
> -
>   #endif
> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index 9c4f427f3a5057b52ec05405e8b15b8ca2246b4b..32dc601fd8ca66dfcd3cb8f38b533314de02d1d2
> 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -1053,6 +1053,15 @@ static size_t rtnl_devlink_port_size(const
> struct net_device *dev)
>          return size;
>   }
>
> +static struct dpll_pin *netdev_dpll_pin(const struct net_device *dev)
> +{
> +#if IS_ENABLED(CONFIG_DPLL)
> +       return rcu_dereference_rtnl(dev->dpll_pin);
> +#else
> +       return NULL;
> +#endif
> +}
> +
>   static size_t rtnl_dpll_pin_size(const struct net_device *dev)
>   {
>          size_t size = nla_total_size(0); /* nest IFLA_DPLL_PIN */

-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

