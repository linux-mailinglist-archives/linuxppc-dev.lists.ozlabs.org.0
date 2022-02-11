Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B44B2942
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 16:43:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwHvy4qmqz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 02:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwHtv4c0bz30hm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 02:42:47 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aebe1.dynamic.kabel-deutschland.de
 [95.90.235.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9531461E6478B;
 Fri, 11 Feb 2022 16:42:44 +0100 (CET)
Message-ID: <b3f392b1-5418-c64b-502b-f0637df13f86@molgen.mpg.de>
Date: Fri, 11 Feb 2022 16:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: =?UTF-8?Q?Re=3a_rcutorture=e2=80=99s_init_segfaults_in_ppc64le_VM?=
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
 <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
 <87y22irx5k.fsf@mpe.ellerman.id.au>
 <6ae23d59-fe88-6f14-7d9f-648afa3dc298@molgen.mpg.de>
In-Reply-To: <6ae23d59-fe88-6f14-7d9f-648afa3dc298@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: rcu@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Willy Tarreau <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Michael,


Am 11.02.22 um 15:19 schrieb Paul Menzel:

> Am 11.02.22 um 02:48 schrieb Michael Ellerman:
>> Paul Menzel writes:
>>> Am 08.02.22 um 11:09 schrieb Michael Ellerman:
>>>> Paul Menzel writes:
>>>
>>> […]
>>>
>>>>> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
>>>>> 5.17-rc2+ with rcutorture tests
>>>>
>>>> I'm not sure if that's the host kernel version or the version you're
>>>> using of rcutorture? Can you tell us the sha1 of your host kernel 
>>>> and of the tree you're running rcutorture from?
>>>
>>> The host system runs Linux 5.17-rc1+ started with kexec. Unfortunately,
>>> I am unable to find the exact sha1.
>>>
>>>       $ more /proc/version
>>>       Linux version 5.17.0-rc1+ (x@eddb.molgen.mpg.de) (Ubuntu clang version 13.0.0-2, LLD 13.0.0) #1 SMP Fri Jan 28 17:13:04 CET 2022
>>
>> OK. In general rc1 kernels can have issues, so it might be worth
>> rebooting the host into either v5.17-rc3 or a distro or stable kernel.
>> Just to rule out any issues on the host.
> 
> Yes, that was a good test. It works with Ubuntu’s 5.13 Linux kernel.
> 
>      $ more /proc/version
>      Linux version 5.13.0-28-generic (buildd@bos02-ppc64el-013) (gcc (Ubuntu 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #31-Ubuntu SMP Thu Jan 13 17:40:19 UTC 2022
> 
> I have to do more tests, but it could be LLVM/clang related.

Building commit f1baf68e1383 (Merge tag 'net-5.17-rc4' of 
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net) with the ata 
patches on top with GCC, I am unable to reproduce the issue. Before I 
built it with

     make -j100 LLVM=1 LLVM_IAS=0 bindeb-pkg

[…]


Kind regards,

Paul
