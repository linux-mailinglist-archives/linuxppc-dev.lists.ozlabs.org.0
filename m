Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A09D79D30F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 16:01:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MqaNon/5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlQGs3m87z3dJb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MqaNon/5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlQFx0n0Rz3cD0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 00:00:20 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-414ba610766so334911cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 07:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694527215; x=1695132015; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDs/ms03yISSc3Q3UiOqo0nosrYG3nv1ybC8XW7Xs6s=;
        b=MqaNon/59OlMhMQSUby83AqHxSIWA/LRD4Dr/qP6h9tQn2BD4ZgMwvZl5qeSGL9mvY
         1kYa2LTQLCjA0Ds9l/IMoHkMIuP+k4KnxB+g0/QsZCgaLlPe2sY5eY7qpHOSvGj5rsVu
         6kjBRZUc5GMhtpahq1H4LbTR23BHoNBElTxgDLgW4oXLaWAnJAunAQWunWJPQBKTgguX
         UHmUNAQw+M2Xofr0pM1jOZ/QldM4Rtr8mS/c2t/gs5t68bWNitFXbYV8QT1VbIraOOXd
         OvbjEDvljlGd5QY7F2gAMdtDL1kSwwi5Lq5VVBXHnLfBdx6FWSl7OSzn3er7Z2qVPqrF
         eVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694527215; x=1695132015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDs/ms03yISSc3Q3UiOqo0nosrYG3nv1ybC8XW7Xs6s=;
        b=bKpnmOR+ULynZ4nRHqmKi9bFzhzKch3kyL6nHkTGNO/M2xD+Wn8qvG90GkXAFYX7CO
         IwpAgVokWk3za44AqFz7AGdJPQqdNMIDZ/kuqAOgbEnSK7P23E90ah8bxXhs/3I0Jh6s
         ujpKWJVe6R/9GYjs7YIrVg8a32K22VQgHR10S4jxm3zGpZnii+6cbmfDK6RkvBOu7SRD
         4UNQgeHRAJNaSY8/nfGtdz4QZJOyqc69LhT90dwKIjImhNGyjM84Z7cy/MAsaNnpYKN2
         0/efNGZqiDQoJdEshmgYyX4dUCxy/3jprHxStX2g2ZHSJ3qvbD4NNK9/kQWHIogInu8K
         54jg==
X-Gm-Message-State: AOJu0YzCLQYckR94w55ULpww7cgFL+x0Akh1iLV0cnkkP3qrgOtHaMyg
	2e/YLS2g3HFUP+Hp2gbMrnOZLXjKIosQ22eJKtZm2Q==
X-Google-Smtp-Source: AGHT+IEo8w3504Qe2c4oLczzX+JcbZh6VtZSHm+Cg+yDS5SdjKyydJl6tkOJB8VZGXLP2wgtRLqeFGyfO5BrT0idoz0=
X-Received: by 2002:ac8:7dd5:0:b0:3de:1aaa:42f5 with SMTP id
 c21-20020ac87dd5000000b003de1aaa42f5mr207058qte.15.1694527214305; Tue, 12 Sep
 2023 07:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230912063807.74250-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230912063807.74250-1-atrajeev@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 12 Sep 2023 07:00:00 -0700
Message-ID: <CAP-5=fU644=VvHf1JcQ1LN7tb_wAkrnrE+n4xCVyWae=UxTFyg@mail.gmail.com>
Subject: Re: [PATCH V3] tools/perf: Add includes for detected configs in Makefile.perf
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 11, 2023 at 11:38=E2=80=AFPM Athira Rajeev
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

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changelog:
> v2 -> v3:
> Added -include since in some cases make clean or make
> will fail when config is not included and if config-detected
> file is not present.
>
> v1 -> v2:
> Added $(OUTPUT) prefix to config-detected as pointed
> out by Ian
>
>  tools/perf/Makefile.perf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 37af6df7b978..f6fdc2d5a92f 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
>
>  python-clean :=3D $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD=
) $(OUTPUT)python/perf*.so
>
> +# Use the detected configuration
> +-include $(OUTPUT).config-detected
> +
>  ifeq ($(CONFIG_LIBTRACEEVENT),y)
>    PYTHON_EXT_SRCS :=3D $(shell grep -v ^\# util/python-ext-sources)
>  else
> --
> 2.31.1
>
