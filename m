Return-Path: <linuxppc-dev+bounces-6038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5924A2F24E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 16:58:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys8P80g16z2yhG;
	Tue, 11 Feb 2025 02:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739203084;
	cv=none; b=ozDTv3kJnrENbz3b1zItbr18VmZl2UReCjGbzei9J/00bzCExeFdL5G8u2/pKEtAF7rJg8OO7u0TpRGwbWGUOGHeQrnVa05yYVqnvJVp4Ns0R7AyUMcUG2D5HQ/2HxSxzPN0SRyU4u4vxxMbeA5lTOilXyrnjkkGfdKgPk9cVYYF61UPPMSFVwRXZu674V246waieUQ7YYBViDkMT1emdJsU1551MkVcQ+4Fx61Y+WF7r3dgoF1BvGivGM7PzEp6xnfjXNKLqRe5mnaDR8KJPf62de/7WbrcffByRJCpP3i30e04biIuUdE9rEKpResTWgARTIeP5tcCshyvbnEMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739203084; c=relaxed/relaxed;
	bh=lQ9xjXE4fQ5E3R9uQe1RdCFTA3rQo7TSFCMdjBUTzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYTPTFv5XhHXSTtd5GFmsBWo/rBFMig3RbpLGhEuXGFDDYxP5AhQhyyIhlf+l75CMfSfV/AQLDhjKZrgAcNXQVUPJ/t1ygK/jTl/rKrcDsoddi+mmKQzS53qE6uLL8mJCu1MFM8ZjhD3LjrX0i0g2dFLVMzkMsKDSYss8iKysnFyDCJ7VGefDma44r8xRMzXwHJ/tE0pfSmS7+AZptxqn8dqJYZbVbUtX9Xtg8VXIFCfZgBZoObRUosTYIwe7Uc+5whFBS1/EzZQJeUNo0W0D/mDlKlLTZ93z7GmQh3zj7dfcZZEB5YLfHqMtVesquz5BRnjwHzv3YetB/NrpklDZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=CpH/G027; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=CpH/G027;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys8P533fzz2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 02:57:57 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3E821240027
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 16:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739203070; bh=lQ9xjXE4fQ5E3R9uQe1RdCFTA3rQo7TSFCMdjBUTzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=CpH/G027oFc8oAku2cy7VEnKPS6qe/8WP69kAGkTRzkM2ro0ESq6s4Yty3aGV6Y4H
	 LZ87v9y9ollAsDGw3QKCoPmG9HdiqyWfoHbPSoH7JyeDhOAMjyxeVRrO7Fwz8CtnF8
	 yZ6oouhluLt+8uLBRgpqSXLtxDHoB5EWkqY0MkIwgqOIDr4QNb55+i/SM0txb5FAwS
	 4ESJidSmnIh/raUUeuW0vjOecJT7E9zB7uQvw9dHxuT4LaLMsMjhIwIbDGV5suapmm
	 yUYj1SeOH5/0885Sbc4ufTMKc7hAEYYPAn+XDAafKZt2HKkUzxjUcfaaXVR34DLf4M
	 +v9zIZdSdmmNw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ys8Nl2HW4z9rxD;
	Mon, 10 Feb 2025 16:57:42 +0100 (CET)
Date: Mon, 10 Feb 2025 15:57:42 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Mark Brown <broonie@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z6oh9t2QQzz17Yt6@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <611e47da-ba87-4c21-a6b7-cf051dc88158@sirena.org.uk>
 <Z6a_f03Ct9aB7Bbn@probook>
 <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0fe3416c-c3f3-44c4-a1c0-7e8262c54d4b@sirena.org.uk>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 12:59:35PM +0000, Mark Brown wrote:
> On Sat, Feb 08, 2025 at 02:20:47AM +0000, J. Neusch=C3=A4fer wrote:
> > On Fri, Feb 07, 2025 at 09:38:05PM +0000, Mark Brown wrote:
>=20
> > > What's the story with dependencies here - why is all this stuff in one
> > > series?
>=20
> > The patches are independent of each other, except for the four elbc/nand
> > patches. They are in the same series because they came up during the
> > same project and achieve similar goals, but it isn't necessary.
>=20
> Please don't do this, it just makes it harder to merge things since it
> makes it look like there's cross tree merges needed when that's not the
> case, complicating merging, and puts the entire series in everyone's
> inbox which makes things more noisy.

How should I proceed with this series, in your opinion?
I see potential advantages (less of the issues you describe) and
disadvantages (somewhat harder to track patches) of splitting it up
before sending v3.

(Outside of this series, the conclusion is clear and simple)


J. Neusch=C3=A4fer

