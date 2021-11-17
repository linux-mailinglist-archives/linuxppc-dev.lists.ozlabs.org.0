Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A54545A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 12:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvLH45Vt2z3cXM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:26:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvLFt6ZTqz2ybK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 22:25:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvLFs6ptPz4xdT;
 Wed, 17 Nov 2021 22:25:37 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <d319f2a9367d4d08fd2154e506101bd5f100feeb.1636967119.git.christophe.leroy@csgroup.eu>
References: <d319f2a9367d4d08fd2154e506101bd5f100feeb.1636967119.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/book3e: Fix TLBCAM preset at boot
Message-Id: <163714821504.1508509.7196630509343337267.b4-ty@ellerman.id.au>
Date: Wed, 17 Nov 2021 22:23:35 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Nov 2021 10:05:32 +0100, Christophe Leroy wrote:
> Commit 52bda69ae8b5 ("powerpc/fsl_booke: Tell map_mem_in_cams() if
> init is done") was supposed to just add an additional parameter to
> map_mem_in_cams() and always set it to 'true' at that time.
> 
> But a few call sites were messed up. Fix them.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/book3e: Fix TLBCAM preset at boot
      https://git.kernel.org/powerpc/c/5b54860943dc4681be5de2fc287408c7ce274dfc

cheers
