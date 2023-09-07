Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C9797F57
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 01:51:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IRadzRuB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhbcG1hQDz3c6c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 09:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IRadzRuB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhbbN4rsvz2yVm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 09:50:39 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-414dff0a8ecso148461cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Sep 2023 16:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694130636; x=1694735436; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI7lyyNrHMidQz42MaI4SQgbCij4QziFNgwQ58DIUNU=;
        b=IRadzRuBkhMIyzEPGHFEKw6t0ABU6oTOK48ES+tgM8SbxXVdXvFnqXQk/4d1FCdyFl
         sFY1GxDZV9xjwotLEXy4KtbEim8ex4XWfr+xhZqTRtePv+83rHjO5tkgTxs03oaIu/By
         CK4Gc6evCatZUJqq+H1SMh8Ngy6bIvPm26DSnQ5w7KgV0U8FbVpwgEWHJwYy63e/k6Hr
         ykw1OG57rIiyQRMh2E2tacu37njf7OA0K23KJVMD9aB64Rtx9KAubhvZWr0kmjlvp4ty
         +7csOdABJ/aBNQNir4MrNrcahuA/FJiGh3NolMRcl2dQsKVdgXyQsPkKb5Eh/xTCI7Ly
         54sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694130636; x=1694735436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI7lyyNrHMidQz42MaI4SQgbCij4QziFNgwQ58DIUNU=;
        b=J1aSbfHWtdhvuL9Yzy3M/OSUar8z1BQYv1hvXGQNg7yuLzoeBr0XYc0W/lEmA0dkyC
         cSYTXf2t1XhzF8FrbGyDwQOfluJmudkxi49s+MxrGAFPguFf1Bv9CVAm0mPE+Tahza6Z
         yFk6nITQweBI+YHeCFPWFt7WKyd2NeTdWT1utaWeHQr++fotrmmKTrGwQ332aPIazFGM
         CDr51w6uFeTo8gMGotEsDWH/WGagMYDR07KExGkKd/f1OD60EGIHTMxEOCFNe3l9LHEr
         WC5JzqR0tvlt2HoFvWay20A60qQrJymwAW1qYwQI/N1Nco5QjWDDoHJ3pXeS4SdxOtV+
         qWqg==
X-Gm-Message-State: AOJu0YwOKRMw2yDUFNbHoBEXvjWlZ3N8B1PBdDj91K4Rm+QYQ1E/lNMm
	LbCrS+4q5tC6RLbWBgTas3YrxKNAm5niBL4kjxcMlA==
X-Google-Smtp-Source: AGHT+IFIrqZFQD5DkBaHyX2450phYhAeUfIeuOhvTy5PjEIztUJEcgP8OQU4IbkYjWqd9kpOx3DBHv79ZeEZsdcTcVM=
X-Received: by 2002:a05:622a:1893:b0:40f:c60d:1c79 with SMTP id
 v19-20020a05622a189300b0040fc60d1c79mr113357qtc.28.1694130636327; Thu, 07 Sep
 2023 16:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 Sep 2023 16:50:23 -0700
Message-ID: <CAP-5=fXVSh0q6cQwQdGR-jxTTec_s43geZ02gEekrFbSvCKnZw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, root <root@ltcden13-lp4.aus.stglabs.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 7, 2023 at 10:17=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> From: root <root@ltcden13-lp4.aus.stglabs.ibm.com>
>
> shellcheck was run on perf tool shell scripts s a pre-requisite
> to include a build option for shellcheck discussed here:
> https://www.spinics.net/lists/linux-perf-users/msg25553.html
>
> And fixes were added for the coding/formatting issues in
> two patchsets:
> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atrajeev@=
linux.vnet.ibm.com/
> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atrajeev@=
linux.vnet.ibm.com/
>
> Three additional issues are observed with shellcheck "0.6" and
> this patchset covers those. With this patchset,
>
> # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellcheck =
-S warning $F; done
> # echo $?
> 0
>
> Athira Rajeev (3):
>   tests/shell: Fix shellcheck SC1090 to handle the location of sourced
>     files
>   tests/shell: Fix shellcheck issues in tests/shell/stat+shadow_stat.sh
>     tetscase
>   tests/shell: Fix shellcheck warnings for SC2153 in multiple scripts

Series:
Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 4 ++++
>  tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 4 ++++
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 4 ++++
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 4 ++++
>  tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 4 ++++
>  tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 ++
>  tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 ++
>  tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 ++
>  tools/perf/tests/shell/record.sh                             | 1 +
>  tools/perf/tests/shell/stat+csv_output.sh                    | 1 +
>  tools/perf/tests/shell/stat+csv_summary.sh                   | 4 ++--
>  tools/perf/tests/shell/stat+shadow_stat.sh                   | 4 ++--
>  tools/perf/tests/shell/stat+std_output.sh                    | 1 +
>  tools/perf/tests/shell/test_intel_pt.sh                      | 1 +
>  tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 1 +
>  15 files changed, 35 insertions(+), 4 deletions(-)
>
> --
> 2.31.1
>
