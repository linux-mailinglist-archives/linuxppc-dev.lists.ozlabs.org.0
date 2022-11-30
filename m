Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1763D216
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMYxp2ZqJz3fpP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYql1K06z3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:31:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYql064Fz4x1R;
	Wed, 30 Nov 2022 20:31:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <ec79f462a3bfa8365b7df505e574d5d85246bc68.1646818177.git.christophe.leroy@csgroup.eu>
References: <ec79f462a3bfa8365b7df505e574d5d85246bc68.1646818177.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove find_current_mm_pte()
Message-Id: <166980022119.3017288.6532732356016650095.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:41 +1100
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

On Wed, 9 Mar 2022 10:29:50 +0100, Christophe Leroy wrote:
> Last usage of find_current_mm_pte() was removed by
> commit 15759cb054ef ("powerpc/perf/callchain: Use
> __get_user_pages_fast in read_user_stack_slow")
> 
> Remove it.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Remove find_current_mm_pte()
      https://git.kernel.org/powerpc/c/e75d07bd8303588c33e6f1f180a9081fb58c872e

cheers
