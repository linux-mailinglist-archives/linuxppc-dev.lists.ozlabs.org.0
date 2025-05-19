Return-Path: <linuxppc-dev+bounces-8659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6555ABB802
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 10:57:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1BQL504wz2xlP;
	Mon, 19 May 2025 18:57:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747645034;
	cv=none; b=R4zPETY0fNcN958ZgWaWg4py7zBGx0AhWJRm0lrbvLy1TyNM+3yDt5xcosiJvhAiHL6fK+Hf2KgiQWUvi5UCKpd9oHwKPelBZTJwSNx36ViJWfxo9RTmO95uTbutlUrYoN84Ig4KZqxF5rrlW3QYwiQmDJzqpTuTMrqgvJXXP+2IhbE6T7qboazSVJ9ud9Tg1b1xfRSdNi/tRHnPWhJfA5jbITK/t1YqjCwhB2WDSXR0NvShY3K0tbV9OgY0vKotRUFSIfIaXI5OFAsNC1A77ztYyj9hpSvF+sjJYoGOy6aaF8OPFlTbDKP5ohgkM0fJSFdTMITh8LsUk80yu4d1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747645034; c=relaxed/relaxed;
	bh=57lbWIGpAZjDd2L3740mwnHRJL/CETq+opyWz0J1phk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMXhpwQv/TkdG+Cl3e+JTJfgbRz01TQWHwQcsdkpujJfbADrbY82gU1ZqoCn62vA/Q+DPb4nZfpNznj8PspwWafoAtjFcAj1JqnDZPuDtTz5CBiORUs3MMU6SjRNaa8VBTUxOkzWiz/NefUuCr6uij8wK1BiR23fz/FiIysZXb5I8YDOGaFeXpHsqxdOBOQzJu2xxzrQtErwLSxE+oyg12KNsSSx1VUf4CgWdO5K8ZBCX5flVpigGTWV5bsMQFNBb3DHdC7gfOZqISz3G1mTAFhOKg7d0t1ApXn+fN1W9OU4dpT5iOhRRacdYwO8dQB6ZdX2D3NJiFePLCgUOYyc/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PTqzLJeo; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LfM8L1e5; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PTqzLJeo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LfM8L1e5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1BQJ5cdhz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 18:57:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747645029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57lbWIGpAZjDd2L3740mwnHRJL/CETq+opyWz0J1phk=;
	b=PTqzLJeo5vUrtkO71KkM4IBSXUjycyceNiFzu2/i02w8NxFgd7gGL8ykyiWsFw4aLp0dG1
	SCRDP248IoR6T3sI9WRwf6Aj9naKNtrXl+pkz0HAdKKtwJmJPlp56n5Qs9cn8sSg7dVSvj
	q4Zsed/Rd8OcIfkTC1/9W6PMV7CSvdk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747645030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57lbWIGpAZjDd2L3740mwnHRJL/CETq+opyWz0J1phk=;
	b=LfM8L1e5pUMN+Q2nipCoWOno/THGFU1m+e7ujZlurhOGE36BPDNAWySvLofGSxyfOcdGBw
	CtjDsx+I3XWTOE9Pn9/MXBM5LQ+UdfzhtOSHHTGMAS0RMxB7I/8bMOp97k7+O8Lo3uI1B7
	nQV4MCi+GpQyZOqVW8oFViRAKtlzR8M=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-MghoniTgMIWVGV9YG5QhBQ-1; Mon, 19 May 2025 04:57:08 -0400
X-MC-Unique: MghoniTgMIWVGV9YG5QhBQ-1
X-Mimecast-MFC-AGG-ID: MghoniTgMIWVGV9YG5QhBQ_1747645027
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b00e4358a34so2520189a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 01:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747645027; x=1748249827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57lbWIGpAZjDd2L3740mwnHRJL/CETq+opyWz0J1phk=;
        b=IV9JhegoGQv/rm/KmVdtr+s5RBbjgJ0rQPQnl6atxS+j0nAEf9HO5Tw2kQItQI72ik
         C4vsGt9kW2bnXA5jzBlU8HBVcJ239WpzX/fn6KJKueFyLLwb7UQbd9gleEHloLqdcp4L
         +oxhL+yZVviWGbXwLiIopnl/ibzglh1hd5Z869ZgZlDEW9i6j6Huil0fAMt2nY6cnu5K
         UfkcfYvUU49lYyhrUqp7HmHjs3d5+LkNQlkA9I6Vc7MgOWDDkHo84F1q/B1a+g3/E+pg
         Tv0CXym/fkKWc4EUBudKi0hJ//QqzL6LeCTKOcRf2dgixegETs8+lsFC4+cFJakr4Nb7
         GRPA==
X-Forwarded-Encrypted: i=1; AJvYcCUXCHbDL5Ee3wkfZYI17e4Q/UVPqFzLgPkraZa6nWchmzP2Be5aDqRiSHjoag4vf+gtz3m0AXHpw9b1v8w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yya10vGelXwlHH9aWCxtKwQwAvzAbAv8+KHNECkbk3yXBtWSbTi
	rKWvp2tJQE1r9e5y29EItEWdQRuQXoAnGly84IokiwPpUE3wLyTmcJyR7diGHDOMYe8syOLcfhc
	Pm/bG2sFHF+QJRmtPSOUN16wsP6eWosqIXzW3L1sUpDT5iGsS2URJelBqLi2j+Pd0+Bg=
X-Gm-Gg: ASbGncswH0i9qt+aWRdAjYj8HWXQ5ET7qWKqTXDiApKe4oyEG65wTYqKkpxOP/rNNGN
	aLCaAu7RQyaZuO1RhsKpzBx8m7YPPPA+W9yVD/SdLLFbCTCWUJzMI/ZK8rRDst7moLtd+rU97Y1
	URGe6QcfYQJnB2r2wyVD89hlG/j9O596FNN5H69HC+aWXMR+67Q1L/AqKhX+EIs8WLBhRY3XaZ6
	Vz1hS3wuz27t5XXfhVq3JFEp+fQA2jqrHQQEPMK7aL2wKjtpp+DIjXmEuhtjgs+/F6o61ZmfMbt
	IL5AW4Ea83A3RNmI
X-Received: by 2002:a05:6a21:a341:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-216218e668fmr19448413637.15.1747645026966;
        Mon, 19 May 2025 01:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+BBkV0dSDFn9S/kO/xVvSG5+nt7BjgxgmMpQUjhktNCq5vzK536Q0m1eaNG4mx2NI/khDRA==
X-Received: by 2002:a05:6a21:a341:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-216218e668fmr19448372637.15.1747645026548;
        Mon, 19 May 2025 01:57:06 -0700 (PDT)
Received: from [10.72.116.146] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a89edsm5672369a12.67.2025.05.19.01.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:57:05 -0700 (PDT)
Message-ID: <1ecedde8-8d18-43f1-a3b7-e8bcc82a61f0@redhat.com>
Date: Mon, 19 May 2025 16:56:56 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 00/16] arm/arm64: Add kvmtool to the
 runner script
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x7InicWiMstEOM6jRzf-PUgA1xjnyaS-MVeM1cC-x7E_1747645027
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Alexandru,

For this series, I've tested it, everything works good.

On 5/7/25 11:12 PM, Alexandru Elisei wrote:
> v2 can be found here [1].
> 
> To goal is to allow the user to do:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ ./run_tests.sh
> 
> to run all the tests automatically with kvmtool.
> 
> Reasons to use kvmtool:
> 
> * kvmtool is smaller and a lot easier to hack than qemu, which means
> developers may prefer it when adding or prototyping new features to KVM.
> Being able to run all the tests reliably and automatically is very useful
> in the development process.
> 
> * kvmtool is faster to run the tests (a couple of times faster on
> my rockpro64), making for a quick turnaround. But do keep in mind that not
> all tests work on kvmtool because of missing features compared to qemu.
> 
> * kvmtool does things differently than qemu: different memory layout,
> different uart, PMU emulation is disabled by default, etc. This makes it a
> good testing vehicule for kvm-unit-tests itself.
> 
> Changes in v3
> -------------
> 
> Lots of changes following the excellent feedback I got. A bird's eye view:
> 
> * Split extra_params into qemu_params and test_args: qemu_params for qemu
> arguments and test_args for the test's main() function.
> 
> Now that I'm putting the cover letter together I'm considering that maybe
> having qemu_params, kvmtool_params and test_params (instead of test_args)
> might be a better naming scheme.
> 
> * TARGET is now exported unconditionally. Unfortunately a side effect of
> this is that checking out these series and running the tests will end up
> with an error because the scripts now expect TARGET to be defined in
> config.mak.
> 
> If it's unacceptable, I can drop this and handle everything in vmm.bash by
> converting direct accesses to vmm_opts with functions defined in vmm.bash
> (vmm_opts[$TARGET:parse_premature_failure] becomes
> vmm_parse_premature_failure(), for example).
> 
> * Introduced scripts/vmm.bash to keep the vmm stuff contained. As a
> consequence there's very little $TARGET stuff in scripts/runtime.bash (only
> for premature_failure(), and no more 'case' statements anywhere) and
> instead scripts/common.bash passes the correct arguments directly to
> runtime.bash::run().
> 
> Unfortunately, because of all the changes, I decided not to keep some of
> the Reviewed-by tags. That's not to say that the effort is not appreciated,
> on the contrary, these changes are a direct result of the review; I dropped
> the tags because I was worried they might not apply to the current content
> of the patches.
> 
> If no major changes are needed following this round of review, for the next
> iteration I'm planning to send the first two patches (extra_params renamed
> to qemu_params and the new test_args) separately, to make sure it gets the
> review it deserves from the rest of the architectures.
> 
> Still haven't managed to get EDK2 to work with kvmtool, so I've decided to
> explicitely disabled UEFI tests in the last patch ("scripts: Enable
> kvmtool") - this is new.
> 
> I would also like to point out that despite Drew's comment I kept the
> 'disabled_if' test definition because I think using 'targets', with the
> default value of 'qemu', will probably lead to most, if not all, of the new
> tests which will be added never being run or tested with kvmtool. More
> details in patch #15 ("scripts: Add 'disabled_if' test definition parameter
> for kvmtool to use").
> 
> [1] https://lore.kernel.org/kvm/20250120164316.31473-1-alexandru.elisei@arm.com/
> 
> Alexandru Elisei (16):
>    scripts: unittests.cfg: Rename 'extra_params' to 'qemu_params'
>    scripts: Add 'test_args' test definition parameter
>    configure: Export TARGET unconditionally
>    run_tests.sh: Document --probe-maxsmp argument
>    scripts: Document environment variables
>    scripts: Refuse to run the tests if not configured for qemu
>    scripts: Use an associative array for qemu argument names
>    scripts: Add 'kvmtool_params' to test definition
>    scripts: Add support for kvmtool
>    scripts: Add default arguments for kvmtool
>    scripts: Add KVMTOOL environment variable for kvmtool binary path
>    scripts: Detect kvmtool failure in premature_failure()
>    scripts: Do not probe for maximum number of VCPUs when using kvmtool
>    scripts/mkstandalone: Export $TARGET
>    scripts: Add 'disabled_if' test definition parameter for kvmtool to
>      use
>    scripts: Enable kvmtool
> 
>   README.md               |  18 ++++-
>   arm/efi/run             |   8 ++
>   arm/run                 | 161 +++++++++++++++++++++++--------------
>   arm/unittests.cfg       | 125 ++++++++++++++++++++---------
>   configure               |  37 ++++++---
>   docs/unittests.txt      |  54 +++++++++++--
>   powerpc/run             |   4 +-
>   powerpc/unittests.cfg   |  21 ++---
>   riscv/run               |   4 +-
>   riscv/unittests.cfg     |   2 +-
>   run_tests.sh            |  35 ++++++---
>   s390x/run               |   2 +-
>   s390x/unittests.cfg     |  53 +++++++------
>   scripts/arch-run.bash   | 113 ++++++++++----------------
>   scripts/common.bash     |  71 +++++++++++------
>   scripts/mkstandalone.sh |   4 +
>   scripts/runtime.bash    |  51 +++++-------
>   scripts/vmm.bash        | 170 ++++++++++++++++++++++++++++++++++++++++
>   x86/run                 |   4 +-
>   x86/unittests.cfg       | 164 +++++++++++++++++++++-----------------
>   20 files changed, 730 insertions(+), 371 deletions(-)
>   create mode 100644 scripts/vmm.bash
> 
> 
> base-commit: 08db0f5cfbca16b36f200b7bc54a78fa4941bcce

-- 
Shaoqin


