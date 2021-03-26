Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49D34A63F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 12:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6KCs6vbFz3c25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 22:16:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GoGD11Hh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GoGD11Hh; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6KCT5Bvcz300J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 22:15:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6KCP2c3Rz9sRf;
 Fri, 26 Mar 2021 22:15:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616757347;
 bh=aRK3MQjYc8DtzjUuBc8xtlY540Ysa4fJ5l5A1e+TZmE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GoGD11HhuUw1qdgZmx/Tgdnea2zeS5ZMScO9rFgOkLJo3r7GmMiXyNdzEQRXZV2u4
 FhsU9AtTulFd0yq/uSEpQ39ucW6ql6RSTMsDnN5f2xF+ulUWm4Z1Lp6AWJGr3mLJ9W
 fiRGCVkytIoHCXOzWXWFh2W3gULBzh4cJ/xhwFqCx3ls5POyNGqfBI+w67AKR01cOy
 YK6t6VBG9njhtzqlukRW6HRJ2SuU6ib8uZw2amcVGD3ecREBYCudiWZDXxt3569Kaj
 R3PQRp/bLooVYEwVxwhwcLFtS0RxzfQJVKzrxjcJcw1KLo2eS7FOP0vUxwcNaXr1lF
 N6SpcfH8RcKPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: He Ying <heying24@huawei.com>, benh@kernel.crashing.org,
 paulus@samba.org, corbet@lwn.net, ruscur@russell.cc, oohall@gmail.com,
 heying24@huawei.com
Subject: Re: [PATCH] docs: powerpc: Fix misspellings and grammar errors
In-Reply-To: <20210326100853.173586-1-heying24@huawei.com>
References: <20210326100853.173586-1-heying24@huawei.com>
Date: Fri, 26 Mar 2021 22:15:43 +1100
Message-ID: <878s6ago80.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

He Ying <heying24@huawei.com> writes:
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>  Documentation/powerpc/booting.rst                | 2 +-
>  Documentation/powerpc/dawr-power9.rst            | 2 +-
>  Documentation/powerpc/eeh-pci-error-recovery.rst | 2 +-
>  Documentation/powerpc/elfnote.rst                | 2 +-
>  Documentation/powerpc/firmware-assisted-dump.rst | 2 +-
>  Documentation/powerpc/kaslr-booke32.rst          | 2 +-
>  Documentation/powerpc/mpc52xx.rst                | 2 +-
>  Documentation/powerpc/papr_hcalls.rst            | 4 ++--
>  Documentation/powerpc/transactional_memory.rst   | 4 ++--
>  9 files changed, 11 insertions(+), 11 deletions(-)

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
