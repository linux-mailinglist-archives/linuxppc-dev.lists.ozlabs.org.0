Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9E647057
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 14:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZ6d20Bcz3gJT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 00:01:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYs60nmXz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:50:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYs51jtQz4xcm;
	Thu,  8 Dec 2022 23:50:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Pali Rohár <pali@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20220930123901.10251-1-pali@kernel.org>
References: <20220930123901.10251-1-pali@kernel.org>
Subject: Re: [PATCH] powerpc: dts: turris1x.dts: Add channel labels for temperature sensor
Message-Id: <167050316466.1457988.5284620690924860944.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:39:24 +1100
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
Cc: Marek Behún <kabel@kernel.org>, Josef Schlehofer <josef.schlehofer@nic.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Sep 2022 14:39:01 +0200, Pali Rohár wrote:
> Channel 0 of SA56004ED chip refers to internal SA56004ED chip sensor (chip
> itself is located on the board) and channel 1 of SA56004ED chip refers to
> external sensor which is connected to temperature diode of the P2020 CPU.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: dts: turris1x.dts: Add channel labels for temperature sensor
      https://git.kernel.org/powerpc/c/67bbb62f61e810734da0a1577a9802ddaed24140

cheers
