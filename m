Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02552770F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1Jh12QfKz3fhT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:36:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JZS2dj4z3cfP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:31:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZS1sXJz4xZv;
 Sun, 15 May 2022 20:31:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20220504101244.12107-1-ldufour@linux.ibm.com>
References: <20220504101244.12107-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/rtas: Keep MSR[RI] set when calling RTAS
Message-Id: <165261054578.1047019.8022784676618367625.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:29:05 +1000
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
Cc: stable@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 4 May 2022 12:12:44 +0200, Laurent Dufour wrote:
> RTAS runs in real mode (MSR[DR] and MSR[IR] unset) and in 32bits
> big endian mode (MSR[SF,LE] unset).
> 
> The change in MSR is done in enter_rtas() in a relatively complex way,
> since the MSR value could be hardcoded.
> 
> Furthermore, a panic has been reported when hitting the watchdog interrupt
> while running in RTAS, this leads to the following stack trace:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/rtas: Keep MSR[RI] set when calling RTAS
      https://git.kernel.org/powerpc/c/b6b1c3ce06ca438eb24e0f45bf0e63ecad0369f5

cheers
