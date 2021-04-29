Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEE36EC0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:07:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHPn1mWcz3c4g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:07:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJM0fYfz3bcf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:43 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJK6k2Bz9sX2; Fri, 30 Apr 2021 00:02:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20210426203518.981550-1-nathan@kernel.org>
References: <20210426203518.981550-1-nathan@kernel.org>
Subject: Re: [PATCH] powerpc: Avoid clang uninitialized warning in
 __get_user_size_allowed
Message-Id: <161970488758.4033873.8885072573106528353.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:27 +1000
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
Cc: clang-built-linux@googlegroups.com,
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Apr 2021 13:35:18 -0700, Nathan Chancellor wrote:
> Commit 9975f852ce1b ("powerpc/uaccess: Remove calls to __get_user_bad()
> and __put_user_bad()") switch to BUILD_BUG() in the default case, which
> leaves x uninitialized. This will not be an issue because the build will
> be broken in that case but clang does static analysis before it realizes
> the default case will be done so it warns about x being uninitialized
> (trimmed for brevity):
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Avoid clang uninitialized warning in __get_user_size_allowed
      https://git.kernel.org/powerpc/c/f9cd5f91a897ea0c45d0059ceeb091cee78c6ebe

cheers
