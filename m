Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B28B6783
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 03:37:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNxDRsNt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT2qp0x85z3d89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 11:37:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNxDRsNt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT2q54tztz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 11:36:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E255461017;
	Tue, 30 Apr 2024 01:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCAAC116B1;
	Tue, 30 Apr 2024 01:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714440991;
	bh=hLCqbm6aIHgWboKq7U6esLVQy2ezFjYgNfa+jq86Qms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SNxDRsNth4mCdKAE8SCUUduLz58XEHWRJ66Ejp3clOgJy6mzJ66rHye7Ww32vrueX
	 +Th/oK03WOn40YOaiCrz5qQB2Xw3qTO7I1VUl7wXc0yL+aZI1GssRgLA9/eTm19IWz
	 eR6yy9Y9gs6eWkBaAighK+dJYYYSi/wCgrQZTnehBOQAGhJKFocjdXw+qdICOgSiHH
	 frwN6LiFL//c27KEwY47qWEBUl4NUMx4e1dGm6NHxKV3h88yYl+b5UL34ZUgxhCRQx
	 UmHBalOoNLAiTWNa5yuzQ6BDN5c9kg2SKWs8eLzAAYhAOPDtG1WjsVIcHASP/2UIjB
	 jHDfQS1Xo0Tlw==
Date: Mon, 29 Apr 2024 18:36:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370
 netpoll_send_skb+0x1fc/0x20c at boot when netconsole is enabled (kernel
 v6.9-rc5, v6.8.7, sungem, PowerMac G4 DP)
Message-ID: <20240429183630.399859e2@kernel.org>
In-Reply-To: <20240428125306.2c3080ef@legion>
References: <20240428125306.2c3080ef@legion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 28 Apr 2024 12:53:06 +0200 Erhard Furtner wrote:
> With netconsole enabled I get this "WARNING: CPU: 1 PID: 1 at
> net/core/netpoll.c:370 netpoll_send_skb+0x1fc/0x20c" and "WARNING:
> CPU: 1 PID: 1 at kernel/locking/irqflag-debug.c:10
> warn_bogus_irq_restore+0x30/0x44" at boot on my PowerMac G4 DP.
> Happens more often than not (6-7 out of 10 times booting):

Could you try with LOCKDEP enabled?
I wonder if irqs_disabled() behaves differently than we expect.
