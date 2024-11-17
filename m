Return-Path: <linuxppc-dev+bounces-3354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712799D0345
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 12:29:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrpSD5PXJz2xqc;
	Sun, 17 Nov 2024 22:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731842956;
	cv=none; b=o0yen7T4zZmbixik9htpkV9ZZcd4CGqHzkQdBIi7dcytMfRslTx74Wh2Zg2IKKoKa1DiBP5vkO2zRNaNLNR3m0NH7/xL1CgFJa1RBliRW54goYc0GWg1LzAiM5wXoiYqyi4Q0RqxcQEt0vAyeiIv3jExq/WDm/YJo9uzTpyfJpxV/b41sAl8mDMEtYxdHcXYQLXtzd1Usi5Yr8QfR1SZQIsKsdmSUQCzOlqhYmkQuTOWtDAwVjbuHvkpcjzZ+HdlmUgyBq16oKEY6sa7qBWXl6NNKm6ssS6B66wH/2WTc0XYnNDh4SG86Xw0BOWzxnJ8isHV8mpPazoBCmmSJXAc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731842956; c=relaxed/relaxed;
	bh=LwloFIxi3u3sTNfvSTU4Cv52KouL8YzkskRDutCjz4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bMOMwMTKxAFjnKjawhPLxCn9RL+n8GbesTeP6+jYzs3Jbuki4Mc/evJt2Wcc4GFzPU2ENI7XwjT76+e/bW9GSRgERzSP/4n9N++OeBxXVp4jEqd+OJUzx7HUn2TEOe2ijLb4vS6bHHC7O9KRjKAwXvpXClodLA3ZpCgcGe/Y51F6r0BPE5i8TIFvRlKjuDthExIrG6jxwVwQciZqis288XBtjfu5ANqplemI1RRC0wAa1pEe2nluN0hhFq+z7DZ3Fmt3i/+WQxiJ0xsOWgK12Ubo6hAWS1IcdCej8NQTtTdTTfaSszQtxtJBtBuhaQI3bZZZMIHZbKkmpJi1T/2tyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Bvpzp0A2; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Bvpzp0A2;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrpSB62dCz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 22:29:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731842947;
	bh=LwloFIxi3u3sTNfvSTU4Cv52KouL8YzkskRDutCjz4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bvpzp0A2UCD6/jvuPEqth7dkLgcz6V6FTxMxZTXN1UcyMzVaOauCZOWsW2IyA7003
	 zsgjxBTRvpo3h9YkvL6h8bViy/NV3Rh++1+pJrIwhvo8He73EveEH09POo5/oX/So3
	 7zEvQT/AkvqNGb0kJG9kLMea1MoctyHLKyj7gkLCW9p+Uoh8O+AeejGXlZJaMtGBaa
	 BDosg9uVw/ckhbw1bRzE1auLJtwYMhbcrhTFR2ve6T7oadvH031DYYfe3hJiVPvsuR
	 q07q0Le0/gUWjBKNzDPDAOALCp6ZNrwYXNu9FdpxvByKy+73LaNGdwR5JPoTVZELuT
	 59ZSFTlPehK5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrpS23y4fz4xD9;
	Sun, 17 Nov 2024 22:29:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org, arnd@arndb.de
Subject: Re: [RFC PATCH 08/10] macintosh: Remove ADB_MACIO
In-Reply-To: <c1c01965-ac44-4d8e-aff1-3f6169bdd3cf@csgroup.eu>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114131114.602234-8-mpe@ellerman.id.au>
 <c1c01965-ac44-4d8e-aff1-3f6169bdd3cf@csgroup.eu>
Date: Sun, 17 Nov 2024 22:29:08 +1100
Message-ID: <87mshyxfnf.fsf@mpe.ellerman.id.au>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 14/11/2024 =C3=A0 14:11, Michael Ellerman a =C3=A9crit=C2=A0:
>> The macio-adb driver depends on PPC_CHRP, which has been removed, remove
>> the driver also.
>>=20
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   drivers/macintosh/Kconfig     |   9 --
>>   drivers/macintosh/Makefile    |   1 -
>>   drivers/macintosh/adb.c       |   4 -
>>   drivers/macintosh/macio-adb.c | 288 ----------------------------------
>>   4 files changed, 302 deletions(-)
>>   delete mode 100644 drivers/macintosh/macio-adb.c
>
> What about:
>
> drivers/macintosh/adb.c:        if (!machine_is(chrp) &&=20
> !machine_is(powermac))
> drivers/macintosh/adbhid.c:     if (!machine_is(chrp) &&=20
> !machine_is(powermac))

Oops, missed them, thanks.

cheers

