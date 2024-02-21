Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55C85EB9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 23:09:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WRDAvBZz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg9Qz23FKz3vXN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 09:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WRDAvBZz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfzjq4PlKz3btP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 01:51:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 06B79CE1E05;
	Wed, 21 Feb 2024 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8107DC433C7;
	Wed, 21 Feb 2024 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708527066;
	bh=jR116JpyfvNBm06wmEVLlKKRHi5BQ5NesCFPXL2SImk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRDAvBZzYYuE5uEfs/DEtOe7zPNcnoZYbwSu75Up2HHOCiaYs3dPtA3OFeS3aPijj
	 cdCJEC4io72wTxOSQfnNvLnLW0c2gv6tih+AGJaN/cIIMfccENvgOGgW+Y4y73EviJ
	 /95XICjCmk7hF5YBUPHW0H5+53rvT5IPFuNh9DzIoo/B/iZuLVvbEAjqaT79MVu+SO
	 zoH5NBPAIyQheTU4QmU6vzAQxSV9MnS1mlP894VbFgkaw3S9I8y+HXI75doohUQtiO
	 LrWh102L8ZI7FGNYQCmOW2aK0zb6kqrnVpxfNYFRZM3L9sb8iFhtUia1zIniN3qzQ2
	 6qH0YCc10mUxQ==
Date: Wed, 21 Feb 2024 14:50:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Maxwell Bland <mbland@motorola.com>
Subject: Re: [PATCH 0/4] arm64: mm: support dynamic vmalloc/pmd configuration
Message-ID: <20240221-ipod-uneaten-4da8b229f4a4@spud>
References: <20240220203256.31153-1-mbland@motorola.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+os/L6iBAa0yd7x"
Content-Disposition: inline
In-Reply-To: <20240220203256.31153-1-mbland@motorola.com>
X-Mailman-Approved-At: Thu, 22 Feb 2024 09:07:37 +1100
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
Cc: mark.rutland@arm.com, linux-efi@vger.kernel.org, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ast@kernel.org, linux@armlinux.org.uk, linux-mm@kvack.org, ryabinin.a.a@gmail.com, glider@google.com, kasan-dev@googlegroups.com, yonghong.song@linux.dev, wuqiang.matt@bytedance.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, will@kernel.org, ardb@kernel.org, michael.christie@oracle.com, quic_nprakash@quicinc.com, linux-arch@vger.kernel.org, hch@infradead.org, gor@linux.ibm.com, daniel@iogearbox.net, mst@redhat.com, john.fastabend@gmail.com, andrii@kernel.org, aneesh.kumar@kernel.org, urezki@gmail.com, linux-arm-kernel@lists.infradead.org, samitolvanen@google.com, zlim.lnx@gmail.com, naveen.n.rao@linux.ibm.com, dennis@kernel.org, borntraeger@linux.ibm.com, cl@linux.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, arnd@arndb.de, linux-s390@vger.kernel.org, hca@linux.ibm.com, npiggin@gmail.com, kpsingh@kernel.org, meted@linux.ibm.com, quic_pkondeti@quici
 nc.com, paul.walmsley@sifive.com, surenb@google.com, akpm@linux-foundation.org, dvyukov@google.com, andreyknvl@gmail.com, haoluo@google.com, brauner@kernel.org, mjguzik@gmail.com, lstoakes@gmail.com, song@kernel.org, gregkh@linuxfoundation.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org, awheeler@motorola.com, martin.lau@linux.dev, linux-riscv@lists.infradead.org, palmer@dabbelt.com, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, guoren@kernel.org, bpf@vger.kernel.org, rick.p.edgecombe@intel.com, linuxppc-dev@lists.ozlabs.org, sdf@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--r+os/L6iBAa0yd7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Maxwell,

FYI:

>   mm/vmalloc: allow arch-specific vmalloc_node overrides
>   mm: pgalloc: support address-conditional pmd allocation

With these two arch/riscv/configs/* are broken with calls to undeclared
functions.

>   arm64: separate code and data virtual memory allocation
>   arm64: dynamic enforcement of pmd-level PXNTable

And with these two the 32-bit and nommu builds are broken.

Cheers,
Conor.

--r+os/L6iBAa0yd7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdYNywAKCRB4tDGHoIJi
0gMuAP9F/qaVnaevMHMAFC79aMoA7T8MPtngzCYgeGKGkodjfwD+LfeSF0KgFWRs
XPWMo+0cR11PZYg4ErTvrYapXzyvsgY=
=uABL
-----END PGP SIGNATURE-----

--r+os/L6iBAa0yd7x--
