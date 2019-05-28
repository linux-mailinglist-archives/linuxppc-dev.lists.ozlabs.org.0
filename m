Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D666F2C101
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 10:15:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Cmq72X8lzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 18:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Cmns0ygvzDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 18:13:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Cmnr5j54z9s4V;
 Tue, 28 May 2019 18:13:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 "linuxppc-dev\@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@ozlabs.org>
Subject: Re: ppc85xx_basic_defconfig is buggy ?
In-Reply-To: <921cadc8-0f6c-a0f2-b16e-d8129f577c16@c-s.fr>
References: <921cadc8-0f6c-a0f2-b16e-d8129f577c16@c-s.fr>
Date: Tue, 28 May 2019 18:13:51 +1000
Message-ID: <87k1ebov28.fsf@concordia.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> ppc85xx_basic_defconfig doesn't not select CONFIG_PPC_85xx.

You mean arch/powerpc/configs/mpc85xx_basic_defconfig presumably.

> Is that expected ?

Yeah it is expected.

It's not intended to be a full defconfig, it's used as a fragment and
merged with other configs, see arch/powerpc/Makefile:

  PHONY += mpc85xx_defconfig
  mpc85xx_defconfig:
  	$(call merge_into_defconfig,mpc85xx_basic_defconfig,\
  		85xx-32bit 85xx-hw fsl-emb-nonhw)

Where 85xx-32bit.config is:

  CONFIG_HIGHMEM=y
  CONFIG_KEXEC=y
  CONFIG_PPC_85xx=y
  CONFIG_PROC_KCORE=y
  CONFIG_PHYS_64BIT=y

So that's where PPC_85xx gets set.

But it's confusing that mpc85xx_basic_defconfig is named "foo_defconfig"
but is not actually a proper defconfig. We should rename it to
mpc85xx_basic.config to make it clearer that it's a fragment. I'll do a
patch.

cheers
