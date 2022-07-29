Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA1F5850C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSqL2V3Fz3hFb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:22:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSk45yFJz3gDX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSk45J6qz4xG0;
	Fri, 29 Jul 2022 23:17:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Rashmica Gupta <rashmica@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220617043135.426897-1-rashmica@linux.ibm.com>
References: <20220617043135.426897-1-rashmica@linux.ibm.com>
Subject: Re: [PATCH] powerpc/signal: Update comment for clarity
Message-Id: <165909978503.253830.13652864295899396561.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:03:05 +1000
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Jun 2022 14:31:35 +1000, Rashmica Gupta wrote:
> The comment being referred to was deleted in commit af1bbc3dd3d5 ("powerpc:
> Remove UP only lazy floating point and vector optimisations").
> 
> Add a bit more detail so it's clear why we need to clear the FP/VEC/VSX
> bits here.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/signal: Update comment for clarity
      https://git.kernel.org/powerpc/c/e4787e71ae2de3f60bc04fe09d1be4ef628b6c68

cheers
