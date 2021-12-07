Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FD546BCB1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:32:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h7V6dn7z3f9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:32:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2T1tx0z3bXW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2T1Lyrz4xh8;
 Wed,  8 Dec 2021 00:28:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211105035042.1398309-1-npiggin@gmail.com>
References: <20211105035042.1398309-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: remove cpu_online_cores_map function
Message-Id: <163888358888.3690807.15330687133722711176.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:26:28 +1100
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

On Fri, 5 Nov 2021 13:50:41 +1000, Nicholas Piggin wrote:
> This function builds the cores online map with on-stack cpumasks which
> can cause high stack usage with large NR_CPUS.
> 
> It is not used in any performance sensitive paths, so instead just check
> for first thread sibling.
> 
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: remove cpu_online_cores_map function
      https://git.kernel.org/powerpc/c/b350111bf7b3f4a780d28c44f18f7c9fcbe6d11b
[2/2] powerpc: select CPUMASK_OFFSTACK if NR_CPUS >= 8192
      https://git.kernel.org/powerpc/c/2eafc4748bc08c5b9b6ee0b5b65ad20b30f7d704

cheers
