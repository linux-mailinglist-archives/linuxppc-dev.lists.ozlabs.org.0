Return-Path: <linuxppc-dev+bounces-13290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43CFC07161
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 17:52:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctS8G1XRGz3bs7;
	Sat, 25 Oct 2025 02:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761321134;
	cv=none; b=WqVEl/n3LhFh+IuYDpdYDJFB1ARwLoCfoBgC63f7J3aYI2sP6Ver9TiztsDBhs1L6QqGZe7elbWSDYbU5i5YphQqEy2aGQJRzgPy7BBqBcyLA1XREu79QGbszyisKZSkdgyqKHUDLptSjT7RUWQ4HKMv376sZT+WSR/zeCo8BckbwAsIn3GsZh9sidH+bv76W6rzyaW1yIZ1ytZPDerwX2Q8C9G3Z7L74u2MevrVa75Kvw6/OgfJ9HQGQXfKjLXX52hd1eKbiJLMYOBcpVX0u4K9d1+xwH1Z/a6RDOjzRB+nvYLu/88ZcHRKvpFTW8kGRZvv/ulB6WzQdHJt5+oscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761321134; c=relaxed/relaxed;
	bh=+WGt0cv6lLjP7TTTzKdDcUwT/Nmru/ATJlKONEKntac=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oOJ2ZT/fzCRDxLxDfp0TeE/VCGxIO0MVVl/gMepWxm1A3bYIUJM85w+/w/2p2eDigD2gY9yKr36mjKJNg68mYWtWK8NKLWKVP4exUszETC94MuZDjsaXVIog2GFCTq9ltQhVxomQ+7PscAizkDRnVYrQ6seI8iNyT4ZFuF0FJ1a6HWsNtyKWNpwcT8D93JGY9IdBUmdDqbN6ia0U8c5KT+qBduoTUH7EiYo/wSlO6Tg7+DFXpoT9RjFfQ/p7zF7LK3GS9sa6oe8krVePdiQSyDVaqgS4UWyRCJRv9c8vPG5Aa4x7x+tvvwz8MBoXSxaooakbo6SaXqqGlkjyNspcLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=FGPW18NE; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=FGPW18NE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctS8F2WfLz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 02:52:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+WGt0cv6lLjP7TTTzKdDcUwT/Nmru/ATJlKONEKntac=; t=1761321133;
	x=1761925933; b=FGPW18NELh+wOxzZ+/+c5YDvfa45UNRBnUx5DrLMAaEpynz92BbBvftpOBlXf
	9ufYax+P15bW7G8ThIthYf2hr4ZWJpvGS4eOs0cbrEeTmBxSfWpDYh/hsHEBtzCGEyR/+EoTMpeUo
	kx9lCzibvisgV3qavWbparaMfcymfKmwLPky9oinCQnRpuw91w8sZumEE62cdoLK52Uofr8ytF57i
	XbXP6XFcgpZ/eo4iUuoUCY2bC5mV1kmjSwok4MBGd+bJ16MIsuUpuOoEasWewpQjdpHhyyTUpdJ7E
	J84ak8n2kwO16o2KAS4fF8i8GqMT772P0LtgRvg8H5m/VS9tEg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vCK55-00000000R61-3t7w; Fri, 24 Oct 2025 17:51:55 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vCK55-00000000Lvz-2RRr; Fri, 24 Oct 2025 17:51:55 +0200
Message-ID: <1d9f416fd3665faf27841b6305b1e8d661427125.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David Hildenbrand <david@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>,  Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>,  Andreas Larsson <andreas@gaisler.com>, Andrew
 Morton <akpm@linux-foundation.org>, Boris Ostrovsky	
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin"	 <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,  Juergen
 Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes	 <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ryan Roberts	
 <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Gleixner	 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon	 <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Date: Fri, 24 Oct 2025 17:51:54 +0200
In-Reply-To: <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
	 <20251015082727.2395128-12-kevin.brodsky@arm.com>
	 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
	 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
	 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
	 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
	 <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
	 <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
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

Hi David,

On Fri, 2025-10-24 at 17:47 +0200, David Hildenbrand wrote:
> > Please have people test kernel changes on SPARC on real hardware. QEMU =
does not
> > emulate sun4v, for example, and therefore testing in QEMU does not cove=
r all
> > of SPARC hardware.
> >=20
> > There are plenty of people on the debian-sparc, gentoo-sparc and sparcl=
inux
> > LKML mailing lists that can test kernel patches for SPARC. If SPARC-rel=
evant
> > changes need to be tested, please ask there and don't bury such things =
in a
> > deeply nested thread in a discussion which doesn't even have SPARC in t=
he
> > mail subject.
>=20
> out of curiosity, do people monitor sparclinux@ for changes to actively=
=20
> offer testing when required -- like would it be sufficient to CC=20
> relevant maintainers+list (like done here) and raise in the cover letter=
=20
> that some testing help would be appreciated?

Yes, that's definitely the case. But it should be obvious that from the sub=
ject
of the mail that the change affects SPARC as not everyone can read every ma=
il
they're receiving through mailing lists.

I'm trying to keep up, but since I'm on mailing lists for many different ar=
chitectures,
mails can slip through the cracks.

For people that want to test changes on SPARC regularly, I can also offer a=
ccounts
on SPARC test machines running on a Solaris LDOM (logical domain) on a SPAR=
C T4.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

