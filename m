Return-Path: <linuxppc-dev+bounces-5220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B50A10440
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 11:34:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXQTs2wfMz304f;
	Tue, 14 Jan 2025 21:34:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736850849;
	cv=none; b=WKyZWN8Vd9w8K1D2bPaboKp/R3F6DSdE6U0DOpRDukIhpJOHUfJ57rxyK0lmvPYJMLZKkDeSUoPOhcZcMDt4tdWLP3H8kfRZ8gS6NaLZCF+e6Uo7vxLKCPtjSjHCMBtShDCWM7/LzRH0sBKDUknwy/wk6fqJc9X434KRUJo5AWRhglEHsWFAJ8iw8JB+ibZxpZ1BBemd08HzOGopFUnk/3BOdhqnKfoRmzzXs19+9meAVUtjWxgXbEN+gHRa75VZnr/MQJVXabHNxYaIkGJRWCqoEevohEc5plS7dJxhMUsK1B+vM1ewm8JIz2PHQDI7nP1wmG1THakpnz52JDle4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736850849; c=relaxed/relaxed;
	bh=ZvAUIm9DRjIEkTFmQhH7cHAGvYQ3AX9FmJcB/mgkw5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNRfpW0ODokOyOqQlfPTfwqB4y0rFsr8tgL0SwjlAXR0AUG+ilVJCFzc8y7lWYSPjDGZJYYghvYNZuvgfsLrvlFIiof1QFv3bQ0LXveZVlbY7pHCTAUfeU4JoK0wGUDH1EPzSKf8MjPqMQgRahnSsVfLSzckf5eYQS09bBZFMyxjhlvZbx5NDTKaar6O1uTDzWuS06jw/8K/aS29FlzKyy9GPH522rI86lKXnOHLTfDZ2hV6fWePv4VKUHjhP2mmYc0+8gwPhMyY9RFOkQCdQwe8GrktgOr3rOwzBiwWl3vzxBaKizlVBsk8CKlHUXRqslXjZal5nhDuPjaMBlEcxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AxTH1TVO; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AxTH1TVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXQTr1Tqsz3045
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:34:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EE47A40C72;
	Tue, 14 Jan 2025 10:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310DFC4CEE0;
	Tue, 14 Jan 2025 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736850844;
	bh=PPBTXcmZ9FTKLOavDTSaaCxS+I83L8XKDLxpo1k4qF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxTH1TVOByRyemy5vzP15NHxHuJlYlyl1hQLGDalk4R7LH2WyA/2gx/XtNbKHP6IE
	 BdijOVzI31N04UC33BwkWxuWMPpjOqJk4YPBcZWpHmsEzVSlAn6n8H3SvPSKjRt4Km
	 MmpAYcYGmR2n+9td9dyxGX+GBgzUR73o9ZemtBsDbfqnix+wupk/YAt26zv5Z/Nt2Q
	 YW8X2WGphjiIh5L1lDgafPSMz5AIFm6Q1aPh8ln+BKEZNUtlb11WMWugcnXi6M0GO3
	 AVtW7Uph3adO04TefpnPeJyGrUuc2ovvVgVBTVrDhbVONzJzNVIc1qvOPiQR3KVK67
	 Hr4Mh5R5VIq3w==
Date: Tue, 14 Jan 2025 10:33:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Guo Ren <guoren@kernel.org>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>, linux-csky@vger.kernel.org
Subject: Re: [PATCH v2 09/18] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20250114-lustily-nuttiness-3bb7646515d5@spud>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
 <20250110-vdso-store-rng-v2-9-350c9179bbf1@linutronix.de>
 <20250113-kissable-monstrous-aace0cf7182e@spud>
 <20250114093609-6cb25835-f912-4f64-9ba7-54c67d4e2904@linutronix.de>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jwGvJ1ZaVXfjr5LT"
Content-Disposition: inline
In-Reply-To: <20250114093609-6cb25835-f912-4f64-9ba7-54c67d4e2904@linutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--jwGvJ1ZaVXfjr5LT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 09:40:11AM +0100, Thomas Wei=DFschuh wrote:
> On Mon, Jan 13, 2025 at 07:48:15PM +0000, Conor Dooley wrote:
> > On Fri, Jan 10, 2025 at 04:23:48PM +0100, Thomas Wei=DFschuh wrote:
> > > The generic storage implementation provides the same features as the
> > > custom one. However it can be shared between architectures, making
> > > maintenance easier.
> > >=20
> > > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> >=20
> > For rv64, nommu:
> >   LD      vmlinux
> > ld.lld: error: undefined symbol: vmf_insert_pfn
> > >>> referenced by datastore.c
> > >>>               lib/vdso/datastore.o:(vvar_fault) in archive vmlinux.a
> >=20
> > ld.lld: error: undefined symbol: _install_special_mapping
> > >>> referenced by datastore.c
> > >>>               lib/vdso/datastore.o:(vdso_install_vvar_mapping) in a=
rchive vmlinux.a
> >=20
> > Later patches in the series don't make it build again.
> > rv32 builds now though, so thanks for fixing that.
>=20
> Thanks for the report.
> Can you try to diff below?

Ye, that resolved it. Thanks!

--jwGvJ1ZaVXfjr5LT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Y9kQAKCRB4tDGHoIJi
0oHDAP9Da+NrCNJE56DtkPFciL+LH3SKSSwOWQ6oFB2bu8GWRQEA9RJt/Is3QV+w
+n+t05VKvIADKDk9hc4FHnNawF8GUgg=
=tDst
-----END PGP SIGNATURE-----

--jwGvJ1ZaVXfjr5LT--

