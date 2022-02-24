Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAD4C2936
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 11:21:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K487w2SGcz3cJS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 21:21:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K487T2tBVz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 21:20:52 +1100 (AEDT)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MaIvV-1nhkXf2CDl-00WHbN for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb
 2022 11:20:50 +0100
Received: by mail-wr1-f46.google.com with SMTP id j22so2148362wrb.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 02:20:49 -0800 (PST)
X-Gm-Message-State: AOAM530SXcGyjE52J4YgRHEVCqCopXazLoTDoWWwEnvGgBpTSRVD8uHi
 d5KCVKoMc3BS2mdyEDdHtzKMAH17lJBiVvFax1g=
X-Google-Smtp-Source: ABdhPJwlwBZOETCLeyu6amnN4VaudZFBEgKuBFVnNi6SbNUIvJmeYpK6VEyqchdPJW+eY7ZEGveiw2GFLgbBfJMODq8=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1730833wra.407.1645698049603; Thu, 24
 Feb 2022 02:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
 <1645694174.z03tip9set.astroid@bobo.none>
In-Reply-To: <1645694174.z03tip9set.astroid@bobo.none>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 11:20:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1LgZkAV2wX03hAgx527MuiFt5ABWFp1bGdsTGc=8OmMg@mail.gmail.com>
Message-ID: <CAK8P3a1LgZkAV2wX03hAgx527MuiFt5ABWFp1bGdsTGc=8OmMg@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6II+4d3TdICpizXJ7T3TOVfzG7JIThmnNX0k2gg37lT5PRgWPZu
 4gegXhZCCEsVU1viK1PNu8HCioMveG+BT0rLnv54iqHQ78m5+jumyDyzeCkk+D9wj7ZL0Wz
 yiXlTfoge/gWNidRJ0isveppxMMx7HFnDaEFy6wvvT+evnm60bOYnCp+yMUhqFOmgIGFIBA
 M16MM0Iq9e6Rflv2xpNOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S+RJFC0NwS4=:vvWOTquhtLWv1MA0pWP41n
 WoJNJNmMDA4icpvZPkdYeR+JuQYug9jUdqPympA+bL4Ze0aTVtclBXUJ7KpfWE5fcadQg0YD1
 ZvlimNslQilZ8qJ7oaoLwlTJqQxxofhZwRBWcJzAYGU0Bxv28HLvk0Mu1oo6OBDq4xNVgC6XS
 0gItUI9og3dGa1xhr+10K1/zGWhbE9w1LmntJjMIDEiiHKMNrCmoT1Q97z31bAHNjO+d9kFeX
 hRTHDWdGVgb8iCHagd8qBCjgUiyFomslUYmElBkdO65KW4886cOPupoCrZDhnmqgdXpmC2fAf
 zI1N671UX4mk1klGrXXAAVX3w5AKq9lMKnY6UdsAEuMbzCU5ta4UzNlL2lhyNSabRFgzRq9AF
 SJ+RZLKVNnDox1r8C8EsrJVaO+SYgx5FHp1t6QYQ4X/B3Khn2HBuXgwurwp4wCA3wNqDPc/yx
 DhHS1qmfmzsPGFyDsDDYxDNre+7QpmrO3G5DX/v75EMePXFK2MBsNLbGItgHdGFui/J/+PAVk
 46s13Z7oyTr5ZrSlfzVS1WJQXX1Zy81D3oWLwyKh6KF5BAhkwk/0v15blnKE6Z1jyaIrEo6gO
 QbnT+VhIz2XOB2DB49Y70oe2pbOshSu800y+JImDDE3VdH4MMJowaSnkc3XCvm3uxUpmYr4Bv
 bDqhazDrt1a3YNbHSMaYLNYynQN8aPJA7AyZzvppLQXg7mejbYUcqby/rj8Vc/ETPCXQdkBRG
 NSEHOttUn2UYG4q21JX514l/kpy6otVXqjM7kh/gJ6jX2eECyE9nRy2U09+o7bDvECyIoEh6W
 CDSLQkCE7ILQrT8FiRTF17q7fEAOmnv8f2ZahLVWZxUjiIztPU=
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 11:11 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> Excerpts from Arnd Bergmann's message of February 24, 2022 6:55 pm:
> > On Thu, Feb 24, 2022 at 6:05 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> > We had the same thing on Arm a few years ago when binutils
> > started enforcing this more strictly, and it does catch actual
> > bugs. I think annotating individual inline asm statements is
> > the best choice here, as that documents what the intention is.
>
> A few cases where there are differences in privileged instructions
> (that won't be compiler generated), that will be done anyway.
>
> For new instructions added to the ISA though? I think it's ugly and
> unecesaary. There is no ambiguity about the intention when you see
> a lharx instruction is there?
>
> It would delinate instructions that can't be used on all processors
> but I don't see  much advantage there, it's not an exhaustive check
> because we have other restrictions on instructions in the kernel
> environment. And why would inline asm be special but not the rest
> of the asm? Would you propose to put these .machine directives
> everywhere in thousands of lines of asm code in the kernel? I
> don't know that it's an improvement. And inline asm is a small
> fraction of instructions.

Most of the code is fine, as we tend to only build .S files that
are for the given target CPU, the explicit .machine directives are
only needed when you have a file that mixes instructions for
incompatible machines, using a runtime detection.

> Right that should be caught if you just pass -m<superset> architecture
> to the assembler that does not include the mtpmr. 32-bit is a lot more
> complicated than 64s like this though, so it's pssible in some cases
> you will want more checking and -m<subset> + some .machine directives
> will work better.
>
> Once you add the .machine directive to your inline asm though, you lose
> *all* such static checking for the instruction. So it's really not a
> panacea and has its own downsides.

Again, there should be a minimum number of those .machine directives
in inline asm as well, which tends to work out fine as long as the
entire kernel is built with the correct -march= option for the minimum
supported CPU, and stays away from inline asm that requires a higher
CPU level.

      Arnd
