Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E934A11C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:45:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F69tX2vXfz3bq8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:45:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=NTfOSkbb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=NTfOSkbb; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F69t74cxFz30MT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 16:45:17 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id u19so3853968pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OqOZYiaXe2/4wha1fEs1gVf5T6I4+DZt+BtbIfVMO+A=;
 b=NTfOSkbbavoRe1I6wHo5nMJh++tgT4yErZ9HicwtA0cg85vQvQq9byvRgoV807Y5p0
 pKkzxaDg7V4iAOPeZn/xEAXQQo+vZ5eIUNo9sQEm8xVW7PEb0906GAQJFs9brSP4pxVL
 zFUl4mAYffjkMLE2jAY8RPKeBsfsr0w8pWQSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OqOZYiaXe2/4wha1fEs1gVf5T6I4+DZt+BtbIfVMO+A=;
 b=JW4w4tvQv/Cvy+EkPeN1w5PGLz+jPwJEBW/1CT+Nt5NQxpjIJN6eVY2udkKfymN3hi
 MalcvSJxic9f51Yy9aSviNm8Vyi4z+5ZsxgOcCDthRu+2DZbTQqcC5DrfJNxioS1Qwdq
 C03jip3ypQXCCvrnFeyCjYv3tLdfDArreAjGJcCdrLQ6Qy9G6ZoNJ0DvqHmf7ycqtTLO
 STOKxtF1ITVChBh4D6EVwYsJNyPdKri9dDPRlHlNa2RcrAnn+sY60gmQa6vwtF9/1ehN
 ILo2oMy+AaIECgTdJf5df5+eQU91+JOk+nTAFKPosFlPs7941pxUK4m1sYrqUgHZVfhE
 QjUQ==
X-Gm-Message-State: AOAM531I/OTj1T90xtPgYGfHaUfs+6Mjyq8HP85nF+28j5DLkmBev7F2
 8/rO73QCTloOGsxUAuBPnlqGPA==
X-Google-Smtp-Source: ABdhPJzNEr7O3Y4iBRs57Wo7KFkaic8g91kRGbfEuj3r1OipG51u0rllrwWAbzkp4/W2IqFt/5InAw==
X-Received: by 2002:a05:6a00:c8f:b029:213:db69:18af with SMTP id
 a15-20020a056a000c8fb0290213db6918afmr11139010pfv.76.1616737513575; 
 Thu, 25 Mar 2021 22:45:13 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id u2sm6875572pgf.93.2021.03.25.22.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 22:45:13 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Wan Jiabing <wanjiabing@vivo.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 Wan Jiabing <wanjiabing@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] tools: testing: Remove duplicate includes
In-Reply-To: <20210323061604.289958-1-wanjiabing@vivo.com>
References: <20210323061604.289958-1-wanjiabing@vivo.com>
Date: Fri, 26 Mar 2021 16:45:10 +1100
Message-ID: <87v99e79jt.fsf@linkitivity.dja.id.au>
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wan Jiabing <wanjiabing@vivo.com> writes:

> sched.h has been included at line 33, so remove the 
> duplicate one at line 36.

> pthread.h has been included at line 17,so remove the 
> duplicate one at line 20.

I can see that both of these are correct from the diff.

> inttypes.h has been included at line 19, so remove the 
> duplicate one at line 23.

For this one I checked the file. Indeed there is another inttypes.h, so
this is also correct.

Again, all the automated checks pass. (although I don't think any of the
automated builds include selftests.)

So:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  tools/testing/selftests/powerpc/mm/tlbie_test.c     | 1 -
>  tools/testing/selftests/powerpc/tm/tm-poison.c      | 1 -
>  tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
> index f85a0938ab25..48344a74b212 100644
> --- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
> +++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
> @@ -33,7 +33,6 @@
>  #include <sched.h>
>  #include <time.h>
>  #include <stdarg.h>
> -#include <sched.h>
>  #include <pthread.h>
>  #include <signal.h>
>  #include <sys/prctl.h>
> diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
> index 29e5f26af7b9..27c083a03d1f 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-poison.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
> @@ -20,7 +20,6 @@
>  #include <sched.h>
>  #include <sys/types.h>
>  #include <signal.h>
> -#include <inttypes.h>
>  
>  #include "tm.h"
>  
> diff --git a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
> index e2a0c07e8362..9ef37a9836ac 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
> @@ -17,7 +17,6 @@
>  #include <pthread.h>
>  #include <sys/mman.h>
>  #include <unistd.h>
> -#include <pthread.h>
>  
>  #include "tm.h"
>  #include "utils.h"
> -- 
> 2.25.1
