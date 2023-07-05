Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0B748B41
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 20:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx73w4cqCz3bh5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 04:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.174; helo=mail-yb1-f174.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx73N4tDvz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 04:09:34 +1000 (AEST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-c01e1c0402cso6618135276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 11:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688580572; x=1691172572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25IhV79GGxnPjGPOZFmmn6T90UuWMvkNhe+QXJFLRLA=;
        b=gkQuzNXpc0fDMTuBtVw2+jgD9d0aKavn8Kq5MpRA2Kn10pQ6qZG56YBPIODFm9WcUF
         6toGqf2Nd/CKDtRT3+fF++3CU23CWFGsbXP/J0hAQHuz3oNjyckJGqyjm9Guyib5WqXJ
         HMMkoynKNJyTydJYrfj795uaiL8IsBFVbvIIy7DDZed0s9OgQmCYFVCZqMbDUwz6jHYx
         QLkecGQo0hWkjLAT2jJ4fdl+H7Ago9NAvmw9ZgN4E3tM5GUKncmEOaaTJC8IeMWzHMbA
         NNUugINXW7jhpF19WBYjKEcq71U0CkqUQBfZmbdP7RBwzKJMiEaKFglIplQYjL49aise
         axdQ==
X-Gm-Message-State: ABy/qLaPA/0UcJBKCDqT0nfz3kJyru5q0wu2EuZFZOP9jBtBjQ3ympjg
	uPNHYve458dPoVFR9Slr/U83Y2rgNSBtTz5a4Gs=
X-Google-Smtp-Source: APBJJlHwrS4nf8rJTk5f0YBRHvIgjXfKS71w5014nQJecXOGCKHjxX2wEzvCCeojB12kpj0VL+rOXigMan1MOeWwDig=
X-Received: by 2002:a25:60d6:0:b0:be6:6539:7fdc with SMTP id
 u205-20020a2560d6000000b00be665397fdcmr12273915ybb.1.1688580571841; Wed, 05
 Jul 2023 11:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230704050327.14963-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230704050327.14963-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 5 Jul 2023 11:09:20 -0700
Message-ID: <CAM9d7chgkbsRn4Zt_hXodEzMYgVQAuAJux-kWQTjCFXb4z=TbQ@mail.gmail.com>
Subject: Re: [PATCH] tools/perf/tests: Fix Basic BPF llvm compile to check for
 libbpf support
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, james.clark@arm.com, jolsa@kernel.org, kjain@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Jul 3, 2023 at 10:03=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Basic BPF llvm compile fails in systems with libbpf
> that doesn't support BTF. Log shows below information.
>
>         libbpf: BTF is required, but is missing or corrupted.
>         Failed to parse test case 'Basic BPF llvm compile'
>         test child finished with -2
>         ---- end ----
>
> Here BPF llvm compile fails due to missing BTF support.
> Fix the llvm test to skip the test incase BTF support is
> missing.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/llvm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/llvm.c b/tools/perf/tests/llvm.c
> index 0bc25a56cfef..4c73c9eab0bb 100644
> --- a/tools/perf/tests/llvm.c
> +++ b/tools/perf/tests/llvm.c
> @@ -4,6 +4,7 @@
>  #include <string.h>
>  #include "tests.h"
>  #include "debug.h"
> +#include <errno.h>
>
>  #ifdef HAVE_LIBBPF_SUPPORT
>  #include <bpf/libbpf.h>
> @@ -14,8 +15,12 @@ static int test__bpf_parsing(void *obj_buf, size_t obj=
_buf_sz)
>         struct bpf_object *obj;
>
>         obj =3D bpf_object__open_mem(obj_buf, obj_buf_sz, NULL);
> -       if (libbpf_get_error(obj))
> +       if (libbpf_get_error(obj)) {
> +               /* Skip if there is no BTF support */
> +               if (errno =3D=3D ENOENT)

Can we use the return value of libbpf_get_error() instead of
using the errno?

Also I'm curious why it requires BTF even if the BPF program
doesn't use it.  Is there an option or something for that?

Thanks,
Namhyung


> +                       return TEST_SKIP;
>                 return TEST_FAIL;
> +       }
>         bpf_object__close(obj);
>         return TEST_OK;
>  }
> --
> 2.27.0
>
