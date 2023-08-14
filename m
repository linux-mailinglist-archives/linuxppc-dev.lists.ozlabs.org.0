Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C944377B8A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 14:31:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sHpaqgkp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPYgH4fXDz308K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 22:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sHpaqgkp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPYfR444qz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 22:31:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692016271;
	bh=CfjLGRNDjQ2wfBPrTce9v4Y5ovLDKc2Td8U4k4EEWXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sHpaqgkpaP54Siurk4UI0Qr+zOKMeBAJyZQOSG5g0/bC/sMMqK8p7uUjzplFp8AVF
	 LQZxg8SJhhh8nJp2tRP+WIGyphQtpubxRJU9eVBqfao+nC2lHpernYv9A2eKAF3hAc
	 oEhLYUDrbstezKYBk5QD1nfUBS6Ag8bX7DQOMvlLIwO0z2l6V28t9ulOeeLlBc7/08
	 1RBk5gyv+ZHCZsq+hkPi/L1Xv6y4GUcVq+8fyVV+p5YhuXJDMcZDmFbJqcp4Af6ssj
	 2sc3nmRSolh+F85iyN+ao8hgewfoy0NJ4ZM5MMlY4b5uIB3l/uQu7Sii398N/V9g/1
	 wFQkLbj0vNEmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RPYfR2WVPz4wb8;
	Mon, 14 Aug 2023 22:31:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Justin Stitt <justinstitt@google.com>, Geoff Levand
 <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RFC 0/3] powerpc/ps3: refactor strncpy usage
In-Reply-To: <CAFhGd8oZLTaFNg3pQSi=zX121HPfY9_v-H5e3_+27W3=1fXxmw@mail.gmail.com>
References: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
 <CAFhGd8oZLTaFNg3pQSi=zX121HPfY9_v-H5e3_+27W3=1fXxmw@mail.gmail.com>
Date: Mon, 14 Aug 2023 22:31:10 +1000
Message-ID: <87cyzperg1.fsf@mail.lhotse>
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
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Justin Stitt <justinstitt@google.com> writes:
> On Fri, Aug 11, 2023 at 2:19=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
>>
>> Within this RFC-series I want to get some comments on two ideas that I
>> have for refactoring the current `strncpy` usage in repository.c.
>>
>> When looking at `make_first_field` we see a u64 is being used to store
>> up to 8 bytes from a literal string. This is slightly suspect to me but
>> it works? In regards to `strncpy` here, it makes the code needlessly
>> complex imo.
>>
>> Please see my two ideas to change this and let me know if any other
>> approaches are more reasonable.
>>
>> Link: https://github.com/KSPP/linux/issues/90
>> Signed-off-by: Justin Stitt <justinstitt@google.com>
>> ---
>> Justin Stitt (3):
>>       [RFC] powerpc/ps3: refactor strncpy usage attempt 1
>>       [RFC] powerpc/ps3: refactor strncpy usage attempt 2
>>       [RFC] powerpc/ps3: refactor strncpy usage attempt 2.5
> Errhm, It looks like the diffs after attempt 1 came out poorly and
> probably won't apply cleanly because they were inter-diffed with the
> first patch. Is there a way to let b4 know I wanted each patch diff'd
> against the same SHA and not each other sequentially?

I don't think there is. It always assumes they're a series.

cheers
