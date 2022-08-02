Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02D587B4B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 13:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxsYd4vw7z3f9G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 21:03:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxsXT6mbqz2xGd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 21:02:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxsXT61N1z4x1P;
	Tue,  2 Aug 2022 21:02:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220603121543.22884-1-linmq006@gmail.com>
References: <20220603121543.22884-1-linmq006@gmail.com>
Subject: Re: [PATCH] powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
Message-Id: <165943814316.1061647.14222914569529823231.b4-ty@ellerman.id.au>
Date: Tue, 02 Aug 2022 21:02:23 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Jun 2022 16:15:42 +0400, Miaoqian Lin wrote:
> of_find_node_by_path() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
      https://git.kernel.org/powerpc/c/6ac059dacffa8ab2f7798f20e4bd3333890c541c

cheers
