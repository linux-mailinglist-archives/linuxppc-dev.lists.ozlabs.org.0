Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B15F8A7E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 12:02:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlczF2f5xz3f7p
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 21:02:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mlcx32mwPz3dqn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 21:00:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mlcwy4RTvz4x1F;
	Sun,  9 Oct 2022 21:00:18 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220920131157.1032707-1-mpe@ellerman.id.au>
References: <20220920131157.1032707-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Remove unused prom_init_toc symbols
Message-Id: <166530952655.1856352.16953718961291017894.b4-ty@ellerman.id.au>
Date: Sun, 09 Oct 2022 20:58:46 +1100
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

On Tue, 20 Sep 2022 23:11:57 +1000, Michael Ellerman wrote:
> Commit 24d33ac5b8ff ("powerpc/64s: Make prom_init require RELOCATABLE")
> made prom_init depend on CONFIG_RELOCATABLE.
> 
> But it missed cleaning up a case in the linker script for RELOCATABLE=n,
> and associated symbols. Remove them now.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Remove unused prom_init_toc symbols
      https://git.kernel.org/powerpc/c/0c32903197ce9f7119aee75a6bcaa4b49e0cd21a

cheers
