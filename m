Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF7B5F44CA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfHm1fysz3gRy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:51:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1d1Wfsz3dqT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:01 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1d0Mj8z4xHN;
	Wed,  5 Oct 2022 00:39:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220928130912.1732466-1-mpe@ellerman.id.au>
References: <20220928130912.1732466-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Remove old STAB comment
Message-Id: <166488996806.779920.10383020371339275322.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:26:08 +1100
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

On Wed, 28 Sep 2022 23:09:12 +1000, Michael Ellerman wrote:
> This used to be about the 0x4300 handler, but that was moved in commit
> da2bc4644c75 ("powerpc/64s: Add new exception vector macros").
> 
> Note that "STAB" here refers to "Segment Table" not the debug format.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/64s: Remove old STAB comment
      https://git.kernel.org/powerpc/c/57a8e4b26eaa8f30aa8bc737255d192915a53023

cheers
