Return-Path: <linuxppc-dev+bounces-58-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E4950558
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 14:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjrfY5Nj4z2xvh;
	Tue, 13 Aug 2024 22:43:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjrfY39FKz2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 22:43:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjrfX2PGGz4wd0;
	Tue, 13 Aug 2024 22:43:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>, "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, Eric DeVolder <eric.devolder@oracle.com>, Laurent Dufour <ldufour@linux.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20240731030126.956210-1-nysal@linux.ibm.com>
References: <20240731030126.956210-1-nysal@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] Skip offline cores when enabling SMT on PowerPC
Message-Id: <172355300460.69780.8475775851092917266.b4-ty@ellerman.id.au>
Date: Tue, 13 Aug 2024 22:43:24 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, 31 Jul 2024 08:31:11 +0530, Nysal Jan K.A. wrote:
> After the addition of HOTPLUG_SMT support for PowerPC [1] there was a
> regression reported [2] when enabling SMT. On a system with at least
> one offline core, when enabling SMT, the expectation is that no CPUs
> of offline cores are made online.
> 
> On a POWER9 system with 4 cores in SMT4 mode:
> $ ppc64_cpu --info
> Core   0:    0*    1*    2*    3*
> Core   1:    4*    5*    6*    7*
> Core   2:    8*    9*   10*   11*
> Core   3:   12*   13*   14*   15*
> 
> [...]

Applied to powerpc/fixes.

[1/2] cpu/SMT: Enable SMT only if a core is online
      https://git.kernel.org/powerpc/c/6c17ea1f3eaa330d445ac14a9428402ce4e3055e
[2/2] powerpc/topology: Check if a core is online
      https://git.kernel.org/powerpc/c/227bbaabe64b6f9cd98aa051454c1d4a194a8c6a

cheers

