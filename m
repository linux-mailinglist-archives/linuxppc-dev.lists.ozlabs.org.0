Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16614820B37
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 12:09:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T2xFg6Mmdz3dFw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Dec 2023 22:09:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T2xDk2S8Jz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Dec 2023 22:08:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T2xDk0cdMz4wdB;
	Sun, 31 Dec 2023 22:08:22 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Geoff Levand <geoff@infradead.org>
In-Reply-To: <df906ac1-5f17-44b9-b0bb-7cd292a0df65@infradead.org>
References: <df906ac1-5f17-44b9-b0bb-7cd292a0df65@infradead.org>
Subject: Re: [PATCH] powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
Message-Id: <170402086357.3311386.8120508393556996228.b4-ty@ellerman.id.au>
Date: Sun, 31 Dec 2023 22:07:43 +1100
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

On Sun, 24 Dec 2023 09:52:46 +0900, Geoff Levand wrote:
> Commit 8c5fa3b5c4df3d071dab42b04b971df370d99354 (powerpc/64: Make ELFv2 the
> default for big-endian builds), merged in Linux-6.5-rc1 changes the calling ABI
> in a way that is incompatible with the current code for the PS3's LV1 hypervisor
> calls.
> 
> This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
> to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
      https://git.kernel.org/powerpc/c/482b718a84f08b6fc84879c3e90cc57dba11c115

cheers
