Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B27273D75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 10:40:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwZW53Fp8zDqxd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 18:40:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=tony.ambardar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rklt1Ixf; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwZT81Yt1zDqvt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 18:38:19 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id t13so16473322ile.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 01:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZN6yIokdu3nRM6zs1gAw4zovR291jsdWkkbanuM5QFo=;
 b=rklt1Ixft43/gqI7RLIpfZCI0rPbxRKKLQAbjEFNPNAhQON3bbUIU+rCVRVWpMgadg
 8F7t2fPgqnEOcVmugUa0jDXI+O6/D5OOE7K4GYr16DacqYHuo3247Uhm/D0o9+Ejdb4r
 Yl1LCoaP1hGhMF4pSsyIw3zAv2aHf259D/hIx8I5kmt9vZYP1P5QoMvUAaqCsskpQnnw
 kjBJrgmphch6j0G1YY7jqNS1dAj8MW3Awc0Nvf+lOhU19jrnUycuf0AEkGjQB9cA4cCO
 0VlsMKzI2bYbvEbxR8202/hxnBEnBuXgdRyZVoeqK1/uqFiZx4U2BxPfEFueCWpwXcd3
 5BoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZN6yIokdu3nRM6zs1gAw4zovR291jsdWkkbanuM5QFo=;
 b=sUx4XPHpGhUdV6B1fhhIWWjzOYV+yz9umJvGJBPeUQ6U3RvwvsU1O8+E2lgjmmtKhh
 ETnlMeUAWjvjBGTKZ5kdQSDwojhS01+4UQWULIOCl5FORVgK/p+RehSfEEMZlKsU8TW9
 rfWjnmRBoM3zllQuVwOK0oOl+dwEARFYqNTAUkDQ09B1OFTJn0o1j8/cH3mxMGnnTt54
 rZwx78fSz26cN2aYjunn1Q+gMzE2yZUlx24GVJkJztOX5mk7zySJEUil0Hpu+LjpFTyC
 Rd0hZoZbJCmoygLvILXXgVxctLQmMUy4yiLz/XkJ3ih5uGo1wc/2E4fhZhmT1AVCulMr
 EyWg==
X-Gm-Message-State: AOAM530kfJrMQ263eU3HXTHUrYiMnZWbncX0ucQI9cFOxHnMmhUKKJUY
 Kc3E7CSTFFRPziCOyJuOby90H4yF/tS0BVxZJto=
X-Google-Smtp-Source: ABdhPJwzZWlvRON3aVQ04ZlKCrEbPsGGMDxQBzAARRIqdLpyrFFlghnM4kYVk1TZM7wrUh4GQD3FHXCDQxfSPa+9fbk=
X-Received: by 2002:a92:d785:: with SMTP id d5mr3140536iln.123.1600763895057; 
 Tue, 22 Sep 2020 01:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200917135437.1238787-1-Tony.Ambardar@gmail.com>
 <20200921125452.32E0E21D7A@mail.kernel.org>
In-Reply-To: <20200921125452.32E0E21D7A@mail.kernel.org>
From: Tony Ambardar <tony.ambardar@gmail.com>
Date: Tue, 22 Sep 2020 01:38:06 -0700
Message-ID: <CAPGftE_RZPUe7Xba7bjhGw8hKrmD8ipWu+jf+ppCpt2r0fKbHg@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
To: Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Stable <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Sep 2020 at 05:54, Sasha Levin <sashal@kernel.org> wrote:
>
> Hi
>
> [This is an automated email]
>
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
>
> The bot has tested the following trees: v5.8.10, v5.4.66, v4.19.146, v4.14.198, v4.9.236, v4.4.236.
>
> v5.8.10: Build OK!
> v5.4.66: Build OK!
> v4.19.146: Build OK!
> v4.14.198: Failed to apply! Possible dependencies:
>     7af7919f0f4b ("tools include s390: Grab a copy of arch/s390/include/uapi/asm/unistd.h")
>     95f28190aa01 ("tools include arch: Grab a copy of errno.h for arch's supported by perf")
>     a3f22d505f56 ("s390/perf: add callback to perf to enable using AUX buffer")
>     a81c42136604 ("perf s390: add regs_query_register_offset()")
>     a9fc2db0a8ab ("s390/perf: define common DWARF register string table")
>     f704ef44602f ("s390/perf: add support for perf_regs and libdw")
>
> v4.9.236: Failed to apply! Possible dependencies:
>     0c744ea4f77d ("Linux 4.10-rc2")
>     2bd6bf03f4c1 ("Linux 4.14-rc1")
>     2ea659a9ef48 ("Linux 4.12-rc1")
>     49def1853334 ("Linux 4.10-rc4")
>     566cf877a1fc ("Linux 4.10-rc6")
>     5771a8c08880 ("Linux v4.13-rc1")
>     7089db84e356 ("Linux 4.10-rc8")
>     7a308bb3016f ("Linux 4.10-rc5")
>     7af7919f0f4b ("tools include s390: Grab a copy of arch/s390/include/uapi/asm/unistd.h")
>     7ce7d89f4883 ("Linux 4.10-rc1")
>     95f28190aa01 ("tools include arch: Grab a copy of errno.h for arch's supported by perf")
>     a121103c9228 ("Linux 4.10-rc3")
>     a81c42136604 ("perf s390: add regs_query_register_offset()")
>     a9fc2db0a8ab ("s390/perf: define common DWARF register string table")
>     b24413180f56 ("License cleanup: add SPDX GPL-2.0 license identifier to files with no license")
>     c1ae3cfa0e89 ("Linux 4.11-rc1")
>     c470abd4fde4 ("Linux 4.10")
>     d5adbfcd5f7b ("Linux 4.10-rc7")
>
> v4.4.236: Failed to apply! Possible dependencies:
>     0c4d40d58075 ("tools build: Add BPF feature check to test-all")
>     1925459b4d92 ("tools build: Fix feature Makefile issues with 'O='")
>     58683600dfe3 ("perf build: Use FEATURE-DUMP in bpf subproject")
>     76ee2ff34274 ("tools build feature: Move dwarf post unwind choice output into perf")
>     7af7919f0f4b ("tools include s390: Grab a copy of arch/s390/include/uapi/asm/unistd.h")
>     8ee4646038e4 ("perf build: Add libcrypto feature detection")
>     95f28190aa01 ("tools include arch: Grab a copy of errno.h for arch's supported by perf")
>     96b9e70b8e6c ("perf build: Introduce FEATURES_DUMP make variable")
>     9fd4186ac19a ("tools build: Allow subprojects select all feature checkers")
>     abb26210a395 ("perf tools: Force fixdep compilation at the start of the build")
>     aeafd623f866 ("perf tools: Move headers check into bash script")
>     c053a1506fae ("perf build: Select all feature checkers for feature-dump")
>     d4dfdf00d43e ("perf jvmti: Plug compilation into perf build")
>     d58ac0bf8d1e ("perf build: Add clang and llvm compile and linking support")
>     d8ad6a15cc3a ("tools lib bpf: Don't do a feature check when cleaning")
>     e12b202f8fb9 ("perf jitdump: Build only on supported archs")
>     e26e63be64a1 ("perf build: Add sdt feature detection")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?
>
[cc: linux-ppc, Arnd, Paul]

The patch makes identical changes to
'arch/powerpc/include/uapi/asm/errno.h' and its copy
'tools/arch/powerpc/include/uapi/asm/errno.h' first created in kernel
v4.16. Since it's the patch
hunk for the latter file which is failing on backports to < v4.16, I
would think it OK to skip
that hunk where the latter file is missing. I'd prefer to let Michael
decide the best course as
he's still reviewing the patch.

Thanks,
Tony
> --
> Thanks
> Sasha
