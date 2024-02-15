Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC428563D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:00:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFXx75p7z3vc1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:00:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFX41YLCz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX33JVZz4wcr;
	Thu, 15 Feb 2024 23:59:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20240124103838.43675-1-matthias.schiffer@ew.tq-group.com>
References: <20240124103838.43675-1-matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH v2] powerpc/6xx: set High BAT Enable flag on G2_LE cores
Message-Id: <170800185782.599237.17634953739221214432.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux@ew.tq-group.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Jan 2024 11:38:38 +0100, Matthias Schiffer wrote:
> MMU_FTR_USE_HIGH_BATS is set for G2_LE cores and derivatives like e300cX,
> but the high BATs need to be enabled in HID2 to work. Add register
> definitions and add the needed setup to __setup_cpu_603.
> 
> This fixes boot on CPUs like the MPC5200B with STRICT_KERNEL_RWX enabled
> on systems where the flag has not been set by the bootloader already.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/6xx: set High BAT Enable flag on G2_LE cores
      https://git.kernel.org/powerpc/c/a038a3ff8c6582404834852c043dadc73a5b68b4

cheers
