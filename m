Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF685B263
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 06:44:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UIdQfx83;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tf7dp2zkDz3cnv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 16:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UIdQfx83;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tf7d21N3Yz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 16:44:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708407839;
	bh=rfmp0MQ0Ux6RuAaBFyTJq/JUhVdDupJU+ukLbInK8Cg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UIdQfx83ta4KwNnjdsUHHnolD9mS7hxnJ3jK8vioxN7IGtMKNm4GQ0CBzFmg54fm9
	 aoAfzUvq+Kyj9hkDAnzsZoXAlXy+5uL163T6JOBMh5tt92286PRVgKG20wVnxjpr0J
	 8TCUqpissJgjktgxVkwGnPGuCfH7FebtRelbqb4V5IrWXjZYv9my2piVMXn3+72O87
	 cVmzpx87TjuwAyorVlZB6q9XpiU/GQQVxmMj38n313L00uL8i32i9x0RO00rK9ezNQ
	 fZ30//lAYPYdfvdD3tMDvYgfPGZlIXAMB95Hrww5mkLaVQ1O6YRDPmMRQf64AWXjoK
	 rb5tPARdVQzFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tf7cv0lWkz4wby;
	Tue, 20 Feb 2024 16:43:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Axtens
 <dja@axtens.net>
Subject: Re: [PATCH] powerpc: remove unused *_syscall_64.o variables in
 Makefile
In-Reply-To: <CAK7LNARFNoAUUiGMP95pTi_rSxSi5Z0HJo2kBC472f0koMr2mA@mail.gmail.com>
References: <20240216135517.2002749-1-masahiroy@kernel.org>
 <CAK7LNARFNoAUUiGMP95pTi_rSxSi5Z0HJo2kBC472f0koMr2mA@mail.gmail.com>
Date: Tue, 20 Feb 2024 16:43:56 +1100
Message-ID: <874je31yhv.fsf@mail.lhotse>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> +To: Daniel Axtens

Unfortunately dja doesn't work on the kernel anymore.

> Maybe, we should check if the issue fixed by
> 2f26ed1764b42a8c40d9c48441c73a70d805decf
> came back.

That crash is specific to Power8, which probably no one is running
syzkaller on anymore.

If I enable KCOV and boot with 1T segments disabled (to make it easier
to trigger the bug) it crashes similarly to the report in that commit.

> On Fri, Feb 16, 2024 at 10:55=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
...
>> To restore the original behavior, we could replace them with:
>>
>>   GCOV_PROFILE_interrupt.o :=3D n
>>   KCOV_INSTRUMENT_interrupt.o :=3D n
>>   UBSAN_SANITIZE_interrupt.o :=3D n

But just putting those back isn't actually enough to fix it, the code
has changed and there are other places that need KCOV disabled on P8.

So I'm not sure how to handle this one. I guess I might just take it and
then make a todo to fix the KCOV problems later.

cheers
