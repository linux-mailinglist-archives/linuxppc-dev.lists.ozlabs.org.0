Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B709087E8EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 12:51:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BBhRlJhM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TytVb3W6lz3dH8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 22:51:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BBhRlJhM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TytTs6HNBz3c9N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 22:50:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710762652;
	bh=Iu+6WHoni3dZzZuI+kVQY9A4E2w/WBparVAHCv9ZkRM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BBhRlJhMpEsQqRM73j78u3Juw7S4OXn2Z4iUr/buzSoGd41Bo0Z24s9N76AewzXJs
	 vbR6crRw1mcM9vRdUXm+THHQLVmfH/FTtaeN7YFoEYBi3OETrCnsLC0D7aVen6+BJE
	 cY1ZnIX3r+YqBW+pXeNEaxxqsrMIIpqbZMdZnNrC4nhTBJlV1/ebv/QhIfb1ZKU5CY
	 EZQVP/SWN+gPkTgSXJ1kYfEDpS4b+Aj5SMrnFK4TsD/GX/L1S0xIxL2Fk2P/kbObXg
	 TLCyjFNV0JwxliMhCKUi4Lo3f16xWDx84Bn//bIcFNcotpeOelonHxlAr7v39SB7Ie
	 c+0e6wZPiMhmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TytTl197Pz4wcR;
	Mon, 18 Mar 2024 22:50:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 dtsen@linux.ibm.com
Subject: Re: Cannot load wireguard module
In-Reply-To: <87jzm32h7q.fsf@mail.lhotse>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse>
Date: Mon, 18 Mar 2024 22:50:49 +1100
Message-ID: <87r0g7zrl2.fsf@mail.lhotse>
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
Cc: netdev@vger.kernel.org, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> Hello,
>>
>> I cannot load the wireguard module.
>>
>> Loading the module provides no diagnostic other than 'No such device'.
>>
>> Please provide maningful diagnostics for loading software-only driver,
>> clearly there is no particular device needed.
>
> Presumably it's just bubbling up an -ENODEV from somewhere.
>
> Can you get a trace of it?
>
> Something like:
>
>   # trace-cmd record -p function_graph -F modprobe wireguard
>
> That should probably show where it's bailing out.
>
>> jostaberry-1:~ # uname -a
>> Linux jostaberry-1 6.8.0-lp155.8.g7e0e887-default #1 SMP Wed Mar 13 09:0=
2:21 UTC 2024 (7e0e887) ppc64le ppc64le ppc64le GNU/Linux
>> jostaberry-1:~ # modprobe wireguard
>> modprobe: ERROR: could not insert 'wireguard': No such device
>> jostaberry-1:~ # modprobe -v wireguard
>> insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/c=
rypto/chacha-p10-crypto.ko.zst=20
>> modprobe: ERROR: could not insert 'wireguard': No such device
>=20=20
> What machine is this? A Power10?

I am able to load the module successfully on a P10 running v6.8.0.

I tried running the demo (client-quick.sh) to check it actually works,
but that hangs sending the public key, I suspect because my development
machine is behind multiple firewalls.

cheers
