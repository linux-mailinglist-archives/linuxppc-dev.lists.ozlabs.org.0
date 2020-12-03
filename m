Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7714C2CD96F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 15:42:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmz7c4K0nzDqkq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 01:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=shelob.surriel.com (client-ip=96.67.55.147;
 helo=shelob.surriel.com; envelope-from=riel@shelob.surriel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=surriel.com
X-Greylist: delayed 778 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Dec 2020 01:39:38 AEDT
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cmz4p58wYzDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 01:39:38 +1100 (AEDT)
Received: from imladris.surriel.com ([96.67.55.152])
 by shelob.surriel.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <riel@shelob.surriel.com>)
 id 1kkpZ2-00023G-Re; Thu, 03 Dec 2020 09:26:32 -0500
Message-ID: <0239dde7da2d6b6499970f343c7498c711ce14c2.camel@surriel.com>
Subject: Re: [MOCKUP] x86/mm: Lightweight lazy mm refcounting
From: Rik van Riel <riel@surriel.com>
To: Matthew Wilcox <willy@infradead.org>, Andy Lutomirski <luto@kernel.org>
Date: Thu, 03 Dec 2020 09:26:32 -0500
In-Reply-To: <20201203123129.GH11935@casper.infradead.org>
References: <7c4bcc0a464ca60be1e0aeba805a192be0ee81e5.1606972194.git.luto@kernel.org>
 <20201203123129.GH11935@casper.infradead.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-s09L+bRyOvtccCU/oR2v"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Dave Hansen <dave.hansen@intel.com>, Will Deacon <will@kernel.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-s09L+bRyOvtccCU/oR2v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-12-03 at 12:31 +0000, Matthew Wilcox wrote:

> And this just makes me think RCU freeing of mm_struct.  I'm sure it's
> more complicated than that (then, or now), but if an anonymous
> process
> is borrowing a freed mm, and the mm is freed by RCU then it will not
> go
> away until the task context switches.  When we context switch back to
> the anon task, it'll borrow some other task's MM and won't even
> notice
> that the MM it was using has gone away.

One major complication here is that most of the
active_mm borrowing is done by the idle task,
but RCU does not wait for idle tasks to context
switch.

That means RCU, as it is today, is not a
mechanism that mm_struct freeing could just
piggyback off.

--=20
All Rights Reversed.

--=-s09L+bRyOvtccCU/oR2v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEKR73pCCtJ5Xj3yADznnekoTE3oMFAl/I9ZgACgkQznnekoTE
3oM1Xwf7BP5sCqPmSgYX7xGoYDG/xK8xty72ALiZ2ixV5SAzOInMZX7m2nmOLZ9k
0Nu3ycKqeKKdjvuqou4W+DEuiBR0Sy8hkkrlCcrzpmTQ0fv/igXyrRChA4V5u5Ki
SbE5tojr7tuCNj7O7iQF92x36A63PAVpI7k3hKxEvJtemPOYdxdxldF66nXm9/u9
1UJRMYEZHqvLJxWrSHe+NwZxcaYwGTWlnn6G69RJ5uC3leyuyFyKUdKcCLJR8c0/
nD001j/kwgtM+bkieMMCrWOEsKKCkLZGjSrZN0z/mDykDD26ITyCXrLgixXn+reJ
zFtzuMl49QDCB66Xb1d9oMbFcUzlJA==
=yjqa
-----END PGP SIGNATURE-----

--=-s09L+bRyOvtccCU/oR2v--

