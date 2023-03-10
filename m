Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF3C6B3BDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 11:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY2946HXHz3cht
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 21:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VBK1EyHg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY2863jsXz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 21:18:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VBK1EyHg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PY2854VW8z4x4r;
	Fri, 10 Mar 2023 21:18:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678443525;
	bh=jiJuyTX5wFANGcuOeY73DhON2fnne2lEj0SJrCko2lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VBK1EyHgI7Ah60Dwwosee2JOBs/BGT8QYjNSoJ9mMCZpXB6cfJKi0eaKz4LhRXuRF
	 JkogByCJps4SkQWaT5Qg6PDUyGqGTCT6Im1+dTwAoS+w7FwGVIR4yG1kC/cEpFBrbA
	 RwJaYGuzEA9M2Yt3UaNK1i5UjSfkwdKJOGFVPite+pMIsJEvlGT2nYILK0XdxcSBBb
	 K0KmjyDtxEYWj4kEUbydq3tWAzrD8Q2Ud/u8Ljl3BIDnJrjURVCin9/mwRUeRi8kO1
	 V/Mv3oJT/nM6stubCmTJlFQieXkU5I3w+HLx5A6ygk2vBd9397gcQ0BLbEm1JjXU9j
	 EfYX0QZEb7XWQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: PPC: Mark three local functions "static"
In-Reply-To: <20230308232437.500031-1-seanjc@google.com>
References: <20230308232437.500031-1-seanjc@google.com>
Date: Fri, 10 Mar 2023 21:18:42 +1100
Message-ID: <87ttysoqnx.fsf@mpe.ellerman.id.au>
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
Cc: Sean Christopherson <seanjc@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:
> Tag a few functions that are local and don't have a previous prototype as
> "static".
>
> No functional change intended.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303031630.ntvIuYqo-lkp@intel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>
> This was prompted by a new W=1 build warning for a commit that went in
> through the KVM tree, but said commit has made its way to Linus, so it
> shouldn't matter who grabs this.

OK thanks. I'll take this via the powerpc tree for v6.4.

cheers
