Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE94591D0B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 00:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4wTt5mx3z3f3Z
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 08:40:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4wSL750jz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 08:38:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M4wSJ3v66z4xTw;
	Sun, 14 Aug 2022 08:38:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org, aik@ozlabs.ru
In-Reply-To: <20220810054331.373761-1-ruscur@russell.cc>
References: <20220810054331.373761-1-ruscur@russell.cc>
Subject: Re: [PATCH v2] powerpc/kexec: Fix build failure from uninitialised variable
Message-Id: <166043029406.1050412.1381535131264194301.b4-ty@ellerman.id.au>
Date: Sun, 14 Aug 2022 08:38:14 +1000
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
Cc: nathan@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Aug 2022 15:43:31 +1000, Russell Currey wrote:
> clang 14 won't build because ret is uninitialised and can be returned if
> both prop and fdtprop are NULL.  Drop the ret variable and return an
> error in that failure case.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/kexec: Fix build failure from uninitialised variable
      https://git.kernel.org/powerpc/c/83ee9f23763a432a4077bf20624ee35de87bce99

cheers
