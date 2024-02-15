Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD38563F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFfX75GMz3wQv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:05:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFYY1lTdz3vl5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 00:01:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFYX2xXnz4wyt;
	Fri, 16 Feb 2024 00:01:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Ricardo B. Marliere" <ricardo@marliere.net>
In-Reply-To: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
Subject: Re: [PATCH v2 0/5] powerpc: struct bus_type cleanup
Message-Id: <170800202446.601034.7720266826681597500.b4-ty@ellerman.id.au>
Date: Fri, 16 Feb 2024 00:00:24 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Feb 2024 17:04:58 -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]). Patch 1/5 is a prerequisite to 2/5, but the others have
> no dependency. They were built using bootlin's without warnings using
> powerpc64le-power8--glibc--stable-2023.11-1 toolchain.
> 

Applied to powerpc/next.

[1/5] powerpc: vio: move device attributes into a new ifdef
      https://git.kernel.org/powerpc/c/e15d01277a8bdacf8ac485049d21d450153fa47e
[2/5] powerpc: vio: make vio_bus_type const
      https://git.kernel.org/powerpc/c/565206aaa6528b30df9294e9aafac429e4bc94eb
[3/5] powerpc: mpic: make mpic_subsys const
      https://git.kernel.org/powerpc/c/8e3d0b8d99d708e8262e76313e0436339add80ec
[4/5] powerpc: pmac: make macio_bus_type const
      https://git.kernel.org/powerpc/c/112202f34e56cd475e26b2a461dd856ca7570ef9
[5/5] powerpc: ibmebus: make ibmebus_bus_type const
      https://git.kernel.org/powerpc/c/14ce0dbb562713bc058ad16d281db355757e6ec0

cheers
