Return-Path: <linuxppc-dev+bounces-8657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C8EABB6D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 10:14:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b19SP6Tqvz2xd4;
	Mon, 19 May 2025 18:13:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747642437;
	cv=none; b=OXS5AT1DjhtotyuaIJkPK644eDr8o0m576Fca5M20Z/sMBndtOwA3Q0W3jbExT4PAbl3+dOvHY7t/BINqxNwS7GuUKCgeZ9QuUWl8JCSVDcl8MitWwlBMd2/R8NNCuLx9ZM+UiXdTRFIqtq4/Sw5MXrc2Zb2P5OAiR1mMKAObNtbMwcH0TUbQRULw1rNV4gXQnsfYmTTvDZudgxe//AaSaMRn8V1mhdM3WLBxhCibtq7/mLH3itRcsIajvTJv84Uugf4bGp927Et8MEeTqVsitjIx9m4ekEZTDhBh5qX4jwvub1ErtbYRI6ar+H1vkEUQTI7h2NioEcCyNgUVAu1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747642437; c=relaxed/relaxed;
	bh=81MSjO1sHE2YfuqWDok69M/T/8z7rZ6g9u0DZWkIwK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBckawqP+C5//C64UgqYylVd3z7UbxwDwKhgqnF3nYaQzlKxUsxiNsNfxoHUg9QJc/wbBQ6L7JLFFdBhPWsTpSasviJeoh0FMHm1l9JPet6mm+3IsfHIj8l93EGWIyam7DLXY874uEecrkZBUOf4v8IHiunP254jhUryLXDKrHVtNnby3it2FDczTM+7oemUHLujoIaPRLztaDj6t/zB/o9MgRIsFXMKTknGQM4CeZEVOwLjpuNpjsr6I5Z4RebphMnhhbZOSY84GxuUQRMj7vWbuqJQzHaocbqtiJ2qLGgwnbZzgLyNGqSFtCAjw5kmR5XuUC5iY+b2vsmQd7m36w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b19xKsP1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b19xKsP1; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b19xKsP1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b19xKsP1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b19SN3ww0z2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 18:13:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747642429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81MSjO1sHE2YfuqWDok69M/T/8z7rZ6g9u0DZWkIwK4=;
	b=b19xKsP1PAEX75FCU5+0/27LzLwxWysG3Y1SnoeyXEQRNv5aiXsE0Zi3ZqoLdhYT804BEO
	Me2X4oauKUBT4rkqUpyMHwf8xGPstoAHlAO6E5UxNkje1988Bfyr9A0ecM/RSNWlS3PsnI
	Xm2JoXXHOLFE40QZkH/xk680zYz2C+s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747642429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81MSjO1sHE2YfuqWDok69M/T/8z7rZ6g9u0DZWkIwK4=;
	b=b19xKsP1PAEX75FCU5+0/27LzLwxWysG3Y1SnoeyXEQRNv5aiXsE0Zi3ZqoLdhYT804BEO
	Me2X4oauKUBT4rkqUpyMHwf8xGPstoAHlAO6E5UxNkje1988Bfyr9A0ecM/RSNWlS3PsnI
	Xm2JoXXHOLFE40QZkH/xk680zYz2C+s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-IxqndG61PfWg5t5Stfcq0w-1; Mon, 19 May 2025 04:13:48 -0400
X-MC-Unique: IxqndG61PfWg5t5Stfcq0w-1
X-Mimecast-MFC-AGG-ID: IxqndG61PfWg5t5Stfcq0w_1747642427
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742a091d290so2672103b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 01:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642427; x=1748247227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81MSjO1sHE2YfuqWDok69M/T/8z7rZ6g9u0DZWkIwK4=;
        b=LXH72P39dhICtgr6/xdeJsh2N5oQ9LkmQCC5H+TM4roCAk/nny9KNmdMaRnE2x1AeB
         1rXfHQjvcuRZ/fmzodLAqzB07iPY6OhXGllG95fQZaZ56H7jy0EFxzJouueglZkn7yPH
         M8roM8IBTEH/5/CPOwtA1bXwEZ1njnrsjBKQByO/SmtHVWHmlRohTVrSAvjUJrvNxTjM
         wYJFEnolporJ9/HQ3RDOLkQ3j0EpOv5M8AmFEeDpknW1kzyJDyLTz3zcE3yHmmI+7N1O
         G2Q66RxkuokzW/4kaDVmBCO9ytCsQYNH667/FmlXMnSLJnXCWHOKV9iJYzMtMC94nUGM
         k/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX7JhqHFYyXNeMdRzCcYxh5l+m475U4AzWJmAsea/r2NlYtebeOt1G64IL1owHl9z10GphhbBMdTA7KNKI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZXv9MKJdYcE4swATfARzZTPAvKLyzOZoucRPFSJgzEUy2cZRi
	WLVfw8AV0xOii95c+U6zCIHl00FI0riqdUKobybuDiG+RgCx7OF6wiz1NkLJh+FyKUsMG9gzOMA
	EYAp9qhQi99pCtjOE5eaMHc81Z9C5O0lPEWhYrSU/2qCUlub8ZUqS//Out06HXgVkxXY=
X-Gm-Gg: ASbGncu1waRyPSS/CTLcq4UjWdxoUJOfMEb6K6Jbfi/pG/ShbUGRijXP5jJjlaoZpxs
	EDctsL3/iFnhIPVVpu7oQUZRerPyBhVtR1xIa1Pz9VdNb2dUXBw4ZoRKwKRh6/1zNC8z+MESuBi
	rpg2J+HWSZmy3vUx76at/Hyu0VkQOd0aShV8y0Q9X8y5GaR/5ubyYlndYJ1Jjr3DbPR8VhWuK0S
	YUOzl5rkVa1AkxCUhvELddF2YRhgsfrwaAa+oLMrA0ZTpor20M2ulR281HN5Gs48y7Kc7Bda/bw
	XUB6Ll8gOib9ohP7
X-Received: by 2002:a05:6a21:7e86:b0:218:bbb:c13d with SMTP id adf61e73a8af0-2180bbbc1b0mr13503023637.13.1747642427128;
        Mon, 19 May 2025 01:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKS9dBCdoBJSd2fsnxqZtqXXkuCdfx1TMqH+JdIVWuZzC6jtmWsd4CbKxNWoE3TDYRsqvBDg==
X-Received: by 2002:a05:6a21:7e86:b0:218:bbb:c13d with SMTP id adf61e73a8af0-2180bbbc1b0mr13502979637.13.1747642426697;
        Mon, 19 May 2025 01:13:46 -0700 (PDT)
Received: from [10.72.116.146] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b9c7sm5585368b3a.48.2025.05.19.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:13:46 -0700 (PDT)
Message-ID: <e90c3221-4a31-4c53-afb9-c2fcf09ae358@redhat.com>
Date: Mon, 19 May 2025 16:13:35 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 11/16] scripts: Add KVMTOOL environment
 variable for kvmtool binary path
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
 <20250507151256.167769-12-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-12-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9m2VhDU2WokeIGYRtH8WbFrmEhb5Vu-ZLSIh7cKsDwM_1747642427
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
> kvmtool is often used for prototyping new features, and a developer might
> not want to install it system-wide. Add a KVMTOOL environment variable to
> make it easier for tests to use a binary not in $PATH.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   run_tests.sh          | 1 +
>   scripts/arch-run.bash | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index dd9d27377905..150a06a91064 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -36,6 +36,7 @@ The following environment variables are used:
>       TIMEOUT         Timeout duration for the timeout(1) command
>       CHECK           Overwrites the 'check' unit test parameter (see
>                       docs/unittests.txt)
> +    KVMTOOL         Path to kvmtool binary for ARCH-run
>   EOF
>   }
>   
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8cf67e4f3b51..d4fc7116abbe 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -372,7 +372,7 @@ search_kvmtool_binary ()
>   {
>   	local kvmtoolcmd kvmtool
>   
> -	for kvmtoolcmd in lkvm vm lkvm-static; do
> +	for kvmtoolcmd in ${KVMTOOL:-lkvm vm lkvm-static}; do
>   		if "$kvmtoolcmd" --help 2>/dev/null| grep -q 'The most commonly used'; then
>   			kvmtool="$kvmtoolcmd"
>   			break
> @@ -381,6 +381,7 @@ search_kvmtool_binary ()
>   
>   	if [ -z "$kvmtool" ]; then
>   		echo "A kvmtool binary was not found." >&2
> +		echo "You can set a custom location by using the KVMTOOL=<path> environment variable." >&2
>   		return 2
>   	fi
>   

-- 
Shaoqin


