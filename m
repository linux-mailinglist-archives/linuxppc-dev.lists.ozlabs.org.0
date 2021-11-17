Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B754545A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 12:28:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvLJx01Z2z3dl1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:28:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvLFx58kvz2yNC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 22:25:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvLFx4FN2z4xdb;
 Wed, 17 Nov 2021 22:25:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20211109064900.2041386-1-npiggin@gmail.com>
References: <20211109064900.2041386-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/pseries: rename numa_dist_table to
 form2_distances
Message-Id: <163714821197.1508509.3981622823494592454.b4-ty@ellerman.id.au>
Date: Wed, 17 Nov 2021 22:23:31 +1100
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Nov 2021 16:48:59 +1000, Nicholas Piggin wrote:
> The name of the local variable holding the "form2" property address
> conflicts with the numa_distance_table global.
> 
> This patch does 's/numa_dist_table/form2_distances/g' over the function,
> which also renames numa_dist_table_length to form2_distances_length.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/pseries: rename numa_dist_table to form2_distances
      https://git.kernel.org/powerpc/c/0bd81274e3f1195ee7c820ef02d62f31077c42c3
[2/2] powerpc/pseries: Fix numa FORM2 parsing fallback code
      https://git.kernel.org/powerpc/c/302039466f6a3b9421ecb9a6a2c528801dc24a86

cheers
