Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985A87454F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:39:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZVG3yflz3dTD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:39:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP61gm7z3bsZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP60Wykz4wxs;
	Mon,  3 Jul 2023 15:34:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20230613045202.294451-1-joel@jms.id.au>
References: <20230613045202.294451-1-joel@jms.id.au>
Subject: Re: [RFC PATCH 0/3] powernv/pci: Remove unused IODA1 support
Message-Id: <168836201905.50010.5386797299773999122.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:59 +1000
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Jun 2023 14:21:59 +0930, Joel Stanley wrote:
> Oliver mentioned this code was only kept around to support the VPL
> Power7 boxes. Now that they are all gone, remove the code.
> 
> Build and boot tested in qemu only.
> 
> Joel Stanley (3):
>   powernv/pci: Remove ioda1 support
>   powerpc/pci: Remove MVE code
>   powernv/pci: Remove last IODA1 defines
> 
> [...]

Applied to powerpc/next.

[1/3] powernv/pci: Remove ioda1 support
      https://git.kernel.org/powerpc/c/5ac129cdb50b4efda59ee5ea7c711996a3637b34
[2/3] powerpc/pci: Remove MVE code
      https://git.kernel.org/powerpc/c/326b3f8c6efca7ddc95f164bc0c8fa1c57d7a84f
[3/3] powernv/pci: Remove last IODA1 defines
      https://git.kernel.org/powerpc/c/98e61df570f06e8a2a2152bb3485c60fe1b148cb

cheers
