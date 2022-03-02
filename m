Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44554CA52C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:48:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v725HLTz3dxD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:48:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v505xLHz3bcm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v4v6c5wz4xcP;
 Wed,  2 Mar 2022 23:46:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <ddcb422102a37eb45f57694c7ef0ec6187964dff.1644742951.git.christophe.leroy@csgroup.eu>
References: <ddcb422102a37eb45f57694c7ef0ec6187964dff.1644742951.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Don't allow the use of EMIT_BUG_ENTRY with
 BUGFLAG_WARNING
Message-Id: <164622487604.2052779.15267979527677516590.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:16 +1100
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

On Sun, 13 Feb 2022 10:02:41 +0100, Christophe Leroy wrote:
> Warnings in assembly must use EMIT_WARN_ENTRY in order to generate
> the necessary entry in exception table.
> 
> Check in EMIT_BUG_ENTRY that flags don't include BUGFLAG_WARNING.
> 
> This change avoids problems like the one fixed by
> commit fd1eaaaaa686 ("powerpc/64s: Use EMIT_WARN_ENTRY for SRR debug
> warnings").
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Don't allow the use of EMIT_BUG_ENTRY with BUGFLAG_WARNING
      https://git.kernel.org/powerpc/c/38a1756861b8fc2ea9afb93e231194c642a4e261

cheers
