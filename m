Return-Path: <linuxppc-dev+bounces-14140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954BDC54C2A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 23:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Jfh2ZH5z2ytT;
	Thu, 13 Nov 2025 09:56:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762988172;
	cv=none; b=fSpcqnJkPydLlec5tKoLnALNHRNo761b0Jny7MQ5hR3tFvMFUVZrWPAeCuZ+uifYfbMRmsfulIZFXFh9MZqmFXMJQ3b2uRgJOzIXQvBFaQ56/yAdMfGevVoaTDfwpzEtkC7Z7mGEv7jUSv/htNJkNzJmz3pn/rv52wCAAjIjY0C1eGutBK7o3Vlz1pWaskx1ou8eZPcsVc0FNhbPvd71SeE0tKqjMHmaG5jKASSvJXZzPnR6d0oG1kVi5MsPE+DByOf2owv9yZoGKXPQ/fU5i5W6FMJ8VJcObQLYFpmtdTUPKd6UZKVw1RxvlJ8IYsxEcLOcuExB1OZrr6tJLWFc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762988172; c=relaxed/relaxed;
	bh=PlGerhTeauyxsfn5crLm18+LSewkwaei4U9yH2f8cqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrFSh1PBTesDEj4aTMpju54W8LFZSKHdmBO3Cl/MZsHEIOF3wEL4Krr07vP0AZDVFNWu0m30OfJ0lnqNeaqImg8ar/+JK8Br2Mkj9V3kwTRVr5E4+ERSY96gytYTI9ZrxrjISmVcnidnmLxDAjPOWcUvBfSfBEwVx0FMgjZXpLTO5hEPppoXw4zmPNpNTllFNfor3gf7CGVVcf2PfP2R0z7h64Ym4FusdG/eWDfV5iEIiOD4QU91js4PRnJMv2hFZ51Fiw3aOAjg9z0AzdhilR8YgOQMbNxppcvi0FCI3U3FC9Cs/jF2ZF9V9uyKZk8lolyZ2/3QwRbYPBv+IboujA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T3U9ZtLM; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T3U9ZtLM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Jfb4Xlmz2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 09:56:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1723C41A36;
	Wed, 12 Nov 2025 22:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52672C4CEF7;
	Wed, 12 Nov 2025 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762988165;
	bh=6F6Ph+mBRwZHPlibDEBt422QzwWtBzRDmoS6rRlf2hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3U9ZtLM8oF+kzwDvVB6ER2pdVinRk5S03N501V/zUwBf6e1RlR6A6xXm5aIaa7Cn
	 q3Nq9EZCjqNhWva/F9gIOuh+F+VXr1k6y0kWZ4vLv6+b64tGfdnq8tneBfw3W6T35Y
	 KWX4Ji5xBnKC3ywMWL7cgkbSDMFbbCMlWVC56KAlU/xFqKwnviNZIOZOndB9L2JvW1
	 nAlyqxi22NF3r/Z69UIuqvwnQd827gKajQLuDca6ikDdsCwbfE3Ox0V1oPJk7ExBnk
	 5Qud0WfyMmuKAc/ZJ1u3uUov/XZo+XcfKF0LokYIlI5mYTJcRFnyjWIoE52yB+WHzd
	 xotO3IleRDYoQ==
Date: Wed, 12 Nov 2025 14:56:02 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Jan Stancek <jstancek@redhat.com>
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check
 scripts
Message-ID: <z4go2m2c7ufulwjk7vkcpv2oyfo2jwpxzieiuuetegnv7sjrsj@gbjwkp2dpdyd>
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 23, 2025 at 05:32:16PM +0200, Jan Stancek wrote:
> We've been observing rare non-deterministic kconfig failures during
> olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> disabled and with it number of other config options that depend on it.
> 
> The reason is that gcc-check-fpatchable-function-entry.sh can fail
> if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> there is still someone writing on other side of pipe. `pipefail`
> propagates that error up to kconfig.

Ping?  This fixes a nasty build bug, any objections to merging?

-- 
Josh

