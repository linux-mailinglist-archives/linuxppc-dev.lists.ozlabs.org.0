Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7973FB8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:59:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZRT/Gwxn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qr3D86Cjlz30XR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 21:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZRT/Gwxn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qr3CB5wcdz2yy1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 21:58:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qr3C80dbtz4w2B;
	Tue, 27 Jun 2023 21:58:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687867125;
	bh=DMI9usNvrSNruiGgU2vzUgMO0263STXJtbXbh2Pjm34=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZRT/Gwxnf/muFUzbV5/CYYrQkOzC8ev8SYk0jjQnrKFoNQvUIPLqlVZszNK6wFfo1
	 aOSj5NXpgg9OX0qwloCURm8hXaV+bvKXM+P0qawrSdIjYxNv2kNkE4wgHN65sXnPZJ
	 dF4nTWdJ22meg+mIX7/z05PKjhqPk5jfhVkoZ5ga283XvhPBB+SMPd83TnBYNczzOh
	 jytqtVXtg6sACDOUbPkxVhvfVJeeTP7IGqjYvGEGAsKMRDu1RNiG59P8UzS3YeKdnx
	 sEvH9GCQTLzuQixXGRjHEpRch8QrT6HiQ7UM44Jr2zMAWNQN9Gnhdh8peSJXfB1DpS
	 I0e+PZzSc8WKQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: remove checks for binutils older than 2.25
In-Reply-To: <CAK7LNAS=UCo_o-B0mgsR+SDb0sYwvQo90uag5sJ1UmB+8NqLjQ@mail.gmail.com>
References: <20230119082250.151485-1-masahiroy@kernel.org>
 <CACPK8XeGsWN+2L57=dfQWOTSo8df7_qrxhwvV4Ho0rkhV=0vSw@mail.gmail.com>
 <CAK7LNAQWtDHOs=K+qznt5U1WiDv86tChkj4zOer4wtVRB974OA@mail.gmail.com>
 <CAK7LNAS=UCo_o-B0mgsR+SDb0sYwvQo90uag5sJ1UmB+8NqLjQ@mail.gmail.com>
Date: Tue, 27 Jun 2023 21:58:39 +1000
Message-ID: <87h6qtglqo.fsf@mail.lhotse>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Thu, Jan 19, 2023 at 9:37=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
>>
>> On Thu, Jan 19, 2023 at 9:12 PM Joel Stanley <joel@jms.id.au> wrote:
>> >
>> > On Thu, 19 Jan 2023 at 08:24, Masahiro Yamada <masahiroy@kernel.org> w=
rote:
>> > >
>> > > Commit e4412739472b ("Documentation: raise minimum supported version=
 of
>> > > binutils to 2.25") allows us to remove the checks for old binutils.
>> > >
>> > > There is no more user for ld-ifversion. Remove it as well.
>> >
>> > ppc kernels fail to link with 2.27 under some configurations:
>> >
>> >  https://github.com/linuxppc/issues/issues/388
>> >
>> > We may want to use ld-ifversion to exclude that version.
>>
>
> Ping?

Sorry. I've now applied the binutils 2.27 patch from Naveen, and this on
top with minor tweaks to make it apply. The result is in my next branch.

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=
=3Dnext

cheers
