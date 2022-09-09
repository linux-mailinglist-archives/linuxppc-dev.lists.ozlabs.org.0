Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B77655B3755
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:17:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFNv50s9z3gFH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDm46KLz3bkx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDm3LJ7z4xcW;
	Fri,  9 Sep 2022 22:10:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, Liang He <windhl@126.com>, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220720124557.1256243-1-windhl@126.com>
References: <20220720124557.1256243-1-windhl@126.com>
Subject: Re: [PATCH] powerpc/fsl_pci: Remove of_node_put() when reference escaped out
Message-Id: <166272525265.2076816.12198202961219467737.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:32 +1000
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

On Wed, 20 Jul 2022 20:45:57 +0800, Liang He wrote:
> In fsl_pci_assign_primary(), we should remove the of_node_put()
> when breaking out of the for_each_matching_node() as the 'np'
> is escaped out by global 'fsl_pci_primary'.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/fsl_pci: Remove of_node_put() when reference escaped out
      https://git.kernel.org/powerpc/c/afa6a472a3d2a8dd477b285eeb67b3593546647b

cheers
