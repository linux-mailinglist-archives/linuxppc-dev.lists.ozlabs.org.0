Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4F78576B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:04:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4dc5Pp0z3c3M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cY2yCLz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cW6Q5hz4wxR;
	Wed, 23 Aug 2023 22:03:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230801044447.11275-1-aneesh.kumar@linux.ibm.com>
References: <20230801044447.11275-1-aneesh.kumar@linux.ibm.com>
Subject: Re: (subset) [PATCH v4 1/2] powerpc/mm: Cleanup memory block size probing
Message-Id: <169279175572.797584.16319542522074255631.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: foraker1@llnl.gov, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 01 Aug 2023 10:14:46 +0530, Aneesh Kumar K.V wrote:
> Parse the device tree in early init to find the memory block size to be
> used by the kernel. Consolidate the memory block size device tree parsing
> to one helper and use that on both powernv and pseries. We still want to
> use machine-specific callback because on all machine types other than
> powernv and pseries we continue to return MIN_MEMORY_BLOCK_SIZE.
> 
> pseries_memory_block_size used to look for the second memory
> block (memory@x) to determine the memory_block_size value. This patch
> changed that to look at all memory blocks and make sure we can map them all
> correctly using the computed memory block size value.
> 
> [...]

Patch 1 applied to powerpc/next.

[1/2] powerpc/mm: Cleanup memory block size probing
      https://git.kernel.org/powerpc/c/4d15721177d539d743fcf31d7bb376fb3b81aeb6

cheers
