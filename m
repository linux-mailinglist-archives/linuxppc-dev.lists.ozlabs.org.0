Return-Path: <linuxppc-dev+bounces-3196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28EA9C8B4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:01:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0dZ3bXbz2yyM;
	Fri, 15 Nov 2024 00:01:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589266;
	cv=none; b=NLAc+CqbPQqRRv15XVqvvz0uKPUseiWo3n4loc4wO1T1UcEd75I2dxKWwXv6t8LTrYDbHHBrPxCiFe00N6tSW0MbruPG4s5w+0CQY5mIZGVJpC90YQteFlPMQhgD45O70zA2be+tRyMESx0xXvkpWE7YOEyQVuR0i14qRwHw/6QZI1DkRgs4rXBqjwIne7aYBRKJQ42sE9RkEcSkU0dwTkOJVGDrBjWD//eXWG3ZgQRPdIZCLshCRW852/mgyNQd/5vh4Q7j0kQjT2NcFBmlFEAy3Pr+xLuVbkP4GaucRau2XXJCTmcxZ2/ackFTK/JcaIbQAtRNNRbcnlBBu4cc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589266; c=relaxed/relaxed;
	bh=jFLAK6bX8rtxwlFo3VzAY8beuT6fNUe+3N/sOyJ+ubg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YURiyavJAFEGhdCsXPRWqg+a7aApEbsqQCL7l66MbSK+YOZ+v3dalPJkb7gGgcP7OqoyeqxAUz1l7UcVmTovmGtftROPav57c2NSqloF0r4TFsEKx258ulvdiYeAD2mrUHRlKL7lPZpST/R5rRo/YtWCc8YfMFhnmDfdDOAwsGu6qx2Fw4fr78OXPELvinIzFfkDU4jkmUdx67RwWE5YcUeYl5AtGNiwXovzRSsO6YIOx5R2sh2qnETir4irRvslVS4snstI8MVy36xKnj0JMS0sKQR+aWp526Uvos2BCHTpbiwq4c5sM7g9DoE+ApjaFF3mNcv44cNr1vO8DPbfdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0dS74Bfz2yx5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:00:59 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4AECsbT5013558;
	Thu, 14 Nov 2024 06:54:37 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4AECsadN013553;
	Thu, 14 Nov 2024 06:54:36 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 14 Nov 2024 06:54:36 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>, linuxppc-dev@lists.ozlabs.org,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
Message-ID: <20241114125436.GL29862@gate.crashing.org>
References: <20241106171028.3830266-1-robh@kernel.org> <87jzdfcm3l.fsf@mpe.ellerman.id.au>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzdfcm3l.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 10:35:58PM +1100, Michael Ellerman wrote:
> "Rob Herring (Arm)" <robh@kernel.org> writes:
> > While OpenFirmware originally allowed walking parent nodes and default
> > root values for #address-cells and #size-cells, FDT has long required
> > explicit values. It's been a warning in dtc for the root node since the
> > beginning (2005) and for any parent node since 2007. Of course, not all
> > FDT uses dtc, but that should be the majority by far. The various
> > extracted OF devicetrees I have dating back to the 1990s (various
> > PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.
> 
> I have various old device trees that have been given to me over the
> years, and as far as I can tell they all have these properties (some of
> them are partial trees so it's hard to be 100% sure).

Many SUN systems won't have such superfluous properties.  But does
anyone use such systems at all anymore, and do people use dtc with
those :-)


Segher

