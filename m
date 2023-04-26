Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA726EF427
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yZC59Q8z3glf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yMb62bCz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:08:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yMb4s07z4xNH;
	Wed, 26 Apr 2023 22:08:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Paul Gortmaker <paul.gortmaker@windriver.com>
In-Reply-To: <20230224204959.17425-1-paul.gortmaker@windriver.com>
References: <20230224204959.17425-1-paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/3] Remove some PQ2/MPC82xx evaluation platforms
Message-Id: <168251050529.3973805.12435281184168188654.b4-ty@ellerman.id.au>
Date: Wed, 26 Apr 2023 22:01:45 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Feb 2023 15:49:56 -0500, Paul Gortmaker wrote:
> [This RFC is proposed for v6.4 and hence is based off linux-next.]
> 
> This series removes support for two PowerQUICC II (MPC82xx) Freescale
> processor family evaluation boards that were added to the kernel in
> approximately the 2003 era.
> 
> I couldn't easily find a reference picture, but there are line art
> sketches in the various manuals still available[1,2].  In any case,
> we've got one system with 32MB RAM and the other with 64MB.  CPU speeds
> are also what one would expect for twenty year old platforms.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: drop MPC8272_ADS platform support
      https://git.kernel.org/powerpc/c/33777a4e9bb93f66ac2511d99ec66ab50f1a04bc
[2/3] powerpc: drop PowerQUICC II Family ADS platform support
      https://git.kernel.org/powerpc/c/859b21a008ebcc7fd876f50738f63750d46b5296
[3/3] powerpc: drop MPC8272-ADS and PowerQUICC II FADS shared code.
      https://git.kernel.org/powerpc/c/ad46ad2d853daf082f742c9654da84e3d2a46765

cheers
