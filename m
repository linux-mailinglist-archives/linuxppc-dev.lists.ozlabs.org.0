Return-Path: <linuxppc-dev+bounces-3521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B99D6757
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 04:01:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwGvR6dWRz2yWK;
	Sat, 23 Nov 2024 14:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732330883;
	cv=none; b=lLZoAzLHR7wi3dW5QnWcOzaEut3B9TZ2oPhATEtFaa+OXzwdo8j1k5XHn4xXgKGWQj+rPrOj4FqQV5rBwcak3dwsH0vBkSwTJdnbMGEi8MwVaht3ygpZ7rpe5UTmF3vuiQsH7ANVvwrniOCJ+2WijxbGpDl8QGOFUhuxoqwv8aFRCAZ+yUE+OIfE0mJ6KhGIVdkVgd763iu8PHCM447aDZHT2IELW6avu2XKGrE4H+5PWvIpo87OiDKOne0R8NqqRdk/fmVkf9uD88jE0O/AH3yr4ys8jrTrunNRjm89vspVnaPYBPNDf4tp8L3ydi0EV8XxupNteCfK+q+qXPDTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732330883; c=relaxed/relaxed;
	bh=xmf/pB8Fle7JNevkDE4mxBCzTeF7nVLdcwwlB25iz/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PA4y8xpYTfUejuv88ul/OFglcoGDo6+mxtLD4OPS5UUc8FK2l7ekPjvB4E+YPyJINZaFnNT94XKfBQcbcd9zVSsEwGvmLeuNtFfAbHeB8UdkZaFBfIu62taNSw6OwdPwqCIauAlu5IQBjKK4oKDydoSXc7JP88yO6oNbvshWQE+pLskPN7iqhtMDRONUeaOyFsGYBR40uVGQ3oDxcXdCQzSnfuP8Nvp5EagkjEf45qH45KKzDncdgSXJRiDtjlCljNGgwdgEiTUML1I/ENhu35H76bCPiq2CLC0FV6+gx85TaIN/WalP5luHYXDFYH94Otsk9Kli0zU/+M4/m4AX5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CyDCe5Sk; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CyDCe5Sk;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwGvP29hZz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 14:01:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732330876;
	bh=xmf/pB8Fle7JNevkDE4mxBCzTeF7nVLdcwwlB25iz/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CyDCe5Skr1mmCIYEMYoLjSqCO2bD8/v+uEtWYHAFi2zk0D6BvxvGqTwSNGW6U9Hj2
	 WeCm+pf/Fpx/zwvEMc3m5XZz/rDCBeUrwO6hWXJ0Ja2VISDrqjQTzw5Kz3dxiCmuK0
	 i6DhPpf1Ns8/RqJKTfnN5bnYJuyNBRCSzWW+xAkOkiF526AzoeKV3HmTXPfOvBWrzO
	 HhxWom2nNH+WqjLKDf45yUf1mpMfrsqvHLGx6wUwtoBzEkJ1DGILDsDurhSZVlGseS
	 RZoSEsgq5O9FgDaXK7jFwhNvFJnTNAMuUQrlk+j4js66A9ADLjVCnQCmOi8HJwB6GG
	 Ms70vkt2RIwcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XwGvJ023xz4wcr;
	Sat, 23 Nov 2024 14:01:15 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
In-Reply-To: <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
Date: Sat, 23 Nov 2024 14:01:04 +1100
Message-ID: <87v7weodqn.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thorsten Blum <thorsten.blum@linux.dev> writes:
> On 11. Nov 2024, at 02:11, Michael Ellerman wrote:
>> Thorsten Blum <thorsten.blum@linux.dev> writes:
>>> The name is Mimi Phuong-Thao Vo.
>>=20
>> Is that the correct spelling?
>>=20
>> The github commit below suggests it's Mimi Ph=C3=BB=C3=B4ng-Th=C3=A5o V=
=C3=B5.
>>=20
>> And presumably the author preferred that spelling, otherwise they would
>> have just written it in ASCII in the first place.
>>=20
>> https://github.com/bminor/binutils-gdb/commit/6603bf38d74409906b3814f6a2=
6c0483a5d32e41
>
> Hi Michael,
>
> Are you suggesting to keep "Mimi Ph\373\364ng-Th\345o V\365" and a FIXME
> instead of changing it to "Mimi Phuong-Thao Vo" which is how she spells
> her name on her LinkedIn profile and other websites?

No I'm not suggesting to leave it as-is.

But I also suspect they spell it that way on LinkedIn etc. because it's
the path of least resistance, not because it's the correct spelling.

I was hoping someone who's more familiar with Vietnamese (I believe)
spelling would chime in and tell us which is correct.

> I doubt anyone prefers their name to be spelled with octal escape
> characters.
=20
Sure, but it wouldn't have been octal escapes in the original character
encoding, it would have appeared, I believe, as Mimi Ph=C3=BB=C3=B4ng-Th=C3=
=A5o V=C3=B5.

cheers

