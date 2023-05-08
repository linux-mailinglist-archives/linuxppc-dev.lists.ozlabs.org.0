Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7266F9E4B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 05:40:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF6Wm4NfLz3fCY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 13:40:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=abgHvwb5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LZRt1LDN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=abgHvwb5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LZRt1LDN;
	dkim-atps=neutral
X-Greylist: delayed 192 seconds by postgrey-1.36 at boromir; Mon, 08 May 2023 13:40:03 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF6Vq0jpsz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 13:40:03 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id D19743200906;
	Sun,  7 May 2023 23:40:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 07 May 2023 23:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683517200; x=1683603600; bh=vj/C0EaqIaqhCvzJu9B9s1SCNHEKuWPHs+m
	LQ9/UBq4=; b=abgHvwb59tnOwN9kxLAqg+/Y6cLYDIXL3ZyZlum3HUszr7mkz1Y
	bUCl8cHFdaoRd801/AXTxG1QklXkrvVmF/8G9rTGAvOFK/fvFz979+aoFT+tV2d4
	cS3J70LIk0JOt9B+zSFsBusCpEWdHyw9vzWMInJ4KbkQqVjY5mr18i7ilhzU25wL
	LdqRtDYtmamY3K9b9yt/IwB1YlYrWNl8B/F6Z1eqEyWyFKL872DM70oJ8/Dv7UZh
	pmx8e/kNeidTkjKTL6gd4aBeYLZMDvT4S57erzr3gMSo4z5911U2wF4nTTTGdtue
	r80ljyExYPTOgiLSPoF6V0gDueCZDG+KYCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683517200; x=1683603600; bh=vj/C0EaqIaqhCvzJu9B9s1SCNHEKuWPHs+m
	LQ9/UBq4=; b=LZRt1LDNxaAk0aHvUSzlbdE2ZSMr0+LmBtII5QILlvNB5gwoUe6
	Bs44GsAkW+jcNENRoXMq+sWS3JcBx85y10On5SOh9de1fQpgzw2AhXQVBPNoKKeJ
	fx7fOlMJL/eyuISdV57q+AZAT8bD1EFy6TB3KuzN14OxScAa4j+ZXgMAMpuHq159
	/4iqD17HWiZidTUTYtf1RqqSpaxuuavaotrWX2K7onuPwPKrFzzdHd1wBiGXz74T
	+I0as7hD11p0E/sqTVrhPfZXT/3yymMa0UtpO5t9350iLyJrNFAHd6lJBHu/JJba
	i6AdvvIiHbWtXVXS1q6a7Y1/tBmtiK/JrVQ==
X-ME-Sender: <xms:EG9YZJxv-BiWs4k5vqeBVoO1paqt74zxTXphMXCdMSLyI72Q5Grm9w>
    <xme:EG9YZJTJ00m6f_01NhU10Wq9ThuZpaqFrBsuEWEQYD4iCUaAg8e-DzDERxCkkTOT4
    wWiXmUerNa_A9D41w>
X-ME-Received: <xmr:EG9YZDUkGNoErDfK8KLRwzJvgbgRCupW8pXnH8F_OYTOclTEjMn-dzvpQ8wPHVny6qwnSwstHx0IF9uP15IQGXyPaEGVbLbH3iF1XjdIYRSe3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:EG9YZLh0jihFmkTsWU8TOEQ7cu6_0jKrHkGSgpwWAaq-FYmO3wIqaw>
    <xmx:EG9YZLDGaKcbAFBuW5qv6B1VL7ayQoMkfOSj1dahTy3ZQYlSGxXz0g>
    <xmx:EG9YZEJVRbUB0fq_9tpEK11dW3DIYI9wYH4mPaoJFncRy5nDaIdqYA>
    <xmx:EG9YZA5fyvYpR5TjSO3qxtkV3wQsWpNYRwzhXAQ6NTp0hd0mi0Z2TQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 May 2023 23:39:58 -0400 (EDT)
Message-ID: <fdb67f021886118cac76e655b68553d4b3ad4aee.camel@russell.cc>
Subject: Re: [PATCH v2 02/12] powerpc/ptrace: Add missing <linux/regset.h>
 include
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 13:39:56 +1000
In-Reply-To: <20230330055040.434133-3-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-3-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-30 at 16:50 +1100, Benjamin Gray wrote:
> ptrace-decl.h uses user_regset_get2_fn (among other things) from
> regset.h. While all current users of ptrace-decl.h include regset.h
> before it anyway, it adds an implicit ordering dependency and breaks
> source tooling that tries to inspect ptrace-decl.h by itself.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Russell Currey <ruscur@russell.cc>

