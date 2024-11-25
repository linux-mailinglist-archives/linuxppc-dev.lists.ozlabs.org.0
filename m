Return-Path: <linuxppc-dev+bounces-3546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151219D82E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 10:52:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxgwK1HDGz2y72;
	Mon, 25 Nov 2024 20:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732528321;
	cv=none; b=haXoOYrQx1C2YV5ix0F2EQF8OWHeR0uU6DVR4c4mFsTLL5T2hT3e335aBLL0h//3lp+NVk6rD0H2vJuuFJ4x5IJ5nZegSsAdm95b+K7+nV/sDe995S4m4M6vCBOqg6nocqNONgmxVmSsPuMYIb+uqROXWxMQgtyyCh30Qox3/9RqnlyrCdFr1n5HE0XmBAOWDqtbBW+pmuWJq3qSTz6rZJWhMJ5LqKEYiuaB+AbgV3oMbuGbVA1H/Iz8cDwsFGSoM4eVY53HP7fxegMzL7LBdkL+2LcujKhbO4OMejjQ8EZMRLdeMFyKC1ILSOcrJp7oawI3fv0oRDn+I7GlkAzUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732528321; c=relaxed/relaxed;
	bh=xXQGNKC9g/gxVu2UclehtcajTzlHUR7Br/voSKreqhc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UAbRY6QyfpsXSo5cUffn6ovUcQXXrKnqbXm2avvtoebiAAZkKwQK9lC9pAkemWqzfAguYNS+JBkKFdmXVqz3jDlm+YEfMk5QnErY1FF0T6pR/irWZ8gVuf12p6gRs+7g9MdGB1NqibZ4k2Hn8WpwW3ZZu5UfxhTjGw6ADEQIANL6lUJvCZnfBLEN4RJTgUERSsu8ojlRjH3G/tvSe+fQ+pJbD9fJkbwC7L+wgqSqVhjGwexGvnf7t5y8GZRwSTi69ORbRV5HRJqZSVK+Uj62/AGwb0ZLmu/ALw98vdCYdpmdqdE4EGqm9tEG1fBaNlc3Fw9qfyNrRCoiGHSp5f4vkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FPReAO52; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FPReAO52;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxgwH1rszz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 20:51:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732528313;
	bh=xXQGNKC9g/gxVu2UclehtcajTzlHUR7Br/voSKreqhc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FPReAO52M8K8BxzdE6potA9MO88w945boEz40ZsO5Q56AgeXdZoYGBVRs8PYdAS45
	 5tx/j8HuHZYirKCbFL7AvrenQAlbNWj11NttW9TxgEOU+8sUbCQBK0SnOnvEyV2YV4
	 3d/gHTibFuBwZZlSjD4FWyCdScra+4NeQ5fgi9kKyQIaz5yXtte7zaL1GAV8EulKTc
	 58tMqJmDP2O1MPaqYkXRXHbTQvWDcx+MCyZKT7oxs7OaJtC5nlqmliWjDXqbPRBNNo
	 Wek/UR9WPBCqD+kkZIvoNYw2ZNYWs38hg3wYml8Gn6j3ZyWmm3+LRhWOXenm8tkcXN
	 J4MZP461zq/6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xxgw83vlyz4xcr;
	Mon, 25 Nov 2024 20:51:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-edac@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, bp@alien8.de, tony.luck@intel.com
In-Reply-To: <20241112084134.411964-1-mpe@ellerman.id.au>
References: <20241112084134.411964-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] EDAC/powerpc: Remove PPC_MAPLE drivers
Message-Id: <173252811445.21628.11243334718451760345.b4-ty@ellerman.id.au>
Date: Mon, 25 Nov 2024 20:48:34 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 12 Nov 2024 19:41:34 +1100, Michael Ellerman wrote:
> These two drivers are only buildable for the powerpc "maple" platform
> (CONFIG_PPC_MAPLE), which has now been removed, see
> commit 62f8f307c80e ("powerpc/64: Remove maple platform").
> 
> Remove the drivers.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] EDAC/powerpc: Remove PPC_MAPLE drivers
      https://git.kernel.org/powerpc/c/3c592ce7991cdf03bc7d139d790ce58c82c5903b

cheers

