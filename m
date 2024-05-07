Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DB8BE704
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 17:09:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dv0H1Dyj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAodteqz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYhWp6w7jz3cX5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 01:09:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dv0H1Dyj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UAodteqz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYhW06gmTz3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 01:08:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715094519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HpVW0/9+/L+kKwM3Qnf0wff1bD8U05A1KXwBGl1ho/Q=;
	b=Dv0H1Dyj8xFkcrvgWGUwwr6dG13yranXIPWekI/8k36RKnSaPAYG4L8VD5kdOiEMV3nW+n
	M8iI16hvAD2usdb2+JiGpeeF0ddB6BL14g00xOpxoWoBnaJHanYbbPua6BoUTI6dcKuPWw
	z+eT0D5magSPf7Nbq+VfpQADB5Lbt0I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715094520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HpVW0/9+/L+kKwM3Qnf0wff1bD8U05A1KXwBGl1ho/Q=;
	b=UAodteqz7Uv7TqbYTEVjCoFf0+sxdu/vTG9VK0jq5P4+NZIOHGx2kcDQAyV4pCo9A412QS
	I8W4JbE6nbo+ODIRjlHrQdDi1mKXKJhd2xGeg+7hTfXZy4kuVP216I7qb1Zn6S/Z3BVW6f
	cYQkClfI53Qw8AyB3eLYNsUPCc4/e7U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-LMi8iqowOVOkNE01tW58qg-1; Tue, 07 May 2024 11:08:37 -0400
X-MC-Unique: LMi8iqowOVOkNE01tW58qg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41c095d5b07so12769635e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2024 08:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715094516; x=1715699316;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpVW0/9+/L+kKwM3Qnf0wff1bD8U05A1KXwBGl1ho/Q=;
        b=WyUPA+YBwAVQBAjjGX/ntKjDH9cT2yVGDowAFT3jHd49jVO5sr4LB8a0sbbcidsrxR
         dO71NDqeU2nIBzFm5Uw46a2e1tslVnC57mnMptwjpieVJ2AMjVPCee9+cUycARO1yQjj
         JuiJRyAFFzPv7ZpSbw+QAuXPM7wnA0F+UPnsRnX7BzozIcXr0qbUZj7IZX07fKRtViGW
         KvfIqJuIYD6zkw14OG1+ZYeajvph6URoMORIXoWCk3Z6oid6mwR9NRpnACLgPHb1sz8B
         +X0wPIVfnn6YFRYUTxPZHveUYI9ipcTyBpddLfK4o/oJmeAVnPI1mk7iEjP3zadhTyWR
         w6dA==
X-Forwarded-Encrypted: i=1; AJvYcCXCjifRM9ZpwyTkbkb+vX/fTNMRfCv0TJtv6ii81efOqzq0e7naTOnV4KievgZ2cHndjHjeGeJIRi8ffxLtN4Kql+oV/vkKii+vQ50LHg==
X-Gm-Message-State: AOJu0Yw/hcchYTJ1f1ZpZg9iz2ww+Ok9VH1tBGlAePefZ5uj76ggZGfx
	f9694ISCeJ6UUvwkmwTX5W6QTehsR+N+uTRK2siyDPxLPjDPumiuDqSGq2fx/YukkuKPAKu0iB1
	bNKFUDhiJxJC9zGX14Vn+ixex45c+JsZhZQHGcwJ1MemhhEKLo14cUTdvL+dPcXI=
X-Received: by 2002:a05:600c:1f81:b0:41b:de8d:dcd7 with SMTP id 5b1f17b1804b1-41f71ebf891mr639425e9.20.1715094515904;
        Tue, 07 May 2024 08:08:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHZ3fHNVLmAQgwakct5lEQriA0Qg34lqLbb28Uv1myWsEsWU4Y4PADgvg9u993fG3wNf7rUQ==
X-Received: by 2002:a05:600c:1f81:b0:41b:de8d:dcd7 with SMTP id 5b1f17b1804b1-41f71ebf891mr639265e9.20.1715094515515;
        Tue, 07 May 2024 08:08:35 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-40-241-109.web.vodafone.de. [109.40.241.109])
        by smtp.gmail.com with ESMTPSA id fc20-20020a05600c525400b00418accde252sm19827078wmb.30.2024.05.07.08.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 08:08:35 -0700 (PDT)
Message-ID: <e0df1892-c17f-4fc3-b95a-4efc0af917d3@redhat.com>
Date: Tue, 7 May 2024 17:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 07/31] scripts: allow machine option to
 be specified in unittests.cfg
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-8-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-8-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/05/2024 14.28, Nicholas Piggin wrote:
> This allows different machines with different requirements to be
> supported by run_tests.sh, similarly to how different accelerators
> are handled.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Acked-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   docs/unittests.txt   |  7 +++++++
>   scripts/common.bash  |  8 ++++++--
>   scripts/runtime.bash | 16 ++++++++++++----
>   3 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 7cf2c55ad..6449efd78 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -42,6 +42,13 @@ For <arch>/ directories that support multiple architectures, this restricts
>   the test to the specified arch. By default, the test will run on any
>   architecture.
>   
> +machine
> +-------
> +For those architectures that support multiple machine types, this restricts
> +the test to the specified machine. By default, the test will run on
> +any machine type. (Note, the machine can be specified with the MACHINE=
> +environment variable, and defaults to the architecture's default.)
> +
>   smp
>   ---
>   smp = <number>
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 5e9ad53e2..3aa557c8c 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -10,6 +10,7 @@ function for_each_unittest()
>   	local opts
>   	local groups
>   	local arch
> +	local machine
>   	local check
>   	local accel
>   	local timeout
> @@ -21,7 +22,7 @@ function for_each_unittest()
>   		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>   			rematch=${BASH_REMATCH[1]}
>   			if [ -n "${testname}" ]; then
> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   			fi
>   			testname=$rematch
>   			smp=1
> @@ -29,6 +30,7 @@ function for_each_unittest()
>   			opts=""
>   			groups=""
>   			arch=""
> +			machine=""
>   			check=""
>   			accel=""
>   			timeout=""
> @@ -58,6 +60,8 @@ function for_each_unittest()
>   			groups=${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
>   			arch=${BASH_REMATCH[1]}
> +		elif [[ $line =~ ^machine\ *=\ *(.*)$ ]]; then
> +			machine=${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^check\ *=\ *(.*)$ ]]; then
>   			check=${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^accel\ *=\ *(.*)$ ]]; then
> @@ -67,7 +71,7 @@ function for_each_unittest()
>   		fi
>   	done
>   	if [ -n "${testname}" ]; then
> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   	fi
>   	exec {fd}<&-
>   }
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 177b62166..0c96d6ea2 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -32,7 +32,7 @@ premature_failure()
>   get_cmdline()
>   {
>       local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
>   }
>   
>   skip_nodefault()
> @@ -80,9 +80,10 @@ function run()
>       local kernel="$4"
>       local opts="$5"
>       local arch="$6"
> -    local check="${CHECK:-$7}"
> -    local accel="$8"
> -    local timeout="${9:-$TIMEOUT}" # unittests.cfg overrides the default
> +    local machine="$7"
> +    local check="${CHECK:-$8}"
> +    local accel="$9"
> +    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
>   
>       if [ "${CONFIG_EFI}" == "y" ]; then
>           kernel=${kernel/%.flat/.efi}
> @@ -116,6 +117,13 @@ function run()
>           return 2
>       fi
>   
> +    if [ -n "$machine" ] && [ -n "$MACHINE" ] && [ "$machine" != "$MACHINE" ]; then
> +        print_result "SKIP" $testname "" "$machine only"
> +        return 2
> +    elif [ -n "$MACHINE" ]; then
> +        machine="$MACHINE"
> +    fi
> +
>       if [ -n "$accel" ] && [ -n "$ACCEL" ] && [ "$accel" != "$ACCEL" ]; then
>           print_result "SKIP" $testname "" "$accel only, but ACCEL=$ACCEL"
>           return 2

For some reasons that I don't quite understand yet, this patch causes the 
"sieve" test to always timeout on the s390x runner, see e.g.:

  https://gitlab.com/thuth/kvm-unit-tests/-/jobs/6798954987

Everything is fine in the previous patches (I pushed now the previous 5 
patches to the repo):

  https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/pipelines/1281919104

Could it be that he TIMEOUT gets messed up in certain cases?

  Thomas

