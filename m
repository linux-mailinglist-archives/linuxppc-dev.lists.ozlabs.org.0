Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DB748B48
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 20:13:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx77T3NQ6z3bnQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 04:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.179; helo=mail-yb1-f179.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx77075PKz301r
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 04:12:44 +1000 (AEST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-c5079a9f1c8so4438443276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 11:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688580762; x=1691172762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUbJVrXykPtTwLEN35bp+YMF5Iwo0jRebaoRjMV9YYA=;
        b=iXzh4y+0nQ3lBWLux1ERfpqYQd9LHFZGD6GW5RjKcpRln3fvdUVG6JBIUQSBPrHZK4
         JSo1dSj3mP/HVFs5mEX2SF9PEp8RGcV2cnqVaIfGZJWpq0hBVdNmQ64hkX+X9633OjyN
         fP2atW41wJ3SNGnmtOSz2BUsjOxuK9Kt9gywWngn+1b6yFcTUXPhNXAz3n/btQvyJ7aW
         l5i+yVM98uTmYlgAlXZQ2pHQ+zrsqhJm77/dY7lzd0eKUtC/YKvlFKfx04pMr4+Z3W4v
         QuRWt+nzMKqhyAtV0ouCsFMTrYcFvypNYWhcBd//oEZG4FC5TaIwJcJnv+ihNAsSmOa0
         QH4w==
X-Gm-Message-State: ABy/qLb//V3zJOtMD8ESpbR4bp8O9ncCYUnyqdE3NgwiXxmcmsXf1Uyu
	S2TYSjAIXFBj1Xac1+xbD4Etbs1+sd0LTP/ADOzBxXUv
X-Google-Smtp-Source: APBJJlGcCUd3OPl6x4E/KJ1bM1hcGmH0AfrHrP6WKUTWzS9wXHW/TUeQksD1seTwutGj57E0TY7DVsFceNN1APE9OeY=
X-Received: by 2002:a25:4ac8:0:b0:c63:8058:f4a3 with SMTP id
 x191-20020a254ac8000000b00c638058f4a3mr1645891yba.58.1688580762285; Wed, 05
 Jul 2023 11:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230704050353.14979-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230704050353.14979-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 5 Jul 2023 11:12:31 -0700
Message-ID: <CAM9d7cidXVFN41-jAtnJsw8EfrqCa1rYypJk0sj4WnYzfGC_6Q@mail.gmail.com>
Subject: Re: [PATCH] tools/perf/tests: Fix objdump in Object code reading test
 to look for all sections
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

On Mon, Jul 3, 2023 at 10:04=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Object code reading test fails intermittently with below logs:
>
>    Reading object code for memory address: 0xc008000001dd34fc
>    File is: /lib/modules/6.3.0-rc7+/kernel/fs/xfs/xfs.ko
>    On file address is: 0x11359c
>    Objdump command is: objdump -z -d --start-address=3D0x1134fc --stop-ad=
dress=3D0x11357c /lib/modules/6.3.0-rc7+/kernel/fs/xfs/xfs.ko
>    objdump read too few bytes: 128
>    test child finished with -1
>    ---- end ----
>    Object code reading: FAILED!
>
> This issue happens ramdomly depending on the sample ip
> captured during the test run. In some cases, the same ip falls
> in the xfs module. The test does an objdump on the xfs.ko file and
> compares it with the dump from the dso that perf captures. But
> since the range of ip address falls in debug info section, it fails

This is strange.  Why did it fall into the debug section?

Thanks,
Namhyung


> to find the address range with objdump. Fix the objdump option so
> as to disasseble all sections to check the address range.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/code-reading.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-read=
ing.c
> index ed3815163d1b..02132478856a 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -184,7 +184,7 @@ static int read_via_objdump(const char *filename, u64=
 addr, void *buf,
>         FILE *f;
>         int ret;
>
> -       fmt =3D "%s -z -d --start-address=3D0x%"PRIx64" --stop-address=3D=
0x%"PRIx64" %s";
> +       fmt =3D "%s -z -D --start-address=3D0x%"PRIx64" --stop-address=3D=
0x%"PRIx64" %s";
>         ret =3D snprintf(cmd, sizeof(cmd), fmt, "objdump", addr, addr + l=
en,
>                        filename);
>         if (ret <=3D 0 || (size_t)ret >=3D sizeof(cmd))
> --
> 2.35.3
>
