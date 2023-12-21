Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73D81C20D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 00:43:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RXLJpd2O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sx6Sh6V0Mz3byh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 10:43:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RXLJpd2O;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx6Rq3p45z2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 10:42:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703202167;
	bh=LvpDHPV8ZFO1a5ZSBn5Alv45CExq5OC+ct9WY4ZpH6A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RXLJpd2OTict3gFueFqVwWKz9dPtkZEC/67FxfUIe4PMqhDNZtEKc830FiCY9dPph
	 IRLapDBLOMzd/mgCaSQUPtyaISMupFO+MyyJ+NfBwidwatWNS4Or5BpO++dMjUat5D
	 5vUAkdWe7LNtr265irZMqetkQMQLKIozn86HLCTfi5UxTfENxqf/LZs0mh8wdu9MZm
	 ZFdnRH+ToY/4Wf7theyy2Psu5yCtDZosKTOBriHxInQiNDMbjlE3Hf+VYx5wBBpbkH
	 NQ9o2bOMGs7Q54OnRdRCnon6UtWzB5HG0bxBFFOEK8Ue5Kvqmn5+tsArQ7d6StID+C
	 4REfNJp976m1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sx6Rq2pHvz4wcJ;
	Fri, 22 Dec 2023 10:42:47 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc: Split PAGE_SHIFT/SIZE into vdso/page.h
In-Reply-To: <CACRpkdZk3pSZ_EfhkPDcm3eXRDRqvHtZ=7hqOHUnTFiew_VtJg@mail.gmail.com>
References: <20231221120410.2226678-1-mpe@ellerman.id.au>
 <CACRpkdZk3pSZ_EfhkPDcm3eXRDRqvHtZ=7hqOHUnTFiew_VtJg@mail.gmail.com>
Date: Fri, 22 Dec 2023 10:42:45 +1100
Message-ID: <878r5nktqi.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Walleij <linus.walleij@linaro.org> writes:
> On Thu, Dec 21, 2023 at 1:04=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>
>> The VDSO needs PAGE_SHIFT/SIZE defined, so it includes asm/page.h.
>>
>> However when COMPAT=3Dy the VDSO is built 32-bit, even though the kernel
>> is 64-bit. That can lead to odd warnings because some kernel constants
>> are 64-bit, but unsigned long is 32-bit, for example:
>>
>>     VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>>   In file included from <built-in>:4:
>>   In file included from /home/michael/linux/lib/vdso/gettimeofday.c:5:
>>   In file included from ../include/vdso/datapage.h:137:
>>   In file included from ../arch/powerpc/include/asm/vdso/gettimeofday.h:=
7:
>>   ../arch/powerpc/include/asm/page.h:230:9: warning: result of compariso=
n of constant 13835058055282163712 with expression of type 'unsigned long' =
is always true
>>     230 |         return __pa(kaddr) >> PAGE_SHIFT;
>>         |                ^~~~~~~~~~~
>>
>> Fix it by moving the PAGE_SHIFT/SIZE constants into a separate header,
>> which can be included by the VDSO, and also by the existing kernel
>> headers. That avoids exposing the rest of the header to the non-standard
>> build environment of the compat VDSO.
>>
>> The particular warning above was introduced by commit 58b6fed89ab0
>> ("powerpc: Make virt_to_pfn() a static inline"), though it is not at
>> fault, it just exposed the fact that the VDSO was including parts of
>> page.h that weren't needed or appropriate for the VDSO.
>>
>> Don't copy the comment about page sizes, it just risks becoming
>> outdated, that information is better available in the Kconfig
>> dependencies and help text.
>>
>> Fixes: 58b6fed89ab0 ("powerpc: Make virt_to_pfn() a static inline")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202311061940.4pBrm44u-lkp@=
intel.com/
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Clearly a working solution!
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks.

> Just a note:
>
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/=
page.h
> (...)
>> +#include <asm/vdso/page.h>
>
> (...)
>> +++ b/arch/powerpc/include/asm/vdso/page.h
>> @@ -0,0 +1,10 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef _ASM_POWERPC_VDSO_PAGE_H
>> +#define _ASM_POWERPC_VDSO_PAGE_H
>> +
>> +#include <vdso/const.h>
>
> Now the whole kernel includes <vdso/const.h>, is this necessary?

It's already included by approximately the whole kernel via:
  include/linux/kernel.h
   - include/uapi/linux/kernel.h
     - include/linux/const.h
       - include/vdso/const.h

And arch/powerpc/include/asm/page.h already includes linux/kernel.h, so
includers of page.h should not see any new headers other than
asm/vdso/page.h.

cheers
