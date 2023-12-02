Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E81801FA3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 00:03:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SjQT10xrQz3dJM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 10:03:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SjQSY629Pz3c5S
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Dec 2023 10:02:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SjQSX4rBrz4x5G;
	Sun,  3 Dec 2023 10:02:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20231122025811.2973-1-npiggin@gmail.com>
References: <20231122025811.2973-1-npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix KVM_RUN clobbering FP/VEC user registers
Message-Id: <170155803785.146803.4946329954526131755.b4-ty@ellerman.id.au>
Date: Sun, 03 Dec 2023 10:00:37 +1100
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
Cc: Timothy Pearson <tpearson@raptorengineering.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Nov 2023 12:58:11 +1000, Nicholas Piggin wrote:
> Before running a guest, the host process (e.g., QEMU) FP/VEC registers
> are saved if they were being used, similarly to when the kernel uses FP
> registers. The guest values are then be loaded into regs, and the host
> process registers will be restored lazily when it uses FP/VEC.
> 
> KVM HV has a bug here: the host process registers do get saved, but the
> user MSR bits remain enabled, which indicates the registers are valid
> for the process. After they are clobbered by running the guest, this
> valid indication causes the host process to take on the FP/VEC regiter
> values of the guest.
> 
> [...]

Applied to powerpc/fixes.

[1/1] KVM: PPC: Book3S HV: Fix KVM_RUN clobbering FP/VEC user registers
      https://git.kernel.org/powerpc/c/dc158d23b33df9033bcc8e7117e8591dd2f9d125

cheers
