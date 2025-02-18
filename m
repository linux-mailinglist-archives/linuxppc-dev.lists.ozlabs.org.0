Return-Path: <linuxppc-dev+bounces-6329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D748CA3AA37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 21:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyBj04SFmz30BG;
	Wed, 19 Feb 2025 07:59:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739911502;
	cv=none; b=HcKACCGZXy7XZBvX/cbZCN1SJFfkiX/30iOzq3JAkXFf5DqW/g7Ko76k9gMuGLPYzE2SbyroIOi7138nsDonA3W5oKRA+bN4SjyEiJZ7R6Jg1Xq8F67vvAgawX9cPawrbCBLd3lMlPTtGmqOTfWUMPIYqO5ls6Dif5cH5y46lNBQ+ihJoPmh3MdSGe2/94hQfCTLFLrQcDqlOE/Cm/G1MY/QjE524Y7AOo/hh2Fhzi1UP6gsL5R4xKSl56gjc9+N5cbxCV6NP8Ok2EirsJ67TFVS8bQeTIn362AmF0RNi3bWOv49V0/9iuJoStKKmJgF1W77+swvbbzFjdS08CT+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739911502; c=relaxed/relaxed;
	bh=9U6IaL4Uh4Ysg2qyqv6Wdh6gK8ZyE5jqK4/4mRmvBeY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PEbUUlw8mUv3wacad1SBJlp8/wrOmQ84LlMWa+kSl81grnTdZ7Vwl3IteFlDhEtnVMHu0DZGRtiJxEAUdSKA9gmovAS1YwLUtDsKCWeKteWZDQ4m2mM2rrVFWnxXJ/P/pQkXyLroGE0aLiBPLVp/zKtEm7DvpgxIzbgbxFlYJGEyKvKXHytVw9lEWAjSC2AJCaU/SDRDeOWT3mVN+dwIzinTYLCgDcnd2jH3NAqRkbeOPAKQHN2fb6JOpcjynacc2MG1+l22kmEWsqHzYk5XJc9x9xmFmePIg/8hbkcLC2eWztVc4x1zoloGzGBr5jESFzjwT68LNweWstkWv9SGJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM/Uz+kz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM/Uz+kz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=llong@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM/Uz+kz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TM/Uz+kz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=llong@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyBNW0Fq8z2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 07:44:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739911493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9U6IaL4Uh4Ysg2qyqv6Wdh6gK8ZyE5jqK4/4mRmvBeY=;
	b=TM/Uz+kz3t40IbAC/K4UpDe1HG7JhX8wdn5J6OHg0DnQACuxpIQ5OmmlxXOQVQ4I8rNB1O
	3p/AYtiY6ZER6UD4VeoQUeYsnzHfk+k3LPdBPTkrqn/7eFPy8Jm9aRihukQJJs6joqsyI4
	rBigSZ4uS5uLOIx3rpE7FjVo7+QUdb0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739911493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9U6IaL4Uh4Ysg2qyqv6Wdh6gK8ZyE5jqK4/4mRmvBeY=;
	b=TM/Uz+kz3t40IbAC/K4UpDe1HG7JhX8wdn5J6OHg0DnQACuxpIQ5OmmlxXOQVQ4I8rNB1O
	3p/AYtiY6ZER6UD4VeoQUeYsnzHfk+k3LPdBPTkrqn/7eFPy8Jm9aRihukQJJs6joqsyI4
	rBigSZ4uS5uLOIx3rpE7FjVo7+QUdb0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-F1Ue6mCwMw2rKuPcb6Ly5g-1; Tue, 18 Feb 2025 15:44:50 -0500
X-MC-Unique: F1Ue6mCwMw2rKuPcb6Ly5g-1
X-Mimecast-MFC-AGG-ID: F1Ue6mCwMw2rKuPcb6Ly5g_1739911490
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-472001e9fe9so24154311cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 12:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739911490; x=1740516290;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9U6IaL4Uh4Ysg2qyqv6Wdh6gK8ZyE5jqK4/4mRmvBeY=;
        b=VlUL8Rs4se48UFRgCEhdbZWmi+9k0+iM4CyNYkFQYHNsq7rdo/1NowD9OdoW1j++g+
         qj/KmOb0PpTKsguik6ttJ2yMwnWJGXMWAspz04SYLRpQMgCUQvdXMQAGGVwwrR317tMw
         PvA3FBxkY1Jhh6KjsJHt/qd5GO++MayAO7wD22Ux87/Tpvk6+r/pS4J0gbpPCH4bsq9v
         /1ugfaC0qwtDfJeT3pXV/Wt0FziyjHNm60Gj2h/n932criNN3f5Xvs2R6Ke34SH32FEF
         BXvaREb3Ct5DHpxwcAWrc93nJNGuaHse4nP9kFuE9ElbOg7bAYx2FlEEe2xtio+S+IOr
         v7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUodsyCjaRcfuxaQovA/D4Ub72FP/ctScxt8kMbwoWclkVKeFCYDvWv8qBF7ibNsVxBd/c2kmAQ+m3gwMA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxd6sDj2VjhFFzcBRSOecXnrfaK6b9FSZ4v445WfNvxuQEz0dlp
	vtKfl/ZrBDxDL7jrBhIQKexEDR3Y7eS0m2j3nC15E4ZlW4oATe33v9IUaxrrYlHtdfF3eZtBVh0
	Pw94+S04yT+Ee7RZDzmhNUKXannXDR9b4xVJ3ptqy8c4Xse+W27otNneAkPWpaHA=
X-Gm-Gg: ASbGncs6jV4SLes9CKBBQAF9dUjGYFniJ8lzuA0CHW8c2/fTNwmvLfVGJAzWaBOQUoN
	JptY2uOjOMSRHpGKQabuXiM/0+oXXHBss2e5o6xXZQlryugGGYbLoIOR0TXXehpzO790nGxHiSg
	oxHLsakF+0Yo0q2zZglNUMNnpAiqyvsMwjAJvFoQc8rZMdIp5oEG3yNtK33uIGwfODK8RkdyDpZ
	TSHPZcv8AsRHGuu6Xc5fRrGiYKp65nuE7FkM1ink0xAv4xAqMvIzqjki2SP555MlAOVTyKzwKIz
	nbmvjafQctzV/rRPtVKhSZTv3B6TyrZxojG6oFh28T5tQ1l8
X-Received: by 2002:ac8:5e4e:0:b0:471:bd14:a77c with SMTP id d75a77b69052e-472082a97c3mr14807061cf.44.1739911489839;
        Tue, 18 Feb 2025 12:44:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDJ43mCnX/GxrYQz/yZz57l69Gil45oCG1T44SH7mvxCs6L1e9ve5SqgQTdz+WY3G273FDRg==
X-Received: by 2002:ac8:5e4e:0:b0:471:bd14:a77c with SMTP id d75a77b69052e-472082a97c3mr14806821cf.44.1739911489528;
        Tue, 18 Feb 2025 12:44:49 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471fa44e494sm17504291cf.48.2025.02.18.12.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 12:44:49 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c7fce1b1-b0f7-42b8-9a1f-fd07e6200924@redhat.com>
Date: Tue, 18 Feb 2025 15:44:47 -0500
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: make shell scripts POSIX-compliant
To: Aditya Dutt <duttaditya18@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Tejun Heo <tj@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, cgroups@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250216120225.324468-1-duttaditya18@gmail.com>
In-Reply-To: <20250216120225.324468-1-duttaditya18@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6F7ptfMwAAPinCv-DMbTReetXW55YuxCpyrMIK4Wie8_1739911490
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/16/25 7:02 AM, Aditya Dutt wrote:
> Changes include:
> - Replaced [[ ... ]] with [ ... ]
> - Replaced == with =
> - Replaced printf -v with cur=$(printf ...).
> - Replaced echo -e with printf "%b\n" ...
>
> The above mentioned are Bash/GNU extensions and are not part of POSIX.
> Using shells like dash or non-GNU coreutils may produce errors.
> They have been replaced with POSIX-compatible alternatives.
>
> Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
> ---
>
> I have made sure to only change the files that specifically have the
> /bin/sh shebang.
> I have referred to https://mywiki.wooledge.org/Bashism for information
> on what is and what isn't POSIX-compliant.
>
>   tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh   | 10 +++++-----
>   tools/testing/selftests/kexec/kexec_common_lib.sh     |  2 +-
>   tools/testing/selftests/kexec/test_kexec_file_load.sh |  2 +-
>   tools/testing/selftests/net/veth.sh                   | 10 +++++-----
>   tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh   |  2 +-
>   tools/testing/selftests/zram/zram_lib.sh              |  2 +-
>   6 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
> index 3f45512fb512..00416248670f 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
> @@ -11,24 +11,24 @@ skip_test() {
>   	exit 4 # ksft_skip
>   }
>   
> -[[ $(id -u) -eq 0 ]] || skip_test "Test must be run as root!"
> +[ $(id -u) -eq 0 ] || skip_test "Test must be run as root!"
>   
>   # Find cpuset v1 mount point
>   CPUSET=$(mount -t cgroup | grep cpuset | head -1 | awk -e '{print $3}')
> -[[ -n "$CPUSET" ]] || skip_test "cpuset v1 mount point not found!"
> +[ -n "$CPUSET" ] || skip_test "cpuset v1 mount point not found!"
>   
>   #
>   # Create a test cpuset, put a CPU and a task there and offline that CPU
>   #
>   TDIR=test$$
> -[[ -d $CPUSET/$TDIR ]] || mkdir $CPUSET/$TDIR
> +[ -d $CPUSET/$TDIR ] || mkdir $CPUSET/$TDIR
>   echo 1 > $CPUSET/$TDIR/cpuset.cpus
>   echo 0 > $CPUSET/$TDIR/cpuset.mems
>   sleep 10&
>   TASK=$!
>   echo $TASK > $CPUSET/$TDIR/tasks
>   NEWCS=$(cat /proc/$TASK/cpuset)
> -[[ $NEWCS != "/$TDIR" ]] && {
> +[ $NEWCS != "/$TDIR" ] && {
>   	echo "Unexpected cpuset $NEWCS, test FAILED!"
>   	exit 1
>   }
> @@ -38,7 +38,7 @@ sleep 0.5
>   echo 1 > /sys/devices/system/cpu/cpu1/online
>   NEWCS=$(cat /proc/$TASK/cpuset)
>   rmdir $CPUSET/$TDIR
> -[[ $NEWCS != "/" ]] && {
> +[ $NEWCS != "/" ] && {
>   	echo "cpuset $NEWCS, test FAILED!"
>   	exit 1
>   }

test_cpuset_v1_hp.sh had been changed to use /bin/bash in v6.14 by 
commit fd079124112c ("selftests/cgroup: use bash in test_cpuset_v1_hp.sh").

Cheers,
Longman


