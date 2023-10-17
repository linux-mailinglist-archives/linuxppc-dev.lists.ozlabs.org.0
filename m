Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1D7CB83A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 04:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8ckF4Plyz3vXC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 13:04:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.47; helo=mail-pj1-f47.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8cjn0pFZz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 13:04:27 +1100 (AEDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-27d5fe999caso1237110a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 19:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697508264; x=1698113064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+GF7dCDjHk8m5WS8HzK25lhtAgTi6Fyhpd2LEXBsic=;
        b=NEx1eyQTrJUQFfpdltH6N4SqsebC9Rf2w6QhI8uKg1CrMcFYrV/79CSSjg9QoJDM6v
         amgQvXx+J6aV876OcVckAXDqqH32sMJbllym4E4ior09+0b1r2AD2M1hYkLXcoV/NetZ
         gAcqTfF4M+o02Lxj34wDW0E3gcQZyKKyvj+PHFeoWElN+N8rp2obKJVu/d5fXWS0bf/B
         vB4toUwl4SPC9LR8zOfoKch+oNX3rGg9ji0kcXa8WVAXQeoVG+oBtyOXf17QMexcjMh/
         hkPFkpRZ+xrAflbCgrWy08mswm8Z2IUqd7vz5UZoxPHXQFtKozZhdJc9jjQg9IXsDuYz
         z8/g==
X-Gm-Message-State: AOJu0YxJglmt/H00e4N72elKvlkao0G/LvMs18ilM/vDTZyuHqynrRLZ
	zjdhv0qC1KP/bfD9OGjcy/YGe1i37eUCY9Z8VQg=
X-Google-Smtp-Source: AGHT+IFrYuYxrCcB1JXBA8JEqzHU7hCBkSpTeW7cvEzxyZwI8/33nx+B/IyphfEiNQF5w2vmkvQ/kEG3UnUP0AIV0PA=
X-Received: by 2002:a17:90a:fa11:b0:27d:3fa4:9d9a with SMTP id
 cm17-20020a17090afa1100b0027d3fa49d9amr799520pjb.29.1697508264166; Mon, 16
 Oct 2023 19:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231013073021.99794-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20231013073021.99794-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 16 Oct 2023 19:04:12 -0700
Message-ID: <CAM9d7ch9Ap+NkdQwTD+BCXNuL6GXRJYJ3vFmH3hFS3F2avT0Jw@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] Fix for shellcheck issues with latest scripts in tests/shell
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

Hello,

On Fri, Oct 13, 2023 at 12:31=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> shellcheck was run on perf tool shell scripts as a pre-requisite
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
> Three additional issues were observed and fixes are part of:
> git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git
>
> With recent commits in perf, other three issues are observed.
> shellcheck version: 0.6.0
> The changes are with recent commits ( which is mentioned in each patch)
> for lock_contention, record_sideband and stat_all_metricgroups test.
> Patch series fixes these testcases and patches are on top of:
> git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git
>
> The version 1 patchset had fix patch for test_arm_coresight.sh.
> Dropping that in V2 based on discussion here:
> https://lore.kernel.org/linux-perf-users/F265857D-0D37-4878-908C-D20732F2=
12F9@linux.vnet.ibm.com/T/#u
>
> Athira Rajeev (3):
>   tools/perf/tests Ignore the shellcheck SC2046 warning in
>     lock_contention
>   tools/perf/tests: Fix shellcheck warning in record_sideband.sh test
>   tools/perf/tests/shell: Fix shellcheck warning SC2112 with
>     stat_all_metricgroups

For the series,
Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung
