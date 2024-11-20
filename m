Return-Path: <linuxppc-dev+bounces-3442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDAF9D3375
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 07:13:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtWJ838mwz2xxt;
	Wed, 20 Nov 2024 17:13:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732083192;
	cv=none; b=m639zubzSM1H/524B/6303Eeqy2scMBpYkeAQ/7cd07/+MpxHEJQ86cfGlUcNjV6muJj/fZVl/ZD7r446hYWKK84dB9fr/0NFPPrMiyPAwxpfxjRj9oLU6L+xKINAK/W0uT/GPxc6qL7dO2q/eHIz+m3tPn92xVkF82lxEP8O1Aq0EeQ0tT4twA3sNDjs5HHx18tGKIWlmihBwoJuqQR/CdAiPDLQflBpvRQSCkx244101QxNYmRiv6hePGcWLbLm94v5DT2oNpavctvjby01lXRw5yX9hYW/Y4HeUgArx9O2pJi8IDpl91wgws/yEKaV4qGeAq5tQtPpysS5PmeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732083192; c=relaxed/relaxed;
	bh=oaAk0jN0HME8JFbAm9/nZx668KNf3WYWiySyRvweP5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PSJACkiMe42HH98BocEhjvxSCXpZ/UhsErx1l0XYo9+ihxd2oXz21FiffCAhDnInTffP2vMeEfPAotenEBQ2DTOAwKEWt4HTxt0qY/1BSfsEKoY82pznCzgg1mlIODVyVhViwcUDNBUjCij2Id2l+UoIpbGmpx2IwiZjU0CVPXEDEFxFeuwE2KxT/9earO42mcNA7C+ZULP5kIOOxWC/Ze4lvGhGFWb0eylSj3x0Kqw54EIjh+1RdxsNue1woFfid5qvjTMZR6h6GKpscaBCwSUt7Jz7gtEa6evyBPU0k15Rwg0VmlaVi9qkt0iXh3K776fayQ0AEmd/eTqCG0ljjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=APANFcbe; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=APANFcbe;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtWJ3602qz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 17:13:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732083180;
	bh=oaAk0jN0HME8JFbAm9/nZx668KNf3WYWiySyRvweP5U=;
	h=Date:From:To:Cc:Subject:From;
	b=APANFcbee5sFVUipPTelPshAUAKyWUfuLxAUU9Ii9+VdWj2AOc+UozEv/Ip9cMWpc
	 yU5sdR3EClyOC50QnWRf46tjwkBxPmr4LWR709IiWUogwNL73gcLNuUT1aBrpX2XDq
	 BJvMtTgU+wJRqvLbtNkhcpTWlX6Kheaj9lM49xoiZmrZ4h4PbTM6Vwmm567Xn+fiGP
	 Larn52ACyZh18ZodJxjb6kWYVsNsCTMNMq+5R72iDMmCKSG8epTysh7aFGwodi7hRU
	 SCInGQmD9Lo0wa+AxITJwu8hAxon3v3pmIjSybZQhECycsnq57bktePwxYK9AVciZb
	 mlsnHXC5vt13A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtWHw2F4rz4x6Q;
	Wed, 20 Nov 2024 17:13:00 +1100 (AEDT)
Date: Wed, 20 Nov 2024 17:13:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Cc: Kajol Jain <kjain@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20241120171302.2053439c@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/3UyAIJa8z0TP/bWtkTFqD0A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/3UyAIJa8z0TP/bWtkTFqD0A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-pmu:2: ERROR: =
Unexpected indentation.

Introduced by commit

  4ae0b32ecee7 ("docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Documen=
t sysfs event format entries for vpa_pmu")

--=20
Cheers,
Stephen Rothwell

--Sig_/3UyAIJa8z0TP/bWtkTFqD0A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9fe4ACgkQAVBC80lX
0GxQLAf9H2blWbiYsDh+gEJzxjzOlJKqYTkzl0b5MhuxXUDaSxmp+zTXIsgNTzkc
E33JUJOyi6bs8UAnqgDJLuuUUx9rxnQDHbEIRyWLgwyWFfTqqr72YKu5zQp9EOaF
ixQLS5kgWIGGB2OGPwuk6d5+kpaNZU7dooKYcsUE7s7zhmfQaWEdyk2882V6qkES
sLHZHcJG03aEoioYiE6oSLsKX6b7P/Ox4puU4hKkcym86w19kBPKFWzRCwXl8Yoj
9Pw7nbvWf0we1ZNuIzsOAJ6KKb2hhQT2vm27AiEJ/RcS7ZPBiQ7yqQAgIwfQlfQA
rgnbBPAS404CmaebLBqbndBuCmueBg==
=xnxR
-----END PGP SIGNATURE-----

--Sig_/3UyAIJa8z0TP/bWtkTFqD0A--

