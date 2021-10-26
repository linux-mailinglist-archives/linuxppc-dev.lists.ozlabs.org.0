Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993743B098
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 12:56:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdpdp24zpz3bXj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 21:55:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R3cGNlW8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdpdC05Znz2x9K
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 21:55:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=R3cGNlW8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hdpd70qPJz4xZ1;
 Tue, 26 Oct 2021 21:55:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635245724;
 bh=OnrTAPXPZ+jyXUISVn3DJ5jVIKulOd+/zxbCJGHW7A0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=R3cGNlW8hpOlbcqUwpUZJjXYHIHHzzYl2FlUeBfZb9d/X7si6JlTOPSes3Bkhkna2
 yehKaBG0cIrC+M4iKA8cyyRKhTcPOcPYP60F/UJcMb2LpwSnq8to7RWi5Tc/nDEFty
 JweL9/cF+yciBM0HGW0Opkcdtz0ZVQfHlGd4hKphjzRh0YVDyBr+Cgv2HLQKnTuTd2
 hHrCXC5Z2PI98PMBv6M2IkyVnOtYpYwMG+H3gtTxD10iylkuT7ijCevcqj/E/yhPrE
 5XwYU8916zbSv+lWP5K6oDuoEOPXEhY8NGvMXaS+RGwnRSpwm7tT+V9jySbajOg4i7
 GKZGkmZRTs1lw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Moore
 <paul@paul-moore.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
In-Reply-To: <20211026133147.35d19e00@canb.auug.org.au>
References: <20211026133147.35d19e00@canb.auug.org.au>
Date: Tue, 26 Oct 2021 21:55:18 +1100
Message-ID: <87k0i0awdl.fsf@mpe.ellerman.id.au>
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
Cc: Richard Guy Briggs <rgb@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the audit tree got conflicts in:
>
>   arch/powerpc/kernel/audit.c
>   arch/powerpc/kernel/compat_audit.c
>
> between commit:
>
>   566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC")
>
> from the powerpc tree and commits:
>
>   42f355ef59a2 ("audit: replace magic audit syscall class numbers with macros")
>   1c30e3af8a79 ("audit: add support for the openat2 syscall")
>
> from the audit tree.

Thanks.

I guess this is OK, unless the audit folks disagree. I could revert the
powerpc commit and try it again later.

If I don't hear anything I'll leave it as-is.

cheers
