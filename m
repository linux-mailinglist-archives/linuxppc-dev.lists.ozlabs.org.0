Return-Path: <linuxppc-dev+bounces-8167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2211AA3B06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 00:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnDv319Jqz2y2B;
	Wed, 30 Apr 2025 08:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745964431;
	cv=none; b=a1jtt+G2Nd36kyO9CWvNOrB3wngAW9LBuAti15nMXtqbcoOizKrLwuyfnP0u+nm5a0RUWS+SWRlVi2jPcHlusFhCEBXbqcpvS0dS3eKsYpzqGtIe4vtMVkC/b+8w2E0DyBZRJckKQzbhzqEJ1OpfXvTk4oZxZHdZ4jGhqSAOG0vaQUxdq7hG8FKJ2yd369yNs18Q8pECKQYg58M6o+V30nSZ2R/00OGcmKMzFCtTfSs294WT7zdeshwdu9/qp9oJDzDtXA2fn3K4mQjBCn0Ru2mgKc+Ugi7zdlvEruafkJNYdl7wCh3jyhsVCByOG6JlGeGCZhbUdJMjixbFC6gBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745964431; c=relaxed/relaxed;
	bh=FN8+uBgejm31/iGMA2YxDjUaaelwFcaAly2uzQJg71g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=akB30D0LyUPxBohwFk+G+Gope8V93GwiBmLVifrbDijpWEBpjQxBY6TTVBJWvRrIsr1G7AtmGzZxIqw6EIuW+4g9PUpeWAqEXXeKhQNePISzBoBsTMBqZHchUDeDSon62GF8s7e/t04M9YYI/Rm7zCB/U64wN21BDodrlc3bsmtVlOG0wkvSphntGiBajs86CQn3lyd/IPaGBI0LZNdlbWNe3wR+UP9kJyxej9h0zZLAAvhJtBB32Uv9z77VHHP3JILPVknVm3Earca743iR81Ui5Ungmgf1k7qxBTpsXv2Bg8F+eTZFMsz3x+bAyfCBfdswB0pl+h3pMh0t5pMBkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=PeIO84G5; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=PeIO84G5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnDv24vxzz2xS0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 08:07:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745964430;
	bh=FN8+uBgejm31/iGMA2YxDjUaaelwFcaAly2uzQJg71g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PeIO84G5jtYu3eA1kG0TnQ9v+n/0VuJPoSNtJCCJdpugzlnoGjTdvtjcDfrOGiAMH
	 ku7uEy3z9+oxnNTthaYsDOO7TPeZ4tVEyHtn4+mzbG6R74kLr2busl4iCzJAdlT1kW
	 5lmqLGrxqsvyOJzM1sB1eDZS8t15o5XQKMz7Oz8weaWWfScrNYJPumxm+oYLYfFEAU
	 sSNgEmHR7j/wYBb8SIJASbsSTluEan3I4UFxIR7yiybDrsaxPKM3Q8/Cgi0326y9cG
	 JYbWmqBWBDt2LE2B+goS5njnrmDr7Oa335wTCGB1JTm2mXPx1lpb8PKt7lx8fiSNnZ
	 5eTMru7KrpZ5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnDv227MBz4wbb;
	Wed, 30 Apr 2025 08:07:10 +1000 (AEST)
Date: Wed, 30 Apr 2025 08:07:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
 tyreld@linux.ibm.com, linux-next@vger.kernel.org, hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Include linux/types.h in
 papr-platform-dump.h
Message-ID: <20250430080709.01e21091@canb.auug.org.au>
In-Reply-To: <20250429211419.1081354-1-haren@linux.ibm.com>
References: <20250429211419.1081354-1-haren@linux.ibm.com>
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
Content-Type: multipart/signed; boundary="Sig_/9YfBLevuRcpdpVSKiPxpuv6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/9YfBLevuRcpdpVSKiPxpuv6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Haren,

Thanks for this.  I have a small nitpick below.

On Tue, 29 Apr 2025 14:14:18 -0700 Haren Myneni <haren@linux.ibm.com> wrote:
>
> Fix the following build warning:
> usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type wi=
thout #include <linux/types.h>
>=20
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character d=
river for dump retrieval")
> Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.a=
uug.org.au/
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Please keep all the commit message tags together at the end of the
commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/9YfBLevuRcpdpVSKiPxpuv6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgRTY0ACgkQAVBC80lX
0Gz1FggAmCTxcvx5Tk9yKXLWInz22A306wfzsoodDnH8Ji1hW0iPQHDLrPjLb0ok
EwQ29q6XGSSD3AmW30HPRsKLSlUEfy4wVvsi/iLGw5eDbKGh5KGWmh6UqDDm5Kok
hqRTC0beKqXn3IFdntFE2IvuoXhuQd8FSKSSj+wckNSaE6rpwWgcg1zLBLkFktIk
dNC1mb1BKlA/uD/o34B70ou4SC1ccoKYPRDzwkYdWd0q/AxCfWHO6zJ4iyBGApbl
T7S6qNxOXBJelAlCBqJrUp6cpMqflNNc7Zj0obeRzNQTq8VFM6lRm0OC1rHG2Zow
mrYBahLyLnnzpV2Phq8YnlCCBBaH+g==
=XyhN
-----END PGP SIGNATURE-----

--Sig_/9YfBLevuRcpdpVSKiPxpuv6--

