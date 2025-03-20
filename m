Return-Path: <linuxppc-dev+bounces-7244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B324A6AFC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 22:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJdqJ6fLmz2yVt;
	Fri, 21 Mar 2025 08:23:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.10.9.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742502962;
	cv=none; b=G79myNEn7tSOLyXj8T4Uk1Gnh+QSPgDLBVYr7J2WMhzl8BLv5YCM0LYbMYaneC9/Xdnen7wNwUiGLlu2DmRS6UtBuu8oaPbAGXooYU1KhUAgk1uj0ELAi8Lfdj9w40M8NdmyJ1XPdK/U0yG86bw0KM7QCl1Ksbljy6geUCWJCakk1b9KHrjwHdP60Zs96XfO1B5B64m9N2g0aByLsXRpjpzklbGW1aoztYTeuREOOsfp9IkHWMuAVktBodiFUdV10ULFeXIaLXfcj8mJyxkxKMc6skEXfpvVEZyMlNLUXKvsntGgivU/n35CkG34l/KG4VS2+BHOBtrug9M212eC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742502962; c=relaxed/relaxed;
	bh=PfndGSLY+iboN6f9+gaut54Qgk8MXkVIEpXxkkY6nPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG0daRiluZp8jGyt0Qmik1fqNMtFZ5bY9xTJmkyA4WArBRghhL5Sy3p7QyO0K4QDkkgvE8n/rWP4F1viPcbx7gwHHpfGOR647pDMI17XE6yPEwyKP6o7PwvBpK3hHEONOnJ09DdqbZUZbktRe/L0EHaW7VwGJD29XizRJ8NcnusmUvN4ohd1N9LGE3NirgKsWP7tInDTTVpm82xfrHl4TuGcLXiQQ3Ea1GyxwoL4BUZ330xLIjiRpY3WwwOJokrXt0t81Lat34cS1JpkE7GdsY2DmrsEOfsvZ8lqIQgMcPkb8CUSNnaYuhKhPKRykgtl2Ez6yJCYHSa/LFSftSGUIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=manchmal.in-ulm.de; spf=pass (client-ip=217.10.9.201; helo=manchmal.in-ulm.de; envelope-from=linux-kernel.bfrz@manchmal.in-ulm.de; receiver=lists.ozlabs.org) smtp.mailfrom=manchmal.in-ulm.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=manchmal.in-ulm.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=manchmal.in-ulm.de (client-ip=217.10.9.201; helo=manchmal.in-ulm.de; envelope-from=linux-kernel.bfrz@manchmal.in-ulm.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 538 seconds by postgrey-1.37 at boromir; Fri, 21 Mar 2025 07:36:01 AEDT
Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJcmK0CRtz306l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:36:00 +1100 (AEDT)
Date: Thu, 20 Mar 2025 21:26:56 +0100
From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/prom_init: Fixup missing powermac #size-cells on
 i2s nodes
Message-ID: <1742502327@msgid.manchmal.in-ulm.de>
References: <20250318192256.3534046-1-robh@kernel.org>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f1DBgl1mI/wxhvd1"
Content-Disposition: inline
In-Reply-To: <20250318192256.3534046-1-robh@kernel.org>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--f1DBgl1mI/wxhvd1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rob Herring (Arm) wrote...

> On some powermacs `i2s` nodes are missing `#size-cells` properties,
> which is deprecated and now triggers a warning at boot since commit
> 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells
> handling").

Tested-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>

Can confirm this makes the warning disappear on the both devices
reported earlier in private:

* PowerMac3,4 7400 0xc0209 PowerMac
* PowerMac11,2 PPC970MP 0x440101 PowerMac

--f1DBgl1mI/wxhvd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEWXMI+726A12MfJXdxCxY61kUkv0FAmfcegwACgkQxCxY61kU
kv1a6g/9HC6bEykB/+61fjSoQVJI8E81MoUTox/RI2t3M8b7DNc5pGZpvQIAkF+P
ZIc40UuDVeN0w1JOpVU37apAYkJyT+hQPvzCpW2u86M1g+x7YkvN+2XU2TCgg5Hi
OwYcobc7zxJqmtJVF3tnairxP8gn7vofx5AwDn6fmtcgt+sL0XCxGCt0Xetp+kCv
eDu4I3+Jkil569H9xK25N2h/P0lO6G6wK0nXO82GUn6hxl7svRIbHPwcdqf+snP/
v9LRjepybJ8ZgGdYkOy0M8VN53lWQVTN8UOKBWiUNSssjhiYAa09/givmxdNJVeO
MbssmvmV8mHr/l6cxLwWn6cYfB6mi68KBhqDoNdhi6AorY5cjVevBDRnliCWYYel
xDpsIqWGigY1Q2ll1eL+GORL5FPW9r6YJPSQxLK3G3o169OULbVj1i8k6/y6dsEY
rHVVXH2f2zp3JjqvjP2yOhMJgz6q1abxYHQmfLVc6B670ni9hbStyODzsRMHsouv
fC/AzT7WfmkFzWRkWjiQ+2R14fOEMD63cFMSpBEaDBjK9nzAgpbI6ziv5MMIjqeY
jWOT1tvSeeTRsEjcwYWgnKR06icJlOLBWdkMsIDdmaVSraJdYOHIGPtHDlqYkOcI
dgGr4wql5qGt4YYoplZOWwkAKQSu+36zZojA5y4030Ervd5Vta0=
=HLvb
-----END PGP SIGNATURE-----

--f1DBgl1mI/wxhvd1--

