Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43691591D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 05:04:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZhSD50SJzDqnK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 13:04:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="yBmL4jvp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VWqN69+v"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZhQ81tvMzDqfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 13:02:23 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F20F13BD;
 Thu, 27 Jun 2019 23:02:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 27 Jun 2019 23:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
 0nIuPza9JXPm3s5p5IiEosU7RutHY/f00ebuDHdt7wE=; b=yBmL4jvp7rsPCcLb
 IFhKyImO+XZO73g5TJWxS8NOeQ5IbHCf7weaSg5c4SRoAy7LhC5Tnu4REDcKdS16
 GDTwQMxvlucc2qIRQ2+5u5cryC5vZhqMQNCYsk6Lopy2CyveX3N0g35P99xUK+32
 QSei7TgwqhnavXquPrZhUTG+NPimxeOKCaRMlXRv1ljVJQSZymj6u+aoMvBSLli8
 QO1qzdatYoyqNHPAADcsxX7W9bY6lod/m7z72c0r5clLVeIIpFXzx75nFUAM3m+x
 ag6smrGFXtHT/GL8CXwi3ZF7BIbm4ULFiS0vLO6qtOGP3T61M78/Oj2ESKJL9Eat
 R47dIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=0nIuPza9JXPm3s5p5IiEosU7RutHY/f00ebuDHdt7
 wE=; b=VWqN69+vW80b8fJeaUpDr3ZtpRa5initaPO3nllJh1y8C09Ny2bps/qtv
 Am5Lm85JkJW5fPAJUAYQBqzxTnXYfhjxp2b5iN+bs8bVhSmb0vApwpklxozJz8nN
 9pGguPWYeG+A9XHKJYvqyWnErNWAGdFOp4xB9MeIuRL7ZcONCKBVQJtLdCkJlFur
 QTpGEicvP3gNnMYCjjdH0b4dzzeJGm7k8e97SKNQ+bGdeJCdhoiXb7SV211QEJ/B
 yW/ELRvOLIXOCKNKuGcczLyjBRYx3sf/bf71uHkF2GPW2puBlAN4EA5RCsQrqc4l
 0b8n5UF0WkfJsGArK+pjpgpHSxo+g==
X-ME-Sender: <xms:OYMVXdWSnAhGXFUij_cwVzqcpyRXb60ehByjbd6TZe9afTgioDttCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhepkffuhf
 fvffgjfhgtfggggfesthejredttderjeenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvdegrddujedurd
 ejvddrudegfeenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgv
 lhhlrdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OYMVXRgqHDdtoR6Hjpq70ACrAlC9WqVYKFF3C0Pspeen7-kJZgmOFQ>
 <xmx:OYMVXR68rKtKTSmx-QPU2ES6WC5DvklTpYGDzFYDsutFxxMnYThzKA>
 <xmx:OYMVXZ4dEytgzHDjJXuQ7kSI5Az4q9MRwIRzQPt5OUShJNAULBiNQQ>
 <xmx:O4MVXTt8JfGAHUz5QQQXn31QqxAwrUUWv21HndsriD6gcJ40BiobZQ>
Received: from crackle.ozlabs.ibm.com (124-171-72-143.dyn.iinet.net.au
 [124.171.72.143])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA70C380076;
 Thu, 27 Jun 2019 23:02:14 -0400 (EDT)
Message-ID: <b21dc7e6aa44f984fe64a2bd6c9a3158c6a10bf8.camel@russell.cc>
Subject: Re: [PATCH] powerpc/eeh_cache: fix a W=1 kernel-doc warning
From: Russell Currey <ruscur@russell.cc>
To: Qian Cai <cai@lca.pw>, mpe@ellerman.id.au
Date: Fri, 28 Jun 2019 13:02:11 +1000
In-Reply-To: <1559767579-7151-1-git-send-email-cai@lca.pw>
References: <1559767579-7151-1-git-send-email-cai@lca.pw>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
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
Cc: sbobroff@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-05 at 16:46 -0400, Qian Cai wrote:
> The opening comment mark "/**" is reserved for kernel-doc comments,
> so
> it will generate a warning with "make W=1".
> 
> arch/powerpc/kernel/eeh_cache.c:37: warning: cannot understand
> function
> prototype: 'struct pci_io_addr_range
> 
> Since this is not a kernel-doc for the struct below, but rather an
> overview of this source eeh_cache.c, just use the free-form comments
> kernel-doc syntax instead.
> 
> Signed-off-by: Qian Cai <cai@lca.pw>

Looks good to me.

Acked-by: Russell Currey <ruscur@russell.cc>

