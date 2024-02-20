Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA085BB8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 13:12:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X3qkbB/3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfJFD5Vfmz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:12:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X3qkbB/3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfJDS1n3Xz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 23:11:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708431109;
	bh=iQEhHxxe6sRF3S1uC1YB4O5oRirlQE0Y7/z/mZ2MGuY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=X3qkbB/3IjXhiDLdw2U9fuWlaBHE8OZ1iIQTgKBJ8c/Cc2+jIQLMrhE5FDeOyK5WF
	 xiVHHvD56bYYk/rHpuq8isZF3SPIo+fHTtyd59w03UtcCcoCfHIbqrZyW4sZReSol9
	 TfPTVD5qbgH9DnBHGZIVYBGSPBksN8TW3SESbGDoESHzIjqY35oY2nhqdzzp8B513g
	 macafAb+BFIx9AsbA0o0+EX5vsjyy+uIG8jUjtP6xLbBEd8CdDS+iH9Hpnc6JvC5wn
	 fMRK5UxuvjA+RyWmp9NZi8RMxJARc0g1GL7yUDSVf+LgRe9grCP5fScJoqJCTbf8O4
	 novoKF14gHQ6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfJDK2hRtz4wcC;
	Tue, 20 Feb 2024 23:11:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Geoff Levand
 <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/4] powerpc/ps3 Add ELFv2 support
In-Reply-To: <0ec4e2dc-38b5-4aca-9e58-2072d2ac6f0f@csgroup.eu>
References: <cover.1705654669.git.geoff@infradead.org>
 <0ec4e2dc-38b5-4aca-9e58-2072d2ac6f0f@csgroup.eu>
Date: Tue, 20 Feb 2024 23:11:43 +1100
Message-ID: <87h6i3baio.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi,
>
> Le 19/01/2024 =C3=A0 11:27, Geoff Levand a =C3=A9crit=C2=A0:
>> The following changes since commit 44a1aad2fe6c10bfe0589d8047057b10a4c18=
a19:
>>=20
>>    Merge branch 'topic/ppc-kvm' into next (2023-12-29 15:30:45 +1100)
>>=20
>> are available in the Git repository at:
>>=20
>>    git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for=
-merge-elfv2
>>=20
>> for you to fetch changes up to 983836405df1b6001a2262972fb32d1aee97d6f5:
>>=20
>>    Revert "powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2" (=
2024-01-19 17:53:48 +0900)
>>=20
>> ----------------------------------------------------------------
>> Geoff Levand (1):
>>        Revert "powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V=
2"
>>=20
>> Nicholas Piggin (3):
>>        powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling convention
>>        powerpc/ps3: lv1 hcall code use symbolic constant for LR save off=
set
>>        powerpc/ps3: Make real stack frames for LV1 hcalls
>
> Must be something wrong it the way you sent this series.
>
> First, the three patches from Nic don't appear as being from him,=20
> missing the From: at the top.
>
> Second, this introductory letter appears as a standalone patch in patchwo=
rk.
>
> The three patches from Nic are awaiting in patchwork, all we need it=20
> your 4th patch when times come.

I'll sort it out.

cheers
