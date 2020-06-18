Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC51FE93D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 05:08:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nRhg4Pz7zDqGk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 13:08:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nPH53zg2zDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=c0vH8Aue; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49nPH35hR4z9sVj;
 Thu, 18 Jun 2020 11:19:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1592443169;
 bh=K1ERJwulQQ71ZmizNv3o80BKfdJjcI6S5OFHSql3lK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c0vH8AueyiwakeVIA+q9EvgLvoFGAklJYJa6D8cd23Kvh1KPcxjxkXxi7lQUf+JDF
 gSuGYQIGdx41HAsr4qUMp49BgSUjPXqRs92UdJLRQaqEjgvG3+T7W5cZSeZC2lCD7l
 H1NFppLprzKSB+8k99ZQJ//fKpJW/N/wQ1EwVnaeL8NjC0rdWsjFLr3SXJb0Lcf99l
 QBKgZavxYAoSIDkGD4IjwsymPUCXEhYbEOruaQ8Kh0yWpvaIENF+MBPygS1Hes9+GJ
 l5qLwH3HQTrXkmD+QSVBeo2S/OmevG2Jn0qTSXPCnIzjMLXgjyUM8v60iIpdP1qfQ5
 9ZDiPGKWSLB4g==
Date: Thu, 18 Jun 2020 11:19:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] mm: Move p?d_alloc_track to separate header file
Message-ID: <20200618111925.28100ec9@canb.auug.org.au>
In-Reply-To: <20200609120533.25867-1-joro@8bytes.org>
References: <20200609120533.25867-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YCi/Nnb9cueQmER4WWU5i5W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-arch@vger.kernel.org, jroedel@suse.de, linux-mm@kvack.org,
 peterz@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-next@vger.kernel.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 manvanth@linux.vnet.ibm.com, hch@lst.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/YCi/Nnb9cueQmER4WWU5i5W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

Sorry for the late reply.

On Tue,  9 Jun 2020 14:05:33 +0200 Joerg Roedel <joro@8bytes.org> wrote:
>
> diff --git a/include/linux/pgalloc-track.h b/include/linux/pgalloc-track.h
> new file mode 100644
> index 000000000000..1dcc865029a2
> --- /dev/null
> +++ b/include/linux/pgalloc-track.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_PGALLLC_TRACK_H
> +#define _LINUX_PGALLLC_TRACK_H
> +

Maybe this could have a comment that it should always be included after
mm.h or we could add enough to make it standalone (even just an include
of mm.h would probably be enough).

--=20
Cheers,
Stephen Rothwell

--Sig_/YCi/Nnb9cueQmER4WWU5i5W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7qwR0ACgkQAVBC80lX
0GysAwf/ZNngUfjr8j+WzPw9diANohv/lSl2wn69fUe4dvCuORBkF0ItPZodhAX1
8MaSeeYqtRt3Vh0xFgsA/rW4DxOxSQN87G1QBgSCA2BFkNs/sxDhMTs0CJmZR52y
LtRaXmfro+7Z9Th1DBKbJA5Waw0Cw90U5muGvb/FFmjvKKGOX52g7lb8RWyeoNe0
FcngH+KvpNBenHro9/87VSadAb5Ch7IoTx1x0eFF0oDtEBe8tOs/ZpLfTUKnql04
FqVy/p1HMv0vNZyc4hFukB1IcPeCSK/YXKHleZ0nIWQ/Qeo6lwlEzboK3ixEBt5B
4YrmmUYfdVq6Mk2Bhnp4uBIO8aYmMw==
=bxHw
-----END PGP SIGNATURE-----

--Sig_/YCi/Nnb9cueQmER4WWU5i5W--
