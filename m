Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D79447F34
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 13:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnqTs1p6qz2yy3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 23:01:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f399M/Up;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnqT94lm4z2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 23:01:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f399M/Up; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HnqT93PNtz4xbw;
 Mon,  8 Nov 2021 23:01:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636372877;
 bh=ZJtG7/545/BVzk7LIuEsY5H7GCcB3kEe7ULLXCPMHuo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f399M/UpVdc1DkQ1dSLOlfvUbiMsbUejIpudiyuuVDOPNjPyb/kp4yDLH6wF5iRaR
 f+srfb+q32BDMLCsVN5NUUfqOeEMM9Z489RzijxXRDWUY3AkqOy/I9OiQUzpgJTE5c
 2nYdBoJClOd18eDBeNiz9sf7MfVtj0wEXreBown2Yo52h+ruNprvWKPdG6u4Ces2/R
 7OuvUl5oj6I1GYq5uI11DOwpcFt3sX+liu0e2V+PsxoBAwB/3QlOyZcyA0DYeojD7y
 tRzq20UZ+Arl0j8swn7prENm66zRMxk6ddT+CbGcxEJWMs26jEWIK8ICVTsVzsa4Wy
 ZMEXzYq0YPhxA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 20/25] powerpc: Use do_kernel_power_off()
In-Reply-To: <20211108004524.29465-21-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
 <20211108004524.29465-21-digetx@gmail.com>
Date: Mon, 08 Nov 2021 23:01:17 +1100
Message-ID: <87lf1y7t6a.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dmitry Osipenko <digetx@gmail.com> writes:
> Kernel now supports chained power-off handlers. Use do_kernel_power_off()
> that invokes chained power-off handlers. It also invokes legacy
> pm_power_off() for now, which will be removed once all drivers will
> be converted to the new power-off API.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/powerpc/kernel/setup-common.c | 4 +---
>  arch/powerpc/xmon/xmon.c           | 3 +--
>  2 files changed, 2 insertions(+), 5 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
