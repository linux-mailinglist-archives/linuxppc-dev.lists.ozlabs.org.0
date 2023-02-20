Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F387F69C49F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 04:52:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpQD5wVVz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 14:52:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKpPl2rX2z3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 14:51:39 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpPj5TW4z4x5c;
	Mon, 20 Feb 2023 14:51:37 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: ruscur@russell.cc, Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230216070903.355091-1-ajd@linux.ibm.com>
References: <20230216070903.355091-1-ajd@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Fix endianness issue when parsing PLPKS secvar flags
Message-Id: <167686495955.2406274.4924843605491543660.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:49:19 +1100
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
Cc: nayna@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Feb 2023 18:09:03 +1100, Andrew Donnellan wrote:
> When a user updates a variable through the PLPKS secvar interface, we take
> the first 8 bytes of the data written to the update attribute to pass
> through to the H_PKS_SIGNED_UPDATE hcall as flags. These bytes are always
> written in big-endian format.
> 
> Currently, the flags bytes are memcpy()ed into a u64, which is then loaded
> into a register to pass as part of the hcall. This means that on LE
> systems, the bytes are in the wrong order.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Fix endianness issue when parsing PLPKS secvar flags
      https://git.kernel.org/powerpc/c/7096deb7b5387e7899655213b7430ab043ddda4f

cheers
