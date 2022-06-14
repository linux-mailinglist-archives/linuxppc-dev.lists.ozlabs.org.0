Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690454B36B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 16:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMrgN6WXnz3cd1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:39:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LhfEscu4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=irogers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LhfEscu4;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMrfp19W9z306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 00:39:12 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id o16so11592350wra.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P5SSmOpxaieAxhBhqLWRq50g/jaHGZ+k1H6+ZODiYts=;
        b=LhfEscu4SL/74tSj97prUIfgT825d4K7enMooSY9LuVRkpG/9fKkilfDhaXyGaRK+X
         6WjpPY20DgafAmrFzGmZnHZzPgqJr20pxhwzByrKfmX9Y8RJs+nxCVpFIapqDO7m771z
         Rsa3ALsO9dINWlsHpfnd9yuqMLd1ZebR6EnOkn7g4CN5Set3VhlUJsGajH2xi8RG0ypt
         XlDWGze1rayefwh/p4q1wsorWjrIm1AhI+aQ/WCmP+mnv3W3cGC9SrjCDVG6m+5ySmVm
         ISYCLkP1w4Nza0VGGbpFYZOsxZBEDg7Rq0SfWMT86p8sNPg6b0hYdAlfOWmsPQOe5jGN
         RsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P5SSmOpxaieAxhBhqLWRq50g/jaHGZ+k1H6+ZODiYts=;
        b=qvY4KfzKx8NomAzMVEmJSdcNVJxwfJU8Nji6Dx6R7a41TUh3i5CiqlEEupAc8MnkOa
         +vpIichKQSXgWniCFxE71myemNfZJtWGwysz3+rcEbnTGHnr68L3iCs1rzGJpUNmxmzY
         mipBanLWWP/7PQLbvVj13hcUrydQuuQGo1/Z7TUG+B3jWRdTugv6QY6phf01lZM57GGA
         I/zpd45F0TS0NkDcBUoQbAITUS6/a4mI30O1ec61OKT7GMlKIbuhiul3vwkqUQpxvMf5
         NhsxiEMfXkfPyMeFjApFUisb4E/P+vVEeVNJk2CNHKM6qz+R3Wi+8pZVTSkrZyWJTOCk
         Lq3A==
X-Gm-Message-State: AJIora9V/O9eqS+DFqZuuZJzlyeuBGz1AdGo1xs88YmKgH8ImUzqrls6
	/09ok9RLQ7Qy/+Uz1JpobApjEXsyZPxq48UxV4VPWQ==
X-Google-Smtp-Source: AGRyM1s7gwiJFhXq3CTNcQ+tU3H7yju67V8T7j+VRz7Qx3Yg4u1r1anNz4VqC0dMSQxjIrAWVcrJ0JBnWeZG2x80nHU=
X-Received: by 2002:a05:6000:1a8d:b0:219:e3f2:c092 with SMTP id
 f13-20020a0560001a8d00b00219e3f2c092mr5456547wry.375.1655217547516; Tue, 14
 Jun 2022 07:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220610135939.63361-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220610135939.63361-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 14 Jun 2022 07:38:55 -0700
Message-ID: <CAP-5=fV6sPUtSqPBmJ0dmeUK+wuuXgyq-GQRV_g_B5uC4y5oGA@mail.gmail.com>
Subject: Re: [PATCH] tools/perf/tests: Fix session topology test comparison check
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
Cc: maddy@linux.ibm.com, rnsastry@linux.ibm.com, tmricht@linux.ibm.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 7:00 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> commit cfd7092c31ae ("perf test session topology: Fix test to
> skip the test in guest environment") added check to skip the
> testcase if the socket_id can't be fetched from topology info.
> But the condition check uses strncmp which should be changed to
> !strncmp and to correctly match platform. Patch fixes this
> condition check.
>
> Fixes: cfd7092c31ae ("perf test session topology: Fix test to skip the test in guest environment")
> Reported-by: Thomas Richter <tmricht@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
> index d23a9e322ff5..0b4f61b6cc6b 100644
> --- a/tools/perf/tests/topology.c
> +++ b/tools/perf/tests/topology.c
> @@ -115,7 +115,7 @@ static int check_cpu_topology(char *path, struct perf_cpu_map *map)
>          * physical_package_id will be set to -1. Hence skip this
>          * test if physical_package_id returns -1 for cpu from perf_cpu_map.
>          */
> -       if (strncmp(session->header.env.arch, "powerpc", 7)) {
> +       if (!strncmp(session->header.env.arch, "ppc64le", 7)) {
>                 if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) == -1)
>                         return TEST_SKIP;
>         }
> --
> 2.35.1
>
