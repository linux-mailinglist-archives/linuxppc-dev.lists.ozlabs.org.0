Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B615614A9C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 13:27:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1q5x6dT2z3f5G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 23:27:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1q4p0MqXz2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 23:26:18 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N1q4k3Vb8z4x1H;
	Tue,  1 Nov 2022 23:26:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221101034852.2340319-1-mpe@ellerman.id.au>
References: <20221101034852.2340319-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: Select ARCH_SPLIT_ARG64
Message-Id: <166730555042.2453885.2827469537528399916.b4-ty@ellerman.id.au>
Date: Tue, 01 Nov 2022 23:25:50 +1100
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
Cc: rmclure@linux.ibm.com, schwab@linux-m68k.org, npiggin@gmail.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Nov 2022 14:48:52 +1100, Michael Ellerman wrote:
> On 32-bit kernels, 64-bit syscall arguments are split into two
> registers. For that to work with syscall wrappers, the prototype of the
> syscall must have the argument split so that the wrapper macro properly
> unpacks the arguments from pt_regs.
> 
> The fanotify_mark() syscall is one such syscall, which already has a
> split prototype, guarded behind ARCH_SPLIT_ARG64.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/32: Select ARCH_SPLIT_ARG64
      https://git.kernel.org/powerpc/c/02a771c9a68a9f08cce4ec5e324fb1bc4dce7202

cheers
