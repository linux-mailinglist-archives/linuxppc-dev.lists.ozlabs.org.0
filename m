Return-Path: <linuxppc-dev+bounces-11066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C946B283DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 18:35:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3SQM6gY7z3chy;
	Sat, 16 Aug 2025 02:35:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755275723;
	cv=none; b=iK2Ng59v8QTm/xKIb/YyT2X1C/Fcpo0OBnqjkGwksZY0sI3tfGBXCyF3tSg3BIUKpjsYxfaOouHx+MKIaVQsy6Tt98REE7hzL0GRvUzFSOQx5WVckFRHiKa4u0JmJ7/ypv0Bl5aYymSdDudarGE3quJX19GO2PjNPsSoKHfEkrmo/CTwt/KCbNCt1vsphKJ3hHtc/e2mBR6W9znryXm7FlI2j6XY5uymHgbSnMlZTwa1qisCb6lMwTImldHQV7ADC9clfHb44Xq/h03eT+alHSDkoihi6SCyKUj2j9zJXJihVL+Vuu01Aaw1tAvu3quJVcMpJLJwD0buY/2HyVC/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755275723; c=relaxed/relaxed;
	bh=M+FiBhNVEKTanBHPsPidPYD5sI/E21Y1dPCbcMR2oLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLNQQse8gBYdGMj66j1E/zl8naafsWHh8vNUfDGwX8ru31UVF1WKNoC/cix8qyzywnWxvMMI7GnrQL+Hy02dEiJAW1kGxVd2LBLOZwaS6uX72X4cVv6MbKb66uZ2l5nxwbpcyK3lDm1qnr/KkCOPcXTjnycJ2KJoakVsrgjcGBpy8CvciDrMC5231VOmtg9PiiQf/jNC3MfcDkvku1UfwTxdh9ES+YKl45VRlOR8xzCPwQXKBS/pQd+UAJQY1BQ0lpv/eFTq5OPn42ZM2NEmb0pal4NglEkSGaJm2KY5O4U/JXPFczwhG+L1YdwzbvuoQ+UktjTI1RUxJ3XRSIa2eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3SQL5QVkz3chb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Aug 2025 02:35:21 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 57FGYuWM2568188;
	Fri, 15 Aug 2025 11:34:56 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 57FGYuon2568187;
	Fri, 15 Aug 2025 11:34:56 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 15 Aug 2025 11:34:56 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 05/17] powerpc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJ9hsHj9lsHvvhcA@gate>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-5-kees@kernel.org>
 <7f4f4d07-38f7-444c-adff-ec2a2387e86b@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f4f4d07-38f7-444c-adff-ec2a2387e86b@linux.ibm.com>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Thu, Aug 07, 2025 at 03:16:35PM +0530, Madhavan Srinivasan wrote:
> making them eligible for compiler optimization.

You can instead use GCC for this.  __builtin_ffs () exists since 2003,
and has this attribute built-in, as well as tens of other optimisations
that the kernel thing misses.

Of course using existing stuff instead of cobbling together something
half working prevents you from having a lot of fun ;-)


Segher

