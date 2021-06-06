Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D239CECC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb3p5jB1z3bwx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb371kXrz2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb353sKCz9sRN; Sun,  6 Jun 2021 22:12:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 gustavoars@kernel.org, ojeda@kernel.org, ndesaulniers@google.com,
 Zhang Jianhua <chris.zjh@huawei.com>
In-Reply-To: <20210510075134.252978-1-chris.zjh@huawei.com>
References: <20210510075134.252978-1-chris.zjh@huawei.com>
Subject: Re: [PATCH -next] ppc: boot: Fix a typo in the file decompress.c
Message-Id: <162298131565.2353459.16060565445905530615.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:35 +1000
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

On Mon, 10 May 2021 15:51:34 +0800, Zhang Jianhua wrote:
> s/input buffer/output buffer/
> s/length of the input buffer/length of the input buffer/
> 
> --------

Applied to powerpc/next.

[1/1] ppc: boot: Fix a typo in the file decompress.c
      https://git.kernel.org/powerpc/c/930a77c3ad79c30ce9ba8cbad9eded5bc5805343

cheers
