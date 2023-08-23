Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7603B7857AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4nS2L2Qz3flG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cm6zVwz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cm5bctz4x2Q;
	Wed, 23 Aug 2023 22:03:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cf652e47ea9e453e89813611b6f76d0939a12063.1687344017.git.christophe.leroy@csgroup.eu>
References: <cf652e47ea9e453e89813611b6f76d0939a12063.1687344017.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/reg: Remove #ifdef around mtspr macro
Message-Id: <169279175565.797584.12691137360042115730.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Jun 2023 12:40:50 +0200, Christophe Leroy wrote:
> That ifdef was introduced by commit 1458dd951f7c ("powerpc/8xx:
> Handle CPU6 ERRATA directly in mtspr() macro") and left over by
> commit 2a45addd21de ("powerpc/8xx: Remove CPU6 ERRATA Workaround")
> 
> Remove it.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/reg: Remove #ifdef around mtspr macro
      https://git.kernel.org/powerpc/c/6039fcd3fba99451ea9d013c4d3a65a40b2feff0

cheers
