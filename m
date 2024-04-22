Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC18AC6CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJBM1KDgz3w1h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJ6x4Pybz3cVq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:18:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNJ6x2dVfz4x0w;
	Mon, 22 Apr 2024 18:18:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
In-Reply-To: <a19ee3dc2b304d39da364a592d5cd167449f8c4a.1713365940.git.ritesh.list@gmail.com>
References: <a19ee3dc2b304d39da364a592d5cd167449f8c4a.1713365940.git.ritesh.list@gmail.com>
Subject: Re: [PATCH] powerpc/ptdump: Fix walk_vmemmap to also print first vmemmap entry
Message-Id: <171377378383.1025456.16155849910889118496.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 18:16:23 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: nathanl@linux.ibm.com, donettom@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Apr 2024 20:37:40 +0530, Ritesh Harjani (IBM) wrote:
> walk_vmemmap() was skipping the first vmemmap entry pointed by
> vmemmap_list pointer itself. This patch fixes that.
> 
> With this we should see the vmemmap entry at 0xc00c000000000000 for hash
> which wasn't getting printed on doing
> 
> "cat /sys/kernel/debug/kernel_hash_pagetable"
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ptdump: Fix walk_vmemmap to also print first vmemmap entry
      https://git.kernel.org/powerpc/c/f318c8be797f8572629d5386a88cde7d753457a8

cheers
