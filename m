Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590566690A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 03:48:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsprW6PRwz3chK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 13:48:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=DowpD4Ef;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jygWv3NY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=DowpD4Ef;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jygWv3NY;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NspqV4ZC3z3c3m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 13:47:17 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E1FD75C0170;
	Wed, 11 Jan 2023 21:47:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 11 Jan 2023 21:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1673491632; x=
	1673578032; bh=zr9RMTnAYevKmn0DQXi/2zQk5Fl2sIhXS0bNucFWxWM=; b=D
	owpD4EfKzSPifr6XaKxlqogqVeT5ZxvN0UiAu1wlXWlh1NdrFIrqfEpNgozmL4hM
	uIXefod+iHX8YcjQKudoGjiRwAzJ63fXbeyGPP0zpRKy/xXOLKLA9CbGh6TyZE7j
	/0Npz94YbPd4ZCSj1oAahsTUad4mvGMW0gtyK+KUmEhMhADuzeiuNHzsKtSKBwQZ
	kRY4rVVY+dqlJckMeyYRaKLB9zIjRSa+O68newE2QksmvwszqWwdHcURok5GtXKV
	qglyWPJJlyICRCoGqjgOcg4fMHMdc6koesf3KWOgfaCR/uR81jPNXQaxXKIwyn6a
	Rq6VBZf8uARbn0HX9uGYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673491632; x=
	1673578032; bh=zr9RMTnAYevKmn0DQXi/2zQk5Fl2sIhXS0bNucFWxWM=; b=j
	ygWv3NYcppxg78n2amQ6Bk01ULusKMDe2njnNTUPJ0pti37d1dO72kCJeGjpCj7j
	diiSScOlbHnisK5wzclYZrqPoJZId4ItNWBZWa/Js5NSkJ6fCTKaUElgnJR89kiU
	Cz9Oowy1QdejtATRA8GQcdRjZWL1j03secXfhCxCEPrudOd7rdJD/vh3QECbErmI
	D8l3bq5tUuNoEnFOAOPU3gzfKTsgyNaT0hv7xLmhY4TrXak5CbA46u04w+zHCVx0
	7VMR9TQtR5MV0RLdQ0ZBsVXZRIJHlUSINB0AFnBFHH7VMc8TiZ7sPvLGSAELRtBw
	uVR/Hckw80WUIvptoxFXQ==
X-ME-Sender: <xms:sHS_YwiMp1cxHStiyR6Z2YE5d7eK76cAKvv0eFdicaYNq7YLBMVPDw>
    <xme:sHS_Y5DreylyIBOEPVYR24bONRcs1LeqGZFTCPgh4NjyGSuDV6HYYhKN6wK0mtS2a
    rKlJrHRkrF-90Dw9Q>
X-ME-Received: <xmr:sHS_Y4EEh__5wZRhMCFLFw2pUxzYD-5XRh-RBXjrN9sDex-ZYDqkFvrWLFf4GpSSdEak9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleehgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhepkffuhf
    fvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    etgfeilefhueefvedvkeehieefjefgfeegheetudekiefguddutdeukeetveelleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:sHS_YxQ9WGRucXwkE_LSa3vxu6jEBu5NAg7ergGAeazfFLG8MzlYsQ>
    <xmx:sHS_Y9y9JePXhwGJ6rIMLLOIE_MAlUFgO5LAq9M6aLqy4kSFd_piEw>
    <xmx:sHS_Y_4aXO-_ODH0URzxaIfGu0kcAlugQA3RtVFmp1Ely5ObNzacsg>
    <xmx:sHS_Y-pWihhHKPq5EBAnakL53uK7YaopS0-Y3LRme9C2xuEyR4ZNbw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 21:47:10 -0500 (EST)
Message-ID: <dda9cf7e717f49d2ad02eb6ca3f7839e340510c8.camel@russell.cc>
Subject: Re: [PATCH] powerpc/secvar: Use u64 in secvar_operations
From: Russell Currey <ruscur@russell.cc>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 12 Jan 2023 13:47:04 +1100
In-Reply-To: <20230112023819.1692452-1-mpe@ellerman.id.au>
References: <20230112023819.1692452-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-01-12 at 13:38 +1100, Michael Ellerman wrote:
> There's no reason for secvar_operations to use uint64_t vs the more
> common kernel type u64.
>=20
> The types are compatible, but they require different printk format
> strings which can lead to confusion.
>=20
> Change all the secvar related routines to use u64.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Russell Currey <ruscur@russell.cc>

