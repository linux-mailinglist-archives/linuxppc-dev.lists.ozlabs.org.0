Return-Path: <linuxppc-dev+bounces-19-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E494ECD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 14:23:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjDFF2Pkwz2yGY;
	Mon, 12 Aug 2024 22:23:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjCmh6lGTz2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 22:01:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjCmh4zRCz4xCg;
	Mon, 12 Aug 2024 22:01:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen@kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20240731130720.1148872-1-tzimmermann@suse.de>
References: <20240731130720.1148872-1-tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] arch: powerpc: Use backlight power constants
Message-Id: <172346406498.772934.161880043570527957.b4-ty@ellerman.id.au>
Date: Mon, 12 Aug 2024 22:01:04 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, 31 Jul 2024 15:06:13 +0200, Thomas Zimmermann wrote:
> Commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants for
> power states") introduced dedicated constants for backlight power states.
> Convert PowerPC code to the new constants.
> 
> The new constants replace the fbdev constants. This is part of a larger
> effort to make kernel subsystems more independent from fbdev code and
> headers.
> 
> [...]

Applied to powerpc/next.

[1/2] arch: powerpc: Use backlight power constants
      https://git.kernel.org/powerpc/c/28455894bb99a1afe541cb7c987cc7e193c41fc6
[2/2] macintosh/pmubl: Use backlight power constants
      https://git.kernel.org/powerpc/c/c7907a47bb68a18758edf12fd45e201ff03e2acc

cheers

