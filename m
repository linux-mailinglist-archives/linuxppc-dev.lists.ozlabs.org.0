Return-Path: <linuxppc-dev+bounces-13288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D10C0701D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 17:39:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctRs04hNDz3btd;
	Sat, 25 Oct 2025 02:39:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761320340;
	cv=none; b=dSz7akC5wnYqVQW+WESBpEM3JM4YtKoHDCcyU80bM78cG5MmrZHQ6ajwGXdi4niLgktB4TI5B8Mh7nzV6Hx/kmoJwM356T4umM7MuUAZaK3VvAvzw1WArVmxwrZcGHlgcJ/FXWM0cLxK7vermBpVx++bHTOwKbr5sEgAZMa+AgxukuIg1ODdtYrXqh4oBl5itD8vdUFzrH9AhM+fnRwqbEq8tfT80FVWSH6rwUiPiGbtTlgVYYZ711dhJFNtbYLcZuieT8tgtnj/+Zd7NwrnY4DnBkCX1Q1OjU8D4diV9lJQYdvsZlhxz4pIWGQFjyzGG1IZzBjKUvABpDidWuD0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761320340; c=relaxed/relaxed;
	bh=73Zwdq32M3wvIOvcsImSKjLgygutGdvwi4JFjWo6zTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gMw9Bw59lQyWZhWym+twyVSiMWOM3VpDJ4wNbBZXqmWAL4PrdnPDGokXem/pezXNhCM1ZDYaama6A4sjWKZdmT/VX2K1S01zXYiAg1XO123zuyhn0foNoramrAeTdWeM6GcGhaIpY5khEw8VKNwqy+5e2nsQyHAt2rMAPn7YJhnMB0Ju0GE7XnKFJTxx/d5zLu+gKsCse+LYl1Tc8Iq9fKUgfIukw4IB4wkJGbQ6FnxACDhiut9peez6zmfIwQu/ssqOlU65JBRLYyDE4v3F+iN2DPuOr1unW2HID+Qv6wUjX+wtsVNazwo8tEWgr6KreMPVEV9jDeLqPybSQo5SUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=lwp5Vy7C; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=lwp5Vy7C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctRrx4vFsz3btM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 02:38:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=73Zwdq32M3wvIOvcsImSKjLgygutGdvwi4JFjWo6zTA=; t=1761320337;
	x=1761925137; b=lwp5Vy7CNybY1kA0EGickK9DaUcqBkrn3bXa/7XhYCixMwIA/1cKOlPBGYb++
	G/WF8Z0eYspyBI9b8+CkJQC/eXZvj0YFecE64LhcPjIVbOuBixtVYxpQGe4qE89JHLym27zMKyCRz
	I3tFw42f/EwZ70zR3tNk5cKlmlE1LXb6IuUvdQOrR0cfqRYgxpVrtQ8KQaJ+uUD8M41JQnz8Gpud7
	3Z/Sa8x42I7wy0w1D+v7hCe7CdEJwkNxNIzpCbCcV9FOMem+SVFpbMKHwg1SfV+WPL21neeboORkM
	glsZY/CFhgnVbvab7BBEO+evZcbAVJPH+HS4aM0plEGGxeFUWA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vCJs4-00000000MJF-0C1i; Fri, 24 Oct 2025 17:38:28 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vCJs3-00000000KCV-30QZ; Fri, 24 Oct 2025 17:38:27 +0200
Message-ID: <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David Woodhouse <dwmw2@infradead.org>, David Hildenbrand
 <david@redhat.com>,  Kevin Brodsky <kevin.brodsky@arm.com>,
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
Date: Fri, 24 Oct 2025 17:38:26 +0200
In-Reply-To: <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
		 <20251015082727.2395128-12-kevin.brodsky@arm.com>
		 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
		 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
		 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
	 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
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

On Fri, 2025-10-24 at 16:13 +0100, David Woodhouse wrote:
> On Fri, 2025-10-24 at 16:51 +0200, David Hildenbrand wrote:
> > On 24.10.25 16:47, David Woodhouse wrote:
> > > On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
> > > > On 15.10.25 10:27, Kevin Brodsky wrote:
> > > > > We currently set a TIF flag when scheduling out a task that is in
> > > > > lazy MMU mode, in order to restore it when the task is scheduled
> > > > > again.
> > > > >=20
> > > > > The generic lazy_mmu layer now tracks whether a task is in lazy M=
MU
> > > > > mode in task_struct::lazy_mmu_state. We can therefore check that
> > > > > state when switching to the new task, instead of using a separate
> > > > > TIF flag.
> > > > >=20
> > > > > Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > > > > ---
> > > >=20
> > > >=20
> > > > Looks ok to me, but I hope we get some confirmation from x86 / xen
> > > > folks.
> > >=20
> > >=20
> > > I know tglx has shouted at me in the past for precisely this reminder=
,
> > > but you know you can test Xen guests under QEMU/KVM now and don't nee=
d
> > > to actually run Xen? Has this been boot tested?
> >=20
> > And after that, boot-testing sparc as well? :D
>=20
> Also not that hard in QEMU, I believe. Although I do have some SPARC
> boxes in the shed...

Please have people test kernel changes on SPARC on real hardware. QEMU does=
 not
emulate sun4v, for example, and therefore testing in QEMU does not cover al=
l
of SPARC hardware.

There are plenty of people on the debian-sparc, gentoo-sparc and sparclinux
LKML mailing lists that can test kernel patches for SPARC. If SPARC-relevan=
t
changes need to be tested, please ask there and don't bury such things in a
deeply nested thread in a discussion which doesn't even have SPARC in the
mail subject.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

