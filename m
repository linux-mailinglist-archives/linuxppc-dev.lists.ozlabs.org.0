Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A54CA52D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:48:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v7S5Th2z3f0M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v5106sZz3bcm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v4t5npwz4xZ5;
 Wed,  2 Mar 2022 23:46:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Anders Roxell <anders.roxell@linaro.org>, mpe@ellerman.id.au
In-Reply-To: <20220224162215.3406642-1-anders.roxell@linaro.org>
References: <20220224162215.3406642-1-anders.roxell@linaro.org>
Subject: Re: [PATCHv2 1/3] powerpc: lib: sstep: fix 'sthcx' instruction
Message-Id: <164622491295.2052779.4708365470490989992.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:52 +1100
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Feb 2022 17:22:13 +0100, Anders Roxell wrote:
> Looks like there been a copy paste mistake when added the instruction
> 'stbcx' twice and one was probably meant to be 'sthcx'.
> Changing to 'sthcx' from 'stbcx'.
> 
> 

Applied to powerpc/next.

[1/3] powerpc: lib: sstep: fix 'sthcx' instruction
      https://git.kernel.org/powerpc/c/a633cb1edddaa643fadc70abc88f89a408fa834a
[2/3] powerpc: fix build errors
      https://git.kernel.org/powerpc/c/8667d0d64dd1f84fd41b5897fd87fa9113ae05e3
[3/3] powerpc: lib: sstep: fix build errors
      https://git.kernel.org/powerpc/c/8219d31effa7be5dbc7ff915d7970672e028c701

cheers
