Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB86DD702
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 11:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwgl00RFVz3f3r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 19:38:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IysLWq27;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwgk76JNsz3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 19:37:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IysLWq27;
	dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4Pwgk52nX0z4xFd; Tue, 11 Apr 2023 19:37:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1681205869;
	bh=ZqYO+3AAJ7KdoPIQv+9ft6lOTImzO3egTdFAE+QjTNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IysLWq276d8TOdhvNMHA8UHL/7Esa9zUf65Wv2wj0jsCkvxZ7sXNjFyQpiMqMMP3m
	 mrjDO2oH3a7dFkzt7RbQLm8A8V8zHRnUtsqJEkhYPXf4wMkzs3dddakSFeynBf1z7l
	 GN0ZRFKO2huqhQVH6QuQfy1SD0ZxnxvIo6avvYL9nFNPp3P9Fl5docy+dJijqbkDY5
	 To6AzdLRgO9KwHmfl2I/TB754D7moWLFuTBBV2o+pnSc8PLaKs46iIj2A9dULu+iTU
	 iALnuKiRbVy6By3+ACij14tqAwH2iqKKs5s1X4mTiEAbygIGaoxUgQ24elbSGqkLdG
	 QgsXJ3bZp7/6Q==
Date: Tue, 11 Apr 2023 19:37:45 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] KVM: PPC: Fix documentation for ppc mmu caps
Message-ID: <ZDUqaUbakmKvNFXM@cleo>
References: <20230411061446.26324-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411061446.26324-1-joel@jms.id.au>
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
Cc: kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 11, 2023 at 03:44:46PM +0930, Joel Stanley wrote:
> The documentation mentions KVM_CAP_PPC_RADIX_MMU, but the defines in the
> kvm headers spell it KVM_CAP_PPC_MMU_RADIX. Similarly with
> KVM_CAP_PPC_MMU_HASH_V3.
> 
> Fixes: c92701322711 ("KVM: PPC: Book3S HV: Add userspace interfaces for POWER9 MMU")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
