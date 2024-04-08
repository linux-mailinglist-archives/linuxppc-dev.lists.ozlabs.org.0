Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C51D89BDCB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 13:11:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RvRtIJvp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCmcZ6K3cz3fCg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 21:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RvRtIJvp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCmbs2v80z3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 21:10:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712574645;
	bh=Yg3RVxf1aZyORcaVE7KcrdEXd2LJDhZI4EMkqtk5Q4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RvRtIJvpmpQ3rE/TbgnFxKbNxYndCntkwwPN3sdGbr/0RcsRftsP9uWYaxrnp1x8l
	 hf5HQ8p5mUes6H4WBkUglJB1nVCU/Eo/3TtE/cHI9sIPz+4Ko3k2V+xqTYhiULDrHY
	 bftXt1/OSdH6RmfnnxMn8FrHCRI3Zzo66PYe+41Al24KsFzfdvDlb01fhoINwYBuU1
	 W22yIBl0MLvUltJRUw/3tP3jf/l8deJaJqlnoaHqBKkKkMqFC1F7XkZgYKL4G9Es8/
	 9UK4sSr156PUfq4aECD5pvAWE2CNm2gQkhzgp3ghXXwfH+EuDW+/75R9p2lxMP7N5P
	 jT43zyDW4pLYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCmbn1pSyz4wcF;
	Mon,  8 Apr 2024 21:10:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: Re: [PATCH v2] Add static_key_feature_checks_initialized flag
In-Reply-To: <20240408052358.5030-1-nicholas@linux.ibm.com>
References: <20240408052358.5030-1-nicholas@linux.ibm.com>
Date: Mon, 08 Apr 2024 21:10:43 +1000
Message-ID: <87msq4az4c.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Miehlbradt <nicholas@linux.ibm.com> writes:
> JUMP_LABEL_FEATURE_CHECK_DEBUG used static_key_intialized to determine
> whether {cpu,mmu}_has_feature() is used before static keys were
> initialized. However, {cpu,mmu}_has_feature() should not be used before
> setup_feature_keys() is called but static_key_initialized is set well
> before this by the call to jump_label_init() in early_init_devtree().
> This creates a window in which JUMP_LABEL_FEATURE_CHECK_DEBUG will not
> detect misuse and report errors. Add a flag specifically to indicate
> when {cpu,mmu}_has_feature() is safe to use.

I'm not sure it warrants a Fixes: tag, but it was commit
ca829e05d3d4 ("powerpc/64: Init jump labels before parse_early_param()")
which added the earlier call to jump_label_init() and created the window
where the debug checks don't fire.

cheers
