Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDA19BFB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 12:56:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tKkS3ZH7zDrHt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 21:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tKhc4HkMzDrBm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 21:54:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gA+0yFMo; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tKhb4hmdz9sRN;
 Thu,  2 Apr 2020 21:54:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585824895;
 bh=k1eckHiRYcUlA+oiJEV2L/x/tm7pSdUROFgylzAgvQU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gA+0yFMo3UD0GnfCfq46uR33SrXx1FsexzcNqB3CXDFCYHE59cFy2VnnS1bQIvdrf
 0zTKrYmKBFNayJsUsasr49Wfm552UUbCi4XJ9KdDCiLJUwbK0RW278t4WMtymrG+Vn
 Nfs/6qtq/kygTgiloASV3SuZ+WnMMzJ+xQEPe1w/NG86zeJcjx/BHdkUXB8KR4GJJW
 sc5yYICTiIakePYPx29WodTJNujWgSSjUsfuXU9DHZgsHRbCLGSti6FJPgwOKU6JFb
 M9+pDGIV/lU7gjeGLdJKOyDPuJtRubxCVidHxuru4HV/ga173tPOXo/lZxkGEWrtxw
 t7QeDuLD7nYcw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>,
 Raphael Moreira Zinsly <rzinsly@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-crypto@vger.kernel.org
Subject: Re: [PATCH V2 3/5] selftests/powerpc: Add NX-GZIP engine compress
 testcase
In-Reply-To: <87369mwgwy.fsf@dja-thinkpad.axtens.net>
References: <20200327181610.13762-1-rzinsly@linux.ibm.com>
 <20200327181610.13762-4-rzinsly@linux.ibm.com>
 <87369mwgwy.fsf@dja-thinkpad.axtens.net>
Date: Thu, 02 Apr 2020 21:55:03 +1100
Message-ID: <875zeitawo.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: abali@us.ibm.com, haren@linux.ibm.com, herbert@gondor.apana.org.au,
 Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Raphael Moreira Zinsly <rzinsly@linux.ibm.com> writes:
>
>> Add a compression testcase for the powerpc NX-GZIP engine.
>>
>> Signed-off-by: Bulent Abali <abali@us.ibm.com>
>> Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
...
>> diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c b/tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c
>> new file mode 100644
>> index 000000000000..d28e1efb527b
>> --- /dev/null
>> +++ b/tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c
>> @@ -0,0 +1,259 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +/* Copyright 2020 IBM Corp.
>> + *
>> + * Author: Bulent Abali <abali@us.ibm.com>
>> + *
>> + */
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +#include <stdint.h>
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>> +#include <sys/time.h>
>> +#include <sys/fcntl.h>
>> +#include <sys/mman.h>
>> +#include <endian.h>
>> +#include <bits/endian.h>
>> +#include <sys/ioctl.h>
>> +#include <assert.h>
>> +#include <errno.h>
>> +#include <signal.h>
>> +#include "nx-gzip.h"
>> +#include "nx.h"
>> +#include "copy-paste.h"
>> +#include "nxu.h"
>> +#include "nx_dbg.h"
>> +#include <sys/platform/ppc.h>
>> +
>> +#define barrier()
>> +#define hwsync()    ({ asm volatile("hwsync" ::: "memory"); })
>
> This doesn't compile on the clang version I tried as it doesn't
> recognise 'hwsync'.

What assembler are you using? I guess the LLVM one?

Can you try with -fno-integrated-as ?

> Does asm volatile("sync" ::: "memory");
> do the same thing? That is recognised by clang, but I don't know if
> dropping the hw prefix matters!

It shouldn't matter.

But you can just try it and look at the generated code to be sure, you
should get 0x7c0004ac.

cheers
