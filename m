Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF396222ECB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 01:12:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B794m0z86zDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 09:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B792D4Cd8zDr9Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 09:09:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=PDEe9kz4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B792D01SRz9sSd;
 Fri, 17 Jul 2020 09:09:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1594940996;
 bh=QWdrxFBpnc+5yuo/EXWfNKKKZ2K+Toci8Qlf1n0C6y0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PDEe9kz4oTwEwQL1l+VwLcW6E6k3EgHZQ1rVzPjU6atoGl6I+EWivth53CB0cj/Ff
 XcAGKp66vPBeKN4jx51BfkfGO9RnBvoTXLlMb5coShUzXMkKEZt+NKSuO0NRZzMFcU
 O4Us8lrYYeOGHGd4XpK4wgYgHzMIP01ATXhmNI5pIHcIsdmW9vQegA2jZQkfXDYr5g
 QJ4aJnLCh8RavotRrhJ85U631r3KjlkBCjx8TGHG6YUh6vfxE5HarM00BggWawG2yl
 AGVWzLBtUIuUzQyh8waUfmLMpZUE9D/wimIyrRYx6uvzwEhvHMK26VuEXbOWFW1sLr
 XYIfSSohdea7A==
Date: Fri, 17 Jul 2020 09:09:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
Message-ID: <20200717090954.51b5e952@canb.auug.org.au>
In-Reply-To: <20200716172713.GA4565@lca.pw>
References: <20200703053608.12884-1-bharata@linux.ibm.com>
 <20200716172713.GA4565@lca.pw>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LrU42vrRqFzVHW8kLZ7IOY.";
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/LrU42vrRqFzVHW8kLZ7IOY.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 16 Jul 2020 13:27:14 -0400 Qian Cai <cai@lca.pw> wrote:
>
> Reverting the whole series fixed random memory corruptions during boot on
> POWER9 PowerNV systems below.

I will revert those commits from linux-next today as well (they revert
cleanly).

--=20
Cheers,
Stephen Rothwell

--Sig_/LrU42vrRqFzVHW8kLZ7IOY.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Q3kIACgkQAVBC80lX
0Gx0EAgAgGAiEBdzR5nyLORIZM/X+qAx7M26k7TbqqYdKD9yzUyQlly6tj8yyOEz
ivEg8oZYzNeoiqxPkYr/HLNzR/4ckQQ5RxTxXXI3r/nSj7nG4TI6vN+tSIomNs0p
hZMh6QMkN52Yf179tutfBOhMdD4Gu5PIeQcgI7qd6VhOFfrZd17WS44i0oIWb1N7
bxGLDbfH7dWO/b3imxj2rsnUZd6Qfs7jrCEExl/88mHPrRkfXlj4IWPdXoQ8R6wV
mkhaEu3JZHlhgVoTebHsTyzlI9mIjKlx0UaOkBX+G6awc/msTlxuKmdBIKxDcj1b
xCwR3sZinXugs1SFocbfj6SGmA9uvQ==
=Nze4
-----END PGP SIGNATURE-----

--Sig_/LrU42vrRqFzVHW8kLZ7IOY.--
