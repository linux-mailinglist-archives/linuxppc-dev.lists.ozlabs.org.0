Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC5DBBF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 06:37:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vYCk4RjrzDqXX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:37:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="WlTTFGi+"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vY966mXqzDrCl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 15:34:50 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5da940f00000>; Thu, 17 Oct 2019 21:34:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 17 Oct 2019 21:34:45 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 17 Oct 2019 21:34:45 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Oct
 2019 04:34:45 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Oct
 2019 04:34:44 +0000
Subject: Re: [PATCH] cpufreq: powernv: fix stack bloat and NR_CPUS limitation
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20191018000431.1675281-1-jhubbard@nvidia.com>
 <20191018042715.f76bawmoyk66isap@vireshk-i7>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c3f16019-5724-a181-8068-8dda60fb67fa@nvidia.com>
Date: Thu, 17 Oct 2019 21:34:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191018042715.f76bawmoyk66isap@vireshk-i7>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1571373296; bh=Rx+GgSz5ZaCKM6ZVWjMWxWP6l9wESsNJ8Pg+CRriU3k=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=WlTTFGi+AW1cpVxLjrs3k8ct7IRcSwLMlcB1VoUvIgOvhpy0sZ7jLoFWyB5BHgNiM
 5wp7xLBwKA2KvbE5a57Ovnr0pgIO1B8wmxe5lOcpdzaChYnL4yshjN+bKWPDZdELEC
 y6g/otss4TxpEUxCddKfKfsIKq9efIPvw/Ac+RMdtQhpc7m5ha1SBpohR3cgEmKNp7
 RSvUEvFKLYIpfE+ObXISnyRzueh0vip+XorSEzzaVDrk2ubY10iIZQI7BXD/nQEtKB
 39GaFWZiltzh212WsM6Vk3/Qk4IZx+C+j1KSICJbrQZpJkhSU2WFJBOUBlfAgnglt9
 jNdFGP9PTB6PA==
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
Cc: linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
 Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/17/19 9:27 PM, Viresh Kumar wrote:
> On 17-10-19, 17:04, John Hubbard wrote:
>> The following build warning occurred on powerpc 64-bit builds:
>>
>> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
>> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> How come we are catching this warning after 4 years ?
> 

Newer compilers. And btw, I don't spend a lot of time in powerpc
code, so I just recently ran this, and I guess everyone has been on less
new compilers so far, it seems.

I used a gcc 8.1 cross compiler in this case:

$ $ /blue_exp/kernel/cross-compilers/powerpc64/gcc-8.1.0-nolibc/powerpc64-linux/bin/powerpc64-linux-gcc -v
Using built-in specs.
COLLECT_GCC=/blue_exp/kernel/cross-compilers/powerpc64/gcc-8.1.0-nolibc/powerpc64-linux/bin/powerpc64-linux-gcc
COLLECT_LTO_WRAPPER=/home/jhubbard/blue_exp/kernel/cross-compilers/powerpc64/gcc-8.1.0-nolibc/powerpc64-linux/bin/../libexec/gcc/powerpc64-linux/8.1.0/lto-wrapper
Target: powerpc64-linux
Configured with: /home/arnd/git/gcc/configure --target=powerpc64-linux --enable-targets=all --prefix=/home/arnd/cross/x86_64/gcc-8.1.0-nolibc/powerpc64-linux --enable-languages=c --without-headers --disable-bootstrap --disable-nls --disable-threads --disable-shared --disable-libmudflap --disable-libssp --disable-libgomp --disable-decimal-float --disable-libquadmath --disable-libatomic --disable-libcc1 --disable-libmpx --enable-checking=release
Thread model: single
gcc version 8.1.0 (GCC) 



thanks,

John Hubbard
NVIDIA

