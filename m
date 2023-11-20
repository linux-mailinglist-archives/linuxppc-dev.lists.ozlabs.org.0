Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF77F1558
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 15:10:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r45lYZBB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYqCb6ZXnz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 01:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r45lYZBB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYqBk3MQyz307V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 01:09:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6F364B817E5;
	Mon, 20 Nov 2023 14:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A142C433C9;
	Mon, 20 Nov 2023 14:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700489371;
	bh=hoIhA8+0yRB+8xKNhUqRCTi4Cj0Q9PRSELx11+Gdf9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r45lYZBBqyt2qIC3VTWvXeFOLpp7CslcoudAqZHo3c3ToiD3advJLwF+LCeQTSM4V
	 ian9GJtKKF/6WQNbnSlPU6HPsyneu0ZkHaso51fhQyb5HfooUycrugoOjqW3AvaFvH
	 JbSyG7Q6aiUwYwnG9OQSQDRK4H2FDhgaP+yGZfOW9mvm9hc6UiF2csU75mRMpuJsB/
	 u1dCYBO9SVZu1FuLumVUvtcx32ALSNqXSMdsp9G0IufrXorcmRf7kCkpyLAOe7IGza
	 CZVtn9hq2ML7D6TA2ZoEM+IA98iwR0d/sA7ltvFzg0zveh92v1bjHGQjv6XIUZ6hjb
	 x08JifS0gmx4Q==
Date: Mon, 20 Nov 2023 14:09:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Anish Moorthy <amoorthy@google.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
Message-ID: <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-35-pbonzini@redhat.com>
 <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61dY8WQ8Ox8wOW0h"
Content-Disposition: inline
In-Reply-To: <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
X-Cookie: Happiness is twin floppies.
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Se
 an Christopherson <seanjc@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--61dY8WQ8Ox8wOW0h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 05:08:01PM -0800, Anish Moorthy wrote:
> Applying [1] and [2] reveals that this also breaks non-x86 builds- the
> MEM_REGION_GPA/SLOT definitions are guarded behind an #ifdef
> __x86_64__, while the usages introduced here aren't.
>=20
> Should
>=20
> On Sun, Nov 5, 2023 at 8:35=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> >
> > +       test_invalid_memory_region_flags();
>=20
> be #ifdef'd, perhaps? I'm not quite sure what the intent is.

This has been broken in -next for a week now, do we have any progress
on a fix or should we just revert the patch?

--61dY8WQ8Ox8wOW0h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbaI0ACgkQJNaLcl1U
h9Aj2Qf9EbUUwOLmAwUa3Jl4QMfiLrKntsPjxIsD9MYRWpqfdGr2gZb7wNXozUgD
A1SOrSPxLG5lvE3dOdXD1O/mzrxVwLcfAssVQ6KjXu13pJtZDIQHAUpYQBJL28QR
KIeV8OVDMKeFryWnyt+y92xYK+7d4TocCuAq2Ph3jQj/OIXp4bI5quuTV58jmIG4
1QuJFi73b7JIL4Ksmg32pp3aWaoP7BqMqnDxx92GwdngF0Jrg1NBhgHoMkh/J28y
zT6Vui1HZF2pSrrxexqXFLJKhveYmLyg3kaoEyvYeRwj/WjZSB3U/9LJrhBDctTJ
2Y23Hu9kFWuPdJxy0l8BV7AiIxSr4Q==
=GWvB
-----END PGP SIGNATURE-----

--61dY8WQ8Ox8wOW0h--
