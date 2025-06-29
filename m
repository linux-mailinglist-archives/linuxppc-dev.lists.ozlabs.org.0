Return-Path: <linuxppc-dev+bounces-9861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F50AECAE7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jun 2025 03:55:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVC6h0wBVz2yhX;
	Sun, 29 Jun 2025 11:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751162124;
	cv=none; b=SI9H6F7+D86KhjKOKV0Mxnhf7coNLz4YdubjgxMAOskykZR6oPAoE1yYXV+gj34XG+RXF8Z1n3EOdm5RNOqLgpStJFxk/y/qksZUbTbO3ISBFJT30jKAohkxOyfKCCyr3aOKyePV9466y2EOa14DZ+XucH2LyDW7yuxQ2P1QPbZzKusqQJkasMrsDUV6IcpXJS+j0qmybwfOCKYGzVkLaobMlHaeOslP6+uO2ePVXPDFxWcQOgtOObPRhu1ls0phzyOLSOYSwiEivuS+OWl3xZxxjuPb5nb2jD3gsoumgxGzFphWI5qfFeo91iANrrdpyXY13KYVjp4j15rjpSdBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751162124; c=relaxed/relaxed;
	bh=wdTPHBtu+qNmk5C2Bn0zJ90/8NEFjhlUIq+Nt2kOfDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvcKqrussC2eJHlwMFtKGkzcI41kE4R7YCeF5OEMpCMO06Ny+CgtIjO5tHcEy5vT8w2JqqhbdsvL2hEGchOijeW1d+3ZwhjH3sadQ/LU0/myyxYDB/bl7g9jMAT4xhmp2VKgbg6jB2PKn08r0lvw7wNKp9z7qM6frQTU9J7g4s50wi/C9UocK35DY8noegyFJTkSMMX3kFZd94uyjmaY9k1pjFjFdMEcBSN8CHGzDCiXo4OWFUd99aZoCNr8KOdkd0a1PG0yET4R3tWUZ+jpsOWrqZXvgf7G2aSblvzuka0zTypF6H9smVa7k46R/oURZkht/2yq6lKGKMBwpGoq7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (3072-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.ea087b header.b=HpODEQVQ; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (3072-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.ea087b header.b=HpODEQVQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 443 seconds by postgrey-1.37 at boromir; Sun, 29 Jun 2025 11:55:20 AEST
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVC6c2ddJz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jun 2025 11:55:19 +1000 (AEST)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C0344240103
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jun 2025 03:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1751161669;
	bh=wdTPHBtu+qNmk5C2Bn0zJ90/8NEFjhlUIq+Nt2kOfDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=HpODEQVQ0LmdwqtslxkJoEOlGy0tEDdruH9DTSixJXJHAD7pJJe2j2BA7g/k7gBdg
	 5sS15ZPnQW/bE8w6G6iejwMKHlgE6VIvgZyNnWvq3pH9ysgJubR9vjyJse8UbnEB6D
	 IZRyhtc7IaH/LOhLUbwKvXEHYEKpdsyP7Q2YMglImdJLpEeI3O/YonQ9V24Z+qc4DN
	 lr3VNmHEZvQDhJPvjkunnP1h7FaCkaEOHza3o60faH6UKMqhynBhKTPqyisyb/gysc
	 tQxdyCbTyctdfb5cyvqFt9g8DB18Ek8+AENS6Rzn+VcjX5FuVft+BQuyD4hgijkTLo
	 qjHp+wmocx9NR1/yHtyR1CD/tkhfEBZNalj+Mekaw/6r+fftnn5NVUUImbworlC51O
	 XNwmEnrFFfsf9L0Yn++JBsSEKLU7x+iBqHr0ydERCTfrSOumg5nxVkTv3SdnI3GzTu
	 eTziKcIP6MyTK2gkLOyvr7C9bP4oqhsmSY8K/OFrT9SM8v7u2rN
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bVBxv5VVNz6tsf;
	Sun, 29 Jun 2025 03:47:47 +0200 (CEST)
Date: Sun, 29 Jun 2025 01:47:47 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert
 fsl,mpic-msi to YAML
Message-ID: <aGCbQ100CFJz6BjK@probook>
References: <20250611-msipic-yaml-v2-1-f2e174c48802@posteo.net>
 <20250625201232.GA2128052-robh@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625201232.GA2128052-robh@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 03:12:32PM -0500, Rob Herring wrote:
> On Wed, Jun 11, 2025 at 11:42:09AM +0200, J. Neuschäfer wrote:
> > As part of a larger effort to bring various PowerPC-related bindings
> > into the YAML world, this patch converts msi-pic.txt to YAML and moves
> > it into the bindings/interrupt-controller/ directory. The conversion may
> > necessarily be a bit hard to read because the binding is quite verbose.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
[...]
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 16
[...]
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +anyOf:
> 
> allOf

AFAIUI, at the current moment it doesn't make a difference because there
is only one item under the anyOf/allOf, but for robustness allOf looks
better.

> 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,mpic-msi-v4.3
> > +              - fsl,vmpic-msi-v4.3
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 16
> 
> Don't you mean 'minItems: 16'? Otherwise, this schema has no effect.

Indeed.

> 
> I can fix these up when applying.

Please do. Thank you!

J. Neuschäfer

> 
> > +          description:
> > +            Version 4.3 implies that there are 16 shared interrupts, and they
> > +            are configured through MSIIR1.

