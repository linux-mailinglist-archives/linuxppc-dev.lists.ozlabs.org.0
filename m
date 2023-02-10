Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CD96915E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCZvd5Cwkz3f50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 11:52:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b2vsgArQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCZtj36DKz3bf7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 11:51:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b2vsgArQ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PCZtf6W29z4xGR;
	Fri, 10 Feb 2023 11:51:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675990299;
	bh=bxaKBZbrFfMrLlOdVf9BUL58Bx3fYDA/Ln/YbtJoXSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b2vsgArQJ22smRJK4jdEjgy0MX7ZItXizmMvAthQgangHzd9mgSv7rrF8wEON13eI
	 5P02CIFHHo74wjKGNwYLof4/MY5NNmej9kawcJJ6GUhzknB/ffdH1Xe0H3gTXq6WyR
	 mqfIlfDsjhr8qZKx11DroZ8qEaAq8AUUMderrKrhsSzT1G+1Dd80oviEfPDPhRt4qs
	 eY/QyWclMnsrL+7PegvqHxJEoYBligkuboPVNeFf8v3g6tCySxOBvApsL9vWW8qYTh
	 L20XnnPgnC4g2ctvoXqJlLdVRMFOcLtHcqD7jmuCNfNplfioYgx2FWDzlLqZ6YBB9h
	 XpcLYFqbD/o1Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
In-Reply-To: <38e58d03-3142-72ae-7424-696499a99bb2@infradead.org>
References: <cover.1672767868.git.geoff@infradead.org>
 <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
 <25cc9a51-2311-d7d3-3451-08725e6384cd@csgroup.eu>
 <284aed88-dc26-d74a-cf7a-f5875ba058eb@infradead.org>
 <87mt6j9wcf.fsf@mpe.ellerman.id.au>
 <a449698b-93f5-0742-77fe-5699544eab5c@infradead.org>
 <75194fe4-8276-4749-ab41-f8ddf02a0200@csgroup.eu>
 <38e58d03-3142-72ae-7424-696499a99bb2@infradead.org>
Date: Fri, 10 Feb 2023 11:51:38 +1100
Message-ID: <87fsbewdet.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> writes:
> On 1/16/23 23:26, Christophe Leroy wrote:
>> Le 16/01/2023 =C3=A0 21:08, Geoff Levand a =C3=A9crit=C2=A0:
>>>
>>> As mentioned, I'd really like to keep PS3 included in ppc64_defconfig. =
 My
>>> original patch that basically just ignores the call to
>>> mmu_hash_ops.updateboltedpp allows that, and I haven't experienced any =
problems
>>> with it yet.
>>=20
>> When you say you have not experienced any problems with it, do you mean=
=20
>> that STRICT_RWX works for you ? When you select CONFIG_DEBUG_RODATA_TEST=
=20
>> it tells you that it works ? Otherwise it looks incorrect to enable=20
>> something that doesn't work.
>
> What I mean is that the system boots up, and works as expected.
> I have not tried with CONFIG_DEBUG_RODATA_TEST set.
>
>>> My preference would be to keep PS3 in ppc64_defconfig, and either apply=
 my
>>> original patch, or I keep that patch in my ps3-linux repo on kernel.org=
. Then,
>>> if we end up adding runtime support for RWX I then fixup PS3 to use tha=
t.
>>>
>>=20
>> In that case I see two solutions:
>> 1/ Implement updateboltedpp for PS3.
>
> I'm now looking into if this is possible.
>
>> 2/ Implement arch_parse_debug_rodata() to always set rodata_enabled =3D=
=20
>> false on PS3, and update free_initmem() to only call mark_initmem_nx()=20
>> when strict_kernel_rwx_enabled() returns true.
>
> OK, I'll consider this if I cannot get updateboltedp working.

I'll take this series as-is for 6.3, there's no point panicking.

Hopefully one of the above options can be implemented in future.

cheers
