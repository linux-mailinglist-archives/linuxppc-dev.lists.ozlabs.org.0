Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A178D209834
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 03:21:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49shzp3hwCzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 11:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=X0Kcl4JB; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49shxr5SfdzDqjg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 11:19:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=neCjOc11qing147Knuno5Zs0TZ7UJ5WPV8cnPuKXZ2w=; b=X0Kcl4JBpdGaR57L7a7o8m2MVK
 9CPsfhd4l47obbP5kxoUqUzw0qhHOMnMrXFgG/vrYcyLnfTiGUgQ4vBztg+LhsFwU1mRMjmFCcRdU
 /k27HIRXI9nxUk1q6tPYuY1Wxr3cKhC47UYWDpqxAsoVQ48BMT1H++wcf0o2LxIkOXco7MQsRhX1/
 EDKlPewtAhbsHzGZeTSgrNjrRrUmNs+2ZyUYiotfST5X11j0q8Xl0SdXjOiImVqWzAlvNCDmey62d
 4SlzdAh2PF+Ti5Y+Jbe5NqJ6z5miCgGLFypocEd1X1HodXffQ0+cgwvs8pm/G7owZUnPlf7i3rXim
 IMcSU+Mg==;
Received: from [2602:306:37b0:7840:f887:89b1:c866:efda]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joGXo-0007QV-Kg; Thu, 25 Jun 2020 01:19:13 +0000
From: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
To: Nathan Chancellor <natechancellor@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200624035920.835571-1-natechancellor@gmail.com>
Message-ID: <1bbb6956-d9de-e0c8-5b45-20b6fecc2189@infradead.org>
Date: Wed, 24 Jun 2020 18:18:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624035920.835571-1-natechancellor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

On 6/23/20 8:59 PM, Nathan Chancellor wrote:
> These are not true arrays, they are linker defined symbols, which are
> just addresses.  Using the address of operator silences the warning
> and does not change the resulting assembly with either clang/ld.lld
> or gcc/ld (tested with diff + objdump -Dr).

Thanks for your patch.  I tested this patch applied to v5.8-rc2 on a
PS3 and it seems OK.

Tested-by: Geoff Levand <geoff@infradead.org>


