Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7499295D2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:14:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmRg5Gs9z3fsJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:14:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ20K1mz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:12:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ16JLyz4xNg;
	Sun,  7 Jul 2024 09:12:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240628121201.130802-1-mpe@ellerman.id.au>
References: <20240628121201.130802-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v3 1/7] powerpc/40x: Remove 40x platforms.
Message-Id: <172030740410.964765.17392972496862858325.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
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

On Fri, 28 Jun 2024 22:11:55 +1000, Michael Ellerman wrote:
> 40x platforms have been orphaned for many years.
> 
> Remove them.
> 
> 

Applied to powerpc/next.

[1/7] powerpc/40x: Remove 40x platforms.
      https://git.kernel.org/powerpc/c/47d13a269bbddd794e4ae393894103eed3dd84bc
[2/7] powerpc/boot: Remove all 40x platforms from boot
      https://git.kernel.org/powerpc/c/839ff58e63ce30988205706aa9ed22bd6bf229f3
[3/7] powerpc: Remove 40x from Kconfig and defconfig
      https://git.kernel.org/powerpc/c/e939da89d024a0de66b0270f1f1fab5fc44c74dd
[4/7] powerpc: Remove core support for 40x
      https://git.kernel.org/powerpc/c/732b32daef80567a7ef5be3d87ae79b6bfd9d82d
[5/7] powerpc/4xx: Remove CONFIG_BOOKE_OR_40x
      https://git.kernel.org/powerpc/c/002b27a51b364a59eac99b8d080afe3924c2e064
[6/7] powerpc: Replace CONFIG_4xx with CONFIG_44x
      https://git.kernel.org/powerpc/c/7bf5f0562b62ae94b4da577994b7b0e04e71d37b
[7/7] powerpc/platforms: Move files from 4xx to 44x
      https://git.kernel.org/powerpc/c/d5d1a1a55a7f227c0f41847b0598982f0a93170d

cheers
