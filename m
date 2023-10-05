Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409987B9AD2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 07:03:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1KFK5V2Mz3vc9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 16:03:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.51; helo=mail-pj1-f51.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1KDr6RzNz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 16:02:35 +1100 (AEDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-27760c31056so364044a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Oct 2023 22:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696482153; x=1697086953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucXGMM2wsWZRQUIgE61EwUCtxRL/wptAnVm0ckROPSc=;
        b=mtpa0PpkFb3c4N+/mF6KzdzP7V9xrus+gRxBAvTTTb6dvVHaTxv6JSY2l+zIHfH+Fp
         OzMdk5UuQHdunaKDA5AgEXge94EUh6Gnp42COU3OZLyq+LqSN9lnncI8q7l5Q2XfpuIu
         mIvCS9X+V8FmVn1WWpe45gzHrUELovDoSdlnIxALfnNO+/cKEYe3SqagA1/0xalgkSXa
         qY39a0WulSnnBTyuEMDbepdfF//lS5yxWEL6WBKQkHQsWHy9in15YsTTbmPRHmSyZ6hM
         5Bs5zG9p1/IXHLvRxL3EWJLMsd277M2urP1cjMKX9Lckfq2ncm5pCAp+dSmaF7AfujlV
         g2Cw==
X-Gm-Message-State: AOJu0YxRXUrrZlrcKxN5k1lZKaKDIFx36KFaOzOA6YCOJsdOSJV0yqds
	LS1ss2VOYz/Uk715LTWXvo3qbz9j6OtKbk/rl4I=
X-Google-Smtp-Source: AGHT+IFcEDolgIB6QYHPmh5ef7Xci5FyI7BIz/Zahu5T5nGT9LDu5s5Q7rezmdB93yE13CCofmJWcfrMGf1+iG0cHcE=
X-Received: by 2002:a17:90a:a38b:b0:274:99e7:217e with SMTP id
 x11-20020a17090aa38b00b0027499e7217emr4008307pjp.16.1696482153357; Wed, 04
 Oct 2023 22:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com> <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 4 Oct 2023 22:02:20 -0700
Message-ID: <CAM9d7cj26Dpit3igZjybsbnotBiv_F8mEu62Aor+9bBhwVh55g@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Leo Yan <leo.yan@linaro.org>
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
> Running shellcheck on tests/shell/test_arm_coresight.sh
> throws below warnings:
>
>         In tests/shell/test_arm_coresight.sh line 15:
>         cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name=
 cpu* -print -quit)
>                   ^--^ SC2061: Quote the parameter to -name so the shell =
won't interpret it.
>
>         In tests/shell/test_arm_coresight.sh line 20:
>                 if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =
=3D "0xA13" ] ; then
>                                      ^-- SC2166: Prefer [ p ] && [ q ] as=
 [ p -a q ] is not well defined
>
> This warning is observed after commit:
> "commit bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")"
>
> Fixed this issue by using quoting 'cpu*' for SC2061 and
> using "&&" in line number 20 for SC2166 warning
>
> Fixes: bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

You'd better add Coresight folks on this.
Maybe this file was missing in the MAINTAINERS file.

Thanks,
Namhyung


> ---
>  tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/te=
sts/shell/test_arm_coresight.sh
> index fe78c4626e45..f2115dfa24a5 100755
> --- a/tools/perf/tests/shell/test_arm_coresight.sh
> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
> @@ -12,12 +12,12 @@
>  glb_err=3D0
>
>  cs_etm_dev_name() {
> -       cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name=
 cpu* -print -quit)
> +       cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name=
 'cpu*' -print -quit)
>         trcdevarch=3D$(cat ${cs_etm_path}/mgmt/trcdevarch)
>         archhver=3D$((($trcdevarch >> 12) & 0xf))
>         archpart=3D$(($trcdevarch & 0xfff))
>
> -       if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D "0xA13=
" ] ; then
> +       if [ $archhver -eq 5 ] && [ "$(printf "0x%X\n" $archpart)" =3D "0=
xA13" ] ; then
>                 echo "ete"
>         else
>                 echo "etm"
> --
> 2.31.1
>
