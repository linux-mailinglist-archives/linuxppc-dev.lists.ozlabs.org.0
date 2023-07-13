Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 651207515BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 03:17:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XlqLAMO8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1cCt2Ghfz3c5Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 11:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XlqLAMO8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1cC11Jkpz3bvn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 11:16:43 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-40371070eb7so87781cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 18:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689211000; x=1691803000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSajZfL2Fg0+J9rUBR1X7rs0ogrromMkaV9GMdpQR6o=;
        b=XlqLAMO8KVLs1TgPlknrE6np08aOXrPRvw+L2tMV9m7sq4cerUQI28bzwucqz4ZvKR
         5Qh2oEcw0Zo/mjU/R8lxQs2TcTqzi6ZxHRubE5t8HMI/rM1VLEKlU66qEhA5wq41Ruw8
         cbKpyduCN4YEVU41hb5FI+kLzjRE3gIaa601AD/53TZI+zDXk2wB7SmilloNJDq/P8rx
         RaYucwWdy/fOEvIrv2fOmzn+7Rkc9SELBzkG3pmiS6U73oQ0qpobN80vF3Hu4pzoG43Z
         9CEv57kaChhbKa0Gm2oTKyOXwSo2HOeB7uRvxCR3GlnwXBpaCtzs2D9g46/gLuAfnNK+
         CNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689211000; x=1691803000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSajZfL2Fg0+J9rUBR1X7rs0ogrromMkaV9GMdpQR6o=;
        b=RH7y37j5jGn9TsFAaFEbZ5ItCH4bSkwDUcWflkjqHn3CjTErmOX/ohFKKTPeb0VMKO
         y9JOPtuQGfBQfWllgoKG0qwON6CBCxIwXnI0MAb58ott2B6ji+l8FqJ7Ye/9SfZ38iwV
         ZnJsMdKZD98qyKvlRS1O59A1/nWnrky0U/gzrnbEvB+X+sEa2jQWR7klG3mIDjNpul1W
         tPYikfdXRYLxYObIc6UJEqQaDIOp/C3S9wtqOuR7qKUNxXnWtzClj4HqjEB55P0Vq+3/
         LissCHOnbGttwXPBFGnSFiKYmyyzUlW6dto8apXQm7pyI9KtX3KDWyrplgl1MAcm3A1f
         hBvg==
X-Gm-Message-State: ABy/qLZ+ttAM3pwlA1FcBAoFrTGtlgOtbBpz3HmFSBxKzbTizwufc/I+
	zlihc2Z2COlvcpyttAV8k+maBygN9LHZJbdyOvufgA==
X-Google-Smtp-Source: APBJJlHgGYB6bDXnHoALNNfwk4u4ow9Nn1d4x5+8cXY/amZiok4oGbJ2v94RKPuDwgASCfqSsRhVT8uRXOFTtnAzD10=
X-Received: by 2002:a05:622a:178a:b0:3f9:56c:1129 with SMTP id
 s10-20020a05622a178a00b003f9056c1129mr357429qtk.5.1689211000179; Wed, 12 Jul
 2023 18:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com> <20230613164145.50488-18-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230613164145.50488-18-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 12 Jul 2023 18:16:28 -0700
Message-ID: <CAP-5=fUYTjPjL0c_R6F=RTOaRtbOvctVubvn6S1hxLYd5g1o3A@mail.gmail.com>
Subject: Re: [PATCH 17/17] perf tests task_analyzer: skip tests if no
 libtraceevent support
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
Cc: maddy@linux.ibm.com, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, Aditya Gupta <adityag@linux.ibm.com>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 10:04=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> From: Aditya Gupta <adityag@linux.ibm.com>
>
> Test "perf script task-analyzer tests" fails in environment with missing
> libtraceevent support, as perf record fails to create the perf.data
> file, which further tests depend on.
>
> Instead, when perf is not compiled with libtraceevent support, skip those
> tests instead of failing them, by checking the output of `perf
> record --dry-run` to see if it prints the error "libtraceevent is
> necessary for tracepoint support"
>
> For the following output, perf compiled with: `make NO_LIBTRACEEVENT=3D1`
>
> Before the patch:
>
> 108: perf script task-analyzer tests                                 :
> test child forked, pid 24105
> failed to open perf.data: No such file or directory  (try 'perf record' f=
irst)
> FAIL: "invokation of perf script report task-analyzer command failed" Err=
or message: ""
> FAIL: "test_basic" Error message: "Failed to find required string:'Comm'.=
"
> failed to open perf.data: No such file or directory  (try 'perf record' f=
irst)
> FAIL: "invokation of perf script report task-analyzer --ns --rename-comms=
-by-tids 0:random command failed" Error message: ""
> FAIL: "test_ns_rename" Error message: "Failed to find required string:'Co=
mm'."
> failed to open perf.data: No such file or directory  (try 'perf record' f=
irst)
> <...>
> perf script task-analyzer tests: FAILED!
>
> With this patch, the script instead returns 2 signifying SKIP, and after
> the patch:
>
> 108: perf script task-analyzer tests                                 :
> test child forked, pid 26010
> libtraceevent is necessary for tracepoint support
> WARN: Skipping tests. No libtraceevent support
> test child finished with -2
> perf script task-analyzer tests: Skip
>
> Fixes: e8478b84d6ba ("perf test: add new task-analyzer tests")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> ---
>  tools/perf/tests/shell/test_task_analyzer.sh | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/te=
sts/shell/test_task_analyzer.sh
> index b094eeb3bf66..59785dfc11f8 100755
> --- a/tools/perf/tests/shell/test_task_analyzer.sh
> +++ b/tools/perf/tests/shell/test_task_analyzer.sh
> @@ -44,9 +44,20 @@ find_str_or_fail() {
>         fi
>  }
>
> +# check if perf is compiled with libtraceevent support
> +skip_no_probe_record_support() {
> +       perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "li=
btraceevent is necessary for tracepoint support" && return 2

Fwiw, another way to detect build options used in other shell tests is:
perf version --build-options | grep HAVE_LIBTRACEEVENT | grep -q OFF && ret=
urn 2

Thanks,
Ian

> +       return 0
> +}
> +
>  prepare_perf_data() {
>         # 1s should be sufficient to catch at least some switches
>         perf record -e sched:sched_switch -a -- sleep 1 > /dev/null 2>&1
> +       # check if perf data file got created in above step.
> +       if [ ! -e "perf.data" ]; then
> +               printf "FAIL: perf record failed to create \"perf.data\" =
\n"
> +               return 1
> +       fi
>  }
>
>  # check standard inkvokation with no arguments
> @@ -134,6 +145,13 @@ test_csvsummary_extended() {
>         find_str_or_fail "Out-Out;" csvsummary "${FUNCNAME[0]}"
>  }
>
> +skip_no_probe_record_support
> +err=3D$?
> +if [ $err -ne 0 ]; then
> +       echo "WARN: Skipping tests. No libtraceevent support"
> +       cleanup
> +       exit $err
> +fi
>  prepare_perf_data
>  test_basic
>  test_ns_rename
> --
> 2.39.1
>
