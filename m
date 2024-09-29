Return-Path: <linuxppc-dev+bounces-1678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC498950E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2024 13:24:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XGhgZ4CqKz2xjQ;
	Sun, 29 Sep 2024 21:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727609080;
	cv=none; b=Jo43liY0rJ6xDGygkq8HwRSXHdR8wYgjN6hUADMwf7jdFwS18mLe4DsrhBX8/7c00szOTlNbMaxJbWnaaoayQUAD7W0S6MehDMWh3FPJ2OaO/eU9Z3ARm0fmC4cvLFG2r6t1Be6ANdWHPIuvB3RC05NP3UJuUXOghLa9bsGl8oQBWNfHDcBByeTX6HRY84blktp/gRxLR/n0hfjXC0d6aC4IxVWw48JWMij6fzEyLbsAzENCfvMn6QmZJS5g49KTYWe4PH+gm8LqZNyYoWd6QD2kYaXm9+sMdfJQ/mzZIxJpyA9OXHL+P23eTRXJco5oT4WM3ZwLs/NK4DmKUceqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727609080; c=relaxed/relaxed;
	bh=HpewcSfBjkx8qDKvBBjBGLAZ6EFUfk6ttuqNXt+K2JI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LEBWKTMlN9WHbEYjMOLBY+3DidNSewaE80cyEfAqK+nLrQYFdRltx/Zh3hsT+8T4NG+2Gy7i/gdbBF4Ev6oyjHgulavQCHcWnrrZpFrb1nlqUaaCh5ikIlHQgGLmyorwVZFwO0tRd4i6JtqZARJWiBiIHl/xEbBJprifuD+C+UlZQf6GnJe7TWzNZnEkV2jWJmaQpdG/aDsEhATUHCkKh/CqjT07phLmC1ixgf2URN2JO46RZnX/UieNVWv0bPW2BLE6P7EIAXwcPNmjjekN+zTbd68GxkD+5cC3wSTMxPxbUABuzqKJztvvUfKL3c7/0obiiJT3cYMthHJie7gtNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MdGo9vPe; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MdGo9vPe;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XGhgW2BV6z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2024 21:24:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1727609077;
	bh=HpewcSfBjkx8qDKvBBjBGLAZ6EFUfk6ttuqNXt+K2JI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MdGo9vPev5gJiAGPsn1T/OQPcsPxLu/CKuLFOOjmnifctk2eEPyaAsx/j8TYIUmje
	 jlUEfzSn6wtcCFWBPXAD5juytHlTi+fAImg0hRmVVooUx9+4UV7rxld8l9l7T84nxI
	 JYp6zfekixO1fcOA8NPpM931gEf22Vy6+tHnPwBmv14TdNnbWVIKY2xOe/hgtmr3Gd
	 8W0AQF5ZN+Wj3fxF/UETcGaE6kWDN4kx9I/UMcqR8cP0DuP0mB1KpV2A67bqZjRsja
	 kCfTj03DEfTlMYoEKF1QeHNp7YquF0JB+RldglvP/AEZzqYfVt06CkqTlGB6Syw4v3
	 z/WjB/dNjttBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XGhgT1NCgz4x11;
	Sun, 29 Sep 2024 21:24:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, Florian Weimer
 <fweimer@redhat.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Cc: Peter Bergner <bergner@linux.ibm.com>
Subject: Re: Are 256K page sizes really a thing (on ppc64le in particular)?
In-Reply-To: <eac7d905-b998-45c0-b3d5-c2f59bc37d69@cs-soprasteria.com>
References: <87cyknzrpk.fsf@oldenburg.str.redhat.com>
 <eac7d905-b998-45c0-b3d5-c2f59bc37d69@cs-soprasteria.com>
Date: Sun, 29 Sep 2024 21:24:36 +1000
Message-ID: <874j5yhfd7.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

LEROY Christophe <christophe.leroy2@cs-soprasteria.com> writes:

> Le 28/09/2024 =C3=A0 18:08, Florian Weimer a =C3=A9crit=C2=A0:
>> I'm working on adding a <sys/pagesize.h> header to glibc, so that
>> programmers can easily determine the range of possible page sizes for a
>> particular target, for things like pointer tagging and mapped file
>> alignment requirements.
>>=20
>> I'm not familiar from the Kconfig system, but as far as I can tell, this
>> ensures that 256 KiB pages are only available on 44x machines:
>>=20
>> arch/powerpc/Kconfig-config PPC_256K_PAGES
>> arch/powerpc/Kconfig-   bool "256k page size (Requires non-standard binu=
tils settings)"
>> arch/powerpc/Kconfig-   depends on 44x && !PPC_47x
>> arch/powerpc/Kconfig:   select HAVE_PAGE_SIZE_256KB
>>=20
>> And none of the 44x configurations set 64BIT, so it's all 32-bit.
>>=20
>> Would it still make sense to recommend 256 KiB file alignment to
>> programmers on 32-bit PowerPC, or should <sys/pagesize.h> pretend
>> that the maximum page size is 64 KiB?
>>=20
>
> For ppc64le it is definitely not a thing.
>
> As you noticed, 256K pages are only for 44x which is a 32 bits=20
> processor, and as mentioned in the CONFIG_PPC_256K_PAGES help:
>
> 	  The kernel will only be able to run applications that have been
> 	  compiled with '-zmax-page-size' set to 256K (the default is 64K) using
> 	  binutils later than 2.17.50.0.3, or by patching the ELF_MAXPAGESIZE
> 	  definition from 0x10000 to 0x40000 in older versions.
>
>
> So 256 Kbytes pages is a corner case and I think the default max=20
> alignment should remain 64 Kbytes.

I agree.

cheers

