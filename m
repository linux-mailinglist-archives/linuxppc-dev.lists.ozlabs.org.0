Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0252DD03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 20:46:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3zMW3XXzz308C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 04:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZFZcj8t2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a2a;
 helo=mail-vk1-xa2a.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ZFZcj8t2; dkim-atps=neutral
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3zLs3fWBz2yyQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 04:45:24 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id m203so3154932vke.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UErDeXihakGThWuvWZEyYnX/IDLG+tP7OOkjLo42zSU=;
 b=ZFZcj8t2sudf8IYNq7JukgVc+l+tHXO3iI0qsAICIHY2ygKHz+QzkRwdVafSLNHg6S
 g57bJQSFd/EMGjboR4f6SpCS9Zbdg4929nTYIj8H0qLLNXk4vwUaaEwybUpdycCPQAmB
 8pIGiNaePzXR7UPrvsoy9WLWL+9b+eU3Han+/pO9/0pY+wB5U5hTCxKoAwhauzy81AhW
 /hfYdQuNDhXNylBIA9y2AUZTiITUBsPMuuTdoPXtjiillWTCZAj2Z8FLnDY++nX9ncNb
 su+I0KcwA96K2A2lmyOmT0j+zGno9ww85UMvyJSdtc4x1+qWc28AUAXbGRWanoHPaYXV
 ptRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UErDeXihakGThWuvWZEyYnX/IDLG+tP7OOkjLo42zSU=;
 b=FHpbwXxLkGks8pVucWxiXxRYkg7FgJkjxt1ijsW7u3LboDn/tSZjvQ63WLKFCc+x+0
 GUUBlG4uEeH7VB2GAhcnYWUUz7+CAJO2b9YOLffAL+pvVihpwx1g04bXwgV16tEl8aXj
 Xn9ErFM+9+VMZV+1OrduYwZjLNgrHSvug27VI1oBJzxc+z4Q6mI7JCtknvz/JrOxWVJj
 DChfCLQhSCm6LO6a4Fldawf3KNO6KuAq2p7Q4kGeXRDXw+bfTZo1IoW1/PrFhq4q9UND
 /leAWdUyK67zNQODKhv6ufxhVNosQ8kco9XW93WQvLsh3oldgdHqxel0Fk8hn/Di4GYF
 WQLQ==
X-Gm-Message-State: AOAM532u6A/h5l4y+wIAf3sRcdBev+6ebQ2y2gVzrftzuXAQay+/LPMX
 BzlyOVz4qXVh6C511SJaRE9K6ER5Z8Go9uwbH/OF+A==
X-Google-Smtp-Source: ABdhPJyDCcFCvUFsrfEXlIKurKxXhctkr6C5chXaKtZB0KMsbDNIfmezLlO3zvekD/VeMM8m+lzLHVGly/BsRhMUij8=
X-Received: by 2002:a1f:9fc4:0:b0:345:5848:4f44 with SMTP id
 i187-20020a1f9fc4000000b0034558484f44mr2807446vke.2.1652985920452; Thu, 19
 May 2022 11:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220519154324.12531-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220519154324.12531-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 May 2022 11:45:07 -0700
Message-ID: <CAP-5=fXrtTe=6-z8-OMzG60XZmA92nHEhc94+NyCJK-ZPDekPQ@mail.gmail.com>
Subject: Re: [PATCH V2] tools/perf/test: Fix perf all PMU test to skip
 hv_24x7/hv_gpci tests on powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 8:43 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> "perf all PMU test" picks the input events from
> "perf list --raw-dump pmu" list and runs "perf stat -e"
> for each of the event in the list. In case of powerpc, the
> PowerVM environment supports events from hv_24x7 and hv_gpci
> PMU which is of example format like below:
> - hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
> - hv_gpci/event,partition_id=?/
>
> The value for "?" needs to be filled in depending on
> system and respective event. CPM_ADJUNCT_INST needs have
> core value and domain value. hv_gpci event needs partition_id.
> Similarly, there are other events for hv_24x7 and hv_gpci
> having "?" in event format. Hence skip these events on powerpc
> platform since values like partition_id, domain is specific
> to system and event.
>
> Fixes: 3d5ac9effcc6 ("perf test: Workload test of all PMUs")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>  v1 -> v2:
>  Instead of checking for platform, used the pmu name
>  ie, hv_24x7 and hv_gpci to skip the test since this
>  pmu name is specific to powerpc as suggested by
>  Michael Ellerman.
>
>  tools/perf/tests/shell/stat_all_pmu.sh | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/perf/tests/shell/stat_all_pmu.sh b/tools/perf/tests/shell/stat_all_pmu.sh
> index b30dba455f36..7d046bb8a7b9 100755
> --- a/tools/perf/tests/shell/stat_all_pmu.sh
> +++ b/tools/perf/tests/shell/stat_all_pmu.sh
> @@ -5,6 +5,16 @@
>  set -e
>
>  for p in $(perf list --raw-dump pmu); do
> +  # In powerpc, skip the events for hv_24x7 and hv_gpci.
> +  # These events needs input values to be filled in for
> +  # core, chip, patition id based on system.
nit: s/patition/partition/
> +  # Example: hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/

I've no problem with this patch, we may need to do similar for other
architectures. For this specific problem I wonder if rather than
skipping the event the event can be fixed with domain and core set to
1 ? This would provide a little additional coverage.

Thanks,
Ian

> +  # hv_gpci/event,partition_id=?/
> +  # Hence skip these events for ppc.
> +  if echo "$p" |grep -Eq 'hv_24x7|hv_gpci' ; then
> +    echo "Skipping: Event '$p' in powerpc"
> +    continue
> +  fi
>    echo "Testing $p"
>    result=$(perf stat -e "$p" true 2>&1)
>    if ! echo "$result" | grep -q "$p" && ! echo "$result" | grep -q "<not supported>" ; then
> --
> 2.35.1
>
