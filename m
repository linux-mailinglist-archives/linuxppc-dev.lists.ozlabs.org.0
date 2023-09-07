Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD1797F1B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 01:12:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QLiASuEz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhZlN3tsbz3bq4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 09:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QLiASuEz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhZkV2LkZz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 09:11:45 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-414ba610766so146921cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Sep 2023 16:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694128302; x=1694733102; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iOwyz8CzNzxeEbnqXiR5e1k7kQJndb/v6qGP/KlU5c=;
        b=QLiASuEzH+HPb8DSGt5B9IKQ2CNf33T1TpH2Juh9Zzq/B8acu7/J/vQQLgEYhBG7zl
         m5yQbAn1AmUe3Ni/Ck5y+qpXnImpOkqcKY454AQnTpYf0o0vmp6cwIXV0rWK0CSHSMN9
         GNakMq+vqNRlQ5o73S3LtNOVdTTr/QAwDnlvdloG4VIJ7aX75erOZuQB1Eo9S6zhEb0l
         d9Fw9py2sv9hl+8m+IaktWMZ241zDlnY4LDGqZOtVsI58+oHFvGfeNAuIS9DeaPOKr7w
         CKw8Eu8vbU8E9t6Fuanj/i0W+RA8Ffk6/zW0vNZO/d94JbX+Am60tKYMvoKCy5l0ys2e
         NE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694128302; x=1694733102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iOwyz8CzNzxeEbnqXiR5e1k7kQJndb/v6qGP/KlU5c=;
        b=EpH6pqHLVAl4UM3zigxmLqyggOu4h7xOEIT4iqpxD8+wminTf6mng8rL5LisKpwssT
         AY80GRXFtleJbD5sCgQ1KnDHvbtmbXgaTvD4swgHqShVtbUYYYtirYVPSjcT4qqTtVix
         Al4S1Kj2eITpBaOrZA1B3JxIBq+jrVBTsXI5cHymRVDhXfiOpMjRd8wCTXHuznjRWPJ4
         Rj/qMGUpXpoGbveQNlE1Zi/2Cr0IZRtIOJScMjSZAXbFiLQoNshEMT9PIWc3xErOoyPf
         MOB+DicnT4MhIllwXZHSPac9A62UtIcz+/tYCDrqOV6VdHAsiyPH5o+JPdPzyCbzkxBc
         MIxQ==
X-Gm-Message-State: AOJu0YzDES479lSJNaHNS4jU2BGbmXuWST8PF19Lsp7f1B6o9cEUXQSi
	L8HLX2hiALHnlRjSYNKuD2oJ+/mPSjmCtaySwpUT+A==
X-Google-Smtp-Source: AGHT+IHqjOGGOf03SUyJXcNjq12YhvYgwirQdUZbUw/yPbr8VokjKW/iOtKeXXObOST3yIVdnPwATDNCyhEvKF+hOeM=
X-Received: by 2002:ac8:7f44:0:b0:3de:1aaa:42f5 with SMTP id
 g4-20020ac87f44000000b003de1aaa42f5mr60853qtk.15.1694128301642; Thu, 07 Sep
 2023 16:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230907171944.36953-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230907171944.36953-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 Sep 2023 16:11:29 -0700
Message-ID: <CAP-5=fXSAzpdf0dH4kdPKRVjonC2wBF2oD56_=2NE0iBs96EOA@mail.gmail.com>
Subject: Re: [PATCH] tools/perf: Add includes for detected configs in Makefile.perf
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

On Thu, Sep 7, 2023 at 10:19=E2=80=AFAM Athira Rajeev
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
>  tools/perf/Makefile.perf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 37af6df7b978..6764b0e156f4 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
>
>  python-clean :=3D $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD=
) $(OUTPUT)python/perf*.so
>
> +# Use the detected configuration
> +include .config-detected

Good catch! I think it should look like:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/build/Makefile.build?h=3Dperf-tools-next#n40

Thanks,
Ian

> +
>  ifeq ($(CONFIG_LIBTRACEEVENT),y)
>    PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-sources)
>  else
> --
> 2.31.1
>
