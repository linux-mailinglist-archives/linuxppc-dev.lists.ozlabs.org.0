Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93164701E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:53:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYxJ35GZz3fWG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:53:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrt0zTPz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrs2G5Jz4xvL;
	Thu,  8 Dec 2022 23:49:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>, npiggin@gmail.com, geoff@infradead.org, mpe@ellerman.id.au
In-Reply-To: <20221122072225.423432-1-hch@lst.de>
References: <20221122072225.423432-1-hch@lst.de>
Subject: Re: [PATCH] powerpc/ps3: mark ps3_system_bus_type static
Message-Id: <167050315778.1457988.3481430850235317266.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:17 +1100
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

On Tue, 22 Nov 2022 08:22:25 +0100, Christoph Hellwig wrote:
> ps3_system_bus_type is only used inside of system-bus.c, so remove
> the external declaration and the very outdated comment next to it.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/ps3: mark ps3_system_bus_type static
      https://git.kernel.org/powerpc/c/dea681c91d3cd5326f87d0a3c93079573e22ce9a

cheers
