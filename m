Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B25FC3AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 12:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnTJJ1mpxz3c2Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 21:23:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FZhr1hcj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EAqFbwrO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FZhr1hcj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EAqFbwrO;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnTHJ6XpDz2yPN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 21:22:36 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A49D732005C1;
	Wed, 12 Oct 2022 06:22:16 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 12 Oct 2022 06:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665570136; x=1665656536; bh=0JMSioevQ4
	gDTfOTdHVlyZsG3TVOQ8okNlP2UiBlbCM=; b=FZhr1hcjwxjwZ9oGJqVEKJFL17
	piqAn7hioFb+WOOcdMl/XuAWR8AUQemPasRLuPlURxzeDpCj3HWKP115LTRgQP+F
	V7AUW47Q9MFH17CRTC/xyDNuWaHEzX5KiNQW4raz9gKOebvvVdch9e+CunUoxPA2
	ZEfw/8ROOu7+BRRyuLkzUdSGeqbszckLhDEkIPYhcH6XOdfFWekS4CF/xorx2hoA
	3pAh4+kGGGmo7zt+nj+wTMtH49W32q9cHl36MJamHlSVpvLuWkNm1XlkxuNt5C4t
	9ePBUSgzPQr5z8Fv3VPjaITzEa6kR43ISF1IDKTTAnfY1cL7MHecauXOC1FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665570136; x=1665656536; bh=0JMSioevQ4gDTfOTdHVlyZsG3TVO
	Q8okNlP2UiBlbCM=; b=EAqFbwrOlxyzQa7oYdBXIhkYKLp56lfWaXrHDtGPT8cm
	94bwIQg+h/lIFgKEm86x6FHHR71rnbqF2k0ESnaPnw/bfKAFNukVE+jLsyLhKwwh
	10yqjJYP1GKwbBZngaM9thNUznU2zWrvGUnyZr0gpJFt3TbEzqudCpkrwJ2WjCqE
	WrHKukXzhFD+4a5k61uddsaLzKhPffKf2BtHkA7PZFZJnhZ6SiIPpRMav+ssdxJt
	d4bK+u4Nj8WZlDfPZgGo47RQORH45LLBNof1DGnk+g6pRdEWu030O8JCvvYaYnDX
	DLnOb4i9rp+JDlsdZ5Ce8aOuL2QC8N3kFgPIIA5DKg==
X-ME-Sender: <xms:WJVGY_rRcmqM8_k9VxRb95K-S5UK7yZnv0Y9aCRCKqJOYo8z9EWpxw>
    <xme:WJVGY5of-CEu4VlGUYDVI8B-9WE3sKJqZlXNUaAfTuNVERw2_UQ8QEJhKffNEA0m2
    SVcbyA7jpl9lFPs2wM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:WJVGY8MoYghTEr4zzGbDIiSGc_c-PIGCpVEhocvY03H7fQH0PknpPw>
    <xmx:WJVGYy75EbXojDEmDc5aIJdx2rwxtDqYwDbs3I_sRYLwyiNKeGWaYQ>
    <xmx:WJVGY-4wMhUfepD2Fn0ej-gqi0W0QhcpmPVE7nKBTX0iJWsYSuUGpg>
    <xmx:WJVGYzh7dDXLQQjNqQZ-x43T6SBcR_WrqeoXKhXzh_SaOzjYiPyGTA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F202DB60089; Wed, 12 Oct 2022 06:22:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <970f5125-2c32-4040-bab9-74ce04e0f2ea@app.fastmail.com>
In-Reply-To: <20221012035335.866440-2-npiggin@gmail.com>
References: <20221012035335.866440-1-npiggin@gmail.com>
 <20221012035335.866440-2-npiggin@gmail.com>
Date: Wed, 12 Oct 2022 12:21:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicholas Piggin" <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc: move sync_file_range2 compat definition
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022, at 5:53 AM, Nicholas Piggin wrote:
> sync_file_range2 is not a special unaligned-odd-pair calling convention
> syscall, it's just a regular one that does not have a generic compat
> definition. Move it out of sys_ppc32.c and into syscalls.c.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This one doesn't fix anything and is not required for the previous
> fix, so it could be merged later. Now that we've repurposed sys_ppc32.c
> for the difficult syscalls and compat syscalls live all over the kernel
> now anyway, IMO it's makes things less confusing to move this.

For this one, I would just move the implementation right next to
sync_file_range2() the same way we define compat_sys_sync_file_range(),
and share it with arm64.

      Arnd
