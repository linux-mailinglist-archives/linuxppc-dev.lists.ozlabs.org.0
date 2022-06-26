Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC255ADC6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 02:29:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVsDt4P4Fz3dsW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 10:29:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVsD66LSTz3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 10:28:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LVsD336rPz4xZj;
	Sun, 26 Jun 2022 10:28:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220616120033.1976732-1-mpe@ellerman.id.au>
References: <20220616120033.1976732-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Move CMA reservations after initmem_init()
Message-Id: <165620330544.1934578.7070887522186510241.b4-ty@ellerman.id.au>
Date: Sun, 26 Jun 2022 10:28:25 +1000
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
Cc: aneesh.kumar@linux.ibm.com, ziy@nvidia.com, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jun 2022 22:00:33 +1000, Michael Ellerman wrote:
> After commit 11ac3e87ce09 ("mm: cma: use pageblock_order as the single
> alignment") there is an error at boot about the KVM CMA reservation
> failing, eg:
> 
>   kvm_cma_reserve: reserving 6553 MiB for global area
>   cma: Failed to reserve 6553 MiB
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Move CMA reservations after initmem_init()
      https://git.kernel.org/powerpc/c/6cf06c17e94f26c290fd3370a5c36514ae15ac43

cheers
