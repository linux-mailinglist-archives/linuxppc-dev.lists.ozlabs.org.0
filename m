Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF77AF6F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 01:52:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwGk73mKlz3cX7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 09:51:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.45; helo=mail-io1-f45.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwGjY6qy5z2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 09:51:28 +1000 (AEST)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-79f82b26abfso346927039f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 16:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695772286; x=1696377086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdnU4DuoDJdYmnW0BzUCEF+B7Lkxwtj+10/qp8KP4eo=;
        b=Jhg4SmZziFndJglYw5O/Hrc0OkPAEpRLk+68qoY0rwodIgjfstkcR9CbpUvzaSoJCJ
         /O68Yt6QWqVaDlsgEUVjJ3CuWGZV1HnDrFAuVHyJMZLO26J4hML75o9ZyTEJZxo2WkdP
         zVA2aMIbvvjEQg9awMwDVUlIsQiB45CWLyMAKYpaQVBtcr5u40qy+rNPCm0O+8Z/evE9
         ifmYaFraE006s6CWalPBDSeXJAYANuUs4C7L8m28bSrcO1R3szpWcTvV4dGN9sVrZUie
         zS1hhPFN1jT5qitLM6h1BrI9S5r/x4KjpfCb23I7mI7NXpZTWWbuMnqaRB+6rDNiKL0g
         BHng==
X-Gm-Message-State: AOJu0YzQdZXYwXpVjFa3Yze26eFlObVVWTIwIxUIv32+CkjLUjpI+HaK
	9hKKgAaSxiLusPOhd2ZCQztC55lfkI0lYSTpxrI=
X-Google-Smtp-Source: AGHT+IEP9vVIywM7SjQaBzy8Ky3U1xznU0lUsv7UYHOA7Bva3KIpj9g+j817av2nW+NyqppUhTx4RSBqY6iEnhNNaTM=
X-Received: by 2002:a05:6602:185:b0:786:ca40:cc88 with SMTP id
 m5-20020a056602018500b00786ca40cc88mr340903ioo.11.1695772286141; Tue, 26 Sep
 2023 16:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 26 Sep 2023 16:51:15 -0700
Message-ID: <CAM9d7chpQ-t72+wsv0qrLsLK9yJ5x77qapqN3+9tKHqT8246Ew@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools/perf: Add new CONFIG_SHELLCHECK for detecting
 shellcheck binary
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

On Thu, Sep 14, 2023 at 10:18=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> shellcheck tool can detect coding/formatting issues on
> shell scripts. In perf directory "tests/shell", there are lot
> of shell test scripts and this tool can detect coding/formatting
> issues on these scripts.
>
> Example to use shellcheck for severity level for
> errors and warnings, below command is used:
>
>    # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellche=
ck -S warning $F; done
>    # echo $?
>      0
>
> This testing needs to be automated into the build so that it
> can avoid regressions and also run the check for newly added
> during build test itself. Add a new feature check to detect
> presence of shellcheck. Add CONFIG_SHELLCHECK feature check in
> the build to avoid not having shellcheck breaking the build.
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/build/Makefile.feature |  6 ++++--
>  tools/build/feature/Makefile |  8 +++++++-
>  tools/perf/Makefile.config   | 10 ++++++++++
>  3 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
> index 934e2777a2db..23f56b95babf 100644
> --- a/tools/build/Makefile.feature
> +++ b/tools/build/Makefile.feature
> @@ -72,7 +72,8 @@ FEATURE_TESTS_BASIC :=3D                  \
>          libzstd                                \
>          disassembler-four-args         \
>          disassembler-init-styled       \
> -        file-handle
> +        file-handle                    \
> +        shellcheck
>
>  # FEATURE_TESTS_BASIC + FEATURE_TESTS_EXTRA is the complete list
>  # of all feature tests
> @@ -138,7 +139,8 @@ FEATURE_DISPLAY ?=3D              \
>           get_cpuid              \
>           bpf                   \
>           libaio                        \
> -         libzstd
> +         libzstd               \
> +         shellcheck
>
>  #
>  # Declare group members of a feature to display the logical OR of the de=
tection
> diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> index 3184f387990a..44ba6d0c98d0 100644
> --- a/tools/build/feature/Makefile
> +++ b/tools/build/feature/Makefile
> @@ -76,7 +76,8 @@ FILES=3D                                          \
>           test-libzstd.bin                      \
>           test-clang-bpf-co-re.bin              \
>           test-file-handle.bin                  \
> -         test-libpfm4.bin
> +         test-libpfm4.bin                      \
> +         test-shellcheck.bin
>
>  FILES :=3D $(addprefix $(OUTPUT),$(FILES))
>
> @@ -92,6 +93,8 @@ __BUILD =3D $(CC) $(CFLAGS) -MD -Wall -Werror -o $@ $(p=
atsubst %.bin,%.c,$(@F)) $(
>  __BUILDXX =3D $(CXX) $(CXXFLAGS) -MD -Wall -Werror -o $@ $(patsubst %.bi=
n,%.cpp,$(@F)) $(LDFLAGS)
>    BUILDXX =3D $(__BUILDXX) > $(@:.bin=3D.make.output) 2>&1
>
> +  BUILD_BINARY =3D sh -c $1 > $(@:.bin=3D.make.output) 2>&1
> +
>  ###############################
>
>  $(OUTPUT)test-all.bin:
> @@ -207,6 +210,9 @@ $(OUTPUT)test-libslang-include-subdir.bin:
>  $(OUTPUT)test-libtraceevent.bin:
>         $(BUILD) -ltraceevent
>
> +$(OUTPUT)test-shellcheck.bin:
> +       $(BUILD_BINARY) "shellcheck --version"

I don't think it'd generate the .bin file.

Anyway, it's a binary file already.  Can we check it with
`command -v` and get rid of the feature test?

Thanks,
Namhyung


> +
>  $(OUTPUT)test-libtracefs.bin:
>          $(BUILD) $(shell $(PKG_CONFIG) --cflags libtraceevent 2>/dev/nul=
l) -ltracefs
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index d66b52407e19..e71fe95ad865 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -779,6 +779,16 @@ ifndef NO_SLANG
>    endif
>  endif
>
> +ifneq ($(NO_SHELLCHECK),1)
> +  $(call feature_check,shellcheck)
> +  ifneq ($(feature-shellcheck), 1)
> +    msg :=3D $(warning No shellcheck found. please install ShellCheck);
> +  else
> +    $(call detected,CONFIG_SHELLCHECK)
> +    NO_SHELLCHECK :=3D 0
> +  endif
> +endif
> +
>  ifdef GTK2
>    FLAGS_GTK2=3D$(CFLAGS) $(LDFLAGS) $(EXTLIBS) $(shell $(PKG_CONFIG) --l=
ibs --cflags gtk+-2.0 2>/dev/null)
>    $(call feature_check,gtk2)
> --
> 2.31.1
>
