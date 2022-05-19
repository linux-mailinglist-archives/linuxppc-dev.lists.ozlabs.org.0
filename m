Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E2352E002
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 00:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L44PH3m6Fz3blb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 08:32:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hhTX3+FN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L44Ng46NSz2yxT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 08:32:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=hhTX3+FN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L44Nf37HFz4xDB;
 Fri, 20 May 2022 08:32:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1652999538;
 bh=HsQ3C+KXpMZzUUB1bcGRf24npFJKXVif+oFEDfFYg/U=;
 h=Date:From:To:Cc:Subject:From;
 b=hhTX3+FNE9kINdQxIXA3nBvIDv8k6ROmGJXsPNRdnx3hMHmHqvDT9r/RFdE7+NR/h
 eYkH8mqvzPWsOVWcJVoJx+3Tk2/KPLW+lYdkvnRc4h0r93BebEyOvv4lT306KbNPTl
 pUfZW7Ehm7rZCZxAILZ9oJ2DaA+prhfmw/cvAlS9mAIGAPCI8JYcnk03sVir3B28/M
 2IAOIOHoIyIYkz1tJOHctMGCBP2nOb5bckcJDvxbcDNf0yXxSIoviESKr+NjISfld7
 UFGIo5RM8TQeQKJawFfpVSqPvHMW1w11wh3vwn+jKsNr5BiugEPtMPFsL5GVK4Vh3d
 URQ7bPHMwjYRA==
Date: Fri, 20 May 2022 08:31:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: Signed-off-by missing for commit in the powerpc tree
Message-ID: <20220520083150.57e953fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ndsHKp=ZuOV6h9zKNpo9eGL";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/ndsHKp=ZuOV6h9zKNpo9eGL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  03a2e65f54b3 ("KVM: PPC: Book3S Nested: Use explicit 4096 LPID maximum")
  18827eeef022 ("KVM: PPC: Remove kvmppc_claim_lpid")

are missing a Signed-off-by from their authors.

The first is just "Signed-of-by" misspelling.  The second is missing.

--=20
Cheers,
Stephen Rothwell

--Sig_/ndsHKp=ZuOV6h9zKNpo9eGL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKGxVYACgkQAVBC80lX
0GyDoAf9E20H9DPEXMUmMGq6Fl+hHTneXt69+Z6XYed7k/bxZw87kUKvSB/91h1E
pYDW4UMClBEKDKp19992vnl47QyuyI75rSLqcLzBeiOi1zdQpXkpmBNJ4kJTmH4B
UEQrH/NycFvH6mFuHjGGaE5hfqc8ETFqfvekLlJPRrR1Ujl4oVC9ime2tknaJUA8
GLm0BHCcGU8pleu6jRg9kvikIJr/ivFADd0fIIX0yAZBWEflfaUFQUd53sdYYzyI
eedhkAGE7wrAz61cfPjMvgDFc1T42MQfjXUP7oEQ4b4SpgiPwpXd0XNSVBHZc/zq
4qgkWrwEkwhsA9FI5Ih//86jaF2R2w==
=q8SX
-----END PGP SIGNATURE-----

--Sig_/ndsHKp=ZuOV6h9zKNpo9eGL--
