Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8047B5B3753
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFNT2F8Sz3g9c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:16:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDm0PkYz3c7k
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDl6Wx4z4xcT;
	Fri,  9 Sep 2022 22:10:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: benh@kernel.crashing.org, paulus@samba.org, Liang He <windhl@126.com>, mpe@ellerman.id.au
In-Reply-To: <20220620065904.4071787-1-windhl@126.com>
References: <20220620065904.4071787-1-windhl@126.com>
Subject: Re: [PATCH] powerpc/embedded6xx/ls_uart: Add missing of_node_put()
Message-Id: <166272523453.2076816.8030610384355885213.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:14 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Jun 2022 14:59:04 +0800, Liang He wrote:
> In ls_uarts_init(), we need to add a of_node_put() to keep refcount
> balance.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/embedded6xx/ls_uart: Add missing of_node_put()
      https://git.kernel.org/powerpc/c/cd772e659da0ad67f19f022f65449e14ebcf1284

cheers
