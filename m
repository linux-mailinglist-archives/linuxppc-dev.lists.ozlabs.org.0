Return-Path: <linuxppc-dev+bounces-8551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF29AB6136
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 05:30:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxzPG6fFVz2yql;
	Wed, 14 May 2025 13:30:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747193410;
	cv=none; b=kUobxmjnlb/a24PzK2TkUJw0CTcYZQ4pktfcccjK29UeGQD/yB8jxIkAkPtx+MyB2fP62DndNqcfV0etHMxmfluVphnMic7Wz/+Xf6S/6lFKtIHFXXFCgdtCKin7WA3lHd/UoDKfHyGdLA6mgZ1qoiG8RSsHFRJD1YxadtIuDS82sOT3029g1K+XA3m/8k2D6cyK1nRW2ebH69bXGsin0ir2GSEAkikGPLJKUYXgBD6/oApfmmkKXPLBmVcBgaKhXz+Kh21ovqR2xwjCdLADJEZDFYpQoXXFYRmWtUmSEGCs4eyBs1CYAo8gNaP05ry7iH4xB2D1gQn+fq9YVms7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747193410; c=relaxed/relaxed;
	bh=zPNj1R9ALDGy4ZhAvSAe9nUoPzbthadZcf4T/oJDS44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHxmKufEVOiPOpIEWvjJuP/vTw4zzSraDRSPYs3FdZSwIGt9+EH0Dnqj79Plrtad8zfoxSnHP1A5udrydp2TIzsaXkAowrvDZRYz1HZH7oPtSbngNFwHru8ecWDu/HNEkAWhzO29nSsEN1ExSM8vRqI9z5aKnyy0OHEJzHHSxeQwQqYsEG9BhzQT/uRdoAo11k2hK98m93mpneg320LMmu047QUiuz3YfNedWf6iMLvH5NoI0cfdYFA4XZeXKQy7DWUEMuj5NC6CzdnPe42jgaP0Y1EwXKD+f4aOWR6rhXrg0tOcLYQsW4/ZGktIZXBSBb5lJhmTiWI34Rm1Ry/orQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PIE+dCDB; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PIE+dCDB; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PIE+dCDB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PIE+dCDB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxzPF72Ckz2yqk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 13:30:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747193406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPNj1R9ALDGy4ZhAvSAe9nUoPzbthadZcf4T/oJDS44=;
	b=PIE+dCDBdMLnqT3XLzEySVyDUJDNWhD9QY+s6w+6F7nijDtH2EYLOkeyTxaq572IHzjrcB
	678S5PR0b3Ype6pBsaf02anTw581h6fVU8da4u+JjbWjiksOVzwSuFakzKm98H/RGzwOB1
	daAmD/28ogSmnYGvht6X4y4H5DWnH+I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747193406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPNj1R9ALDGy4ZhAvSAe9nUoPzbthadZcf4T/oJDS44=;
	b=PIE+dCDBdMLnqT3XLzEySVyDUJDNWhD9QY+s6w+6F7nijDtH2EYLOkeyTxaq572IHzjrcB
	678S5PR0b3Ype6pBsaf02anTw581h6fVU8da4u+JjbWjiksOVzwSuFakzKm98H/RGzwOB1
	daAmD/28ogSmnYGvht6X4y4H5DWnH+I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-Fx4SZa1IOdKoUCZAMIvVjw-1; Tue, 13 May 2025 23:30:02 -0400
X-MC-Unique: Fx4SZa1IOdKoUCZAMIvVjw-1
X-Mimecast-MFC-AGG-ID: Fx4SZa1IOdKoUCZAMIvVjw_1747193401
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7424d8944b6so317344b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 20:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747193401; x=1747798201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPNj1R9ALDGy4ZhAvSAe9nUoPzbthadZcf4T/oJDS44=;
        b=UpUp/KbHj5M60ZXl1u4xjUGk+gHzUsakUZpnWnflA0QhpzdCQjEHMSd1Up/eOwert8
         t90i+j2yiCnMUuVcsigwD4Esjbackji8kdfwXFUSOCfxFzJwfEm4wAvEn6c5PftvsK+5
         xGkbLa40d16HGaywod5Ag7YHxvNGE9nekaXFhevRBsl+oBtxFJfmAOetqkE1+oivQrab
         ZKQ6ofLsHWAQ+WR55aCqKquJsdDKdBGK06JERf06Ma/760I0LxQ0pn9W+6fwBDrw882O
         TolgVkWXrG5Rw9WFgyDBjmBF5y/bAxeLWqfd8bFdrWJREAoh0iqc4/+qSY0sByjA5CjI
         x3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXSftWHW1utt6gxb3dF5ysHXwGuOg42wqPruYhMemLyFX1/nFGbpVmkMMyvd3WIhA9vti+SLIHurmpT5mw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBxLVqyUvnwtjWTlryzMPSyIgI+6SLuC4tSRX/VIUwMTFAW+Jy
	eTH8Imct1vcfCVFi0AgVHs2JeVozoF4bFcOCOPGmDC2GbagGqkrOgbshJsoMPCSSoICOb7EQgEO
	UDbKhgmJIuMGgttx9SjW2MKAzEdIKyt00nvBXout7/GrowbTYTSbQyMmwcpxuNSM=
X-Gm-Gg: ASbGncv5Gl7Sm9kGuQkY86WdN4oEttZgV/LskHtU5NCIvpFjnkqirMP74w700vGQdl3
	OyVR+KaDzPv9pWsICPXAyAW6+lRbYnRhvbwVkfP+pt+0yUf0wGYOLeuVXnqbMnmjgks/r31i6LF
	j7OtfgrAtehoM/n1XXpuUTsJjhnKyIFS9e+6rkdtoIfhAe/HzVYXuccQ7onqoOCkUEX2/BE2Cu2
	+caK5U4epjJlg6utjJlBMBL462jEr94pLmgnZS53x61vpxB1r/j7JyTSvx0K/UJnwAHPhmWARru
	qYGl21yBkejCv4Uw
X-Received: by 2002:a05:6a00:849:b0:73e:2367:c914 with SMTP id d2e1a72fcca58-7428907dbbemr2608216b3a.7.1747193401138;
        Tue, 13 May 2025 20:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4NfRMilmo0WhS6bonXckoq6ayKF8QYGypn6TRZn6O1csy9tmwHCGt4njEOo+8VL50NM6NRQ==
X-Received: by 2002:a05:6a00:849:b0:73e:2367:c914 with SMTP id d2e1a72fcca58-7428907dbbemr2608173b3a.7.1747193400666;
        Tue, 13 May 2025 20:30:00 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8a3adsm8406109b3a.158.2025.05.13.20.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 20:30:00 -0700 (PDT)
Message-ID: <54b5bb37-5304-4e73-afc8-bf2a23e6490b@redhat.com>
Date: Wed, 14 May 2025 11:29:51 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 04/16] run_tests.sh: Document
 --probe-maxsmp argument
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
 <20250507151256.167769-5-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-5-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PGnaGYkdf-32PVLF7O3IR89GH-iRM18Xmm8Ca6cSdt4_1747193401
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/7/25 11:12 PM, Alexandru Elisei wrote:
> Commit 5dd20ec76ea63 ("runtime: Update MAX_SMP probe") added the
> --probe-maxmp argument, but the help message for run_tests.sh wasn't
> updated. Document --probe-maxsmp.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   run_tests.sh | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 152323ffc8a2..f30b6dbd131c 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -17,14 +17,15 @@ cat <<EOF
>   
>   Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
>   
> -    -h, --help      Output this help text
> -    -v, --verbose   Enables verbose mode
> -    -a, --all       Run all tests, including those flagged as 'nodefault'
> -                    and those guarded by errata.
> -    -g, --group     Only execute tests in the given group
> -    -j, --parallel  Execute tests in parallel
> -    -t, --tap13     Output test results in TAP format
> -    -l, --list      Only output all tests list
> +    -h, --help          Output this help text
> +    -v, --verbose       Enables verbose mode
> +    -a, --all           Run all tests, including those flagged as 'nodefault'
> +                        and those guarded by errata.
> +    -g, --group         Only execute tests in the given group
> +    -j, --parallel      Execute tests in parallel
> +    -t, --tap13         Output test results in TAP format
> +    -l, --list          Only output all tests list
> +        --probe-maxsmp  Update the maximum number of VCPUs supported by host
>   
>   Set the environment variable QEMU=/path/to/qemu-system-ARCH to
>   specify the appropriate qemu binary for ARCH-run.

-- 
Shaoqin


