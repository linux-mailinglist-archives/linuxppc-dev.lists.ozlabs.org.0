Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EECFB45D7AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Cq05L7gz3fNs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Cjw5k8Tz3ck3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:48:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Cjs3N6Cz4xcs;
 Thu, 25 Nov 2021 20:48:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Jason Wang <wangborong@cdjrlc.com>
In-Reply-To: <20211114115616.493815-1-wangborong@cdjrlc.com>
References: <20211114115616.493815-1-wangborong@cdjrlc.com>
Subject: Re: [PATCH] powerpc: tsi108: make EXPORT_SYMBOL follow its function
 immediately
Message-Id: <163783298962.1228879.14308676036786907622.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:29 +1100
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
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, michael@walle.cc,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 14 Nov 2021 19:56:16 +0800, Jason Wang wrote:
> EXPORT_SYMBOL(foo); should immediately follow its function/variable.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: tsi108: make EXPORT_SYMBOL follow its function immediately
      https://git.kernel.org/powerpc/c/a3bcfc182b2c968fd740101322bd128844724961

cheers
