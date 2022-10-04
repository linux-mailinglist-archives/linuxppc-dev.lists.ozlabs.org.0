Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D25F44DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:54:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfMD1N1Fz3gSj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1h5cHCz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:04 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1d4Dz8z4xHP;
	Wed,  5 Oct 2022 00:39:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220916131523.319123-1-mpe@ellerman.id.au>
References: <20220916131523.319123-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Always select HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-Id: <166488985542.779920.15160759477705356388.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:15 +1100
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
Cc: lukas.bulwahn@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Sep 2022 23:15:23 +1000, Michael Ellerman wrote:
> Currently powerpc selects HAVE_EFFICIENT_UNALIGNED_ACCESS in all cases
> but one. The exception is if the kernel is being built little endian and
> explicitly targetted for Power7.
> 
> The combination of Power7 and little endian was never commercially
> supported, or widely used. It was only ever possible on bare metal
> machines, using unofficial firmware, or in qemu guests hosted on those
> machines.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Always select HAVE_EFFICIENT_UNALIGNED_ACCESS
      https://git.kernel.org/powerpc/c/ecf8f36446f53866727d9670df1746f8d20130a8

cheers
