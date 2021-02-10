Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E54317192
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 21:45:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbWwf2085zDwjm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 07:45:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lmkiJKXC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbWtQ6KHgzDwj0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 07:43:10 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2878C64EF6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612989788;
 bh=uLOKAWM3j/FoxqUD8GT+3TtzddPUhVZXn4EjHpRaYRU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lmkiJKXCvcIr7bJJwt0+IcDnvs1AsnqLmmrmIbC7czgtUZdY5VxVSJCPusafVRb3m
 aH0pgkNpvwqct6bgF3g6Xaj4KJgbz83uG25cy4KzS2QmowT39NgqsIVjwRcM1P8izu
 8T3Eek10TdCuQon4b2gb4yXKxazZXCWdy65+9m4tDh1jb93rOIkn797PR3XGB1iB7d
 AJs91tGIyzvMxiErvs7HjM9ZEgpKWq45I3j5SDXtXcqppw1553I4EzzZfN47PueR2W
 ejhYnLvGOHfXEicQifr5YZnnj8AkVB2FZLp9gvHcZ4xQUHVbZj3nLQdkEwAxa5a5bG
 cU12yHQoC0Xsw==
Received: by mail-ed1-f42.google.com with SMTP id s11so4621680edd.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 12:43:08 -0800 (PST)
X-Gm-Message-State: AOAM532r2IVznqNFCUKnryyFQ0wwcfcmBozmomrvKVlmLObymjzMhaXd
 kkgK9Y/kJbUKqJj9Cf3bn9f6WmMa8Syip0uPAw==
X-Google-Smtp-Source: ABdhPJyZOou+FoAa1VvtSo/LHBp8mrbstlSxAr2IxMuuWsdlFjqx8EC6dZAWMoScFPYRRlNAEw7N0EavS9AV9/V0P7o=
X-Received: by 2002:a17:906:af41:: with SMTP id
 ly1mr4612652ejb.525.1612989785769; 
 Wed, 10 Feb 2021 12:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210210171500.GA2328209@robh.at.kernel.org>
 <5c002c32-bc49-acda-c641-7b1494ea292d@linux.microsoft.com>
In-Reply-To: <5c002c32-bc49-acda-c641-7b1494ea292d@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Feb 2021 14:42:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLmdqfFF8u=dE+dQz+6ngv=moWkQF8tpZjUCX-vHuvU_w@mail.gmail.com>
Message-ID: <CAL_JsqLmdqfFF8u=dE+dQz+6ngv=moWkQF8tpZjUCX-vHuvU_w@mail.gmail.com>
Subject: Re: [PATCH v17 00/10] Carry forward IMA measurement log on kexec on
 ARM64
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 vincenzo.frascino@arm.com, Frank Rowand <frowand.list@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 James Morris <jmorris@namei.org>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 10, 2021 at 11:33 AM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> On 2/10/21 9:15 AM, Rob Herring wrote:
> > On Tue, Feb 09, 2021 at 10:21:50AM -0800, Lakshmi Ramasubramanian wrote:
> >> On kexec file load Integrity Measurement Architecture (IMA) subsystem
> >> may verify the IMA signature of the kernel and initramfs, and measure
> >> it.  The command line parameters passed to the kernel in the kexec call
> >> may also be measured by IMA.  A remote attestation service can verify
> >> a TPM quote based on the TPM event log, the IMA measurement list, and
> >> the TPM PCR data.  This can be achieved only if the IMA measurement log
> >> is carried over from the current kernel to the next kernel across
> >> the kexec call.
> >>
> >> powerpc already supports carrying forward the IMA measurement log on
> >> kexec.  This patch set adds support for carrying forward the IMA
> >> measurement log on kexec on ARM64.
> >>
> >> This patch set moves the platform independent code defined for powerpc
> >> such that it can be reused for other platforms as well.  A chosen node
> >> "linux,ima-kexec-buffer" is added to the DTB for ARM64 to hold
> >> the address and the size of the memory reserved to carry
> >> the IMA measurement log.
> >>
> >> This patch set has been tested for ARM64 platform using QEMU.
> >> I would like help from the community for testing this change on powerpc.
> >> Thanks.
> >>
> >> This patch set is based on
> >> commit 96acc833dec8 ("ima: Free IMA measurement buffer after kexec syscall")
> >> in https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
> >> "next-integrity" branch.
> >
> > Is that a hard dependency still? Given this is now almost entirely
> > deleting arch code and adding drivers/of/ code, I was going to apply it.
> >
>
> I tried applying the patches in Linus' mainline branch -
> PATCH #5 0005-powerpc-Move-ima-buffer-fields-to-struct-kimage.patch
> doesn't apply.
>
> But if I apply the dependent patch set (link given below), all the
> patches in this patch set apply fine.
>
> https://patchwork.kernel.org/project/linux-integrity/patch/20210204174951.25771-2-nramas@linux.microsoft.com/

Ideally, we don't apply the same patch in 2 branches. It looks like
there's a conflict but no real dependence on the above patch (the
ima_buffer part). The conflict seems trivial enough that Linus can
resolve it in the merge window.

Or Mimi can take the whole thing if preferred?

Rob
