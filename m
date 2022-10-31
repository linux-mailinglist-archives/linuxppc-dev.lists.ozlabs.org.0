Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492D613E6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 20:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1NlJ0dXmz3cMl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 06:39:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=GYtvJSOq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rmsf3ZPz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=GYtvJSOq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rmsf3ZPz;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1NkH1ZmRz3bjk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 06:38:45 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id ACBA65C0112;
	Mon, 31 Oct 2022 15:38:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 31 Oct 2022 15:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667245121; x=1667331521; bh=MgNMSe6Xf7
	10RuzoxZeq3x7szaWx6N8myLp+SDNFSe8=; b=GYtvJSOquCisowS7lMj95XRnai
	HXhceTK3YeqChDQxWMmfvKqmsNUIOJN2Hwn7x6TtsXG5RYUmqU0sStkVRaLvdHwN
	I/WCrBX3c1n55wKIgUkFlyZ130JTu25RP/1MxMGxV8RmLx1HHOZGbFCcMDURq5WB
	5F8J0PKKE57fGuSs3ZI+MT6jZQk04cpxJIyi2HEIdJ43Q/Zad76KqXUcAPfRS/WV
	0luwVG7oANO2s7S0oWoOiHRhp16utRJ5Hx3mJ9LvcK4aU3xEU4C4X7s6alWeEVQL
	Gx4O2k6njR31+cBbFKZ9yvwcUfvJO1RXGNWFTkk9+JtO/d0OS5U0sSnCMR0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667245121; x=1667331521; bh=MgNMSe6Xf710RuzoxZeq3x7szaWx
	6N8myLp+SDNFSe8=; b=rmsf3ZPzcjqZKd1HK7MlVqEAF/NKNl+tM5BbR81HmEiZ
	hq6zixE7SIVXsKVdz6wyRFM59O/s7tYPO5rAB8PP9eifqzRShuaUV/urGeClfNdv
	ie2lDEANpo94Fgt2Kce+8An1Hmi4JD9Iis8S3+x4YW0dLS/G0+eOoR1RiK60s+eB
	/IpA9vSl8o2F1b7doP31xFc9Bq7ENxDM18HqFVZHBKEh2HEzZ2ldQB3YQwZryMBo
	ZA8moK8kDabfCUc3ZYe0Lm+dQXm8nafpN6hnD8jHs1rYMbwduP89c45WavYm9+Xl
	bNaNGZxKxoNJaTZxhKJWLMD2sBPHtqTwRcxuJpK/DA==
X-ME-Sender: <xms:QSRgY_5pZ5-aquYMMmcl0hXilQzBNNetZsEtDAIx8GQr-v9adXr9HQ>
    <xme:QSRgY05xYArUlWq3OC4QTTf0dJKIAda4e-r_--4PkSXT_AFI7FwZEUcxHPY0b4fmP
    yrz2YJJ-chYjQBbVH0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:QSRgY2eqJCAvhjHzppr5q8jhArr7aN6kLpEEuYO-uMEL7wAoJKCsmg>
    <xmx:QSRgYwKEjE7D3pMyMBnAHoFklNu0GxlEv9eV9vJAiVyXelp1DmYJcw>
    <xmx:QSRgYzLFiVoTESrzmdCXfFNccQpvHyvb4hlrWXcI3KoambrQfHQrSQ>
    <xmx:QSRgY5hNu9OE5Og6ekt5EgHSctrwADEn_E-pUmZd_eAA9_kDCJVdFg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0C1BCB60089; Mon, 31 Oct 2022 15:38:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <8c0317c2-1175-4feb-8d3f-d1d2e94b577b@app.fastmail.com>
In-Reply-To: <87mt9cxd6g.fsf_-_@igel.home>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-22-rmclure@linux.ibm.com>
 <87mt9cxd6g.fsf_-_@igel.home>
Date: Mon, 31 Oct 2022 20:37:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Schwab" <schwab@linux-m68k.org>,
 "Rohan McLure" <rmclure@linux.ibm.com>
Subject: Re: [PATCH] powerpc/32: fix syscall wrappers with 64-bit arguments
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022, at 15:47, Andreas Schwab wrote:
> With the introducion of syscall wrappers all wrappers for syscalls with
> 64-bit arguments must be handled specially, not only those that have
> unaligned 64-bit arguments.  This left out the fallocate and
> sync_file_range2 syscalls.
>
> Fixes: 7e92e01b7245 ("powerpc: Provide syscall wrapper")
> Fixes: e23750623835 ("powerpc/32: fix syscall wrappers with 64-bit 
> arguments of unaligned register-pairs")
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>

This looks correct as a minmal bugfix to be backported.
I have cross-checked the syscalls with 64-bit arguments that
have special handlers on powerpc against the list from x86
to make sure there are no other obvious ones that need a
similar fix.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> +
> +#ifdef CONFIG_PPC32
> +SYSCALL_DEFINE6(ppc_fallocate,
> +		int, fd, int, mode,
> +		u32, offset1, u32, offset2, u32, len1, u32, len2)
> +{
> +	return ksys_fallocate(fd, mode,
> +			      merge_64(offset1, offset2),
> +			      merge_64(len1, len2));
> +}
> +#endif

This is identical to compat_sys_fallocate() and to
(an andian-corrected) sys_ia32_fallocate(), right?

I still think we should eventually generalize this further and
make all these handlers architecture independent to prevent the
same bug from happening on additional architectures, but that
should probably be done separately.

     Arnd
