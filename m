Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D38A54994A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 21:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjMVd5xtGz3cCK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 07:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com; envelope-from=yinan@linux.alibaba.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 312 seconds by postgrey-1.36 at boromir;
 Mon, 24 Jan 2022 23:20:44 AEDT
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj8G44RC8z30L1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 23:20:42 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yinan@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V2kVahY_1643026507; 
Received: from 30.240.98.205(mailfrom:yinan@linux.alibaba.com
 fp:SMTPD_---0V2kVahY_1643026507) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 24 Jan 2022 20:15:07 +0800
Message-ID: <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
Date: Mon, 24 Jan 2022 20:15:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
To: Sachin Sant <sachinp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
From: Yinan Liu <yinan@linux.alibaba.com>
In-Reply-To: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Jan 2022 07:47:02 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

在 2022/1/24 下午5:19, Sachin Sant 写道:
> While running stress_code_patching test from selftests/powerpc/mm
> against 5.17-rc1 booted on a POWER10 LPAR following ftrace warning
> is seen:
> 
> WARNING: CPU: 1 PID: 2017392 at kernel/trace/ftrace.c:2068 ftrace_bug+0x274/0x2d8
> Modules linked in: dm_mod bonding rfkill sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
> CPU: 1 PID: 2017392 Comm: stress_code_pat Not tainted 5.17.0-rc1-gdd81e1c7d5fb #1
> NIP:  c0000000002d561c LR: c0000000002d5618 CTR: 00000000005b4448
> REGS: c0000000332fb760 TRAP: 0700   Not tainted  (5.17.0-rc1-gdd81e1c7d5fb)
> MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48228224  XER: 00000009
> CFAR: c0000000001f6b00 IRQMASK: 0
> GPR00: c0000000002d5618 c0000000332fba00 c000000002a20000 0000000000000022
> GPR04: 00000000ffff7fff c0000000332fb720 c0000000332fb718 0000000000000027
> GPR08: c00000167cca7e10 0000000000000001 0000000000000027 c0000000028d6d08
> GPR12: 0000000000008000 c00000167fa30780 0000000040000000 00007fff9a089798
> GPR16: 00007fff9a089724 00007fff9a026be8 00007fff99fbf4f0 00007fff9a08d568
> GPR20: 00007fffce533ed0 0000000000000001 00007fff9a0399d8 00007fffd9eccf94
> GPR24: 0000000000000001 0000000000000000 c0000000332fbc70 c000000000fb0d18
> GPR28: c000000000ff5080 c000000000fadd38 c0000000020032ec c0000000070800a8
> NIP [c0000000002d561c] ftrace_bug+0x274/0x2d8
> LR [c0000000002d5618] ftrace_bug+0x270/0x2d8

Hi, Steven and Sachin

I don't have a powerpc machine for testing, I guess the ppc has a 
similar problem with the s390. It's not clear to me why the compiler 
does this. Maybe we can handle ppc like you did with the s390 before, 
but I'm not sure if other architectures have similar issues. Or limit 
BUILDTIME_MCOUNT_SORT to a smaller scope and make it only available for 
x86 and arm?

steven, what's your opinion?


Best regards
--yinan

