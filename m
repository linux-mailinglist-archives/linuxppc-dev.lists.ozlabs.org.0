Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAC5F44C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:50:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfHB6ZVwz3gNs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:50:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1c0wTVz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1b6vNwz4xHL;
	Wed,  5 Oct 2022 00:38:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220913124545.2817825-1-mpe@ellerman.id.au>
References: <20220913124545.2817825-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Remove unused SYS_CALL_TABLE symbol
Message-Id: <166488985138.779920.17518270170170849576.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:11 +1100
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

On Tue, 13 Sep 2022 22:45:45 +1000, Michael Ellerman wrote:
> In interrupt_64.S, formerly entry_64.S, there are two toc entries
> created for sys_call_table and compat_sys_call_table.
> 
> These are no longer used, since the system call entry was converted from
> asm to C, so remove them.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Remove unused SYS_CALL_TABLE symbol
      https://git.kernel.org/powerpc/c/e74611aa91bb9939dfc4a41b045a1a19227cff98

cheers
