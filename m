Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F40237E7916
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 07:17:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JSm2Pp03;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRTBr6JT5z3cTS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 17:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JSm2Pp03;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRTB03DFyz30fk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 17:16:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699597013;
	bh=k0KT7Oc2LV3aJGmLjsBXdbW4OHO2DCMqzsHH5BrfELg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JSm2Pp03lkuqDWdRwEMo9S5q57PZwl9vN6GV6MhXcLtNfKtXhuJMDIdsmnCHWCF78
	 RFlV6VS2qsWX/9UX747o1ZHNpIUIbS86oBi78Oe9z+OdCrQ2bBQTm0Uso8BnbozgQZ
	 pBBOKo5MR3VQqVdia5hsizzklFqwulN0vGFOiKUW+U6kcI6vyEdDw38PEwIkXnZvxn
	 toxVAS0dOfanZFErxdXqAcAnWbRBhEk4y4+a+HVUi4kUjTdhOJkyaTOvz24CDHWwYp
	 PEzVLqlQHZt8/3hfp+1dI7qe4Vzi0LJclv+JXZGTGPKNlxY/pauVX/y10bUy8J1o8W
	 bWNO6Bdw8kYzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SRT9w6gPLz4x1v;
	Fri, 10 Nov 2023 17:16:52 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc: Fix signature of pfn_to_kaddr()
In-Reply-To: <CACRpkdbL1mfcAz9sPn89UGSQ6tb=jF6nRYAwp9Qz8zLXLLU_UA@mail.gmail.com>
References: <20231106-virt-to-pfn-fix-ppc-v1-1-93197a7ccab4@linaro.org>
 <87ttpyw1ez.fsf@mail.lhotse>
 <CACRpkdbL1mfcAz9sPn89UGSQ6tb=jF6nRYAwp9Qz8zLXLLU_UA@mail.gmail.com>
Date: Fri, 10 Nov 2023 17:16:52 +1100
Message-ID: <87bkc28757.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Walleij <linus.walleij@linaro.org> writes:
> On Tue, Nov 7, 2023 at 6:57=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
>
>> I'm struggling to connect the removal of const with those bug reports.
>> It looks like all those warnings are about 0xc000000000000000 being
>> outside the range of unsigned long when building 32-bit.
>
> Aha right. I wonder what actually causes that.

It is the 32-bit VDSO being built:

      VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
    In file included from <built-in>:4:
    In file included from /home/michael/linux/lib/vdso/gettimeofday.c:5:
    In file included from ../include/vdso/datapage.h:137:
    In file included from ../arch/powerpc/include/asm/vdso/gettimeofday.h:7:
    ../arch/powerpc/include/asm/page.h:230:9: warning: result of comparison=
 of constant 13835058055282163712 with expression of type 'unsigned long' i=
s always true [-Wtautological-constant-out-of-range-compare]
      230 |         return __pa(kaddr) >> PAGE_SHIFT;
          |                ^~~~~~~~~~~
    ../arch/powerpc/include/asm/page.h:217:37: note: expanded from macro '_=
_pa'
      217 |         VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);     =
         \
          |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
    ../arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'V=
IRTUAL_WARN_ON'
      202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG=
_VIRTUAL) && (x))
          |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~^~~
    ../arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WAR=
N_ON'
       88 |         int __ret_warn_on =3D !!(x);                           =
   \
          |                                ^


Which is a bit of a frankenstein, because we're building 32-bit VDSO
code for a 64-bit kernel, and using some of the kernel headers for that.

So the warning is correct, we are doing a tautological comparison.
Except that we're not actually using that code in the VDSO, it's just
included in the VDSO because it needs PAGE_SHIFT.

Anyway none of that is your fault, you just had the misfortune of
touching page.h :)

I think I see a way to clean it up. Will send a patch.

cheers
