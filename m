Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 594375653CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:37:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3hF2PgYz3dv8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:37:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3f311Dpz3c1x
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:35:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3f23kJnz4xZb;
	Mon,  4 Jul 2022 21:35:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <9f1a47de80f78d3dd270a7a72f69f55f581c4054.1652859593.git.christophe.leroy@csgroup.eu>
References: <9f1a47de80f78d3dd270a7a72f69f55f581c4054.1652859593.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/irq: Split irq.c
Message-Id: <165693439157.9954.12569794251184438782.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:11 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 May 2022 09:40:15 +0200, Christophe Leroy wrote:
> More than half of irq.c is dedicated to PPC64.
> 
> Move PPC64 code out of irq.c into irq_64.c
> 
> 

Applied to powerpc/next.

[1/2] powerpc/irq: Split irq.c
      https://git.kernel.org/powerpc/c/7d7b28b302085e1ec2815bc9f5205af28394c5db
[2/2] powerpc/irq64: Remove get_irq_happened()
      https://git.kernel.org/powerpc/c/98552307e3a72d480e72744bf5da2a865822f496

cheers
