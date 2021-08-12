Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3113E9E04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 07:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Glb9F5GMYz3bTV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 15:39:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F+mWnUne;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F+mWnUne; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Glb8d0cSvz2ysv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 15:38:56 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E498B60F00;
 Thu, 12 Aug 2021 05:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628746733;
 bh=hejqc7dh5wrbDEZ+s9vicbuSdxijhsRpuex7Fb6PQSE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=F+mWnUneaUut6gGPFPd8wHXigUQfNKMtl1jp3HI8vqiwVSvrvq5GcfiaJUZkXoyYe
 NTLq4+SsfogM2xoBiykCd8aTKxTSl+taissXskYnQv6uoJRDtE1qkdxlTXOpT0f9JL
 YuP6pSDMZjZMNT163YKI04A5NEjNQ6+tapvbz9XZJtqgi6UIxMXCetAkUsjyCs4X4v
 WnOkf6y8DtL+ZUjHW5hWaxGoVmNA6hcO8VPVlMktBabrYp3f/EDYn+/ElXjGR4s6aV
 MMa5m7t9EgIgaxRjgzkuEyvxko3H7m7TZMK6rkZloP/7lG6l1OPZn9jaMf3gnWVVYz
 mC3sgNtKT4FVA==
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <b0a86089-8b8b-122e-fd6d-73e8c2304964@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From: Felipe Balbi <balbi@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 7/9] usb: phy: fsl-usb: add IRQ check
Date: Thu, 12 Aug 2021 08:38:35 +0300
In-reply-to: <b0a86089-8b8b-122e-fd6d-73e8c2304964@omp.ru>
Message-ID: <871r6z1aty.fsf@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ran Wang <ran.wang_1@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling request_irq() with the invalid IRQ #s.
>
> Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
