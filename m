Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6457F09D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 00:20:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q5QOG72O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYRTN2X54z3cgN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 10:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q5QOG72O;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYRSY4rTYz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 10:20:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700436013;
	bh=76dgy/q3s+u4p4Cb3MeIetYWtCubfvcxxj7D9CtJh6U=;
	h=From:To:Cc:Subject:Date:From;
	b=q5QOG72OVYAXPZy+ExCRxU4NQrqmT1g+ww/78GDQS/z4pHLvhzbOSWSJQETmIsERz
	 /tyiKYI4oQNO70OMvq1CYS8k7ApI9o0EfPrIbqrtPD1nefSnrQ73+izLgKcdbFzUUc
	 +FoBJ5qcNgBpIj6uIjtTmRP/qLbyN1QRC65GLYMVNdeb+2TAcyPcZldYoxUPPMr4wU
	 sLkXXpsGFnZkZB0Gkq7eTFUUb4EQZBrXvHzrKcw30w+PJIgAilXnJ6lfw+dFCoMnQj
	 h1L9yCPugbH2GLUME6unkZcvTehXq2JHaIc39o/quAiJi8nVyhjHBDV+OxHHsjt94I
	 Q5xEgVvqtUwLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SYRSY37gsz4wcj;
	Mon, 20 Nov 2023 10:20:13 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: stable@vger.kernel.org 
Subject: Please backport feea65a338e5 ("powerpc/powernv: Fix fortify source
 warnings in opal-prd.c")
Date: Mon, 20 Nov 2023 10:20:13 +1100
Message-ID: <87edgl72ky.fsf@mail.lhotse>
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
Cc: matoro_mailinglist_kernel@matoro.tk, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Please backport feea65a338e5 ("powerpc/powernv: Fix fortify source
warnings in opal-prd.c") to the 6.5, 6.1, 5.15, 5.10 stable trees.

cheers
