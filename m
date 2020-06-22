Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428F202EFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 06:20:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qx6V0cbdzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 14:20:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qx4b3mfszDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 14:19:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aHW3Amow; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49qx4Z5bmsz9sRN;
 Mon, 22 Jun 2020 14:19:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592799551;
 bh=0tEIz6JxNkf7bgRb+6/0QwG9eouCp7+4YDrSoXR8HxY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aHW3AmowwS2VFgoC895R8RCop4tahFGfE6KrrIugUoAZF4ZjaOS1SX+lRgTC7mZLS
 7Ij6i2+VtOEWaDUFWXwOM5LsO4xkSg1M/KDnmqxdR68mWXkOGCiaRBYDZyj76e+J5O
 yRiHD5nRI2em23eOpru479AkmK7RkepLcgzrN3Mm77lQSwLj42/kuQhfn1ZDXkyz7/
 snMXaZoXD7m27vt2i+x52DnzS+sk619eg+tUVYWM4lDUCkApklij28m2lb8cIV6IzV
 YbjayaAGqMvIHcPjNe1a7zyrp6i8Bl/8C2Vo8zB8jLG2VFcE/gSJgKe1Bz8ltmZO90
 KRKSeGBsvW/Yg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] selftests/powerpc: Add prefixed loads/stores to
 alignment_handler test
In-Reply-To: <2070842.8SDOZEvoPg@townsend>
References: <20200520021103.19798-1-jniethe5@gmail.com>
 <20200520021103.19798-2-jniethe5@gmail.com> <2070842.8SDOZEvoPg@townsend>
Date: Mon, 22 Jun 2020 14:19:39 +1000
Message-ID: <87wo3zbulg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple <alistair@popple.id.au> writes:
> On Wednesday, 20 May 2020 12:11:03 PM AEST Jordan Niethe wrote:
>> +/* POWER10 feature */
>> +#ifndef PPC_FEATURE2_ARCH_3_10
>> +#define PPC_FEATURE2_ARCH_3_10 0x00040000
>> +#endif
>
> One minor nit pick, this needs to be updated to PPC_FEATURE2_ARCH_3_1 to 
> reflect the changes made in response to feedback on the patch series that 
> introduced this feature.

Done, thanks for noticing.

cheers
