Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D35F4512
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:03:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfYh19KDz3fFK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 01:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1w2G0Gz3dwD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1w15Jqz4xHr;
	Wed,  5 Oct 2022 00:39:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Pali Rohár <pali@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220830225500.8856-1-pali@kernel.org>
References: <20220830225500.8856-1-pali@kernel.org>
Subject: Re: [PATCH] powerpc: dts: turris1x.dts: Fix NOR partitions labels
Message-Id: <166488986372.779920.5007717143695238322.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:23 +1100
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

On Wed, 31 Aug 2022 00:55:00 +0200, Pali Rohár wrote:
> Partition partition@20000 contains generic kernel image and it does not
> have to be used only for rescue purposes. Partition partition@1c0000
> contains bootable rescue system and partition partition@340000 contains
> factory image/data for restoring to NAND. So change partition labels to
> better fit their purpose by removing possible misleading substring "rootfs"
> from these labels.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: dts: turris1x.dts: Fix NOR partitions labels
      https://git.kernel.org/powerpc/c/c9986f0aefd1ae22fe9cf794d49699643f1e268b

cheers
