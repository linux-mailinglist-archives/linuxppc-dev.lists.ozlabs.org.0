Return-Path: <linuxppc-dev+bounces-3379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46899D03AA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjC4R72z3bnq;
	Sun, 17 Nov 2024 23:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846335;
	cv=none; b=FvcpOhwFAKGRw0TMvG9OrlXQ/MmnGUFTjWySdYxnovkUevTPSjtmYN8bHlogWaDu437C+dN/kVAYgrypLi70dMj6QNPrBjak/t2koOqcMrkIrwA9qeQ4vncgLx/6eQZxw8ZQL1XjVAPt2ZyiYwoU9GecTFtcMDEQjq0tZdcViWXhCFvWSeAvuJ4r/ddX4/gykH4S8i8xb2n1i5NUjWvjaWAEP8qA8voZniWiXmN9z1wM4Zv5y7o313JxiHU378j3h4SVOIuEpSI/3OqHzRLQ7cXUDAh1/ssK1MaOIu0+F40OVHJBCeD5XKI1fbAcxEuk4f+wRlOX+Kvs92c8qq15UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846335; c=relaxed/relaxed;
	bh=9lWibbk1D5UT61L9PfAE59H8lBHp918beMmK9DrEsm4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A/2HH9HW84V2RoQUOpqfVN0FxQpIyQbsdI8fUJgMmOAvrovNP4fO7QnttsBCfB1yNzOyMloqNUGEsukjTkKQ/01x+/RgFDkRLX3cXIuGn3H7BC/QpU2OED/njgDyzVOAJWASMwPZTbqaPLN2YnRISWoAotmz4nJEK8ggG2oIPlS9EHTJmt2MSrRymKR9Gc0Sqga3B5/loN3lKO5IKVcc5MkEZRWBgj6/Zu8eIL6VJFcGpErML2acX+gtsOG4UpPagmTP839JuQUr44Dr50fRTwn5gnqVREYL/LQ+g7RBaHmkAv06MyJpvka9hR4e4X8oS2vWY7d9XCjQQJHAujD6Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NJ8iIp/G; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NJ8iIp/G;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj96gGCz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846331;
	bh=9lWibbk1D5UT61L9PfAE59H8lBHp918beMmK9DrEsm4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=NJ8iIp/GOYEHrRh22m9e9l/8bbPwXCXo0hjx3urfZT8UjFREbHCqw49zpEchW313Y
	 d9CsbPQOq/UR1+UkYyjoDYko7cSwpGybloncUNlOtM9qGc9LJ+bs/V+3ddvDMAsS6+
	 vybYuYLTs97seQ/QhlatwXVSmtSSOcvqtvMXq6Iww3JeuYTuTFgL+GgeBa7N0EuuUH
	 r+YSs2JaOsGK6F8smRjUHffPbBZ8hUICH853pUf+KS6OS9a1wtK5ET/t79BFYwLWEX
	 pHg0qXxT2TcNNUBAPLTxEAilAJHuefoUzBW7WEYxfUXcfrkCyOjGaieMHoJYDOzTm+
	 01t8fDzhG38xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj66h6tz4xfS;
	Sun, 17 Nov 2024 23:25:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240812063312.730496-1-mpe@ellerman.id.au>
References: <20240812063312.730496-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/modules: start/end_opd are only needed for ABI v1
Message-Id: <173184539744.890800.8094742091218684641.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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

On Mon, 12 Aug 2024 16:33:12 +1000, Michael Ellerman wrote:
> The start_opd/end_opd members of struct mod_arch_specific are only
> needed for kernels built using ELF ABI v1. Guard them with an ifdef to
> save a little bit of space on ELF ABI v2 kernels.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/modules: start/end_opd are only needed for ABI v1
      https://git.kernel.org/powerpc/c/f1c774ba91054a749573781f9e8fd652b9a1f633

cheers

