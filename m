Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF375328E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sLJ3Xgfz3gY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7t1RgZz3cdG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7t0Xlvz4yTH;
 Tue, 24 May 2022 21:15:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
Subject: Re: [PATCH 00/14] powerpc/rtas: various cleanups and improvements
Message-Id: <165339052753.1718562.588956115697522458.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:08:47 +1000
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Mar 2022 23:50:33 +1000, Nicholas Piggin wrote:
> I had a bunch of random little fixes and cleanups around and
> was prompted to put them together and make a change to call
> RTAS with MSR[RI] enabled because of a report of the hard
> lockup watchdog NMI IPI hitting in an rtas call which then
> crashed because it's unrecoverable.
> 
> Could possibly move patch 9 earlier if it would help with
> backporting.
> 
> [...]

Patches 1-4, 7, 9 & 13 applied to powerpc/next.

[01/14] powerpc/rtas: Move rtas entry assembly into its own file
        https://git.kernel.org/powerpc/c/838ee286ecc9a3c76e6bd8f5aaad0c8c5c66b9ca
[02/14] powerpc/rtas: Make enter_rtas a nokprobe symbol on 64-bit
        https://git.kernel.org/powerpc/c/07940b4b61cf0cbcfb9e4226c07318f737157c42
[03/14] powerpc/rtas: Fix whitespace in rtas_entry.S
        https://git.kernel.org/powerpc/c/4e949faae2bd42783a2b2b732b7bf17557d94cfb
[04/14] powerpc/rtas: Call enter_rtas with MSR[EE] disabled
        https://git.kernel.org/powerpc/c/c5a65e0a420d50655bf692fc7386813683c0cd81
[07/14] powerpc/rtas: PACA can be restored directly from SPRG
        https://git.kernel.org/powerpc/c/5c86bd02b3c3ef68a109fa7e690ad62d3091f6d4
[09/14] powerpc/rtas: Leave MSR[RI] enabled over RTAS call
        https://git.kernel.org/powerpc/c/014b2e896cc8445fcc04636e69bf5f9e24281daa
[13/14] powerpc/rtas: enture rtas_call is called with MMU enabled
        https://git.kernel.org/powerpc/c/804c0a166ffea628eb7ef72b9fd710883cb1fa8f

cheers
