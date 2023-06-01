Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27E719459
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 09:31:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWyWH1MCwz3f1Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 17:31:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SA/OoBhn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWyV72JWmz3dw5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 17:30:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SA/OoBhn;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWyV354nPz4x3s;
	Thu,  1 Jun 2023 17:30:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685604651;
	bh=3pSew9k6P5Gtc4GC6KdLUot/OsZwv+jd76EFbmDpIk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SA/OoBhnuuIWzUOhL08upnPl4ERBqykcIUj24b33w/hUV01t300CfacaI6RCoVSmo
	 uwxDVxHrlaHoAng4/N7sDzVzEGuBTBA5LLG8DjaGI4aKfs/5mAUg8gRnDFm1tVHZ42
	 m6pZ6MX2KJCFZ5cXVSOEoUdB6Dx/pFUr+ps2zsnj2/zAGIbV+0MSyvPWvFwJ3UH+dS
	 mOJKGTu7vXhI5SUhr7SUro6ttrH0KoBJHGbu6VvcmdTTjNcc9/acF6lzBPFliQCJQA
	 l5IJW3rk0lnG2+nZQA8f4iJBfbcwQSstaJRoloINI4Vw8LBN7EQyFokEX8YVr/5pkf
	 tpVh92mCDDCLQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
In-Reply-To: <f020b46c-f291-ad2f-6c4c-6bc79955e6f2@linux-m68k.org>
References: <20230531125023.1121060-1-mpe@ellerman.id.au>
 <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
 <f020b46c-f291-ad2f-6c4c-6bc79955e6f2@linux-m68k.org>
Date: Thu, 01 Jun 2023 17:30:51 +1000
Message-ID: <87mt1jhc5w.fsf@mail.lhotse>
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
Cc: linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Finn Thain <fthain@linux-m68k.org> writes:
> On Wed, 31 May 2023, Geert Uytterhoeven wrote:
>> On Wed, May 31, 2023 at 2:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
>> > The powerpc section has a "F:" entry for drivers/macintosh, matching=20
>> > all files in or below drivers/macintosh. That is correct for the most=
=20
>> > part, but there are a couple of m68k-only drivers in the directory, so=
=20
>> > exclude those.
>> >
>> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>=20
>> Thanks for your patch!
>>=20
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -11916,6 +11916,8 @@ L:      linuxppc-dev@lists.ozlabs.org
>> >  S:     Odd Fixes
>> >  F:     arch/powerpc/platforms/powermac/
>> >  F:     drivers/macintosh/
>> > +X:     drivers/macintosh/adb-iop.c
>> > +X:     drivers/macintosh/via-macii.c
>> >
>> >  LINUX FOR POWERPC (32-BIT AND 64-BIT)
>> >  M:     Michael Ellerman <mpe@ellerman.id.au>
>>=20
>> LGTM, as there are already entries for these two files under
>> "M68K ON APPLE MACINTOSH".
>
> Right. I should have addded those "X files" in commit 2ae92e8b9b7.

Or I should have suggested it when I acked that commit :}

cheers
