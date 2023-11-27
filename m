Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989617F9E15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 12:02:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QkIUe72q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf2j16kn9z3cVd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 22:01:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QkIUe72q;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf2h8217hz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 22:01:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701082862;
	bh=EpDIq0TRM3BRRgVZPPMTRFEoR5Q/FkolWUXiEN2dtlk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QkIUe72qFjWBb4ulKtgfKRQnxT3Tey0HpxiczAVjNXpPGqJJFaTAEeJn4rvf++2x1
	 VRqUd76cLw2f5MSiaVJXhHfUHjTi9KkEo88DF0oo1zJt0nNYVfGOBJkpEPMuPOB7aR
	 3Quif89NCJOC440f8nwbsoO3Xem5s+NxIOlq0okj6JKYwn/UPMyObVgvl0m6NlZG+P
	 /WoX0ZvIw8jMS7uqbA4/wrP/TtG2eNdibbHd5+WZWsBRFscJakr0mmewcVB1du4piz
	 vx7lcG4MT6IiXJG8rs6iMEYTV2tkF/QENdTOPbvReVjY+Nir/TsP4GdhcSAOa03HmR
	 om9Cs9V0kD3eQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sf2gx6D9rz4xFR;
	Mon, 27 Nov 2023 22:01:01 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the powerpc tree
In-Reply-To: <20231127114904.77f7efb6@canb.auug.org.au>
References: <20231127114904.77f7efb6@canb.auug.org.au>
Date: Mon, 27 Nov 2023 22:00:58 +1100
Message-ID: <877cm34g0l.fsf@mail.lhotse>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the tty tree got a conflict in:
>
>   drivers/tty/hvc/hvc_console.h
>
> between commit:
>
>   c9e38dc90e1c ("tty: hvc: Make hvc_remove() return no value")
>
> from the powerpc tree and commit:
>
>   7f30c19caf94 ("tty: hvc: Make hvc_remove() return no value")
>
> from the tty tree.
>
> These are slightly different versions of the same patch.

I'll drop it from my tree.

cheers
