Return-Path: <linuxppc-dev+bounces-8550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93901AB6123
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 05:17:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zxz6C22SNz2yqd;
	Wed, 14 May 2025 13:17:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747192627;
	cv=none; b=OOuDHNRuQ3g2wUjCj1lGuvNjI6LCTjz9mymIisWocijrcnI+E4bQ6pnblp2YNjbqEngHp+monQkHK8JMeQudkgWFKLllmcQOxykMHwHhZgl6b2Oo9POBW6nCkR6E97cWm4QegfMwaActwNjYtIArmV0813Cfi+ACiOuPp9gURBrKPGSY9jPRBWAbuLVHd3L1LTFcYO43Bu/zEBUJ36gpGi+YKxDI8BMWQfVB1GaOePnDlqYHujujKH56dfF07Ogiy8yaed58NHJl0reaTwtdu0QhPCTacAVuKsYRBXWVzvBlHrgMnx0N833CjNMv7wD1AMc9SxVwS0g5d8q3rt6XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747192627; c=relaxed/relaxed;
	bh=bo1zHO1TLu57xTKrXLBF+PVswDcfMpKNQu425MUg/X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFTUNrkyzmw0VO3P3bt5pwO7DOs7ukVK2WZmnOko8EIzhH7kGvNEXccB9oF9KXIS72i2wmR+ouIM7BU7JMummhiZ4SMfrAjib+uRioqxILYJ0nUXY04+s/YJiP+ZXfdhA0BUZrHYdZT+xYjfWcNYMz6gNrJpMK//7za68WY5AoJrU6C79aIOebb4XpupTXyXKkV5hFmM2rcHGuk/Ao5DyVjX/qjKnTf0cjfpFsJFFMY9KFcJMJxu3FdspHWeyYbXkuF0lMCHrNSwkgZB1/csDqWf8f9QzxW72eBY73oJAdzHa6FwZ2xikEB5y+4b5n39/e9d6dDpqKiQ10bKWPKIzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SGD6SsHE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SGD6SsHE; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SGD6SsHE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SGD6SsHE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zxz692mktz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 13:17:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747192620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bo1zHO1TLu57xTKrXLBF+PVswDcfMpKNQu425MUg/X4=;
	b=SGD6SsHEuDSs8ihpcD9BnYlLBiRIvEOpz6U1UkcNyEYi1eEndA2kaj0gTMCbeOQUPLDpUS
	GlnBqUR/EpWtDonXUuvOLeNaMLEBNxsmYuZRCacrMys2NVpBnE7sLQxReezonTZA4OTv5K
	a2zeXtW5QIMv77YfmJvtELKOf09K7+Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747192620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bo1zHO1TLu57xTKrXLBF+PVswDcfMpKNQu425MUg/X4=;
	b=SGD6SsHEuDSs8ihpcD9BnYlLBiRIvEOpz6U1UkcNyEYi1eEndA2kaj0gTMCbeOQUPLDpUS
	GlnBqUR/EpWtDonXUuvOLeNaMLEBNxsmYuZRCacrMys2NVpBnE7sLQxReezonTZA4OTv5K
	a2zeXtW5QIMv77YfmJvtELKOf09K7+Y=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-UWBhTBLkOhSthAVYUNQqVA-1; Tue, 13 May 2025 23:16:58 -0400
X-MC-Unique: UWBhTBLkOhSthAVYUNQqVA-1
X-Mimecast-MFC-AGG-ID: UWBhTBLkOhSthAVYUNQqVA_1747192618
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b16b35ea570so6256719a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 20:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747192618; x=1747797418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bo1zHO1TLu57xTKrXLBF+PVswDcfMpKNQu425MUg/X4=;
        b=oSvBYTOxnKHKgKZCDpZCfpFD5KKrS7FWY2aV+gdanHIHthJoeZRbxVDj1HsVy8ym48
         QGp0a1ECgmynSYBznTNwsDUx7Be7+0lyJWpK/Js0x3aQzRg3Y6EBWPRPHViWsg7DObAq
         LKZl9kLCJw/sCXoZePSrSgyOaHLQLUx2duXDhL50ZG59I0rVcSSugw1QgsCIYUpG5Lug
         EJ7SZ48QnZMfrmxyJLXkEhTyC0H2aYmaDWMG+8otqdwBJ4TFACJh+b2ihpJQTmG8gytg
         6c2wuUxU+aTKMMo/eUcNWDJx1mqTTt0cyemD7agcqKvstJQXGux1Gf4n7Gm2IyLLpgMo
         j8tA==
X-Forwarded-Encrypted: i=1; AJvYcCWUvc04MozU6xiNpc2pzAChs0woPsD55CNAQvBUoilERHhEnjEefJSXgT7lq73qlcxC89oakdLZFTa5+FQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxW6335sLLdRleXZV9R+W3IR8LiSRElKvaIUcLSPDga1ZpaTe6G
	6NC70e6hTVgX50FSaKw4CKX03/0rbNU7Nf8hGEZ8fpt+Vk3BDIQBWf/JUEiwkDusWIiJnZlKF3+
	Z5yipdL1OkXUmKFLSzXx1xVIhHtq0PXxJCzkpX/4rQ9i70l5KsJKBD1AegC1TKn0=
X-Gm-Gg: ASbGncvKlKRyvHJ0qhOd3wkTspfDnnGXfHUf/FwIB9XfOuhsN+KuWbHRwpO4Jl+n6SU
	UmDXC7Uzm46eoPb4Fy2ywtlcGXBh+eRV7ToYmJ595sn3gIXlmStx6CASNWIGDj7i8iPg9HgjDrI
	/4ngRFvJiVIhPor17d8fWDnp5jLoczbnhQvBwHCLsF8bCt2buELEfIMFAlS+mAM9ooaK5x9j6f1
	AYzqBNT0G9qdHKQ2qrBPRyeZwR0m4b9fECdCmYZw2eL0hBnpHLLpc4+Hg7OPTfbQMcCfcmDJpJZ
	X34uE6uxIXOP77Nx
X-Received: by 2002:a05:6a20:3d86:b0:215:ee6e:ee3b with SMTP id adf61e73a8af0-215ff0db94dmr2590847637.15.1747192617476;
        Tue, 13 May 2025 20:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6ZmEbxqIkWHONUIYBOvAIG+f/adO1+radfY7mm1COXYOKYtizQKv5r8znzX86CFmwnS3eyg==
X-Received: by 2002:a05:6a20:3d86:b0:215:ee6e:ee3b with SMTP id adf61e73a8af0-215ff0db94dmr2590789637.15.1747192616945;
        Tue, 13 May 2025 20:16:56 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f14csm8775641b3a.107.2025.05.13.20.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 20:16:56 -0700 (PDT)
Message-ID: <7179a8d6-4548-45c6-8b53-11ea605d394e@redhat.com>
Date: Wed, 14 May 2025 11:16:45 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 02/16] scripts: Add 'test_args' test
 definition parameter
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
 <20250507151256.167769-3-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-3-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hXrhTb-jALQXRUXeEjIGFkjaoI_lBRD11xhYMTn6TNM_1747192618
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
> kvm-unit-tests, on arm and arm64, is getting ready to support running all
> the test automatically under kvmtool. kvmtool has a different syntax for
> configuring and running a virtual machine, but what is common between
> kvmtool and qemu, and any other virtual machine manager that kvm-unit-tests
> might support in the future, is the test arguments that are passed to the
> main() function.
> 
> So add a new test definition parameter, 'test_args', that contains only the
> VMM-independent arguments that are passed to the main() function.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   arm/unittests.cfg     | 94 ++++++++++++++++++++++++++-----------------
>   docs/unittests.txt    | 17 ++++++--
>   powerpc/unittests.cfg | 19 +++++----
>   riscv/unittests.cfg   |  2 +-
>   s390x/unittests.cfg   | 13 +++---
>   scripts/common.bash   |  8 +++-
>   scripts/runtime.bash  | 18 ++++++---
>   x86/unittests.cfg     | 92 ++++++++++++++++++++++++++----------------
>   8 files changed, 164 insertions(+), 99 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 6c6f76b2fb52..a4192ed7e20b 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -15,26 +15,27 @@
>   [selftest-setup]
>   file = selftest.flat
>   smp = 2
> -qemu_params = -m 256 -append 'setup smp=2 mem=256'
> +test_args = 'setup smp=2 mem=256'
> +qemu_params = -m 256
>   groups = selftest
>   
>   # Test vector setup and exception handling (kernel mode).
>   [selftest-vectors-kernel]
>   file = selftest.flat
> -qemu_params = -append 'vectors-kernel'
> +test_args = vectors-kernel
>   groups = selftest
>   
>   # Test vector setup and exception handling (user mode).
>   [selftest-vectors-user]
>   file = selftest.flat
> -qemu_params = -append 'vectors-user'
> +test_args = vectors-user
>   groups = selftest
>   
>   # Test SMP support
>   [selftest-smp]
>   file = selftest.flat
>   smp = $MAX_SMP
> -qemu_params = -append 'smp'
> +test_args = smp
>   groups = selftest
>   
>   # Test PCI emulation
> @@ -46,79 +47,81 @@ groups = pci
>   [pmu-cycle-counter]
>   file = pmu.flat
>   groups = pmu
> -qemu_params = -append 'cycle-counter 0'
> +test_args = "cycle-counter 0"
>   
>   [pmu-event-introspection]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-event-introspection'
> +test_args = pmu-event-introspection
>   
>   [pmu-event-counter-config]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-event-counter-config'
> +test_args = pmu-event-counter-config
>   
>   [pmu-basic-event-count]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-basic-event-count'
> +test_args = pmu-basic-event-count
>   
>   [pmu-mem-access]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-mem-access'
> +test_args = pmu-mem-access
>   
>   [pmu-mem-access-reliability]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-mem-access-reliability'
> +test_args = pmu-mem-access-reliability
>   
>   [pmu-sw-incr]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-sw-incr'
> +test_args = pmu-sw-incr
>   
>   [pmu-chained-counters]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-chained-counters'
> +test_args = pmu-chained-counters
>   
>   [pmu-chained-sw-incr]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-chained-sw-incr'
> +test_args = pmu-chained-sw-incr
>   
>   [pmu-chain-promotion]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-chain-promotion'
> +test_args = pmu-chain-promotion
>   
>   [pmu-overflow-interrupt]
>   file = pmu.flat
>   groups = pmu
>   arch = arm64
> -qemu_params = -append 'pmu-overflow-interrupt'
> +test_args = pmu-overflow-interrupt
>   
>   # Test PMU support (TCG) with -icount IPC=1
>   #[pmu-tcg-icount-1]
>   #file = pmu.flat
> -#qemu_params = -icount 0 -append 'cycle-counter 1'
> +#test_args = "cycle-counter 1"
> +#qemu_params = -icount 0
>   #groups = pmu
>   #accel = tcg
>   
>   # Test PMU support (TCG) with -icount IPC=256
>   #[pmu-tcg-icount-256]
>   #file = pmu.flat
> -#qemu_params = -icount 8 -append 'cycle-counter 256'
> +#test_args = "cycle-counter 256"
> +#qemu_params = -icount 8
>   #groups = pmu
>   #accel = tcg
>   
> @@ -126,77 +129,89 @@ qemu_params = -append 'pmu-overflow-interrupt'
>   [gicv2-ipi]
>   file = gic.flat
>   smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> -qemu_params = -machine gic-version=2 -append 'ipi'
> +test_args = ipi
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv2-mmio]
>   file = gic.flat
>   smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> -qemu_params = -machine gic-version=2 -append 'mmio'
> +test_args = mmio
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv2-mmio-up]
>   file = gic.flat
>   smp = 1
> -qemu_params = -machine gic-version=2 -append 'mmio'
> +test_args = mmio
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv2-mmio-3p]
>   file = gic.flat
>   smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
> -qemu_params = -machine gic-version=2 -append 'mmio'
> +test_args = mmio
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv3-ipi]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'ipi'
> +test_args = ipi
> +qemu_params = -machine gic-version=3
>   groups = gic
>   
>   [gicv2-active]
>   file = gic.flat
>   smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> -qemu_params = -machine gic-version=2 -append 'active'
> +test_args = active
> +qemu_params = -machine gic-version=2
>   groups = gic
>   
>   [gicv3-active]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'active'
> +test_args = active
> +qemu_params = -machine gic-version=3
>   groups = gic
>   
>   [its-introspection]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-introspection'
> +test_args = its-introspection
> +qemu_params = -machine gic-version=3
>   groups = its
>   arch = arm64
>   
>   [its-trigger]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-trigger'
> +test_args = its-trigger
> +qemu_params = -machine gic-version=3
>   groups = its
>   arch = arm64
>   
>   [its-migration]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-migration'
> +test_args = its-migration
> +qemu_params = -machine gic-version=3
>   groups = its migration
>   arch = arm64
>   
>   [its-pending-migration]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-pending-migration'
> +test_args = its-pending-migration
> +qemu_params = -machine gic-version=3
>   groups = its migration
>   arch = arm64
>   
>   [its-migrate-unmapped-collection]
>   file = gic.flat
>   smp = $MAX_SMP
> -qemu_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
> +test_args = its-migrate-unmapped-collection
> +qemu_params = -machine gic-version=3
>   groups = its migration
>   arch = arm64
>   
> @@ -231,37 +246,37 @@ groups = cache
>   [debug-bp]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'bp'
> +test_args = bp
>   groups = debug
>   
>   [debug-bp-migration]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'bp-migration'
> +test_args = bp-migration
>   groups = debug migration
>   
>   [debug-wp]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'wp'
> +test_args = wp
>   groups = debug
>   
>   [debug-wp-migration]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'wp-migration'
> +test_args = wp-migration
>   groups = debug migration
>   
>   [debug-sstep]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'ss'
> +test_args = ss
>   groups = debug
>   
>   [debug-sstep-migration]
>   file = debug.flat
>   arch = arm64
> -qemu_params = -append 'ss-migration'
> +test_args = ss-migration
>   groups = debug migration
>   
>   # FPU/SIMD test
> @@ -276,17 +291,20 @@ arch = arm64
>   [mte-sync]
>   file = mte.flat
>   groups = mte
> -qemu_params = -machine mte=on -append 'sync'
> +test_args=sync
> +qemu_params = -machine mte=on
>   arch = arm64
>   
>   [mte-async]
>   file = mte.flat
>   groups = mte
> -qemu_params = -machine mte=on -append 'async'
> +test_args=async
> +qemu_params = -machine mte=on
>   arch = arm64
>   
>   [mte-asymm]
>   file = mte.flat
>   groups = mte
> -qemu_params = -machine mte=on -append 'asymm'
> +test_args=asymm
> +qemu_params = -machine mte=on
>   arch = arm64
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 3d19fd70953f..6eb315618dbd 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -56,13 +56,22 @@ smp = <number>
>   Optional, the number of processors created in the machine to run the test.
>   Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
>   
> +test_args
> +---------
> +test_args = "..."
> +
> +Optional, will be used to pass arguments into the test case argv. If multiple,
> +space separated, arguments need to be passed to a test, wrap them in quotes.
> +Backticks can be used to pass the result of shell commands, for example:
> +
> +test_args = "10000000 `date +%s`"
> +
>   qemu_params
>   ------------
> -These are extra parameters supplied to the QEMU process. -append '...' can
> -be used to pass arguments into the test case argv. Multiple parameters can
> -be added, for example:
> +These are extra parameters supplied to the QEMU process. Multiple parameters
> +can be added, for example:
>   
> -qemu_params = -m 256 -append 'smp=2'
> +qemu_params = -m 256 -machine pit=off
>   
>   extra_params
>   ------------
> diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
> index 5097911e4bf3..2dd32edfa1ae 100644
> --- a/powerpc/unittests.cfg
> +++ b/powerpc/unittests.cfg
> @@ -15,7 +15,8 @@
>   [selftest-setup]
>   file = selftest.elf
>   smp = 2
> -qemu_params = -m 1g -append 'setup smp=2 mem=1024'
> +test_args = 'setup smp=2 mem=1024'
> +qemu_params = -m 1g
>   groups = selftest
>   
>   [selftest-migration]
> @@ -27,7 +28,7 @@ groups = selftest migration
>   file = selftest-migration.elf
>   machine = pseries
>   groups = selftest migration
> -qemu_params = -append "skip"
> +test_args = "skip"
>   
>   [migration-memory]
>   file = memory-verify.elf
> @@ -46,20 +47,21 @@ machine = pseries
>   file = rtas.elf
>   machine = pseries
>   timeout = 5
> -qemu_params = -append "get-time-of-day date=$(date +%s)"
> +test_args = "get-time-of-day date=$(date +%s)"
>   groups = rtas
>   
>   [rtas-get-time-of-day-base]
>   file = rtas.elf
>   machine = pseries
>   timeout = 5
> -qemu_params = -rtc base="2006-06-17" -append "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
> +test_args = "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
> +qemu_params = -rtc base="2006-06-17"
>   groups = rtas
>   
>   [rtas-set-time-of-day]
>   file = rtas.elf
>   machine = pseries
> -qemu_params = -append "set-time-of-day"
> +test_args = "set-time-of-day"
>   timeout = 5
>   groups = rtas
>   
> @@ -94,7 +96,7 @@ smp = 2
>   [atomics-migration]
>   file = atomics.elf
>   machine = pseries
> -qemu_params = -append "migration -m"
> +test_args = "migration -m"
>   groups = migration
>   
>   [timebase]
> @@ -110,7 +112,8 @@ file = tm.elf
>   machine = pseries
>   accel = kvm
>   smp = 2,threads=2
> -qemu_params = -machine cap-htm=on -append "h_cede_tm"
> +test_args = "h_cede_tm"
> +qemu_params = -machine cap-htm=on
>   groups = h_cede_tm
>   
>   [sprs]
> @@ -119,7 +122,7 @@ file = sprs.elf
>   [sprs-migration]
>   file = sprs.elf
>   machine = pseries
> -qemu_params = -append '-w'
> +test_args = '-w'
>   groups = migration
>   
>   [sieve]
> diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
> index 5b31047f75c7..8a98ac723c2c 100644
> --- a/riscv/unittests.cfg
> +++ b/riscv/unittests.cfg
> @@ -10,7 +10,7 @@
>   [selftest]
>   file = selftest.flat
>   smp = $MAX_SMP
> -qemu_params = -append 'foo bar baz'
> +test_args = 'foo bar baz'
>   groups = selftest
>   
>   # Set $FIRMWARE_OVERRIDE to /path/to/firmware to select the SBI implementation.
> diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
> index 1e129fef3c38..ed4d069ece38 100644
> --- a/s390x/unittests.cfg
> +++ b/s390x/unittests.cfg
> @@ -10,7 +10,7 @@
>   file = selftest.elf
>   groups = selftest
>   # please keep the kernel cmdline in sync with $(TEST_DIR)/selftest.parmfile
> -qemu_params = -append 'test 123'
> +test_args = 'test 123'
>   
>   [selftest-migration]
>   file = selftest-migration.elf
> @@ -22,7 +22,7 @@ accel = kvm
>   [selftest-migration-skip]
>   file = selftest-migration.elf
>   groups = selftest migration
> -qemu_params = -append "skip"
> +test_args = "skip"
>   
>   # This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
>   [migration-memory]
> @@ -214,13 +214,13 @@ smp = 2
>   [migration-skey-sequential]
>   file = migration-skey.elf
>   groups = migration
> -qemu_params = -append '--sequential'
> +test_args = '--sequential'
>   
>   [migration-skey-parallel]
>   file = migration-skey.elf
>   smp = 2
>   groups = migration
> -qemu_params = -append '--parallel'
> +test_args = '--parallel'
>   
>   [execute]
>   file = ex.elf
> @@ -252,12 +252,13 @@ file = topology.elf
>   
>   [topology-2]
>   file = topology.elf
> -qemu_params = -cpu max,ctop=on -smp sockets=31,cores=8,maxcpus=248  -append '-sockets 31 -cores 8'
> +test_args = '-sockets 31 -cores 8'
> +qemu_params = -cpu max,ctop=on -smp sockets=31,cores=8,maxcpus=248
>   
>   [topology-3]
>   file = topology.elf
> +test_args = '-drawers 2 -books 2 -sockets 2 -cores 16'
>   qemu_params = """-cpu max,ctop=on -smp cpus=1,drawers=2,books=2,sockets=2,cores=16,maxcpus=128 \
> --append '-drawers 2 -books 2 -sockets 2 -cores 16' \
>   -device max-s390x-cpu,core-id=31,drawer-id=0,book-id=0,socket-id=0,entitlement=medium,dedicated=false \
>   -device max-s390x-cpu,core-id=11,drawer-id=0,book-id=0,socket-id=0,entitlement=high,dedicated=true \
>   -device max-s390x-cpu,core-id=95,drawer-id=0,book-id=0,socket-id=0,entitlement=medium,dedicated=false \
> diff --git a/scripts/common.bash b/scripts/common.bash
> index bd7c82f1adda..9deb87d4050d 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -7,6 +7,7 @@ function for_each_unittest()
>   	local testname
>   	local smp
>   	local kernel
> +	local test_args
>   	local opts
>   	local groups
>   	local arch
> @@ -22,11 +23,12 @@ function for_each_unittest()
>   		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>   			rematch=${BASH_REMATCH[1]}
>   			if [ -n "${testname}" ]; then
> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   			fi
>   			testname=$rematch
>   			smp=1
>   			kernel=""
> +			test_args=""
>   			opts=""
>   			groups=""
>   			arch=""
> @@ -38,6 +40,8 @@ function for_each_unittest()
>   			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
>   			smp=${BASH_REMATCH[1]}
> +		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> +			test_args=${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
>   			opts=${BASH_REMATCH[2]}$'\n'
>   			while read -r -u $fd; do
> @@ -71,7 +75,7 @@ function for_each_unittest()
>   		fi
>   	done
>   	if [ -n "${testname}" ]; then
> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   	fi
>   	exec {fd}<&-
>   }
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 400e8a082528..06cc58e79b69 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -80,12 +80,18 @@ function run()
>       local groups="$2"
>       local smp="$3"
>       local kernel="$4"
> -    local opts="$5"
> -    local arch="$6"
> -    local machine="$7"
> -    local check="${CHECK:-$8}"
> -    local accel="$9"
> -    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
> +    local test_args="$5"
> +    local opts="$6"
> +    local arch="$7"
> +    local machine="$8"
> +    local check="${CHECK:-$9}"
> +    local accel="${10}"
> +    local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
> +
> +    # If $test_args is empty, qemu will interpret the first option after -append
> +    # as a kernel parameter instead of a qemu option, so make sure the -append
> +    # option is used only if $test_args is not empy.
> +    [ -n "$test_args" ] && opts="-append $test_args $opts"
>   
>       if [ "${CONFIG_EFI}" == "y" ]; then
>           kernel=${kernel/%.flat/.efi}
> diff --git a/x86/unittests.cfg b/x86/unittests.cfg
> index a356f486eaec..3effddfe4207 100644
> --- a/x86/unittests.cfg
> +++ b/x86/unittests.cfg
> @@ -58,27 +58,27 @@ smp = 3
>   
>   [vmexit_cpuid]
>   file = vmexit.flat
> -qemu_params = -append 'cpuid'
> +test_args = 'cpuid'
>   groups = vmexit
>   
>   [vmexit_vmcall]
>   file = vmexit.flat
> -qemu_params = -append 'vmcall'
> +test_args = 'vmcall'
>   groups = vmexit
>   
>   [vmexit_mov_from_cr8]
>   file = vmexit.flat
> -qemu_params = -append 'mov_from_cr8'
> +test_args = 'mov_from_cr8'
>   groups = vmexit
>   
>   [vmexit_mov_to_cr8]
>   file = vmexit.flat
> -qemu_params = -append 'mov_to_cr8'
> +test_args = 'mov_to_cr8'
>   groups = vmexit
>   
>   [vmexit_inl_pmtimer]
>   file = vmexit.flat
> -qemu_params = -append 'inl_from_pmtimer'
> +test_args = 'inl_from_pmtimer'
>   groups = vmexit
>   
>   # To allow IPIs to be accelerated by SVM AVIC when the feature is available and
> @@ -87,40 +87,43 @@ groups = vmexit
>   [vmexit_ipi]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -machine pit=off -append 'ipi'
> +test_args = 'ipi'
> +qemu_params = -machine pit=off
>   groups = vmexit
>   
>   [vmexit_ipi_halt]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -append 'ipi_halt'
> +test_args = 'ipi_halt'
>   groups = vmexit
>   
>   [vmexit_ple_round_robin]
>   file = vmexit.flat
> -qemu_params = -append 'ple_round_robin'
> +test_args = 'ple_round_robin'
>   groups = vmexit
>   
>   [vmexit_tscdeadline]
>   file = vmexit.flat
>   groups = vmexit
> -qemu_params = -cpu qemu64,+x2apic,+tsc-deadline -append tscdeadline
> +test_args = tscdeadline
> +qemu_params = -cpu qemu64,+x2apic,+tsc-deadline
>   
>   [vmexit_tscdeadline_immed]
>   file = vmexit.flat
>   groups = vmexit
> -qemu_params = -cpu qemu64,+x2apic,+tsc-deadline -append tscdeadline_immed
> +test_args = tscdeadline_immed
> +qemu_params = -cpu qemu64,+x2apic,+tsc-deadline
>   
>   [vmexit_cr0_wp]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -append 'toggle_cr0_wp'
> +test_args = 'toggle_cr0_wp'
>   groups = vmexit
>   
>   [vmexit_cr4_pge]
>   file = vmexit.flat
>   smp = 2
> -qemu_params = -append 'toggle_cr4_pge'
> +test_args = 'toggle_cr4_pge'
>   groups = vmexit
>   
>   [access]
> @@ -131,7 +134,8 @@ qemu_params = -cpu max,host-phys-bits
>   [access_fep]
>   file = access_test.flat
>   arch = x86_64
> -qemu_params = -cpu max,host-phys-bits -append force_emulation
> +test_args = force_emulation
> +qemu_params = -cpu max,host-phys-bits
>   groups = nodefault
>   timeout = 240
>   
> @@ -256,13 +260,15 @@ arch = x86_64
>   [svm]
>   file = svm.flat
>   smp = 2
> -qemu_params = -cpu max,+svm -m 4g -append "-pause_filter_test"
> +test_args = "-pause_filter_test"
> +qemu_params = -cpu max,+svm -m 4g
>   arch = x86_64
>   groups = svm
>   
>   [svm_pause_filter]
>   file = svm.flat
> -qemu_params = -cpu max,+svm -overcommit cpu-pm=on -m 4g -append pause_filter_test
> +test_args = pause_filter_test
> +qemu_params = -cpu max,+svm -overcommit cpu-pm=on -m 4g
>   arch = x86_64
>   groups = svm
>   
> @@ -285,7 +291,7 @@ groups = tasks
>   [kvmclock_test]
>   file = kvmclock_test.flat
>   smp = 2
> -qemu_params = --append "10000000 `date +%s`"
> +test_args = "10000000 `date +%s`"
>   
>   [pcid-enabled]
>   file = pcid.flat
> @@ -320,33 +326,38 @@ qemu_params = -cpu max,host-phys-bits
>   
>   [vmx]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "-exit_monitor_from_l2_test -ept_access* -vmx_smp* -vmx_vmcs_shadow_test -atomic_switch_overflow_msrs_test -vmx_init_signal_test -vmx_apic_passthrough_tpr_threshold_test -apic_reg_virt_test -virt_x2apic_mode_test -vmx_pf_exception_test -vmx_pf_exception_forced_emulation_test -vmx_pf_no_vpid_test -vmx_pf_invvpid_test -vmx_pf_vpid_test -vmx_basic_vid_test -vmx_eoi_virt_test -vmx_posted_interrupts_test"
> +test_args = "-exit_monitor_from_l2_test -ept_access* -vmx_smp* -vmx_vmcs_shadow_test -atomic_switch_overflow_msrs_test -vmx_init_signal_test -vmx_apic_passthrough_tpr_threshold_test -apic_reg_virt_test -virt_x2apic_mode_test -vmx_pf_exception_test -vmx_pf_exception_forced_emulation_test -vmx_pf_no_vpid_test -vmx_pf_invvpid_test -vmx_pf_vpid_test -vmx_basic_vid_test -vmx_eoi_virt_test -vmx_posted_interrupts_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   
>   [ept]
>   file = vmx.flat
> -qemu_params = -cpu max,host-phys-bits,+vmx -m 2560 -append "ept_access*"
> +test_args = "ept_access*"
> +qemu_params = -cpu max,host-phys-bits,+vmx -m 2560
>   arch = x86_64
>   groups = vmx
>   
>   [vmx_eoi_bitmap_ioapic_scan]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_eoi_bitmap_ioapic_scan_test
> +test_args = vmx_eoi_bitmap_ioapic_scan_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   
>   [vmx_hlt_with_rvi_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append vmx_hlt_with_rvi_test
> +test_args = vmx_hlt_with_rvi_test
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 10
>   
>   [vmx_apicv_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "apic_reg_virt_test virt_x2apic_mode_test vmx_basic_vid_test vmx_eoi_virt_test"
> +test_args = "apic_reg_virt_test virt_x2apic_mode_test vmx_basic_vid_test vmx_eoi_virt_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 30
> @@ -354,7 +365,8 @@ timeout = 30
>   [vmx_posted_intr_test]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -append "vmx_posted_interrupts_test"
> +test_args = "vmx_posted_interrupts_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 10
> @@ -362,14 +374,16 @@ timeout = 10
>   [vmx_apic_passthrough_thread]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_apic_passthrough_thread_test
> +test_args = vmx_apic_passthrough_thread_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   
>   [vmx_init_signal_test]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_init_signal_test
> +test_args = vmx_init_signal_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   timeout = 10
> @@ -377,62 +391,71 @@ timeout = 10
>   [vmx_sipi_signal_test]
>   file = vmx.flat
>   smp = 2
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_sipi_signal_test
> +test_args = vmx_sipi_signal_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   timeout = 10
>   
>   [vmx_apic_passthrough_tpr_threshold_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -m 2048 -append vmx_apic_passthrough_tpr_threshold_test
> +test_args = vmx_apic_passthrough_tpr_threshold_test
> +qemu_params = -cpu max,+vmx -m 2048
>   arch = x86_64
>   groups = vmx
>   timeout = 10
>   
>   [vmx_vmcs_shadow_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append vmx_vmcs_shadow_test
> +test_args = vmx_vmcs_shadow_test
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx
>   timeout = 180
>   
>   [vmx_pf_exception_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_exception_test"
> +test_args = "vmx_pf_exception_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception
>   
>   [vmx_pf_exception_test_fep]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_exception_forced_emulation_test"
> +test_args = "vmx_pf_exception_forced_emulation_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_vpid_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_vpid_test"
> +test_args = "vmx_pf_vpid_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_invvpid_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_invvpid_test"
> +test_args = "vmx_pf_invvpid_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_no_vpid_test]
>   file = vmx.flat
> -qemu_params = -cpu max,+vmx -append "vmx_pf_no_vpid_test"
> +test_args = "vmx_pf_no_vpid_test"
> +qemu_params = -cpu max,+vmx
>   arch = x86_64
>   groups = vmx nested_exception nodefault
>   timeout = 240
>   
>   [vmx_pf_exception_test_reduced_maxphyaddr]
>   file = vmx.flat
> -qemu_params = -cpu IvyBridge,phys-bits=36,host-phys-bits=off,+vmx -append "vmx_pf_exception_test"
> +test_args = "vmx_pf_exception_test"
> +qemu_params = -cpu IvyBridge,phys-bits=36,host-phys-bits=off,+vmx
>   arch = x86_64
>   groups = vmx nested_exception
>   check = /sys/module/kvm_intel/parameters/allow_smaller_maxphyaddr=Y
> @@ -462,7 +485,8 @@ groups = hyperv
>   [hyperv_stimer_direct]
>   file = hyperv_stimer.flat
>   smp = 2
> -qemu_params = -cpu host,hv_passthrough -append direct
> +test_args = direct
> +qemu_params = -cpu host,hv_passthrough
>   groups = hyperv
>   
>   [hyperv_clock]

-- 
Shaoqin


