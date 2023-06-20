Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95580736CE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 15:17:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ssj75aD4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlnGt3nQPz3bX2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 23:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ssj75aD4;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlnG11nD3z30Xd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 23:16:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QlnFz3jyRz4x1R;
	Tue, 20 Jun 2023 23:16:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687266985;
	bh=62smsxlJDZU6Jbl2/hF7KMwX/Cu2CFdidOWYdCKWjFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ssj75aD4vUP5RbyiHK8fMOI3r0apZCkh2rqk4TO7hurs6P4Frh1h4d0J8ZBj8Ghpl
	 9/ZgRf+/oEL+yBxFPat/XRXEzIliUwDd/FjrD9eZzw8M+WXo0LVD+eP7CFmrLi2tUU
	 e8X2PKFzMsD+3sCBmFueLheFJpAgA+m21T0Csyti9tLfCa2DDDSuEsiRG3zdQ3yfiO
	 WXyoafCGsyjYvY7hbxirWLigdV1g+PsGiiWCr4TuuIawpJC9F6hpm9xbhN9mQL3CRY
	 y3HmlASqYWozd8nMftTBVLlUZ0GIECoyKSuBPjFj8j8u3DjYSjbEO5uk56Mn2vdFzo
	 rBDWqb7ehHEcA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 2/3] powerpc/pci: Remove MVE code
In-Reply-To: <20230613045202.294451-3-joel@jms.id.au>
References: <20230613045202.294451-1-joel@jms.id.au>
 <20230613045202.294451-3-joel@jms.id.au>
Date: Tue, 20 Jun 2023 23:16:19 +1000
Message-ID: <87jzvyp93w.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> With IODA1 support gone the OPAL calls to set MVE are dead code. Remove
> them.
>
> TODO: Do we have rules for removing unused OPAL APIs? Should we leave it
> in opal.h? opal-call.c?

I don't think we have any rules for removal.

When skiboot was being actively developed Stewart and I did try to keep
the skiboot and kernel opal-api.h in sync, but I haven't checked on the
state of that for a few years. ... And I just checked and boy they are
*not* in sync anymore.

But anyway opal.h and opal-call.c are just kernel internal, so I think
we just remove unused code there as normal.

cheers
