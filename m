Return-Path: <linuxppc-dev+bounces-2116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 998EB99A3F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 14:34:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ5fX3Sv0z3c01;
	Fri, 11 Oct 2024 23:34:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728650068;
	cv=none; b=c1CBktBhfO+iN74YtFnclieFGVA8wDKrAiIKn7MQiNYqly0daWdXgGo1Wvh9CxsC/7QzQL7iMSM2aH8PWZT0RjPmsZHPCsO8nvxmCmWDv4yZdMMOyKz9LLSrP7mp5wrkSdtmE4eNJ1f9SZUt2Bm9tEaE04ZyPd7cdC5eDt9XPwQM7wm68xr5xYX1Sw4bYbroqrQMdcrSjKzem+ZFrf68jdD7FGW7Cb42p/o/A4ag+67b1Jb0HxGURzUfdqSf5zlcfnKAJBsA+Pq4mV1Nv7bYjyGCNXKXG3+aX5Sdu0FScFCXaLOAMXlXRBmsgwntqK4d9FxYod4jP3Lq9INUQyMGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728650068; c=relaxed/relaxed;
	bh=nvLN4VQlh9vavkDOpnC4/xp37r1ricTAjQQ2X+MEHYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmNYS+mnPyUjlCltLWtQg0M9RjUNbciFipicLOpy0MeY9H5tR4/2VYPjXjinQIyOqQ+xhsK8SjBwucxQMt1piPMaDnOCk0YswE1nqsVkR8uDy9VhEpHvosV2s/AsV1LL2RAIPBZTvX+fmh07vpo0r4K01k6QxQAYPKazK83NxdovXhjBCL9rDBjdOgN/scfBLv9TDYD5Aog5FgTVXRnvXi2YdIrPtEcIwn4Y3Q5p+zRL21LvXno+6zhH4u5MBip6rfurHYV8/h5w+C5s8tYDUMHh1eVPMHPu9xCu/ptPaKQWjKmrK8A7dNvDiGPGWgzqXbmRDPmlGMTA+AIaUKtjZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nIXSafMC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nIXSafMC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ5fW0n8vz3byF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 23:34:26 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCINSg031223;
	Fri, 11 Oct 2024 12:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=n
	vLN4VQlh9vavkDOpnC4/xp37r1ricTAjQQ2X+MEHYc=; b=nIXSafMCKfwEu+xMQ
	9EVsvL66vsMwdnWa8tUu37OCfmo5X7cfjmx8mwk/+XsW2kbX74BZiH7Gz36ea3FW
	zQTzTLl4a+H3ji4qSwcTwlaYHihhhosq7/Qu/kcWatX9gOzOsVgdLwuQ1M7iPocp
	p8dXj4cWcSr0EMOSUb44DP8XO3T17KA9+NbjorWUDubq594YvvkbQ2Y/qhevgmVB
	BWeZ+cOhCtGAazTNc5eHXVgTgvGqSZdnmKow6J2rLm41KBpahijszoL9+lFDec+C
	MD6h7fhmXdKNXJYpsMNiwxf8+n8kS2N9KwHIsWA/cHjFAFRrHu2PuhQwtbkydqP8
	6TITg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4273bv080j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:34:10 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49BCYAJv005850;
	Fri, 11 Oct 2024 12:34:10 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4273bv080f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:34:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAvQYV011516;
	Fri, 11 Oct 2024 12:34:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423g5y5m6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 12:34:09 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49BCY5h215008142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2024 12:34:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D1A720040;
	Fri, 11 Oct 2024 12:34:05 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9921D20043;
	Fri, 11 Oct 2024 12:34:02 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.219.55])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 11 Oct 2024 12:34:02 +0000 (GMT)
Date: Fri, 11 Oct 2024 18:04:00 +0530
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Sourabh Jain <sourabhjain@linux.ibm.com>, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: drivers/nx: Invalid wait context issue when rebooting
Message-ID: <ZwkbOJN5Jmjy_wkJ@linux.ibm.com>
References: <ZwjjXJ5UtZ28FH6s@linux.ibm.com>
 <87wmif53iw.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmif53iw.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9wp6aDb0zByL9Tsbr3O29-WZKt9fnJT4
X-Proofpoint-GUID: VF38LUs_v_LjnORHo1U17QmrrtxgTsDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_09,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110084
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 09:37:27PM +1100, Michael Ellerman wrote:
> Vishal Chourasia <vishalc@linux.ibm.com> writes:
> > Hi,
> > I am getting Invalid wait context warning printed when rebooting lpar
> >
> > kexec/61926 is trying to acquire `of_reconfig_chain.rwsem` while holding
> > spinlock `devdata_mutex`
> >
> > Note: Name of the spinlock is misleading.
> 
> Oof, yeah let's rename that to devdata_spinlock at least.
> 
> > In my case, I compiled a new vmlinux file and loaded it into the running
> > kernel using `kexec -l` and then hit `reboot`
> >
> > dmesg:
> > ------
> >
> > [ BUG: Invalid wait context ]
> > 6.11.0-test2-10547-g684a64bf32b6-dirty #79 Not tainted
> 
> Is that v6.11 plus ~10,000 patches? O_o
> 
> Ah no, 684a64bf32b6 is roughly v6.12-rc1. Maybe if you fetch tags into
> your tree you will get a more sensible version string?
> 
> Could also be good to try v6.12-rc2.

[ bug: invalid wait context ]
6.12.0-rc2-invalid_wait_context-00222-g7d2910da7039 #83 not tainted
-----------------------------
kexec/11068 is trying to lock:
c000000002dbedb8 ((of_reconfig_chain).rwsem){++++}-{4:4}, at: blocking_notifier_chain_unregister+0x40/0x90
other info that might help us debug this:
context-{5:5}
4 locks held by kexec/11068:
 #0: c000000002956c08 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0xf8/0x2e0
 #1: c00000000294af30 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x150/0x300
 #2: c000000050882138 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x164/0x300
 #3: c000000002dbb898 (devdata_mutex){....}-{3:3}, at: nx842_remove+0xa8/0x1bc
stack backtrace:
CPU: 6 UID: 0 PID: 11068 Comm: kexec Not tainted 6.12.0-rc2-invalid_wait_context-00222-g7d2910da7039 #83
Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_012) hv:phyp pSeries
Call Trace:
[c00000015974b470] [c00000000130d2e4] dump_stack_lvl+0xc8/0x130 (unreliable)
[c00000015974b4b0] [c000000000312ca8] __lock_acquire+0xb68/0xf00
[c00000015974b5c0] [c000000000313130] lock_acquire.part.0+0xf0/0x2a0
[c00000015974b6e0] [c00000000138df6c] down_write+0x6c/0x1e0
[c00000015974b720] [c00000000026f060] blocking_notifier_chain_unregister+0x40/0x90
[c00000015974b750] [c000000000efe168] of_reconfig_notifier_unregister+0x28/0x40
[c00000015974b770] [c000000000ec8918] nx842_remove+0x144/0x1bc
[c00000015974b800] [c0000000001dba20] vio_bus_remove+0x50/0xc0
[c00000015974b830] [c000000000cfa2fc] device_shutdown+0x1fc/0x300
[c00000015974b8c0] [c000000000272b10] kernel_restart_prepare+0x50/0x70
[c00000015974b8e0] [c0000000003d10b8] kernel_kexec+0xa8/0x110
[c00000015974b950] [c000000000273184] __do_sys_reboot+0x214/0x2e0
[c00000015974bab0] [c000000000032708] system_call_exception+0x148/0x310
[c00000015974be50] [c00000000000cedc] system_call_vectored_common+0x15c/0x2ec
--- interrupt: 3000 at 0x7fff84557df8
NIP:  00007fff84557df8 LR: 00007fff84557df8 CTR: 0000000000000000
REGS: c00000015974be80 TRAP: 3000   Not tainted  (6.12.0-rc2-invalid_wait_context-00222-g7d2910da7039)
MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48022484  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000058 00007fffd9315af0 00007fff84667100 fffffffffee1dead
GPR04: 0000000028121969 0000000045584543 0000000000000000 0000000000000003
GPR08: 0000000000000003 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007fff849bb360 ffffffffffffffff 0000000000000000
GPR16: 0000000000000001 0000000000000002 0000000000000001 0000000000000001
GPR20: 000000010aa9f520 0000000000000000 0000000000000000 0000000000000001
GPR24: 000000010b3c0480 0000000000000003 0000000000000003 00007fffd9315bc0
GPR28: 000000010aa82d30 000000010aa82d28 00007fff846618d0 000000010b3c04a0
NIP [00007fff84557df8] 0x7fff84557df8
LR [00007fff84557df8] 0x7fff84557df8
--- interrupt: 3000

> 
> > -----------------------------
> > kexec/61926 is trying to lock:
> > c000000002d8b590 ((of_reconfig_chain).rwsem){++++}-{4:4}, at: blocking_notifier_chain_unregister+0x44/0xa0
> > other info that might help us debug this:
> > context-{5:5}
> > 4 locks held by kexec/61926:
> >  #0: c000000002926c70 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0xf8/0x2e0
> >  #1: c00000000291af30 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x160/0x310
> >  #2: c000000051011938 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x174/0x310
> >  #3: c000000002d88070 (devdata_mutex){....}-{3:3}, at: nx842_remove+0xac/0x1bc
>   
> That's pretty conclusive.
> 
> I don't understand why you're the first person to see this. I can't see
> that any of the relevant code has changed recently. Unless something in
> lockdep itself changed?
> 
> Did you just start seeing this on recent kernels? Can you bisect?
I saw this on a recent kernel built with config lockdep enabled.
But looking at the git blame output for nx842_remove() shows that the
relevant section of the code was added 12 years ago

$ git blame -L 136,137 -L 1112,1136 drivers/crypto/nx/nx-common-pseries.c
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500  136) static DEFINE_SPINLOCK(devdata_mutex);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500  137)
386a966f5ce71a drivers/crypto/nx/nx-842-pseries.c    (Uwe Kleine-König 2021-02-25 23:18:34 +0100 1112) static void nx842_remove(struct vio_dev *viodev)
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1113) {
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1114)  struct nx842_devdata *old_devdata;
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1115)  unsigned long flags;
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1116)
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1117)  pr_info("Removing IBM Power 842 compression device\n");
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1118)  sysfs_remove_group(&viodev->dev.kobj, &nx842_attribute_group);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1119)
8c099490fd2bd3 drivers/crypto/nx/nx-common-pseries.c (Haren Myneni     2021-06-17 13:39:08 -0700 1120)  if (caps_feat)
8c099490fd2bd3 drivers/crypto/nx/nx-common-pseries.c (Haren Myneni     2021-06-17 13:39:08 -0700 1121)          sysfs_remove_group(&viodev->dev.kobj, &nxcop_caps_attr_group);
8c099490fd2bd3 drivers/crypto/nx/nx-common-pseries.c (Haren Myneni     2021-06-17 13:39:08 -0700 1122)
03952d98015326 drivers/crypto/nx/nx-842-pseries.c    (Dan Streetman    2015-07-22 14:26:38 -0400 1123)  crypto_unregister_alg(&nx842_pseries_alg);
03952d98015326 drivers/crypto/nx/nx-842-pseries.c    (Dan Streetman    2015-07-22 14:26:38 -0400 1124)
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1125)  spin_lock_irqsave(&devdata_mutex, flags);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1126)  old_devdata = rcu_dereference_check(devdata,
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1127)                  lockdep_is_held(&devdata_mutex));
1cf3d8b3d24cd3 drivers/crypto/nx/nx-842.c            (Nathan Fontenot  2012-10-02 16:57:57 +0000 1128)  of_reconfig_notifier_unregister(&nx842_of_nb);
7ded6e3d1bf5f8 drivers/crypto/nx/nx-842.c            (Monam Agarwal    2014-03-24 01:02:42 +0530 1129)  RCU_INIT_POINTER(devdata, NULL);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1130)  spin_unlock_irqrestore(&devdata_mutex, flags);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1131)  synchronize_rcu();
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1132)  dev_set_drvdata(&viodev->dev, NULL);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1133)  if (old_devdata)
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1134)          kfree(old_devdata->counters);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1135)  kfree(old_devdata);
0e16aafb12046e drivers/crypto/nx/nx-842.c            (Seth Jennings    2012-07-19 09:42:40 -0500 1136) }

> 
> > stack backtrace:
> > CPU: 2 UID: 0 PID: 61926 Comm: kexec Not tainted 6.11.0-test2-10547-g684a64bf32b6-dirty #79
> > Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_012) hv:phyp pSeries
> > Call Trace:
> > [c0000000bb577400] [c000000001239704] dump_stack_lvl+0xc8/0x130 (unreliable)
> > [c0000000bb577440] [c000000000248398] __lock_acquire+0xb68/0xf00
> > [c0000000bb577550] [c000000000248820] lock_acquire.part.0+0xf0/0x2a0
> > [c0000000bb577670] [c00000000127faa0] down_write+0x70/0x1e0
> > [c0000000bb5776b0] [c0000000001acea4] blocking_notifier_chain_unregister+0x44/0xa0
> > [c0000000bb5776e0] [c000000000e2312c] of_reconfig_notifier_unregister+0x2c/0x40
> > [c0000000bb577700] [c000000000ded24c] nx842_remove+0x148/0x1bc
> > [c0000000bb577790] [c00000000011a114] vio_bus_remove+0x54/0xc0
> > [c0000000bb5777c0] [c000000000c1a44c] device_shutdown+0x20c/0x310
> > [c0000000bb577850] [c0000000001b0ab4] kernel_restart_prepare+0x54/0x70
> > [c0000000bb577870] [c000000000308718] kernel_kexec+0xa8/0x110
> > [c0000000bb5778e0] [c0000000001b1144] __do_sys_reboot+0x214/0x2e0
> > [c0000000bb577a40] [c000000000032f98] system_call_exception+0x148/0x310
> > [c0000000bb577e50] [c00000000000cedc] system_call_vectored_common+0x15c/0x2ec
> 
> I don't see why of_reconfig_notifier_unregister() needs to be called
> with the devdata_mutext held, but I haven't looked that closely at it.
> 
> So the change below might work.
> 
> cheers
> 
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
> index 35f2d0d8507e..a2050c5fb11d 100644
> --- a/drivers/crypto/nx/nx-common-pseries.c
> +++ b/drivers/crypto/nx/nx-common-pseries.c
> @@ -1122,10 +1122,11 @@ static void nx842_remove(struct vio_dev *viodev)
>  
>  	crypto_unregister_alg(&nx842_pseries_alg);
>  
> +	of_reconfig_notifier_unregister(&nx842_of_nb);
> +
>  	spin_lock_irqsave(&devdata_mutex, flags);
>  	old_devdata = rcu_dereference_check(devdata,
>  			lockdep_is_held(&devdata_mutex));
> -	of_reconfig_notifier_unregister(&nx842_of_nb);
>  	RCU_INIT_POINTER(devdata, NULL);
>  	spin_unlock_irqrestore(&devdata_mutex, flags);
>  	synchronize_rcu();
> 
With above changes, I see another similar bug, but what's strange is
swapper does not hold any lock and still this bug is being triggered

=============================
[ BUG: Invalid wait context ]
6.12.0-rc2-fix-invalid-wait-context-00222-g7d2910da7039-dirty #84 Not tainted
-----------------------------
swapper/2/0 is trying to lock:
c000000004062128 (&xibm->lock){....}-{3:3}, at: xive_spapr_put_ipi+0xb8/0x120
other info that might help us debug this:
context-{2:2}
no locks held by swapper/2/0.
stack backtrace:
CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted 6.12.0-rc2-fix-invalid-wait-context-00222-g7d2910da7039-dirty #84
Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_012) hv:phyp pSeries
Call Trace:
[c000000004ac3420] [c00000000130d2e4] dump_stack_lvl+0xc8/0x130 (unreliable)
[c000000004ac3460] [c000000000312ca8] __lock_acquire+0xb68/0xf00
[c000000004ac3570] [c000000000313130] lock_acquire.part.0+0xf0/0x2a0
[c000000004ac3690] [c0000000013955b8] _raw_spin_lock_irqsave+0x78/0x130
kexec: waiting for cpu 2 (physical 2) to enter 2 state
[c000000004ac36d0] [c000000000194798] xive_spapr_put_ipi+0xb8/0x120
[c000000004ac3710] [c000000001383728] xive_cleanup_cpu_ipi+0xc8/0xf0
[c000000004ac3750] [c0000000013837f4] xive_teardown_cpu+0xa4/0x100
[c000000004ac3780] [c0000000001d2cc4] pseries_kexec_cpu_down+0x54/0x1e0
[c000000004ac3800] [c000000000213674] kexec_smp_down+0x124/0x1f0
[c000000004ac3890] [c0000000003c9ddc] __flush_smp_call_function_queue+0x28c/0xad0
[c000000004ac3950] [c00000000005fb64] smp_ipi_demux_relaxed+0xe4/0xf0
[c000000004ac3990] [c0000000000593d8] doorbell_exception+0x108/0x2f0
[c000000004ac3a20] [c00000000000a26c] doorbell_super_common_virt+0x28c/0x290
--- interrupt: a00 at plpar_hcall_norets_notrace+0x18/0x2c
NIP:  c0000000001bee18 LR: c0000000013867a8 CTR: 0000000000000000
REGS: c000000004ac3a50 TRAP: 0a00   Not tainted  (6.12.0-rc2-fix-invalid-wait-context-00222-g7d2910da7039-dirty)
MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 22000242  XER: 00000001
CFAR: 0000000000000000 IRQMASK: 0
GPR00: 0000000000000000 c000000004ac3cf0 c000000001e37600 0000000000000000
GPR04: 0000000000000000 0000000000000000 0001dc4f97750361 0000000000010000
GPR08: 00000000000000c0 0000000000000080 0001dc4f97750554 0000000000000080
GPR12: 0000000000000000 c0000007fffee480 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 c000000002ebf778 0000000000000000 00000043a215d824
GPR24: 0000000000000000 c000000000ec0f80 c000000002ebf778 0000000000000000
GPR28: 0000000000000000 0000000000000001 c0000000021a2300 c0000000021a2308
NIP [c0000000001bee18] plpar_hcall_norets_notrace+0x18/0x2c
LR [c0000000013867a8] check_and_cede_processor+0x48/0x80
--- interrupt: a00
[c000000004ac3cf0] [0000000000982538] 0x982538 (unreliable)
[c000000004ac3d50] [c000000001386874] dedicated_cede_loop+0x94/0x1a0
[c000000004ac3da0] [c00000000138584c] cpuidle_enter_state+0x10c/0x8a8
[c000000004ac3e50] [c000000000ec0f80] cpuidle_enter+0x50/0x80
[c000000004ac3e90] [c0000000002ba9c8] call_cpuidle+0x48/0xa0
[c000000004ac3eb0] [c0000000002cec54] cpuidle_idle_call+0x164/0x250
[c000000004ac3f00] [c0000000002cee74] do_idle+0x134/0x1d0
[c000000004ac3f50] [c0000000002cf34c] cpu_startup_entry+0x4c/0x50
[c000000004ac3f80] [c0000000000607d0] start_secondary+0x280/0x2b0
[c000000004ac3fe0] [c00000000000e058] start_secondary_prolog+0x10/0x14


