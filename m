Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C314B62EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:36:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVFh6nBrz3dt9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:36:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6L1hhRz3bTr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:18 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6L3Wrkz4xsm;
 Tue, 15 Feb 2022 16:30:18 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thierry Reding <thierry.reding@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20211220134036.683309-1-thierry.reding@gmail.com>
References: <20211220134036.683309-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] powerpc: dts: Fix some I2C unit addresses
Message-Id: <164490279131.270256.1190323452286806072.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:31 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Dec 2021 14:40:36 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The unit-address for the Maxim MAX1237 ADCs on XPedite5200 boards don't
> match the value in the "reg" property and cause a DTC warning.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: dts: Fix some I2C unit addresses
      https://git.kernel.org/powerpc/c/d5342fdd163ae0553a14820021a107e03eb1ea72

cheers
