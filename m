Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6AA64705E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 14:02:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ7m42Pfz3gc9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 00:02:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs718bXz3bym
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:50:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs702tsz4y3T;
	Thu,  8 Dec 2022 23:50:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221201071019.1953023-1-rmclure@linux.ibm.com>
References: <20221201071019.1953023-1-rmclure@linux.ibm.com>
Subject: Re: [PATCH v5 1/7] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
Message-Id: <167050320986.1457988.998616160152157705.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:09 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Dec 2022 18:10:13 +1100, Rohan McLure wrote:
> Add Kconfig option for enabling clearing of registers on arrival in an
> interrupt handler. This reduces the speculation influence of registers
> on kernel internals. The option will be consumed by 64-bit systems that
> feature speculation and wish to implement this mitigation.
> 
> This patch only introduces the Kconfig option, no actual mitigations.
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
      https://git.kernel.org/powerpc/c/0e23347f1e0f2b1c98f87a4088231d0d6f59b962
[2/7] powerpc/64: Add interrupt register sanitisation macros
      https://git.kernel.org/powerpc/c/cbf892ba56677b942020d2bc7ca9b79281fa0bcc
[3/7] powerpc/64: Sanitise common exit code for interrupts
      https://git.kernel.org/powerpc/c/75c5d6b1e194c341371639469fcb8691afa0e254
[4/7] powerpc/64s: IOption for MSR stored in r12
      https://git.kernel.org/powerpc/c/2487fd2e6d61b5293eed8ecd25add3cc78593d38
[5/7] powerpc/64s: Zeroise gprs on interrupt routine entry on Book3S
      https://git.kernel.org/powerpc/c/1df45d78b8a89da6544fab5267e8f5da15073d28
[6/7] powerpc/64e: Clear gprs on interrupt routine entry on Book3E
      https://git.kernel.org/powerpc/c/efe1691ac814e4cf3653538b701662cbd905bddc
[7/7] powerpc/64: Sanitise user registers on interrupt in pseries, POWERNV
      https://git.kernel.org/powerpc/c/7cd882df9485988f7d9b3fae04fde4e95a4c7a74

cheers
