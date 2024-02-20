Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134985BCA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 13:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfKBC63vfz3vZp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:54:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfK9Q3PW4z3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 23:54:18 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfK9N0vp6z4wnr;
	Tue, 20 Feb 2024 23:54:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-api@vger.kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Peter Bergner <bergner@linux.ibm.com>
In-Reply-To: <a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com>
References: <a406b535-dc55-4856-8ae9-5a063644a1af@linux.ibm.com>
Subject: Re: [PATCH v2] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux vector, entries
Message-Id: <170843363898.1291121.4882822831062369983.b4-ty@ellerman.id.au>
Date: Tue, 20 Feb 2024 23:53:58 +1100
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, Arnd Bergmann <arnd@kernel.org>, Nick Piggin <npiggin@au1.ibm.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Feb 2024 16:34:06 -0600, Peter Bergner wrote:
> Changes from v1:
> - Add Acked-by lines.
> 
> The powerpc toolchain keeps a copy of the HWCAP bit masks in our TCB for fast
> access by the __builtin_cpu_supports built-in function.  The TCB space for
> the HWCAP entries - which are created in pairs - is an ABI extension, so
> waiting to create the space for HWCAP3 and HWCAP4 until we need them is
> problematical.  Define AT_HWCAP3 and AT_HWCAP4 in the generic uapi header
> so they can be used in glibc to reserve space in the powerpc TCB for their
> future use.
> 
> [...]

Applied to powerpc/next.

[1/1] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux vector, entries
      https://git.kernel.org/powerpc/c/3281366a8e79a512956382885091565db1036b64

cheers
