Return-Path: <linuxppc-dev+bounces-12556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4B7B9893F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 09:41:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWpgW2f1wz304f;
	Wed, 24 Sep 2025 17:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758699671;
	cv=none; b=WhbF/7vZ0Ncxi7Jn8fx/RrULSlcd1TqbrQ+SrL4z+8edZBhVTxxe9LZ71CamFpAihvV/nJ5xyIq4+/r70VZBjvVXtc0dtvoNm+1fY0Rwvn2SQZvKFZ/WmBT2NUt3VMEVUHjLYTYYUTG/MUixV/ugjTjHxXsG9RkepphAB/QlhESqSa2kSNOPA8LxrHp6do2uKKGiTaCbjy3RFzsLJONtI3HafiyBT/56rabnJy0Ymq6KsC9zopb1i+JlVpihrsDgsZ0iR+BvOLwhz8J7nXK7ZkXqLS+RNyN6g6TW5GlS/478TnKUyl30yXU4OJ5n4MCN12WWG0nMiRiQkuC9+joIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758699671; c=relaxed/relaxed;
	bh=oxAx55vS2rggMZF7eTbs+MZ7ZqRsew9htCf8ptQSB2w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TfvJbRkhXJkECAFPgT/AVDid4Hj+0riyp4cpDlbYqPoLl0E9xKREt0aLY5HK3HHshiwEXS9Rtqr1J9i6Lz8rHqkp/CK2USF+CvuS1hig17lp9hVVoYy6TmNwwQ4yrsrpEOWr+Vvp3c1oiSWxDLvgh0C+t6NuuQUmJQUsS6UdMWxVva17EF6oYjyB2PijweLWR5Y9zhgqUV9vdApwZZEVfMVblGpUF75H5sfxYYM0/1Szwt3xfspJeErI2KNVp4p9x1in1WAR77GCVFn7guz3H6WAFvMOBGmcmTeFUbtZeFAepqlkhdkYNdGg1R3cwiXmw4iuu76/umGFYlOTHPry6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=nwGsCxNN; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=nwGsCxNN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWpgQ1GJLz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 17:41:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=oxAx55vS2rggMZF7eTbs+MZ7ZqRsew9htCf8ptQSB2w=; t=1758699666;
	x=1759304466; b=nwGsCxNNidm5qcj/kuw93rpHJwQWt/5B22Xtlo2imHBPf6XsRgxbX1Kfa3pJ/
	EHDDUnjLatrjRJTyILNxaLwR/Iqld4h6/yAbtGaapWpvFxyEnMfqYbX/gUFk56ub6yBGjFGzjkPQ9
	q/1HnKutbiihOiACXlhhHVIyYtk9hl8nFAZs2dKWT7bVo1K/fmtuferB9WP79s2mTtlVa3Pr+Gb/+
	ang2KHYce23fbL0cOvb2eIYE3qyEAzrImbfpyeNI4Qgs380Fmte/ZBUyiRzy3QmmzxBqcZeEw7brk
	Mnq/3ZwigL+cglfZmpnXS7jr6hwx7r9Q4RX6sBfOyKx41twU4g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1v1K71-00000003rTv-3nNq; Wed, 24 Sep 2025 09:40:27 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1v1K71-00000003D15-2K09; Wed, 24 Sep 2025 09:40:27 +0200
Message-ID: <60a0af09cc1a5de3b33b9606ed07ae91b42c5432.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
  Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,  Andreas Larsson
 <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, John Stultz
 <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>,  Russell King <linux@armlinux.org.uk>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman	 <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy	
 <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui	 <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev	 <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>, Nagarathnam Muthusamy
 <nagarathnam.muthusamy@oracle.com>, Shannon Nelson	 <sln@onemain.com>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann	
 <arnd@kernel.org>
Date: Wed, 24 Sep 2025 09:40:25 +0200
In-Reply-To: <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
References: 
	<20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
	 <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
	 <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
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
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Thomas,

On Sat, 2025-09-20 at 16:37 +0200, Thomas Wei=C3=9Fschuh wrote:
> > Could you share a version of the series based on top of 6.17.0-rcN for
> > testing purposes? I would like to test the series on a Sun Netra 240
> > which is based on the UltraSPARC IIIi.
>=20
> Here is the git branch based on rc4:
> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.g=
it/log/?h=3Db4/vdso-sparc64-generic-2
>=20
> Does that work for you?

I'm getting merge conflicts with "vdso/datastore: Allocate data pages dynam=
ically" and
"vdso/datapage: Remove inclusion of gettimeofday.h".

Can these be skipped?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

