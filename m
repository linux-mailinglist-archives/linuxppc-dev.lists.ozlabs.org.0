Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CE109780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 02:15:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MQty0ktrzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 12:15:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MQrd0sClzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 12:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47MQrc6TCxz9sPV; Tue, 26 Nov 2019 12:13:20 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f2bb86937d86ebcb0e52f95b6d19aba1d850e601
In-Reply-To: <41c99bc06394a6bc2888631cb98a3ed2ae281ddb.1568295907.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com, hch@infradead.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v1 1/4] powerpc/fixmap: don't clear fixmap area in
 paging_init()
Message-Id: <47MQrc6TCxz9sPV@ozlabs.org>
Date: Tue, 26 Nov 2019 12:13:20 +1100 (AEDT)
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

On Thu, 2019-09-12 at 13:49:41 UTC, Christophe Leroy wrote:
> fixmap is intended to map things permanently like the IMMR region on
> FSL SOC (8xx, 83xx, ...), so don't clear it when initialising paging()
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f2bb86937d86ebcb0e52f95b6d19aba1d850e601

cheers
