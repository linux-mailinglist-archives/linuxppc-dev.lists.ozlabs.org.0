Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFD28CE16D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 09:16:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FD2N3ewJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlx4q6HJFz87RH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 17:10:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FD2N3ewJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vlx461KLCz87Gm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 17:09:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716534560;
	bh=Esb2KY6b1PqEQxysInOUkGshLUVvXJHL4fIErYt0EbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FD2N3ewJox45JFZSUsks0vEqEKj3SmDBFivg+uAiR+YCaa7oV4t+DVFIEKT1vFf3R
	 aZ7wlqs9JxKBUzkCxL+lgdqO1UQ3BEMbTUfi9EFDtCD+y3+WjZOT7oMprLT10KyOBd
	 WtLUrGX/NW2gYMDfieBu7zTdY3NUAio2gRDRIXCV/BbHy6I3jCnffgTFQ7Mpw9Izkt
	 a57/LfMnHvKkU6GcozZDvrxFxmazqYm52ZL5T0WUsW7458I5wcp5y03xtt4pFiv7bJ
	 YhH94A1k8kWzHa4bZdiNjkaWh7V/URxwNogHLscHlzWaxRIzeYGJp8KMYzDyrSzjC8
	 q4eoDQ+gzQ73w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vlx3y60jZz4wcC;
	Fri, 24 May 2024 17:09:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] powerpc/uaccess: Fix build errors seen with GCC 14
In-Reply-To: <CAKwvOdm0_dAvQtuJXWfSCwh+2Jy=79DyjG+tKp9NGv9tunwj1A@mail.gmail.com>
References: <20240521123919.245886-1-mpe@ellerman.id.au>
 <CAKwvOdm0_dAvQtuJXWfSCwh+2Jy=79DyjG+tKp9NGv9tunwj1A@mail.gmail.com>
Date: Fri, 24 May 2024 17:09:17 +1000
Message-ID: <87h6en4rfm.fsf@mail.lhotse>
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, linkw@gcc.gnu.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers <ndesaulniers@google.com> writes:
> On Tue, May 21, 2024 at 5:39=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>>
>> Building ppc64le_defconfig with GCC 14 fails with assembler errors:
>>
>>     CC      fs/readdir.o
>>   /tmp/ccdQn0mD.s: Assembler messages:
>>   /tmp/ccdQn0mD.s:212: Error: operand out of domain (18 is not a multipl=
e of 4)
>>   /tmp/ccdQn0mD.s:226: Error: operand out of domain (18 is not a multipl=
e of 4)
>>   ... [6 lines]
>>   /tmp/ccdQn0mD.s:1699: Error: operand out of domain (18 is not a multip=
le of 4)
>>
>> A snippet of the asm shows:
>>
>>   # ../fs/readdir.c:210:         unsafe_copy_dirent_name(dirent->d_name,=
 name, namlen, efault_end);
>>          ld 9,0(29)       # MEM[(u64 *)name_38(D) + _88 * 1], MEM[(u64 *=
)name_38(D) + _88 * 1]
>>   # 210 "../fs/readdir.c" 1
>>          1:      std 9,18(8)     # put_user       # *__pus_addr_52, MEM[=
(u64 *)name_38(D) + _88 * 1]
>>
>> The 'std' instruction requires a 4-byte aligned displacement because
>> it is a DS-form instruction, and as the assembler says, 18 is not a
>> multiple of 4.
>>
>> The fix is to change the constraint on the memory operand to put_user(),
>> from "m" which is a general memory reference to "YZ".
>>
>> The "Z" constraint is documented in the GCC manual PowerPC machine
>> constraints, and specifies a "memory operand accessed with indexed or
>> indirect addressing". "Y" is not documented in the manual but specifies
>> a "memory operand for a DS-form instruction". Using both allows the
>> compiler to generate a DS-form "std" or X-form "stdx" as appropriate.
>>
>> The change has to be conditional on CONFIG_PPC_KERNEL_PREFIXED because
>> the "Y" constraint does not guarantee 4-byte alignment when prefixed
>> instructions are enabled.
>>
>> Unfortunately clang doesn't support the "Y" constraint so that has to be
>> behind an ifdef.
>
> Filed: https://github.com/llvm/llvm-project/issues/92939

Thanks. I will file one to have the GCC constraint documented.

cheers
