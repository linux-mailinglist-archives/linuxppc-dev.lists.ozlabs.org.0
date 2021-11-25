Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FE45D797
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:49:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0ClP3m3nz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Cj52RhGz3c6R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Cj45ZLFz4xcs;
 Thu, 25 Nov 2021 20:47:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Julia Lawall <Julia.Lawall@lip6.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <1448051604-25256-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1448051604-25256-1-git-send-email-Julia.Lawall@lip6.fr>
Subject: Re: (subset) [PATCH 0/6] add missing of_node_put
Message-Id: <163783295820.1228879.10682208282272545718.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:35:58 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Nov 2015 20:33:18 +0000, Julia Lawall wrote:
> The various for_each device_node iterators performs an of_node_get on each
> iteration, so a break out of the loop requires an of_node_put.
> 
> The complete semantic patch that fixes this problem is
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @r@
> local idexpression n;
> expression e1,e2;
> iterator name for_each_node_by_name, for_each_node_by_type,
> for_each_compatible_node, for_each_matching_node,
> for_each_matching_node_and_match, for_each_child_of_node,
> for_each_available_child_of_node, for_each_node_with_property;
> iterator i;
> statement S;
> expression list [n1] es;
> @@
> 
> [...]

Patch 5 applied to powerpc/next.

[5/6] powerpc/btext: add missing of_node_put
      https://git.kernel.org/powerpc/c/a1d2b210ffa52d60acabbf7b6af3ef7e1e69cda0

cheers
