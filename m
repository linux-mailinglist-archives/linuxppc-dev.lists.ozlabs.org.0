Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F9442D35
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7XL4Jztz3f33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7G62MvDz3c4x
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7G54Thjz4xdl;
 Tue,  2 Nov 2021 22:38:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211027072410.40950-1-ruscur@russell.cc>
References: <20211027072410.40950-1-ruscur@russell.cc>
Subject: Re: [PATCH] powerpc/security: Use a mutex for interrupt exit code
 patching
Message-Id: <163584792339.1845480.1083493723225070083.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:12:03 +1100
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Oct 2021 17:24:10 +1000, Russell Currey wrote:
> The mitigation-patching.sh script in the powerpc selftests toggles
> all mitigations on and off simultaneously, revealing that rfi_flush
> and stf_barrier cannot safely operate at the same time due to races
> in updating the static key.
> 
> On some systems, the static key code throws a warning and the kernel
> remains functional.  On others, the kernel will hang or crash.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/security: Use a mutex for interrupt exit code patching
      https://git.kernel.org/powerpc/c/3c12b4df8d5e026345a19886ae375b3ebc33c0b6

cheers
