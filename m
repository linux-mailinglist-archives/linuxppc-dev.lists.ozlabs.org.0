Return-Path: <linuxppc-dev+bounces-943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA796ADF2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 03:34:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wz4lr4FY6z2xjH;
	Wed,  4 Sep 2024 11:34:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725413656;
	cv=none; b=UMg3VHWBegzNXXXgZUe79nfz8a/kna5lKIox3RHvtTKEuytvQHkxr+roflYBwGP1dC36v+QdRENXlwG4AskkNJKhYwdJAiRMdWFEQw4K5Jac8DdB8FtxtP/nj0t8lYQs32kE2VSJEpVYSJJqtv6Em0Y5os3L7/0O5HniH7mIkFJHZzb5a9zjIucX3OH24n6RD69kkbcRzIJ3ekKQRQoi0bas+iBm06ArY6N+ps5gxS4V23Prs0pAJLkNgb8T5Qg0hhR78Pz67fl2u1pfaOZz0vV+fUzrOFwjseA89qJQJFaKZHgNz08+vTtcvs8Ak8kQrG7IhjiZzQUgD9gRiNxWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725413656; c=relaxed/relaxed;
	bh=IsVPjjW6M3sDE/NG9+2YkWeUDBBBD1Noboxn2fMI4fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XnwEHphUcqpD1osZ6AP2Lyl+6p/VD4J4A7WzdzStQ5c4+O2gnpwZW04aDgZIIqBuaop2MBHPYCYBZhObEU+pMSgOr7Z9Sde21Btb209yKwSH19OKzoEwvHTh7CecKbIsWjbwM28wBvTM5PffyqYVGQ30QJI8Hd5LiuEuXb5r0fk3oBDHzamktc4Vr06gifemifBsv/rFqYEy3rzczYKk4rzingGRQPyPBskW8qlP0BvGkbxOkcPBBFSqktMnl+jEgf0vrMERkv7DxIaufzJJY9nsANkz9K0Dj+D0ckz+qXaLWTJeg2MonjTOhotFnOJ3Cwuk1aHTYdlQfdZcrDZ23g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=lihongbo22@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wz4lq1cQmz2xZr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 11:34:14 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wz4f03ztgz69LX;
	Wed,  4 Sep 2024 09:29:12 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id A254F1403D2;
	Wed,  4 Sep 2024 09:34:09 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 09:34:09 +0800
Message-ID: <e68fa7bf-50a9-4507-92b0-b637a048099e@huawei.com>
Date: Wed, 4 Sep 2024 09:34:09 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] soc/fsl/qbman: make use of the helper function
 kthread_run_on_cpu()
To: kernel test robot <lkp@intel.com>, <christophe.leroy@csgroup.eu>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>
References: <20240902133125.3089560-1-lihongbo22@huawei.com>
 <202409032300.9u9g0C8J-lkp@intel.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <202409032300.9u9g0C8J-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/9/3 23:46, kernel test robot wrote:
> Hi Hongbo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20240902]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/soc-fsl-qbman-make-use-of-the-helper-function-kthread_run_on_cpu/20240903-060257
> base:   next-20240902
> patch link:    https://lore.kernel.org/r/20240902133125.3089560-1-lihongbo22%40huawei.com
> patch subject: [PATCH -next] soc/fsl/qbman: make use of the helper function kthread_run_on_cpu()
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240903/202409032300.9u9g0C8J-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032300.9u9g0C8J-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409032300.9u9g0C8J-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/soc/fsl/qbman/qman_test_stash.c:112:27: error: too many arguments to function call, expected 4, have 5
>       111 |                 struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
>           |                                         ~~~~~~~~~~~~~~~~~~
>       112 |                                                 cpu, "hotpotato%d", cpu);
Sorry, I forget remove the last cpu variable.

struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap, cpu, 
"hotpotato%u");


Thanks,
Hongbo

>           |                                                                     ^~~
>     include/linux/kthread.h:73:1: note: 'kthread_run_on_cpu' declared here
>        73 | kthread_run_on_cpu(int (*threadfn)(void *data), void *data,
>           | ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        74 |                         unsigned int cpu, const char *namefmt)
>           |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1 error generated.
> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>     Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
>     Selected by [y]:
>     - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])
> 
> 
> vim +112 drivers/soc/fsl/qbman/qman_test_stash.c
> 
>      35	
>      36	/*
>      37	 * Algorithm:
>      38	 *
>      39	 * Each cpu will have HP_PER_CPU "handlers" set up, each of which incorporates
>      40	 * an rx/tx pair of FQ objects (both of which are stashed on dequeue). The
>      41	 * organisation of FQIDs is such that the HP_PER_CPU*NUM_CPUS handlers will
>      42	 * shuttle a "hot potato" frame around them such that every forwarding action
>      43	 * moves it from one cpu to another. (The use of more than one handler per cpu
>      44	 * is to allow enough handlers/FQs to truly test the significance of caching -
>      45	 * ie. when cache-expiries are occurring.)
>      46	 *
>      47	 * The "hot potato" frame content will be HP_NUM_WORDS*4 bytes in size, and the
>      48	 * first and last words of the frame data will undergo a transformation step on
>      49	 * each forwarding action. To achieve this, each handler will be assigned a
>      50	 * 32-bit "mixer", that is produced using a 32-bit LFSR. When a frame is
>      51	 * received by a handler, the mixer of the expected sender is XOR'd into all
>      52	 * words of the entire frame, which is then validated against the original
>      53	 * values. Then, before forwarding, the entire frame is XOR'd with the mixer of
>      54	 * the current handler. Apart from validating that the frame is taking the
>      55	 * expected path, this also provides some quasi-realistic overheads to each
>      56	 * forwarding action - dereferencing *all* the frame data, computation, and
>      57	 * conditional branching. There is a "special" handler designated to act as the
>      58	 * instigator of the test by creating an enqueuing the "hot potato" frame, and
>      59	 * to determine when the test has completed by counting HP_LOOPS iterations.
>      60	 *
>      61	 * Init phases:
>      62	 *
>      63	 * 1. prepare each cpu's 'hp_cpu' struct using on_each_cpu(,,1) and link them
>      64	 *    into 'hp_cpu_list'. Specifically, set processor_id, allocate HP_PER_CPU
>      65	 *    handlers and link-list them (but do no other handler setup).
>      66	 *
>      67	 * 2. scan over 'hp_cpu_list' HP_PER_CPU times, the first time sets each
>      68	 *    hp_cpu's 'iterator' to point to its first handler. With each loop,
>      69	 *    allocate rx/tx FQIDs and mixer values to the hp_cpu's iterator handler
>      70	 *    and advance the iterator for the next loop. This includes a final fixup,
>      71	 *    which connects the last handler to the first (and which is why phase 2
>      72	 *    and 3 are separate).
>      73	 *
>      74	 * 3. scan over 'hp_cpu_list' HP_PER_CPU times, the first time sets each
>      75	 *    hp_cpu's 'iterator' to point to its first handler. With each loop,
>      76	 *    initialise FQ objects and advance the iterator for the next loop.
>      77	 *    Moreover, do this initialisation on the cpu it applies to so that Rx FQ
>      78	 *    initialisation targets the correct cpu.
>      79	 */
>      80	
>      81	/*
>      82	 * helper to run something on all cpus (can't use on_each_cpu(), as that invokes
>      83	 * the fn from irq context, which is too restrictive).
>      84	 */
>      85	struct bstrap {
>      86		int (*fn)(void);
>      87		atomic_t started;
>      88	};
>      89	static int bstrap_fn(void *bs)
>      90	{
>      91		struct bstrap *bstrap = bs;
>      92		int err;
>      93	
>      94		atomic_inc(&bstrap->started);
>      95		err = bstrap->fn();
>      96		if (err)
>      97			return err;
>      98		while (!kthread_should_stop())
>      99			msleep(20);
>     100		return 0;
>     101	}
>     102	static int on_all_cpus(int (*fn)(void))
>     103	{
>     104		int cpu;
>     105	
>     106		for_each_cpu(cpu, cpu_online_mask) {
>     107			struct bstrap bstrap = {
>     108				.fn = fn,
>     109				.started = ATOMIC_INIT(0)
>     110			};
>     111			struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
>   > 112							cpu, "hotpotato%d", cpu);
>     113			int ret;
>     114	
>     115			if (IS_ERR(k))
>     116				return -ENOMEM;
>     117			/*
>     118			 * If we call kthread_stop() before the "wake up" has had an
>     119			 * effect, then the thread may exit with -EINTR without ever
>     120			 * running the function. So poll until it's started before
>     121			 * requesting it to stop.
>     122			 */
>     123			while (!atomic_read(&bstrap.started))
>     124				msleep(20);
>     125			ret = kthread_stop(k);
>     126			if (ret)
>     127				return ret;
>     128		}
>     129		return 0;
>     130	}
>     131	
> 

