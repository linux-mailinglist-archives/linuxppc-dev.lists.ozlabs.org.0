Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DD5328CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:22:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sHP4r3vz3f1m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:22:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7m41lfz3cCN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7m0kpLz4ySl;
 Tue, 24 May 2022 21:15:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Miaoqian Lin <linmq006@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Kumar Gala <galak@kernel.crashing.org>, linux-kernel@vger.kernel.org,
 Jin Qing <b24347@freescale.com>, Alexandre Bounine <alexandre.bounine@idt.com>,
 Liu Gang <Gang.Liu@freescale.com>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220512123724.62931-1-linmq006@gmail.com>
References: <20220512123724.62931-1-linmq006@gmail.com>
Subject: Re: [PATCH] powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup
Message-Id: <165339058446.1718562.15673499679733918948.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:44 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 May 2022 16:37:18 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup
      https://git.kernel.org/powerpc/c/fcee96924ba1596ca80a6770b2567ca546f9a482

cheers
