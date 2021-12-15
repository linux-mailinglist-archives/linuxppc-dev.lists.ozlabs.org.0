Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9DF474F3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGLn4hcMz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:28:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGJl5MJnz2x9F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:26:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGJl4fBVz4xhp;
 Wed, 15 Dec 2021 11:26:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 00/22] powerpc: Add KUAP support for BOOKE and 40x
Message-Id: <163952787453.919625.13319498646375109178.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:24:34 +1100
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

On Tue, 19 Oct 2021 09:29:11 +0200, Christophe Leroy wrote:
> On booke/40x we don't have segments like book3s/32.
> On booke/40x we don't have access protection groups like 8xx.
> 
> Use the PID register to provide user access protection.
> Kernel address space can be accessed with any PID.
> User address space has to be accessed with the PID of the user.
> User PID is always not null.
> 
> [...]

Applied to powerpc/next.

[01/22] Revert "powerpc: Inline setup_kup()"
        https://git.kernel.org/powerpc/c/6c1fa60d368e6b752e1612eae9bb0970e85392b2
[02/22] powerpc/8xx: Activate KUEP at all time
        https://git.kernel.org/powerpc/c/13dac4e31e75ce10b2fcaad4432a24dae6c955f6
[03/22] powerpc/44x: Activate KUEP at all time
        https://git.kernel.org/powerpc/c/ee2631603fdbab6f76e86ea87f7a03ebc3a1ef85
[04/22] powerpc/book3e: Activate KUEP at all time
        https://git.kernel.org/powerpc/c/dc3a0e5b83a8806d7da1f343a7d2e0be386d16d2
[05/22] powerpc/32s: Remove capability to disable KUEP at boottime
        https://git.kernel.org/powerpc/c/df415cd758261bceff27f34a145dd8328bbfb018
[06/22] powerpc/32s: Do kuep_lock() and kuep_unlock() in assembly
        https://git.kernel.org/powerpc/c/526d4a4c77aedf1b7df1133e5cced29c70232e6e
[07/22] powerpc/32s: Save content of sr0 to avoid 'mfsr'
        https://git.kernel.org/powerpc/c/70428da94c7ad692d306747a04117543827292a7
[08/22] powerpc/kuep: Remove 'nosmep' boot time parameter except for book3s/64
        https://git.kernel.org/powerpc/c/6754862249d324b11f1361a5353e234325d805ec
[09/22] powerpc/kuap: Add a generic intermediate layer
        https://git.kernel.org/powerpc/c/ba454f9c8e4efcc47c772b7642a5c8c6d1343cbf
[10/22] powerpc/kuap: Check KUAP activation in generic functions
        https://git.kernel.org/powerpc/c/c252f3846d3114542c606618995e3cbc11775357
[11/22] powerpc/kuap: Remove __kuap_assert_locked()
        https://git.kernel.org/powerpc/c/2341964e27b02b2ca1deef8a18df59d1db7b9085
[12/22] powerpc/kuap: Add kuap_lock()
        https://git.kernel.org/powerpc/c/937fb7003ee1f37faed1f1a4ece46e8a14863d92
[13/22] powerpc/nohash: Move setup_kuap out of 8xx.c
        https://git.kernel.org/powerpc/c/25ae981fafaa140a12e4c830992b4fe997071124
[14/22] powerpc/config: Add CONFIG_BOOKE_OR_40x
        https://git.kernel.org/powerpc/c/047a6fd40199eb55ffd18091f7ceae9743d972bf
[15/22] powerpc/kuap: Prepare for supporting KUAP on BOOK3E/64
        https://git.kernel.org/powerpc/c/42e03bc5240b75007682d9941ef672d12828fc70
[16/22] powerpc/kuap: Make PPC_KUAP_DEBUG depend on PPC_KUAP only
        https://git.kernel.org/powerpc/c/e3c02f25b4296c48376b8edb6aadcec460e803bc
[17/22] powerpc: Add KUAP support for BOOKE and 40x
        https://git.kernel.org/powerpc/c/43afcf8f0101279cf4243bb4f9f9b249ddd8613c
[18/22] powerpc/kuap: Wire-up KUAP on 44x
        https://git.kernel.org/powerpc/c/f6fad4fb55936f0d613cea08341d187d691d6440
[19/22] powerpc/kuap: Wire-up KUAP on 40x
        https://git.kernel.org/powerpc/c/fcf9bb6d32f8a268bc3daf3281e3beefabec4e7c
[20/22] powerpc/kuap: Wire-up KUAP on 85xx in 32 bits mode.
        https://git.kernel.org/powerpc/c/4f6a025201a290316b28a2a0ef9950398bd75088
[21/22] powerpc/kuap: Wire-up KUAP on book3e/64
        https://git.kernel.org/powerpc/c/57bc963837f5f1753a1d51fada54a32b8a84fdc3
[22/22] powerpc: Remove CONFIG_PPC_HAVE_KUAP and CONFIG_PPC_HAVE_KUEP
        https://git.kernel.org/powerpc/c/dede19be5163cdc5b5d65a2ce7e7f6eedcb666ff

cheers
