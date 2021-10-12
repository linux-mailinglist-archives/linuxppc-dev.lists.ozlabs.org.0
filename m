Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1C42A10C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 11:29:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT9NK0k4gz2ypB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 20:29:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Af/9zwXN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Af/9zwXN; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT9Mb2xGhz2xs3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 20:28:42 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E16360F92;
 Tue, 12 Oct 2021 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634030919;
 bh=w6tJ0j7GZyF9EA8+IbdyJH2ct/ziottLxIdQqKTGRqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Af/9zwXNiRPkvFTna55wceL8kexV3DRj4NlW8pN/pyovPyCs5nA2v/56fiiRDIU+c
 HM3Yu00NmTQF5P/KOHjXwMKD/VP0O/X3b0SCsoNdDpQFnkr/DDBxo1KFcNTaVuCVAK
 CleWg31dMcxiLmuLVt6pU/08nVbn/1ukk2C4m0v8=
Date: Tue, 12 Oct 2021 11:28:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 5.4 00/52] 5.4.153-rc2 review
Message-ID: <YWVVRDEDdaIQYKlX@kroah.com>
References: <20211012064436.577746139@linuxfoundation.org>
 <CA+G9fYt3vmhvuoFJ6p49DHiFE60oBeWUwuSLrh7vXwr=8_rpfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt3vmhvuoFJ6p49DHiFE60oBeWUwuSLrh7vXwr=8_rpfg@mail.gmail.com>
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
Cc: Song Liu <songliubraving@fb.com>, Florian Fainelli <f.fainelli@gmail.com>,
 bpf <bpf@vger.kernel.org>, Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Pavel Machek <pavel@denx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-stable <stable@vger.kernel.org>, patches@kernelci.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 12, 2021 at 01:04:54PM +0530, Naresh Kamboju wrote:
> On Tue, 12 Oct 2021 at 12:16, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.4.153 release.
> > There are 52 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Thu, 14 Oct 2021 06:44:25 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.153-rc2.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> stable rc 5.4.153-rc2 Powerpc build failed.
> 
> In file included from arch/powerpc/net/bpf_jit64.h:11,
>                  from arch/powerpc/net/bpf_jit_comp64.c:19:
> arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
> arch/powerpc/net/bpf_jit.h:32:9: error: expected expression before 'do'
>    32 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
>       |         ^~
> arch/powerpc/net/bpf_jit.h:33:33: note: in expansion of macro 'PLANT_INSTR'
>    33 | #define EMIT(instr)             PLANT_INSTR(image, ctx->idx, instr)
>       |                                 ^~~~~~~~~~~
> arch/powerpc/net/bpf_jit_comp64.c:415:41: note: in expansion of macro 'EMIT'
>   415 |                                         EMIT(PPC_LI(dst_reg, 0));
>       |                                         ^~~~
> arch/powerpc/net/bpf_jit.h:33:33: note: in expansion of macro 'PLANT_INSTR'
>    33 | #define EMIT(instr)             PLANT_INSTR(image, ctx->idx, instr)
>       |                                 ^~~~~~~~~~~
> arch/powerpc/net/bpf_jit.h:41:33: note: in expansion of macro 'EMIT'
>    41 | #define PPC_ADDI(d, a, i)       EMIT(PPC_INST_ADDI |
> ___PPC_RT(d) |           \
>       |                                 ^~~~
> arch/powerpc/net/bpf_jit.h:44:33: note: in expansion of macro 'PPC_ADDI'
>    44 | #define PPC_LI(r, i)            PPC_ADDI(r, 0, i)
>       |                                 ^~~~~~~~
> arch/powerpc/net/bpf_jit_comp64.c:415:46: note: in expansion of macro 'PPC_LI'
>   415 |                                         EMIT(PPC_LI(dst_reg, 0));
>       |                                              ^~~~~~
> make[3]: *** [scripts/Makefile.build:262:
> arch/powerpc/net/bpf_jit_comp64.o] Error 1
> make[3]: Target '__build' not remade because of errors.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Ok, I'm just going to go delete this patch from the queue now...

Thanks for the quick report.

greg k-h
