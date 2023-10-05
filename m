Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA27B9ADB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 07:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1KHy1PC3z3vdQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 16:05:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.41; helo=mail-pj1-f41.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1KHT4FXXz30hj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 16:04:53 +1100 (AEDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2777a5e22b5so425252a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Oct 2023 22:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696482291; x=1697087091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GpQOgC+hdgh0C9LQyr/MypfTxuRF/K6WCOldOnnXYA=;
        b=OF5e7tynQ3ajc48kjRhVTrlAPVxWsnsEOMFWS6Ybci3GDK83b7MjYDikS7VdlC6ddr
         gMDVY2OUH7BSCq7m8WjNKOlDDZHNC7tokxm4/vjo1mtse/EcMknojFIB/XqP5XXEor+H
         VQwiUmf1wnSzqPOztlSG8PG5WJKLu6JYCy3b+PT3cE4WEtoIWJ99fYRBmRR1CInIpfVJ
         2Sn/VNpwQJjLjFFw6RSop/bXlf8JutvvXuZ/k4hDNzG9m2naAN9JEJuzGeJu7SA2zlvw
         oEjUfpTHgJ/8kOXRQDA0cwvuhQngDXFoo4oKDhJ61K3JehPYPI/jzwPK8B2wZL2dVX+h
         ZW+Q==
X-Gm-Message-State: AOJu0Yzc1C+od1+UbTmGVYXerxJZCIKYa0vVj/Gk65Qfd/cdd1iN3cUJ
	pIMqTevDr/fMRMhkt3RRJ3AG2zwo9GvTnTwGPWI=
X-Google-Smtp-Source: AGHT+IFboV2QT7m/k+gdl6ovBnuALbYSTfeigYPbQQByLDnmqlc2aCPlMBNIdTAXTgLjM9gWhJ6jMIsND9j3Kl6RORw=
X-Received: by 2002:a17:90a:c711:b0:268:dad:2fdc with SMTP id
 o17-20020a17090ac71100b002680dad2fdcmr4294888pjt.21.1696482291408; Wed, 04
 Oct 2023 22:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com> <20230929041133.95355-4-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230929041133.95355-4-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 4 Oct 2023 22:04:38 -0700
Message-ID: <CAM9d7cjr0TDjrMkgu3TJ-JTDbi17SAVfeE0_2=ZCjLJ8_uS=Pw@mail.gmail.com>
Subject: Re: [PATCH 3/3] tools/perf/tests: Fix shellcheck warning in
 record_sideband.sh test
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 28, 2023 at 9:11=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Running shellcheck on record_sideband.sh throws below
> warning:
>
>         In tests/shell/record_sideband.sh line 25:
>           if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 true 2=
>&1 >/dev/null
>             ^--^ SC2069: To redirect stdout+stderr, 2>&1 must be last (or=
 use '{ cmd > file; } 2>&1' to clarify).
>
> This shows shellcheck warning SC2069 where the redirection
> order needs to be fixed. Use { cmd > file; } 2>&1 to fix the
> redirection of perf record output
>
> Fixes: 23b97c7ee963 ("perf test: Add test case for record sideband events=
")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/shell/record_sideband.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/record_sideband.sh b/tools/perf/tests=
/shell/record_sideband.sh
> index 5024a7ce0c51..7e036763a43c 100755
> --- a/tools/perf/tests/shell/record_sideband.sh
> +++ b/tools/perf/tests/shell/record_sideband.sh
> @@ -22,7 +22,7 @@ trap trap_cleanup EXIT TERM INT
>
>  can_cpu_wide()
>  {
> -    if ! perf record -o ${perfdata} -BN --no-bpf-event -C $1 true 2>&1 >=
/dev/null
> +    if ! { perf record -o ${perfdata} -BN --no-bpf-event -C $1 true > /d=
ev/null; } 2>&1

I think we usually go without braces.

Thanks,
Namhyung


>      then
>          echo "record sideband test [Skipped cannot record cpu$1]"
>          err=3D2
> --
> 2.31.1
>
