Return-Path: <linuxppc-dev+bounces-14381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03685C76294
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 21:16:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dC8kB4Fyjz2yvL;
	Fri, 21 Nov 2025 07:16:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763669762;
	cv=none; b=BszmROPLilqCWo+h7WohhJ2YGSDls4TdJL4qKpj8C+uV9vXwGvYVXcfjkXRlEJQznsqq4IM0qDi4/99VERtPgpd72cqvlc6SYbq6TJHBVh3UBgXl6HXQ7L7iVjlfDo53RdHSLsoZTeC6W4j6Gs8HFErWh8NFZyAHAR3l2puUV9rWaz7l1gfO45h6HK2c940PqAlQRO51xNxJDvCPhvzhR6qF49bOxbzeiexN5W38X9MEGMfUloZAwtJjqCdxH8BtH7pTS4Pg0cVItvyZlFzZ9QYsrCGcSOpplvCnwtduS9jsWT1+L3Pci8T2f8Op6RY5mLCmhkCkNrC8bbPVqhRO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763669762; c=relaxed/relaxed;
	bh=OLl64RVwbxG7uWMTRj+QY42tMwVazdb3ajQCCN58D/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/zyvKAHnqzQ5GasvrzZbNrZWKgHOvWHnKIO0KM8fsZUN24S1c+5/ELBvVBStVUSZ4a0kIrw+2Aer6KLFrJvqmc26QSjgApQRQtwtkKNCs6eIChRbRWoSUMXPmcXB76Odrt5Mknjy4eX2RhZLovol463swvbCRrCttJJ7Azg6l8bTtoH4Kko0VBOxC7vzsC9LIFol8yK0aPVFImf5V8wxwKTNvv5ZQgxReOAZgzd4vR432xNC4LDpVDTXgzJyBjgVLCScdKAkeCh/5lH+2/pGzgv/DF5DnM1KUsYMS049Fa261X0F1h3InRkmSLO6m4DHIJfeAYB/cj3hdm59hsMLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBeYe4xN; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aBeYe4xN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dC8k86GrWz2yFq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 07:16:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 806A144080;
	Thu, 20 Nov 2025 20:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC582C4CEF1;
	Thu, 20 Nov 2025 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763669758;
	bh=UVvLhmqpWsCeKRPq24w1NmHmZ13Ys5GIiVAPutH6rLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBeYe4xNr9rBxhDTF+/AZm9PdyFdsFK0lecmz/AfH/WyxhIThpr9Vv0PD/vtDOLMV
	 clZ1SuNl6vKhkpvXfVyOQOpHVXsXOLhKJ0q/nCy0OTAEU2hhvpm9vqgk+3FiW8nFF2
	 KaVho+HcG+ruGM4iHnJb7TdCmaArotnL6/lKLC1ZshijnCl6HI1L8xwEVk9OXn3N/4
	 kgqGWI99/qNv462kJ1RveNYIanmYglrXmzz7kb4Q8qw205XAdgz7DbNHVJ47jzkSGk
	 ByXMN27IIO9Fhzg9cbXJTUMzWxXHL/smYBaFsWKRyksEHCggud5roWs/Akp6EUnmSA
	 w6Nxx0RYXhVow==
Date: Thu, 20 Nov 2025 12:15:56 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Jan Stancek <jstancek@redhat.com>
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check
 scripts
Message-ID: <qtnjbiz2wq35mmisa2dljpvslnmc3wmygxsq5usmiml223ry3r@eze7qwlrgx5p>
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
 <z4go2m2c7ufulwjk7vkcpv2oyfo2jwpxzieiuuetegnv7sjrsj@gbjwkp2dpdyd>
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
In-Reply-To: <z4go2m2c7ufulwjk7vkcpv2oyfo2jwpxzieiuuetegnv7sjrsj@gbjwkp2dpdyd>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 12, 2025 at 02:56:05PM -0800, Josh Poimboeuf wrote:
> On Tue, Sep 23, 2025 at 05:32:16PM +0200, Jan Stancek wrote:
> > We've been observing rare non-deterministic kconfig failures during
> > olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> > disabled and with it number of other config options that depend on it.
> > 
> > The reason is that gcc-check-fpatchable-function-entry.sh can fail
> > if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> > there is still someone writing on other side of pipe. `pipefail`
> > propagates that error up to kconfig.
> 
> Ping?  This fixes a nasty build bug, any objections to merging?

Ping?

-- 
Josh

