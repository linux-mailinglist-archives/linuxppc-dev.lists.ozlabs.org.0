Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4015EB648
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 02:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc0t646wkz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 10:31:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=mNysYnW1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=07tCwHEq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=mNysYnW1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=07tCwHEq;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc0sN1Dgbz3bWD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 10:30:47 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7EBC35C0189;
	Mon, 26 Sep 2022 20:30:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 26 Sep 2022 20:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1664238643; x=
	1664325043; bh=Ml+yLcOnKaFHvWZzZyhwHiQHuXakcYlxDu0IDLmaSyw=; b=m
	NysYnW1lPC9shkcSb8pAErlcdAsn3jkYzVA4kuz38cQkK508OHRSkV25i+KS/ipw
	nIylth3Xj6v14nCTajSinnb+z87+acyIoXBojBgZS8qn4Igme5QqZ4e2o5PP5Zqf
	AZ8H+45jYT1GrtYbB5y9remRiwtCD1syszQ/aiG12gDEOXj7IsFahiZs6BfwbDhI
	6Bhgj6gacbBDBfIPYVxPeJTe/uzc87LgfCSEf6TKhJjJhZpnLbYDZ0xXne4WwtqL
	GtFUrJkcttB3e/dJxFFfTvAY9XSHUcldovLx8t/lZcRVypw5l9+H3+oIvlDxzTdU
	ys6Q4JZ0/UlTBm99L9New==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1664238643; x=1664325043; bh=M
	l+yLcOnKaFHvWZzZyhwHiQHuXakcYlxDu0IDLmaSyw=; b=07tCwHEqlTxQcZ26c
	szxlggyeZQ1SCH/ZJyjwo5wOpZQ+zUX0DhiU5JCTQvkcm0BoFfBjqM8kH2+icD+X
	fesevhrCT2ixxP/bG8AD6d0VrzQFBOOzZhJz9itYS8h7ivfs8gUvrvVdsbD3VA3R
	dXAB0vodNZHX7d4PS8Cv7S3qq1rm6h+uA9XoFrd8adkePwqu743NF6XzOopXnyXu
	Q9uJX84T4zG0h/jYJY7WYYLFiOUbKsyD5AI+t2ETxw8+9i/x79A2guHSKhBVkUR2
	sFIKQPAKRxi1nBqxj/qL/t3BOMK9gLu4iPVDQLfg051iuXzN13Mefu9ZH9DSgN5K
	rpiNA==
X-ME-Sender: <xms:M0QyY-nq7RCpRbvODTZUPJh4YtkfArVn1mWOrssEM9rrWtElva5xZw>
    <xme:M0QyY113HNu7FGHMmOZni5cOV4aI7EPZ1i1HfuT2gPaGi9xYx981orOPhBgnsbUwv
    gBI7rwpljMJEjtecw>
X-ME-Received: <xmr:M0QyY8q4eIVfzQ4kgomIzCRFDewjC_ZHdSeKogvlXbnt1tPk_ovQ17xCtdQmEIq0-JlsbdEeUgUHgbWiw2OPHZO4GPxMvTlhtEcSItRxjHxn5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddt
    reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
    hsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeevhfehieeijeeiheegueehgfffuddu
    veeukedujeefhffggfegtdeiveeuhefgtdenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:M0QyYymWhxU0JAHHuTkAizVxs7RLjSuCVTCid2fJPIvDaWLMCoDo3g>
    <xmx:M0QyY82JszMWKt4Js08fDF63hzF-f2FcU2wSe2HiFPO_qKovvLbWNA>
    <xmx:M0QyY5t2IqHgOxVVfSJ7WY5duK2x3G0uqrlH6e0srkaG2JEodOrmng>
    <xmx:M0QyYx9l1ILT0veFbw5_XCIg0-gsIcgqGuWChP0AJ0uFy2HtFqQbOQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 20:30:41 -0400 (EDT)
Message-ID: <3c7101489801f5ca2bab2fc396e08ca4a3cf99bf.camel@russell.cc>
Subject: Re: [PATCH v3 4/4] powerpc/64s: Enable KFENCE on book3s64
From: Russell Currey <ruscur@russell.cc>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org
Date: Tue, 27 Sep 2022 10:30:38 +1000
In-Reply-To: <20220926075726.2846-4-nicholas@linux.ibm.com>
References: <20220926075726.2846-1-nicholas@linux.ibm.com>
	 <20220926075726.2846-4-nicholas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-09-26 at 07:57 +0000, Nicholas Miehlbradt wrote:
> KFENCE support was added for ppc32 in commit 90cbac0e995d
> ("powerpc: Enable KFENCE for PPC32").
> Enable KFENCE on ppc64 architecture with hash and radix MMUs.
> It uses the same mechanism as debug pagealloc to
> protect/unprotect pages. All KFENCE kunit tests pass on both
> MMUs.
>=20
> KFENCE memory is initially allocated using memblock but is
> later marked as SLAB allocated. This necessitates the change
> to __pud_free to ensure that the KFENCE pages are freed
> appropriately.
>=20
> Based on previous work by Christophe Leroy and Jordan Niethe.
>=20
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>

LGTM.  For the whole series:

Reviewed-by: Russell Currey <ruscur@russell.cc>
