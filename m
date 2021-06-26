Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A03B4E2E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr6R6X6Kz3f06
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:42:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2W3JsZz3c1n
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:38:59 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2T6s0Lz9sW8; Sat, 26 Jun 2021 20:38:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210623130514.2543232-1-mpe@ellerman.id.au>
References: <20210623130514.2543232-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix is_kvm_guest() / kvm_para_available()
Message-Id: <162470384503.3589875.4224730716859368974.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:25 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Jun 2021 23:05:14 +1000, Michael Ellerman wrote:
> Commit a21d1becaa3f ("powerpc: Reintroduce is_kvm_guest() as a fast-path
> check") added is_kvm_guest() and changed kvm_para_available() to use it.
> 
> is_kvm_guest() checks a static key, kvm_guest, and that static key is
> set in check_kvm_guest().
> 
> The problem is check_kvm_guest() is only called on pseries, and even
> then only in some configurations. That means is_kvm_guest() always
> returns false on all non-pseries and some pseries depending on
> configuration. That's a bug.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fix is_kvm_guest() / kvm_para_available()
      https://git.kernel.org/powerpc/c/95839225639ba7c3d8d7231b542728dcf222bf2d

cheers
