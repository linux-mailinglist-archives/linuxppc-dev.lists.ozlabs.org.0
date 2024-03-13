Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84287A874
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 14:31:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvryB2TDKz3wFy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 00:31:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvrt31npTz3cC9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:27:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tvrt3117wz4x2r;
	Thu, 14 Mar 2024 00:27:55 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240229122521.762431-1-mpe@ellerman.id.au>
References: <20240229122521.762431-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/5] powerpc/64s: Move dcbt/dcbtst sequence into a macro
Message-Id: <171033598342.517247.1896448861294695847.b4-ty@ellerman.id.au>
Date: Thu, 14 Mar 2024 00:19:43 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Feb 2024 23:25:17 +1100, Michael Ellerman wrote:
> There's an almost identical code sequence to specify load/store access
> hints in __copy_tofrom_user_power7(), copypage_power7() and
> memcpy_power7().
> 
> Move the sequence into a common macro, which is passed the registers to
> use as they differ slightly.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/64s: Move dcbt/dcbtst sequence into a macro
      https://git.kernel.org/powerpc/c/8488cdcb00fd5f238754005a43a3a7445860d344
[2/5] powerpc/64s: Use .machine power4 around dcbt
      https://git.kernel.org/powerpc/c/4e284e38ed586edeb8bdb2b0c544273a7f72021c
[3/5] powerpc/fsl: Fix mfpmr build errors with newer binutils
      https://git.kernel.org/powerpc/c/5f491356b7149564ab22323ccce79c8d595bfd0c
[4/5] powerpc/fsl: Modernise mt/mfpmr
      https://git.kernel.org/powerpc/c/f01dbd73ccf122486ad4b52e74f5505985dd6af4
[5/5] powerpc: Remove cpu-as-y completely
      https://git.kernel.org/powerpc/c/ca3d3aa14e7673f1b15e862b71998a4664d50ebe

cheers
