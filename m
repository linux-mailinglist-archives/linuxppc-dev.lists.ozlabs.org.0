Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F15F44AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:49:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfFL44NSz3g6v
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:49:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1Z2jlcz3dqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1Z1Z8qz4xHH;
	Wed,  5 Oct 2022 00:38:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220927150419.1503001-1-mpe@ellerman.id.au>
References: <20220927150419.1503001-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: Make stack frame marker upper case
Message-Id: <166488996500.779920.5936049394897797698.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:26:05 +1100
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

On Wed, 28 Sep 2022 01:04:18 +1000, Michael Ellerman wrote:
> Now that the stack frame regs marker is only 32-bits it is not as
> obvious in memory dumps and easier to miss, eg:
> 
>   c000000004733e40 0000000000000000 0000000000000000  |................|
>   c000000004733e50 0000000000000000 0000000000000000  |................|
>   c000000004733e60 0000000000000000 0000000000000000  |................|
>   c000000004733e70 7367657200000000 0000000000000000  |sger............|
>   c000000004733e80 a700000000000000 708897f7ff7f0000  |........p.......|
>   c000000004733e90 0073428fff7f0000 208997f7ff7f0000  |.sB..... .......|
>   c000000004733ea0 0100000000000000 ffffffffffffffff  |................|
>   c000000004733eb0 0000000000000000 0000000000000000  |................|
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Make stack frame marker upper case
      https://git.kernel.org/powerpc/c/bbd71709087a9d486d1da42399eec14e106072f2
[2/2] powerpc: Reverse stack frame marker on little endian
      https://git.kernel.org/powerpc/c/19c95df1277c48e3ef8cc7d9f1d315dce949f203

cheers
