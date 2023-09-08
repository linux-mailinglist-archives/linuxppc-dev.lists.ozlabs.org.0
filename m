Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC34798A91
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 18:16:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dOClJ1LW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj1T76pCPz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 02:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dOClJ1LW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj1SF5rKXz2ymM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 02:15:56 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-34f3dd14b66so132425ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694189753; x=1694794553; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQEJvDuRs3UkoD1b56O/pI7tuDGHQtmDCny6dwGdlzI=;
        b=dOClJ1LWexukf41oqcIDUnFJ/hUO4Eb+IuJmHYGsYopz8uNl5EmiUypiS3gDM6sSv4
         bhUky2DN7g1QlD6sZuH0RQFfk6BzQM7yu2bqowyx5ACfazMpmqBovcJ3FKqk+DMKOpt2
         gfgOelYrref8A15G/vRjr1pa3cOM518vF8GdoJUA18amzQpQQ8T6zQhcubqAT4ZjzQQv
         asuxqUKY+iY+PPpB/k5387sWJIVUlslk46dCpSi5Okg5tNrXcC0U6eiW+H8X9yHs0u1Z
         yan6wT4HyZSwTP99Lquv9ykkRFslVer1QRHcdNJ1VML5KOoOCSDmGH+drluKBbcyM2Kf
         hkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694189753; x=1694794553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQEJvDuRs3UkoD1b56O/pI7tuDGHQtmDCny6dwGdlzI=;
        b=GMJ5w59PMA0VM2rokXZ1OGDWmGSiCd1txYO61TdCmoqYespfjbmfKJAmEn4uFSiXmg
         KiGamAd6KgYCXCrJN0wlaCsFnOGGqhEytF+xFCH8BLBhbUOnTz7PV2PXHFPPRvsTY0PF
         +IUYUkXtfozBrxGTMfmrxLuZI+RCbIH3mquj3CnV0vZfZDFGYjozAt3cQO4Xmyr64sfj
         KEmHAVmrS72QzNju51r52YJ50sfQEJiOlve2dYtaNDH051FBzAO26KI3gXkGOA3d7Wjl
         Tbrkz9SZQ4e23rh/HJF8uUe0nBhnTlVSrg2vi7brtbG6oYldenbTM1tQ8YYiFIVI0Ne6
         BEoA==
X-Gm-Message-State: AOJu0Yx9VabxicFts02k2obzOjEWdBP18dxumFA90o9FokWdCW9TSh7V
	kXLApF3KmjjS4HIflJNk5WwALPrIBscg8NESOnOkiQ==
X-Google-Smtp-Source: AGHT+IFdl02AUmaxNkylaUSkhXBIdzRaYxZPDMOHsucFGY/+tT+qzQzwY8yH6GcE4mmVkzJEkzHPv9t4YhNmE7YaT0k=
X-Received: by 2002:a92:c569:0:b0:34f:21e9:7239 with SMTP id
 b9-20020a92c569000000b0034f21e97239mr232372ilj.23.1694189752833; Fri, 08 Sep
 2023 09:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230908145045.47408-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230908145045.47408-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Sep 2023 09:15:38 -0700
Message-ID: <CAP-5=fVZacRGiU2e1_vW8WWd4tF6f2msbBvA7+U7VqkRinR31w@mail.gmail.com>
Subject: Re: [PATCH V2] tools/perf: Add includes for detected configs in Makefile.perf
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 8, 2023 at 7:51=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Makefile.perf uses "CONFIG_*" checks in the code. Example the config
> for libtraceevent is used to set PYTHON_EXT_SRCS
>
>         ifeq ($(CONFIG_LIBTRACEEVENT),y)
>           PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-source=
s)
>         else
>           PYTHON_EXT_SRCS :=3D $(shell grep -v '^\#\|util/trace-event.c' =
util/python-ext-sources)
>         endif
>
> But this is not picking the value for CONFIG_LIBTRACEEVENT that is
> set using the settings in Makefile.config. Include the file
> ".config-detected" so that make will use the system detected
> configuration in the CONFIG checks. This will fix isues that
> could arise when other "CONFIG_*" checks are added to Makefile.perf
> in future as well.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>  v1 -> v2:
>  Added $(OUTPUT) prefix to config-detected as pointed
>  out by Ian
>
>  tools/perf/Makefile.perf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 37af6df7b978..66b9dc61c32f 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
>
>  python-clean :=3D $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD=
) $(OUTPUT)python/perf*.so
>
> +# Use the detected configuration
> +include $(OUTPUT).config-detected

The Makefile.build version also has a "-include" rather than "include"
in case the .config-detected file is missing. In Makefile.perf
including Makefile.config is optional:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/Makefile.perf?h=3Dperf-tools-next#n253

and there are certain targets that where we don't include it:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/Makefile.perf?h=3Dperf-tools-next#n200

So playing devil's advocate, if we ran "make clean" we'd remove
.config-detected:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/Makefile.perf?h=3Dperf-tools-next#n1131

If we then ran "make tags" then we wouldn't include Makefile.config
and so .config-detected wouldn't be generated and I think the build
would fail due to a missing include here. So I think this should be
-include or perhaps:

ifeq ($(config),1)
include $(OUTPUT).config-detected
endif

Thanks,
Ian

> +
>  ifeq ($(CONFIG_LIBTRACEEVENT),y)
>    PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-sources)
>  else
> --
> 2.31.1
>
