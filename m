Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E48260D9EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 05:31:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxvVp2SyTz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 14:31:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=urjYV3cy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kHd/9IRh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=urjYV3cy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kHd/9IRh;
	dkim-atps=neutral
X-Greylist: delayed 546 seconds by postgrey-1.36 at boromir; Wed, 26 Oct 2022 14:30:52 AEDT
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxvTm6nn8z2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 14:30:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 574153200392;
	Tue, 25 Oct 2022 23:21:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 25 Oct 2022 23:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666754500; x=
	1666840900; bh=FOpn3oC9u+5CmBY/mkrH2lYJWJ7JQNJARtq/LOiighw=; b=u
	rjYV3cy8tfViuT2Ir6Br9lJuBFNRrO+2FZP7Otcc9qaOiY/41xAw9jt+fpo0GEow
	meNeZrswVZvth6o5RBrCKdpstMJ3kGlOriSwTjdosSLgyxW1Ws3120guM+gAj0rq
	sMRW5OLQ3bUr82tENEKfmjn3N3gTTG/6NLt8RYuswo/dwkI7YbYOuotY1toDbBLL
	ooLaWLdS2+Xsqq2gBdwNsaodm0KXa+eQ+5W9c90qfiiuvNT4bhY2Mo2Y/43QHoX9
	g+ZnL00OczVICqaWwXDdzPHsw7hWlokh8+7yjDoH7/LInrVDWk+K54uUy2XZUTC4
	snd4+IfrrwDtM0bclwzXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1666754500; x=1666840900; bh=F
	Opn3oC9u+5CmBY/mkrH2lYJWJ7JQNJARtq/LOiighw=; b=kHd/9IRhZQ16KDLNi
	EP5wBDRgcFHmNMEzQ2/0Oiy1Dx74dJwHSUq9Ve3rYGFgE6HjS+ywhdgG45a1Rkzh
	c2Bc4OK4suiCrN9dtn5ICKwiAsCyfdMr+L1mSMK1ESe3nCUbtqFVFKLFOkxmXIbT
	qfVAu2oURqj8n6PjPqVrguBafCuGQoU7tpFgXG/oh0hsv6BIem0EFatwpzQsw8jZ
	RK0X0g8ONdWo0tXj2hZontmwvwtRPSlOdJAhz+CRv3HfIjk/CHvbEAiZZ1cJDlv1
	J0fefstqoy4HdYoCfxwqnXWgOYrX93OKTvVDJX9QVIXyyPpxM+EhEvxOY+MF3et7
	5uI2Q==
X-ME-Sender: <xms:xKdYY3f2UoguqyfSWS_wZGD6yclLJGr3qvGjLdey3N_zba9zULhicg>
    <xme:xKdYY9P2a0R6d_4_Xa8HVQN4zIDPwCG4yAdzbFzTZTgnChfdirnP6OS2pxqxif0DB
    79IoBhk4ibkxpn0XA>
X-ME-Received: <xmr:xKdYYwgCnp3lMwBsYbYcosJnwmQbhh3jowtzwc1yW7nrq3uvvIUb_hv_5JsTw1a1b1fRI-xp_3AkPfn0vOQOuuwMnq2goNPlMtbNE-SGyCI0fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddugdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdduhedmnecujfgurhepkffuhffvffgjfhgtgfgfggesthhqredttder
    jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
    gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvefhheeiieejieehgeeuhefgffduudev
    ueekudejfefhgffggedtieevueehgfdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:xKdYY495XSZVpp9b9ehhQEjTpzOcppe3lKfjjpjJCI-W-lHiwmGe1w>
    <xmx:xKdYYzsAG59rzFU8nWvsbUSS10OlQI3v6SHqfW_PBYQhqODfdxOxww>
    <xmx:xKdYY3G3_uEKpSdQ6VDWPMSwf53jwwpubtVwQO5oIlAYy-FWNmferA>
    <xmx:xKdYYx1YFuDPr_c9X3UPgRTZ972os5pTQBFjXT0LSTkDLoJQTmepKA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Oct 2022 23:21:39 -0400 (EDT)
Message-ID: <cf3cf708786602bef0aade511356420ee387e0f9.camel@russell.cc>
Subject: Re: [PATCH v3 3/3] powerpc: mm: support page table check
From: Russell Currey <ruscur@russell.cc>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 26 Oct 2022 14:21:36 +1100
In-Reply-To: <20221024003541.1347364-3-rmclure@linux.ibm.com>
References: <20221024003541.1347364-1-rmclure@linux.ibm.com>
	 <20221024003541.1347364-3-rmclure@linux.ibm.com>
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

On Mon, 2022-10-24 at 11:35 +1100, Rohan McLure wrote:
> On creation and clearing of a page table mapping, instrument such
> calls
> by invoking page_table_check_pte_set and page_table_check_pte_clear
> respectively. These calls serve as a sanity check against illegal
> mappings.
>=20
> Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK for all ppc64, and 32-bit
> platforms implementing Book3S.
>=20
> Change pud_pfn to be a runtime bug rather than a build bug as it is
> consumed by page_table_check_pud_{clear,set} which are not called.
>=20
> See also:
>=20
> riscv support in commit 3fee229a8eb9 ("riscv/mm: enable
> ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> arm64 in commit 42b2547137f5 ("arm64/mm: enable
> ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page
> table
> check")
>=20
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Russell Currey <ruscur@russell.cc>
