Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EC924CDC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 02:48:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2g0L0rv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDLkK5nfnz3c3l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 10:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2g0L0rv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDLjf2L29z30WX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 10:48:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72A21CE222B;
	Wed,  3 Jul 2024 00:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7F6C116B1;
	Wed,  3 Jul 2024 00:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719967683;
	bh=1VcpuV2FfStRLvavkaB9W9ZVWw/27dwvy043xnumcIc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=a2g0L0rvVlxqdwklQXrG7T3zapsQCIE77XX7VS/r0l1V/+mAsmadiMH1Uq3lWcmxH
	 hWcdoRIvHB/MMrSrmTRfyUMgixKmG4rTR2GV5eUMqnMDrhmpM5bZdq0LJKmqM0nf0n
	 NGiBpM+b+jVABKkhQzQ4mRM4BfeCV+Yx0jaQ7loTLtebnLI2AdcFvvnRzZsV8YEoEM
	 9wNSjye4IeQSSaATeL6d9OjTvDQW5XXymsNtVfnpAIVSqDHd34bCmqjMAM1zUoPDUX
	 ijyfomfEI68bKFWKz7+1qla1knFgX6YYLz7JAN/4EpjABEd5oAyZNeLFCJfPmr+Mnm
	 f/lm4JJ4qPUOA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jul 2024 03:48:00 +0300
Message-Id: <D2FHNOGO624G.HX2SKHYFXU4L@kernel.org>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Linux regressions mailing list"
 <regressions@lists.linux.dev>
X-Mailer: aerc 0.17.0
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
 <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
 <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
 <D2EFNJTR80JS.1RW91OVY1UH1N@iki.fi>
 <e7db74a0-cd5c-4394-b87e-c31ea0861ea1@linux.ibm.com>
 <b7559dbb323d16fb334f8f8f35b8fda3fb6e481c.camel@iki.fi>
 <85f882ff079554c41a73d8ad4275072c5229f716.camel@iki.fi>
 <D2FHD82R8YAC.YBL9FAIVMBWL@iki.fi>
In-Reply-To: <D2FHD82R8YAC.YBL9FAIVMBWL@iki.fi>
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
Cc: naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jul 3, 2024 at 3:34 AM EEST, Jarkko Sakkinen wrote:
> https://lore.kernel.org/linux-integrity/20240703003033.19057-1-jarkko@ker=
nel.org/T/#u
>
> There's also bunch of other drivers than tpm_ibmvtpm so better
> to limit it to known good drivers.
>
> I can take at the actual issue in August and will review any
> possible patches then. This one I'll send after my current PR
> for TPM has been merged.

After this patch has been merged to mainline, you can send your change
as a feature patch for tpm_ibmvtpm and replace Kconfig line with
"depends on ... || TCG_IBMVTPM".

This zeros the risk other drivers than tpm_tis, tpm_crb and tpm_ibmvtpm,
and thus is the only possible solution that I'm willing to accept in
*fast phase*". I.e. the most conservative and guaranteed route, like
anyone with sane mind should really.

BR, Jarkko
