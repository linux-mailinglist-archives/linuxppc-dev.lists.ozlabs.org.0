Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A25653E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3ks6psqz3ffx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fD5Tklz3c1X
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fD2WDCz4xZj;
	Mon,  4 Jul 2022 21:36:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <98a4c2603bf9e4b776e219f5b8541d23aa24e854.1654930308.git.christophe.leroy@csgroup.eu>
References: <98a4c2603bf9e4b776e219f5b8541d23aa24e854.1654930308.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Restore CONFIG_DEBUG_INFO in defconfigs
Message-Id: <165693440488.9954.15240124724285203311.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:24 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 11 Jun 2022 08:51:57 +0200, Christophe Leroy wrote:
> Commit f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable from a
> choice") broke the selection of CONFIG_DEBUG_INFO by powerpc defconfigs.
> 
> It is now necessary to select one of the three DEBUG_INFO_DWARF*
> options to get DEBUG_INFO enabled.
> 
> Replace DEBUG_INFO=y by DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y in all
> defconfigs using the following command:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Restore CONFIG_DEBUG_INFO in defconfigs
      https://git.kernel.org/powerpc/c/92f89ec1b534b6eca2b81bae97d30a786932f51a

cheers
