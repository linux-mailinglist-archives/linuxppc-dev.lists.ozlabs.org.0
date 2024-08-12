Return-Path: <linuxppc-dev+bounces-16-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC894ECD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 14:22:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjDDX4W9Kz2y65;
	Mon, 12 Aug 2024 22:22:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjCl61mLLz2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 22:00:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjCl42fKCz4x9G;
	Mon, 12 Aug 2024 22:00:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: sean.anderson@linux.dev, camelia.groza@nxp.com, linux@treblig.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240528231123.136664-1-linux@treblig.org>
References: <20240528231123.136664-1-linux@treblig.org>
Subject: Re: [PATCH] soc/fsl/qbman: remove unused struct 'cgr_comp'
Message-Id: <172346398138.772106.1480775033029305821.b4-ty@ellerman.id.au>
Date: Mon, 12 Aug 2024 21:59:41 +1000
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

On Wed, 29 May 2024 00:11:23 +0100, linux@treblig.org wrote:
> 'cgr_comp' has been unused since
> commit 96f413f47677 ("soc/fsl/qbman: fix issue in
> qman_delete_cgr_safe()").
> 
> Remove it.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] soc/fsl/qbman: remove unused struct 'cgr_comp'
      https://git.kernel.org/powerpc/c/06ce0af34177a110d6a5cf71f924965b9b230691

cheers

