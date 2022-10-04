Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D035F44FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfVq36N2z3h0h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 01:00:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1t4fc8z3dsV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1s5rJyz4xHj;
	Wed,  5 Oct 2022 00:39:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Pali Rohár <pali@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220902212103.22534-1-pali@kernel.org>
References: <20220902212103.22534-1-pali@kernel.org>
Subject: Re: [PATCH 1/2] powerpc: Fix SPE Power ISA properties for e500v1 platforms
Message-Id: <166488994758.779920.14841742277370652020.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:47 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2 Sep 2022 23:21:02 +0200, Pali Rohár wrote:
> Commit 2eb28006431c ("powerpc/e500v2: Add Power ISA properties to comply
> with ePAPR 1.1") introduced new include file e500v2_power_isa.dtsi and
> should have used it for all e500v2 platforms. But apparently it was used
> also for e500v1 platforms mpc8540, mpc8541, mpc8555 and mpc8560.
> 
> e500v1 cores compared to e500v2 do not support double precision floating
> point SPE instructions. Hence power-isa-sp.fd should not be set on e500v1
> platforms, which is in e500v2_power_isa.dtsi include file.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Fix SPE Power ISA properties for e500v1 platforms
      https://git.kernel.org/powerpc/c/37b9345ce7f4ab17538ea62def6f6d430f091355
[2/2] powerpc: Include e500v1_power_isa.dtsi for remaining e500v1 platforms
      https://git.kernel.org/powerpc/c/c102432005e8811b80b25641e12c4577970b5558

cheers
