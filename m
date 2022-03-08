Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8E4D16EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:11:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZ1P6qfKz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:11:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ0f6xYzz30jZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:10:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ0d4W2hz4xvG;
 Tue,  8 Mar 2022 23:10:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <cover.1644928018.git.christophe.leroy@csgroup.eu>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Message-Id: <164674125384.3322453.12551849351633372798.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:07:33 +1100
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Feb 2022 13:40:55 +0100, Christophe Leroy wrote:
> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
> on those three architectures because LKDTM messes up function
> descriptors with functions.
> 
> This series does some cleanup in the three architectures and
> refactors function descriptors so that it can then easily use it
> in a generic way in LKDTM.
> 
> [...]

Applied to powerpc/next.

[01/13] powerpc: Fix 'sparse' checking on PPC64le
        https://git.kernel.org/powerpc/c/81df21de8fb45d3a55d41da9c7f5724797d51ce6
[02/13] powerpc: Move and rename func_descr_t
        https://git.kernel.org/powerpc/c/5b23cb8cc6b0aab0535253cc2aa362572bab7072
[03/13] powerpc: Use 'struct func_desc' instead of 'struct ppc64_opd_entry'
        https://git.kernel.org/powerpc/c/d3e32b997a4ca2e7be71cb770bcb2c000ee20b36
[04/13] powerpc: Remove 'struct ppc64_opd_entry'
        https://git.kernel.org/powerpc/c/0a9c5ae279c963149df9a84588281d3d607f7a1f
[05/13] powerpc: Prepare func_desc_t for refactorisation
        https://git.kernel.org/powerpc/c/2fd986377d546bedaf27e36554dc9090d272f15d
[06/13] ia64: Rename 'ip' to 'addr' in 'struct fdesc'
        https://git.kernel.org/powerpc/c/41a88b45479da873bfc5d29ba1a545a780c5329a
[07/13] asm-generic: Define CONFIG_HAVE_FUNCTION_DESCRIPTORS
        https://git.kernel.org/powerpc/c/a257cacc38718c83cee003487e03197f237f5c3f
[08/13] asm-generic: Define 'func_desc_t' to commonly describe function descriptors
        https://git.kernel.org/powerpc/c/0dc690e4ef5b901e9d4b53520854fbd5c749e09d
[09/13] asm-generic: Refactor dereference_[kernel]_function_descriptor()
        https://git.kernel.org/powerpc/c/e1478d8eaf27704db17a44dee4c53696ed01fc9c
[10/13] lkdtm: Force do_nothing() out of line
        https://git.kernel.org/powerpc/c/69b420ed8fd3917ac7073256b4929aa246b6fe31
[11/13] lkdtm: Really write into kernel text in WRITE_KERN
        https://git.kernel.org/powerpc/c/b64913394f123e819bffabc79a0e48f98e78dc5d
[12/13] lkdtm: Fix execute_[user]_location()
        https://git.kernel.org/powerpc/c/72a86433049dcfe918886645ac3d19c1eaaa67ab
[13/13] lkdtm: Add a test for function descriptors protection
        https://git.kernel.org/powerpc/c/5e5a6c5441654d1b9e576ce4ca8a1759e701079e

cheers
