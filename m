Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8735D2D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 00:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK2n259SJz3c38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:03:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=nts6sXBG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=kaleshsingh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nts6sXBG; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJyDh6BTdz30G6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 04:38:44 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so9372378pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=znmXIW1/QJS0uTcg80n6f83PnFW9LOiw79fgKlUbw/4=;
 b=nts6sXBGb0eC1anG2BPaT0sd+dN2/tL6x72qAjDVVttCP9qy4xKob6Z64pSuwF9X1y
 ZpBEawHOoU+THK/WeH0tGhwmuPfSa1xfSEGtOrKaQQQRZPqSNFTOc1wpc+/Xt1h9DsLD
 87ouFykHfcUHAimf/co9vcrbxaAg8/QE4/IE8QOPZn/V/PEBdQ2uIaItAbzgfa9jgx/+
 OrSW9DG/DUNLnNnn3z3VFaKzgTM7abDB9zin/CgHCRSePQfCExNPXoNW50Zt+wvZ7SNt
 HNMAMkmM+JpcGao/wUbZujJHmgDB5qbjdghf2NYpEO0oVzGnRin8VtnPVEywUGtm9n1Q
 19/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=znmXIW1/QJS0uTcg80n6f83PnFW9LOiw79fgKlUbw/4=;
 b=TZJ/1jtOKkS6bbX7+A0RHPL8tGbZEg+z97GWr0OivQsf+dkljgreQlI+u9uZWLUUNV
 8Vu5jSNQ+m2ejFSrTODosxfdxom4+X03vw+Hs0tZZd0qdheTM2ceZBTgKmPwfq35GO86
 DpLYSVEoppqDwsNeVFlZQVFOcIGDUPcHY9EnNAprSLngIFOm8s3mLHvZ2uTINr6XwNWM
 MUtSpkTA3hSWB2mNqDljB+lALW9oCk23nSoYTCRhReTu7/Enu7OHK1YN3+4JlMs3nek3
 oGQCFEu47rXyuNYmSDOTKhGZb2NJTdDDuhCWs/zvZdrdl+yPl2u87/bOVHDhgB1COA+3
 yKhw==
X-Gm-Message-State: AOAM531QkbUDDwqQfFziUKE12qaHGBS+0YyzsbOHsJVQPKnABNfJcH7V
 jqLmNg7ykOf8n8LVDBfiaCn0GWcIB/hJwd882FO7jg==
X-Google-Smtp-Source: ABdhPJysusR/0ohykd080zxtz0L/gAQRVHtNW+nVOMELoEOreBYlWERdT7s5icQwW3t/Xk04rh8mVkDFh6B/pOQG3Zc=
X-Received: by 2002:a17:90a:7d05:: with SMTP id
 g5mr572428pjl.114.1618252721322; 
 Mon, 12 Apr 2021 11:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
 <20210330060752.592769-3-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210330060752.592769-3-aneesh.kumar@linux.ibm.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Mon, 12 Apr 2021 11:38:30 -0700
Message-ID: <CAC_TJveHUqijcvneKTLNH76MQp_PyqOmzp-x_QiSiQqujmtSGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] selftest/mremap_test: Avoid crash with static build
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 13 Apr 2021 08:01:23 +1000
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
Cc: npiggin@gmail.com, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 joel@joelfernandes.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 11:08 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> With a large mmap map size, we can overlap with the text area and using
> MAP_FIXED results in unmapping that area. Switch to MAP_FIXED_NOREPLACE
> and handle the EEXIST error.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: Kalesh Singh <kaleshsingh@google.com>

> ---
>  tools/testing/selftests/vm/mremap_test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/vm/mremap_test.c b/tools/testing/selftests/vm/mremap_test.c
> index c9a5461eb786..0624d1bd71b5 100644
> --- a/tools/testing/selftests/vm/mremap_test.c
> +++ b/tools/testing/selftests/vm/mremap_test.c
> @@ -75,9 +75,10 @@ static void *get_source_mapping(struct config c)
>  retry:
>         addr += c.src_alignment;
>         src_addr = mmap((void *) addr, c.region_size, PROT_READ | PROT_WRITE,
> -                       MAP_FIXED | MAP_ANONYMOUS | MAP_SHARED, -1, 0);
> +                       MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
> +                       -1, 0);
>         if (src_addr == MAP_FAILED) {
> -               if (errno == EPERM)
> +               if (errno == EPERM || errno == EEXIST)
>                         goto retry;
>                 goto error;
>         }
> --
> 2.30.2
>
