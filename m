Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F392F90E4CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 09:45:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBEw5Ms2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBEw5Ms2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3wdv4qw0z3cY0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 17:45:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBEw5Ms2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBEw5Ms2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3wdB22Tjz3cVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 17:45:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718783100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cux+7kpeF5VekvynNts7C8PD9JNm/gwxEni9kpJP52o=;
	b=XBEw5Ms2rnEan5gKuDLtV8jefsHAQFy08LP4NQa/+MwzlTuOrCUdevKOcCNOFLlmyjiUia
	caMIQdtcCd5AAAu5npxuiBJqYx7yZ1Ernd9iQ6IWhO6f6a/00jrgbKJHx2OwRciTN8A5zl
	5VNxb4AI6IHe/WceRkkgOH2yU+sq2TE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718783100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cux+7kpeF5VekvynNts7C8PD9JNm/gwxEni9kpJP52o=;
	b=XBEw5Ms2rnEan5gKuDLtV8jefsHAQFy08LP4NQa/+MwzlTuOrCUdevKOcCNOFLlmyjiUia
	caMIQdtcCd5AAAu5npxuiBJqYx7yZ1Ernd9iQ6IWhO6f6a/00jrgbKJHx2OwRciTN8A5zl
	5VNxb4AI6IHe/WceRkkgOH2yU+sq2TE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-_-NYthdPNwmbfWiaHnS76Q-1; Wed, 19 Jun 2024 03:44:56 -0400
X-MC-Unique: _-NYthdPNwmbfWiaHnS76Q-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4405de838abso75354571cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 00:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718783096; x=1719387896;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cux+7kpeF5VekvynNts7C8PD9JNm/gwxEni9kpJP52o=;
        b=ZI0vL2gTSvt3jN0ni22lpC2jzpLiXAZoxH8uZN6ovM7zqR4CvfKOhr8QZlQHx2eO5y
         KJdWv8l6AlVvMYumhezgdScpX9wfNBhkWQDcsf2uOWW+hCgaGFEQFxsmS97aMf/RNPP4
         jJdP4Q5hawU5qF1agfHsEwPyNcEtcXWChM/yFQPyDZ9hlYYhSNHB9RCuy2rWn4f0mPrd
         W9eOiqtsjJAfEjIdAfCme3B8W1i+bdFQurdBvoQrDu378co/wIGrXl7+sx43rYtxKX2D
         68coWp85DXiAaC1Yt1TIpuZ0n+IiZJByTVaIf3Fr16xMRyBSaRtOPiqycZhtlJN6Mk84
         2BTg==
X-Forwarded-Encrypted: i=1; AJvYcCWvlWvBLG/OnOUUg/HBv1wAXx9M984kjeJxhzOmEWHvDG/LwQFl9xjNRax2ryjHS3tYUjIfzTzuGPkUKRrqGZHmsRaIIfAxK+m6r3uiQQ==
X-Gm-Message-State: AOJu0YxAgzOLPmH+B7WG//QlpxFUg3taZICE8pnWqVlRI6meQPt60e2x
	eBoCksHtKASR7S7zuNPAPmxfDmydOb4WMYWG5gHCw/b4zlsNoh7HwoVqpbtwE4zoKJoQp4WpXEU
	5W+n/ZmsFgI0cMgWbdRyuNAyPZMPcLL9BkMsSVfZCqxDo/e5TfXVMLr7/fRd2keQ=
X-Received: by 2002:ac8:57d3:0:b0:440:6115:ad4e with SMTP id d75a77b69052e-444a79a3f7bmr21193091cf.2.1718783096199;
        Wed, 19 Jun 2024 00:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcxqq0o8C85U9HuQX4IFUydnWTkzgMyKM6sXiKxNpXRMrzfTIduQgbllbt8qse8+Y24u4jfQ==
X-Received: by 2002:ac8:57d3:0:b0:440:6115:ad4e with SMTP id d75a77b69052e-444a79a3f7bmr21192981cf.2.1718783095894;
        Wed, 19 Jun 2024 00:44:55 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef50497dsm63345601cf.36.2024.06.19.00.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 00:44:55 -0700 (PDT)
Message-ID: <a0b16c1f-2cb1-4899-aa49-50e9e0001818@redhat.com>
Date: Wed, 19 Jun 2024 09:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v10 15/15] powerpc/gitlab-ci: Enable more
 tests with Fedora 40
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
 <20240612052322.218726-16-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240612052322.218726-16-npiggin@gmail.com>
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

On 12/06/2024 07.23, Nicholas Piggin wrote:
> With Fedora 40 (QEMU 8.2), more tests can be enabled.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   .gitlab-ci.yml        |  2 +-
>   powerpc/unittests.cfg | 17 ++++++++---------
>   2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ffb3767ec..ee14330a3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -110,7 +110,7 @@ build-ppc64le:
>    extends: .intree_template
>    image: fedora:40
>    script:
> - - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
> + - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat jq

Please mention the addition of jq in the patch description (why it is needed).

  Thanks,
   Thomas



