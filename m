Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7775F4471
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:40:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf3S5dFdz3dxD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:40:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1M3TQJz3bjS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1J0PB9z4xGn;
	Wed,  5 Oct 2022 00:38:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220704063851.295482-1-aneesh.kumar@linux.ibm.com>
References: <20220704063851.295482-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/mm: Update max/min_low_pfn in the same function
Message-Id: <166488997860.779920.11703570382917645466.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:26:18 +1100
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

On Mon, 4 Jul 2022 12:08:51 +0530, Aneesh Kumar K.V wrote:
> For both CONFIG_NUMA enabled/disabled use mem_topology_setup to
> update max/min_low_pfn.
> 
> This also add min_low_pfn update to CONFIG_NUMA which was initialized
> to zero before.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mm: Update max/min_low_pfn in the same function
      https://git.kernel.org/powerpc/c/7b31f7dadd7074fa70bb14a53bd286ffdfc98b04

cheers
