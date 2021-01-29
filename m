Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3BD308878
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 12:45:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRwWS39r8zDrp4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 22:45:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRwQq5fcDzDrhn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 22:41:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=R81CIsQ7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRwQh2FfCz9s1l;
 Fri, 29 Jan 2021 22:41:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1611920481;
 bh=xzHILf+29xPZ0aQ6YxqaatCYkWf8taJuwJRNrFUdFnM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=R81CIsQ71oN+2wG2HJbeXjtDGytU9PT1DGw/3VnLzkUjN2VNI5KJz3T0OpP4FfWfs
 aiUppaWH87mHCLyV70ca1YTg/L0vmmwdhlF+53OMHhqGKCPtgoiBqyp8kajeuDS7xJ
 9eZzbYj4hyee+qwTCd4Xph3V9bgHx7m0yGEuBTbuLJ5yxD+d5TYQHtDRGIDxLZmMaw
 KOEjI5y7L5G6oXtRL6oBRS/Jf9jWOQ8U2u1w2ReBe9wbdipfRE/dZeemqmztFTsobs
 zk1j5L0sOUFVNB+ZtbG0tRseTq4TFhWcR68Ag6GuIpLjDtyxbx2JWRKIXUFuO36+n/
 8yt1mfsWHcVWg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/vdso: fix unnecessary rebuilds of
 vgettimeofday.o
In-Reply-To: <CAK7LNASEVM8e5hohV4jbXOvMxSJ_Prm3es+fhezPkRc6UL=vdw@mail.gmail.com>
References: <20201223171142.707053-1-masahiroy@kernel.org>
 <CAK7LNASEVM8e5hohV4jbXOvMxSJ_Prm3es+fhezPkRc6UL=vdw@mail.gmail.com>
Date: Fri, 29 Jan 2021 22:41:15 +1100
Message-ID: <87y2gcc6n8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Greentime Hu <green.hu@gmail.com>, Michal Suchanek <msuchanek@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Thu, Dec 24, 2020 at 2:12 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> vgettimeofday.o is unnecessarily rebuilt. Adding it to 'targets' is not
>> enough to fix the issue. Kbuild is correctly rebuilding it because the
>> command line is changed.
>>
>> PowerPC builds each vdso directory twice; first in vdso_prepare to
>> generate vdso{32,64}-offsets.h, second as part of the ordinary build
>> process to embed vdso{32,64}.so.dbg into the kernel.
>>
>> The problem shows up when CONFIG_PPC_WERROR=y due to the following line
>> in arch/powerpc/Kbuild:
>>
>>   subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror
>>
>> In the preparation stage, Kbuild directly visits the vdso directories,
>> hence it does not inherit subdir-ccflags-y. In the second descend,
>> Kbuild adds -Werror, which results in the command line flipping
>> with/without -Werror.
>>
>> It implies a potential danger; if a more critical flag that would impact
>> the resulted vdso, the offsets recorded in the headers might be different
>> from real offsets in the embedded vdso images.
>>
>> Removing the unneeded second descend solves the problem.
>>
>> Link: https://lore.kernel.org/linuxppc-dev/87tuslxhry.fsf@mpe.ellerman.id.au/
>> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>
>
> Michael, please take a  look at this.
>
> The unneeded rebuild problem is still remaining.

Sorry missed those.

I guess I'll pick these up as fixes for v5.10.

cheers
