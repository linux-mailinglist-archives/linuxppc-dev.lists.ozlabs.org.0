Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C75209873
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 04:24:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49skNg3ZyzzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 12:24:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PzlzzsXi; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49skLd6FLKzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 12:22:33 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id 64so3877374oti.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 19:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xdH2xoOfsMc7dLXOy11ch04mvWFiqfyRgGDX8RhsAdM=;
 b=PzlzzsXi4vVm7zffx8Yo9gyOUr3qCdbKHkUA4Zyjk1gn67CBMffhG5e0PgHHaJvSoF
 tnxPAXZIalCdxLefn4UWAkGjMM7Z9FE1WgqFzBpH8pxA85Xz4ai3HlNbRF5ti9WN4r9R
 hyKsgY+VszOzmchvlaubSQyESeb2ZE+rL/vEkUlIVCWFhCC5tQ/eaMv0n8wRnj4hlOVB
 9LDTKDErXb4ktKPXQGO1CgQoeeSt+SDSDKj+vKnfMAG64ckNEVFLhmRMAa37HeGg5UyN
 FmtyEyxDfDZZYeXFwg94RrICQCXBmkLmp+DW/3/jGP/q/9MRqeF9UHkuiD2/RxEnCCGH
 o34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xdH2xoOfsMc7dLXOy11ch04mvWFiqfyRgGDX8RhsAdM=;
 b=nwXlH4drjT3Se4ynzteMObSIlq4UWW2r7CN5NcbqW0sKHHISMICzrc9r7T90YEFTSA
 dHFSyv+q9G3U9+ZLP98dSByiZ7NwBxubHXEifnfKN4NXm3mDdR+FjVmHF9zddjeRFuqK
 cWieUkEnm3Co1eqoEWA//M1e7m48Ou8aiftct/oGcc1JgBb2P2Mo36XCH2GZH6+gfmVj
 KHmrmii3KsnD8JRHgbLo/LigYAjfBHj/l4OiGDSDk2SfHJCH2+ynVZsLSI48PHrvhGyb
 pj4WOfO8ezi5VhDbuaHI8MAvnzWb/2sDnIoleb4isgc4drB7yFvU1MD0C/H/QWHQtBmN
 6R8w==
X-Gm-Message-State: AOAM531WJauFdJ4BT2qhFGenVUM2eeo64mfKqCsbnEYy+MRN7Pvyz0Vi
 +hOTw41mzv1BApg/cw4qXg8=
X-Google-Smtp-Source: ABdhPJwCCJUGGje/syyoFSwUc/3gTdj+4NS45vdvyfiLp8yXx33fvNF2taA0vu8wfSWV15opFUr4Qg==
X-Received: by 2002:a4a:b791:: with SMTP id a17mr25742894oop.48.1593051750035; 
 Wed, 24 Jun 2020 19:22:30 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id h17sm2801127oor.18.2020.06.24.19.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 19:22:29 -0700 (PDT)
Date: Wed, 24 Jun 2020 19:22:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
Message-ID: <20200625022228.GA2871607@ubuntu-n2-xlarge-x86>
References: <20200624035920.835571-1-natechancellor@gmail.com>
 <1bbb6956-d9de-e0c8-5b45-20b6fecc2189@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bbb6956-d9de-e0c8-5b45-20b6fecc2189@infradead.org>
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

Hi Geoff,

On Wed, Jun 24, 2020 at 06:18:48PM -0700, Geoff Levand wrote:
> Hi Nathan,
> 
> On 6/23/20 8:59 PM, Nathan Chancellor wrote:
> > These are not true arrays, they are linker defined symbols, which are
> > just addresses.  Using the address of operator silences the warning
> > and does not change the resulting assembly with either clang/ld.lld
> > or gcc/ld (tested with diff + objdump -Dr).
> 
> Thanks for your patch.  I tested this patch applied to v5.8-rc2 on a
> PS3 and it seems OK.
> 
> Tested-by: Geoff Levand <geoff@infradead.org>

Thanks a lot for the quick response and testing, I really appreciate it!

Cheers,
Nathan
