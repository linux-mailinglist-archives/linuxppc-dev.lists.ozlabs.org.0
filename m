Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2B35AE60
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcsK5LF3z3dJy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp82Vsrz3bwL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:36 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp23yX0z9sWP; Sun, 11 Apr 2021 00:29:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, cmr@codefail.de,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 00/10] Convert signal32 to user read access by block
Message-Id: <161806493285.1467223.5574270316923753261.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:52 +1000
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 11:06:49 +0000 (UTC), Christophe Leroy wrote:
> Similarly to the work done earlier with writes, this series
> converts signal32 to using user_read_access_begin/end and
> unsafe_get_user() and friends.
> 
> Applies on to of the signal64 series, ie on merge-test (ca6e327fefb2)
> 
> Christophe Leroy (10):
>   signal: Add unsafe_get_compat_sigset()
>   powerpc/uaccess: Also perform 64 bits copies in
>     unsafe_copy_from_user() on ppc32
>   powerpc/signal: Add unsafe_copy_ck{fpr/vsx}_from_user
>   powerpc/signal32: Rename save_user_regs_unsafe() and
>     save_general_regs_unsafe()
>   powerpc/signal32: Remove ifdefery in middle of if/else in sigreturn()
>   powerpc/signal32: Perform access_ok() inside restore_user_regs()
>   powerpc/signal32: Reorder user reads in restore_tm_user_regs()
>   powerpc/signal32: Convert restore_[tm]_user_regs() to user access
>     block
>   powerpc/signal32: Convert do_setcontext[_tm]() to user access block
>   powerpc/signal32: Simplify logging in sigreturn()
> 
> [...]

Applied to powerpc/next.

[01/10] signal: Add unsafe_get_compat_sigset()
        https://git.kernel.org/powerpc/c/fb05121fd6a20f0830ff2a4420c51af6ca4ac6e7
[02/10] powerpc/uaccess: Also perform 64 bits copies in unsafe_copy_from_user() on ppc32
        https://git.kernel.org/powerpc/c/c1cc1570bc8d94f288060f262f11be8f7672578c
[03/10] powerpc/signal: Add unsafe_copy_ck{fpr/vsx}_from_user
        https://git.kernel.org/powerpc/c/7c11f8893a76ac4e86c07f4b57371d5fa593627f
[04/10] powerpc/signal32: Rename save_user_regs_unsafe() and save_general_regs_unsafe()
        https://git.kernel.org/powerpc/c/f918a81e209f24acb45cd935bcfb78d2c024f6a1
[05/10] powerpc/signal32: Remove ifdefery in middle of if/else in sigreturn()
        https://git.kernel.org/powerpc/c/ca9e1605cdd9473a0eb4d6da238d2524be12591a
[06/10] powerpc/signal32: Perform access_ok() inside restore_user_regs()
        https://git.kernel.org/powerpc/c/362471b3192e4184fff5fedee1ea20bdf637a0c8
[07/10] powerpc/signal32: Reorder user reads in restore_tm_user_regs()
        https://git.kernel.org/powerpc/c/036fc2cb1dc2245c2ea7d2f03c7af80417b6310c
[08/10] powerpc/signal32: Convert restore_[tm]_user_regs() to user access block
        https://git.kernel.org/powerpc/c/627b72bee84d6652e0af26617e71ce2b3c18fcd5
[09/10] powerpc/signal32: Convert do_setcontext[_tm]() to user access block
        https://git.kernel.org/powerpc/c/887f3ceb51cd34109ac17bfc98695162e299e657
[10/10] powerpc/signal32: Simplify logging in sigreturn()
        https://git.kernel.org/powerpc/c/c7393a71eb1abdda7e3a3ef798bae60de11540ec

cheers
