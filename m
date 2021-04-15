Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E77360395
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 09:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLWWX4dspz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 17:42:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jQktgvDS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jQktgvDS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jQktgvDS; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=jQktgvDS; 
 dkim-atps=neutral
X-Greylist: delayed 66 seconds by postgrey-1.36 at boromir;
 Thu, 15 Apr 2021 17:41:36 AEST
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLWW43vW8z2yx3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 17:41:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618472494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FABcKglbZyz1XUUkdOXQm+i1lKqkxdPYz82VDd7EHCc=;
 b=jQktgvDSYm7IPKKx8G7US8nRiZOcexqyvLllb5OjMeCKiYtVU7FKurK5usKEjvsyjyfl4l
 6KvLC3Q0FA1rhI2/hIJQpD+dYWPNvW6oRogVK3wmv0qFrkJaaaZ5uT8sRl6TQdyxFt/MyT
 xkwM03vYc9FBM2HZMq2vAnv+TDKiQKU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618472494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FABcKglbZyz1XUUkdOXQm+i1lKqkxdPYz82VDd7EHCc=;
 b=jQktgvDSYm7IPKKx8G7US8nRiZOcexqyvLllb5OjMeCKiYtVU7FKurK5usKEjvsyjyfl4l
 6KvLC3Q0FA1rhI2/hIJQpD+dYWPNvW6oRogVK3wmv0qFrkJaaaZ5uT8sRl6TQdyxFt/MyT
 xkwM03vYc9FBM2HZMq2vAnv+TDKiQKU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-5zmKdwffOlesW14bKlD9QQ-1; Thu, 15 Apr 2021 03:40:25 -0400
X-MC-Unique: 5zmKdwffOlesW14bKlD9QQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 t11-20020aa7d4cb0000b0290382e868be07so4710874edr.20
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 00:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FABcKglbZyz1XUUkdOXQm+i1lKqkxdPYz82VDd7EHCc=;
 b=NWvOX2qvc+fg1dIKdYqDbEL+os7oFzQUMGc8EJ4Ur/2GyBC7RGPZw5b0xC83FXABl6
 2EaspknSFg+2oQw7JQf4vVy6kKXHYHgGQv052t/t0iJTZM2BIVf00p0XaSEl/lquH9De
 mRCsr1TEy2MXgPEDBMHwBW10s+rSywIUOPTjRjYJWOMOgE0u+DvdF2lZC2D0O4y3J7+Q
 QGLd+7NKEb26w12zif3gwtLVLbyJkYymak2nlztzU004uOXiPd//S9Vkplq8i4r/Rp0p
 Nz437IHqQZH/vodS4jxmCn7rdQn2Ize3kxtcfio2Ry9l23CUoF2xKNdkWAczldqh3RTn
 THnw==
X-Gm-Message-State: AOAM532qRJLjmirzDQjU6c1OjsF26JuuQmd3kz0JiHz1NlB4pSIiZdwO
 7+JFtuh98ZvxtwFK6YPELmke90rlbG/JtRZedQHbUZCvGIN4nlnKdYfeIlVxLVIDXu3bLnfx6bR
 Q5pz6vwZox4x3PBN5SvuPDqJ6tw==
X-Received: by 2002:a17:906:80d6:: with SMTP id
 a22mr2018522ejx.277.1618472424066; 
 Thu, 15 Apr 2021 00:40:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0fuohm6puHv0F4pqjM8Oe2og4+AYVZWqbQ2+dlsXsdUigyAKX+u4GzMQpiq69iOvQF1X+Kw==
X-Received: by 2002:a17:906:80d6:: with SMTP id
 a22mr2018508ejx.277.1618472423854; 
 Thu, 15 Apr 2021 00:40:23 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d18sm1701897edv.1.2021.04.15.00.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 00:40:23 -0700 (PDT)
Subject: Re: [PATCH 2/2] tools: do not include scripts/Kbuild.include
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <20210415072700.147125-1-masahiroy@kernel.org>
 <20210415072700.147125-2-masahiroy@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9d33ee98-9de3-2215-0c0b-cc856cec1b69@redhat.com>
Date: Thu, 15 Apr 2021 09:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415072700.147125-2-masahiroy@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Song Liu <songliubraving@fb.com>, kvm@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 clang-built-linux@googlegroups.com, Harish <harish@linux.ibm.com>,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/04/21 09:27, Masahiro Yamada wrote:
> Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
> scripts/Makefile.compiler"), some kselftests fail to build.
> 
> The tools/ directory opted out Kbuild, and went in a different
> direction. They copy any kind of files to the tools/ directory
> in order to do whatever they want to do in their world.
> 
> tools/build/Build.include mimics scripts/Kbuild.include, but some
> tool Makefiles included the Kbuild one to import a feature that is
> missing in tools/build/Build.include:
> 
>   - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
>     only if supported") included scripts/Kbuild.include from
>     tools/thermal/tmon/Makefile to import the cc-option macro.
> 
>   - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
>     not support -no-pie") included scripts/Kbuild.include from
>     tools/testing/selftests/kvm/Makefile to import the try-run macro.
> 
>   - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
>     failures") included scripts/Kbuild.include from
>     tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
>     target.
> 
>   - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
>     unrecognized option") included scripts/Kbuild.include from
>     tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
>     try-run macro.
> 
> Copy what they want there, and stop including scripts/Kbuild.include
> from the tool Makefiles.

I think it would make sense to add try-run, cc-option and 
.DELETE_ON_ERROR to tools/build/Build.include?

Paolo

> Link: https://lore.kernel.org/lkml/86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com/
> Fixes: d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
> Reported-by: Janosch Frank <frankja@linux.ibm.com>
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   tools/testing/selftests/bpf/Makefile          |  3 ++-
>   tools/testing/selftests/kvm/Makefile          | 12 +++++++++++-
>   .../selftests/powerpc/pmu/ebb/Makefile        | 11 ++++++++++-
>   tools/thermal/tmon/Makefile                   | 19 +++++++++++++++++--
>   4 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index 044bfdcf5b74..d872b9f41543 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
> -include ../../../../scripts/Kbuild.include
>   include ../../../scripts/Makefile.arch
>   include ../../../scripts/Makefile.include
>   
> @@ -476,3 +475,5 @@ EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)	\
>   	prog_tests/tests.h map_tests/tests.h verifier/tests.h		\
>   	feature								\
>   	$(addprefix $(OUTPUT)/,*.o *.skel.h no_alu32 bpf_gcc bpf_testmod.ko)
> +
> +.DELETE_ON_ERROR:
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index a6d61f451f88..8b45bc417d83 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -1,5 +1,15 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -include ../../../../scripts/Kbuild.include
> +
> +TMPOUT = .tmp_$$$$
> +
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
>   
>   all:
>   
> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> index af3df79d8163..d5d3e869df93 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
> -include ../../../../../../scripts/Kbuild.include
>   
>   noarg:
>   	$(MAKE) -C ../../
> @@ -8,6 +7,16 @@ noarg:
>   CFLAGS += -m64
>   
>   TMPOUT = $(OUTPUT)/TMPDIR/
> +
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
> +
>   # Toolchains may build PIE by default which breaks the assembly
>   no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
>           $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
> diff --git a/tools/thermal/tmon/Makefile b/tools/thermal/tmon/Makefile
> index 59e417ec3e13..92a683e4866c 100644
> --- a/tools/thermal/tmon/Makefile
> +++ b/tools/thermal/tmon/Makefile
> @@ -1,6 +1,21 @@
>   # SPDX-License-Identifier: GPL-2.0
> -# We need this for the "cc-option" macro.
> -include ../../../scripts/Kbuild.include
> +
> +TMPOUT = .tmp_$$$$
> +
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
> +
> +__cc-option = $(call try-run,\
> +	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> +
> +cc-option = $(call __cc-option, $(CC),\
> +	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
>   
>   VERSION = 1.0
>   
> 

