Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E293B78E542
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:06:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbnfJ623vz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncH3tS2z2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncH2yLRz4wy7;
	Thu, 31 Aug 2023 14:04:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20230705023056.16273-1-joel@jms.id.au>
References: <20230705023056.16273-1-joel@jms.id.au>
Subject: Re: [PATCH] powerpc/config: Disable SLAB_DEBUG_ON in skiroot
Message-Id: <169345455032.11824.1134842974966694048.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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

On Wed, 05 Jul 2023 12:00:56 +0930, Joel Stanley wrote:
> In 5.10 commit 5e84dd547bce ("powerpc/configs/skiroot: Enable some more
> hardening options") set SLUB_DEUBG_ON.
> 
> When 5.14 came around, commit 792702911f58 ("slub: force on
> no_hash_pointers when slub_debug is enabled") print all the
> pointers when SLUB_DEUBG_ON is set. This was fine, but in 5.12 commit
> 5ead723a20e0 ("lib/vsprintf: no_hash_pointers prints all addresses as
> unhashed") added the warning at boot.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/config: Disable SLAB_DEBUG_ON in skiroot
      https://git.kernel.org/powerpc/c/cdebfd27292ecdebe7d493830354e302368b3188

cheers
