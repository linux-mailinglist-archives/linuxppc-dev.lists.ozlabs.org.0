Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA78697C36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:49:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyZk6g1Cz3g60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:49:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRP61Qsz3chB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRP4sw7z4x8B;
	Wed, 15 Feb 2023 23:43:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230203113858.1152093-1-npiggin@gmail.com>
References: <20230203113858.1152093-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/3] powerpc: prepare for pcrel addressing patches
Message-Id: <167646485047.1421441.7759763379319808164.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:50 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Feb 2023 21:38:55 +1000, Nicholas Piggin wrote:
> Here's a few of the easier preparation patches from the pcrel
> addressing series.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (3):
>   crypto: powerpc - Use address generation helper for asm
>   powerpc/64s: Refactor initialisation after prom
>   powerpc/64e: Simplify address calculation in secondary hold loop
> 
> [...]

Applied to powerpc/next.

[1/3] crypto: powerpc - Use address generation helper for asm
      https://git.kernel.org/powerpc/c/26d53a9c89a8486c5c637cc587e1933a786747d0
[2/3] powerpc/64s: Refactor initialisation after prom
      https://git.kernel.org/powerpc/c/58f24eea5278cb6078552e16063fdd8b0a1b9676
[3/3] powerpc/64e: Simplify address calculation in secondary hold loop
      https://git.kernel.org/powerpc/c/ffc8e90decc531a2dd59ef9e1e6f16a52057ab62

cheers
