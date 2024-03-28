Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453B890779
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 18:47:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f0dgZsew;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V59wl4VjYz3vZt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 04:47:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f0dgZsew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vgupta@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V59w06qJYz3vXy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 04:46:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B613617D7;
	Thu, 28 Mar 2024 17:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F2CC433C7;
	Thu, 28 Mar 2024 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711648012;
	bh=YNR7A+kRgAjMXDjHr2JB1yywFqUpQ/6e+8DUHAu4Nlg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f0dgZsewbfCG8PiA45FJQw1TL/EasYUMhLz2/QhlXeqqfXOMfSFzRv9IkgTHijlFV
	 FhqTfFXUmCq641ywYGBQNJBov/tcSVKyclO43CvFgYl4vG0jR5PyLIGzGCMyZLU3uq
	 upLsVvNze+XfKUgkqPNlhtRQ4CV0x+8HigCh3u2WrcBvzfPqQuTABnjeZ6Hvb3VE8w
	 6ZvOi3ANgqwkkwdMuKgaXo07dtclbN/G0YdTFjA+6G2vfiNmaVW0Ibuf2jgixdXOzz
	 yzc01GzZXuDW31OzbOufYEa/h1z/NE2Qj9VquGG7bkMy752oMrsKA8KOWYY6NXnc2q
	 ClRqTQBAOutLg==
Message-ID: <1ea303d0-b5c6-4185-b6ae-8836c5ac0469@kernel.org>
Date: Thu, 28 Mar 2024 10:46:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
To: Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20240327130538.680256-1-david@redhat.com> <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
 <dc1433ea-4e59-4ab7-83fb-23b393020980@app.fastmail.com>
 <3360dba8-0fac-4126-b72b-abc036957d6a@kernel.org>
 <10da3ced-9a79-4ebb-a77d-1aa49cc61952@app.fastmail.com>
 <ZgUZCBNloC-grPWJ@kernel.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <ZgUZCBNloC-grPWJ@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, Ryan Roberts <ryan.roberts@arm.com>, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, linux-kernel@vger.kernel.org, peterx <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Matt Turner <mattst88@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/28/24 00:15, Mike Rapoport wrote:
> On Thu, Mar 28, 2024 at 07:09:13AM +0100, Arnd Bergmann wrote:
>> On Thu, Mar 28, 2024, at 06:51, Vineet Gupta wrote:
>>> On 3/27/24 09:22, Arnd Bergmann wrote:
>>>> On Wed, Mar 27, 2024, at 16:39, David Hildenbrand wrote:
>>>>> On 27.03.24 16:21, Peter Xu wrote:
>>>>>> On Wed, Mar 27, 2024 at 02:05:35PM +0100, David Hildenbrand wrote:
>>>>>>
>>>>>> I'm not sure what config you tried there; as I am doing some build tests
>>>>>> recently, I found turning off CONFIG_SAMPLES + CONFIG_GCC_PLUGINS could
>>>>>> avoid a lot of issues, I think it's due to libc missing.  But maybe not the
>>>>>> case there.
>>>>> CCin Arnd; I use some of his compiler chains, others from Fedora directly. For
>>>>> example for alpha and arc, the Fedora gcc is "13.2.1".
>>>>> But there is other stuff like (arc):
>>>>>
>>>>> ./arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
>>>>> ./arch/arc/include/asm/mmu-arcv2.h:82:9: error: implicit declaration of 
>>>>> function 'write_aux_reg' [-Werro
>>>>> r=implicit-function-declaration]
>>>>>     82 |         write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
>>>>>        |         ^~~~~~~~~~~~~
>>>> Seems to be missing an #include of soc/arc/aux.h, but I can't
>>>> tell when this first broke without bisecting.
>>> Weird I don't see this one but I only have gcc 12 handy ATM.
>>>
>>>     gcc version 12.2.1 20230306 (ARC HS GNU/Linux glibc toolchain -
>>> build 1360)
>>>
>>> I even tried W=1 (which according to scripts/Makefile.extrawarn) should
>>> include -Werror=implicit-function-declaration but don't see this still.
>>>
>>> Tomorrow I'll try building a gcc 13.2.1 for ARC.
>> David reported them with the toolchains I built at
>> https://mirrors.edge.kernel.org/pub/tools/crosstool/
>> I'm fairly sure the problem is specific to the .config
>> and tree, not the toolchain though.
> This happens with defconfig and both gcc 12.2.0 and gcc 13.2.0 from your
> crosstools. I also see these on the current Linus' tree:
>
> arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'syscall_trace_enter' [-Wmissing-prototypes]
> arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'arc_kprobe_handler' [-Wmissing-prototypes]

Yep these two I could trigger and fix posted [1]

> This fixed the warning about write_aux_reg for me, probably Vineet would
> want this include somewhere else...
>
> diff --git a/arch/arc/include/asm/mmu-arcv2.h b/arch/arc/include/asm/mmu-arcv2.h
> index ed9036d4ede3..0fca342d7b79 100644
> --- a/arch/arc/include/asm/mmu-arcv2.h
> +++ b/arch/arc/include/asm/mmu-arcv2.h
> @@ -69,6 +69,8 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <asm/arcregs.h>
> +
>  struct mm_struct;
>  extern int pae40_exist_but_not_enab(void);

Thx Mike. Indeed the fix is trivial but on tip of tree I still can't
trigger the warning to even test anything. I'm at following with my
other fixes.

    2024-03-27 962490525cff Merge tag 'probes-fixes-v6.9-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace  

I tried defconfig build as well as the exact config from Linaro report
[2], and/or various toolchains: from snps github, Arnd's crosstool
toolchain.
Granted all of these are linux toolchains - I vaguely remember at some
time, baremetal elf32 toolchain behaved differently due to different
defaults etc.
I have a feeling this was something transient which got fixed up due to
order of header includes etc.

Anyone in the followup email David only reported 2 warnings which have
been tended to as mentioned above - will be sent to Linus soon.

[1]
http://lists.infradead.org/pipermail/linux-snps-arc/2024-March/007916.html
[2]
https://storage.tuxsuite.com/public/linaro/lkft/builds/2eA2VSZdDsL0DMBBhjoauN9IVoK/

Thx,
-Vineet
