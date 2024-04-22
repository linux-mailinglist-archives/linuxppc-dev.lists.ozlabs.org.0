Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D11828AC6C6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:21:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJ9x44q6z3vxV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJ6x01Rqz3cjt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:18:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNJ6w6Mg5z4x2P;
	Mon, 22 Apr 2024 18:18:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Nicholas Miehlbradt <nicholas@linux.ibm.com>
In-Reply-To: <20240408052358.5030-1-nicholas@linux.ibm.com>
References: <20240408052358.5030-1-nicholas@linux.ibm.com>
Subject: Re: [PATCH v2] Add static_key_feature_checks_initialized flag
Message-Id: <171377378381.1025456.6870359647889434716.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 18:16:23 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 08 Apr 2024 05:23:58 +0000, Nicholas Miehlbradt wrote:
> JUMP_LABEL_FEATURE_CHECK_DEBUG used static_key_intialized to determine
> whether {cpu,mmu}_has_feature() is used before static keys were
> initialized. However, {cpu,mmu}_has_feature() should not be used before
> setup_feature_keys() is called but static_key_initialized is set well
> before this by the call to jump_label_init() in early_init_devtree().
> This creates a window in which JUMP_LABEL_FEATURE_CHECK_DEBUG will not
> detect misuse and report errors. Add a flag specifically to indicate
> when {cpu,mmu}_has_feature() is safe to use.
> 
> [...]

Applied to powerpc/next.

[1/1] Add static_key_feature_checks_initialized flag
      https://git.kernel.org/powerpc/c/676b2f99b0f6cd11193eeae13c976565c3fc7545

cheers
