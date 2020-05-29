Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92C1E74D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 06:26:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YBNW2bFWzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 14:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YBF64QfvzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 14:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49YBF610M2z9sSw; Fri, 29 May 2020 14:20:26 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b44f687386875b714dae2afa768e73401e45c21c
In-Reply-To: <ebf1250b6d4f351469fb339e5399d8b92aa8a1c1.1585898438.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, airlied@linux.ie, daniel@ffwll.ch,
 torvalds@linux-foundation.org, viro@zeniv.linux.org.uk,
 akpm@linux-foundation.org, keescook@chromium.org, hpa@zytor.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 3/5] drm/i915/gem: Replace user_access_begin by
 user_write_access_begin
Message-Id: <49YBF610M2z9sSw@ozlabs.org>
Date: Fri, 29 May 2020 14:20:25 +1000 (AEST)
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 intel-gfx@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-04-03 at 07:20:52 UTC, Christophe Leroy wrote:
> When i915_gem_execbuffer2_ioctl() is using user_access_begin(),
> that's only to perform unsafe_put_user() so use
> user_write_access_begin() in order to only open write access.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Applied to powerpc topic/uaccess, thanks.

https://git.kernel.org/powerpc/c/b44f687386875b714dae2afa768e73401e45c21c

cheers
