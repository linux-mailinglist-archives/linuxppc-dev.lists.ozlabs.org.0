Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5052F897
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 10:31:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F15X1MynzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 18:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45F1406RS0zDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 18:30:20 +1000 (AEST)
Received: by mail-wm1-f65.google.com with SMTP id c6so322523wml.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 01:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pIqrbsE6/Nv/138vVdlcEQnoXvw/3uCQiUSd/l1oIaY=;
 b=I81dugDTc3tAzijLBAO5BaqYw/GdUHlMMgNYgIoCW4mn+t+WlSKi5QsvpYgaSaC4+E
 MZUcHna3T+YpqNZx5d2zkc6m6uhr+p4zSmFrtDwZyWZ3lIRZ9Gf9nPX2YIv5llc0sj2I
 SWg5uOe/3xv1zw915y4g14GWuJ886syk3k86WFvlmXVAmPRD6wM4BsFOcc5X1Jyeo/rR
 yFM2dtOjBpaRbuzh7J94KS6taAOC0RbzjWj6O6EEaol4lqPs0xvcLoYByXWWf+AHHa99
 UFdnKc2hLIwOuSZ4hGbeV5jeYni6wfxIghYBKsWM8Pb/EdY4j8YJsJRcSDdVJ6AEU4pI
 CDFA==
X-Gm-Message-State: APjAAAWno/FiaEm98GnxfbqF5Yxgg9RNAZJMg9ckWDOcyyoaBHLVxqJg
 9FHymQjC+NUlKWsO27arQyvGow==
X-Google-Smtp-Source: APXvYqxguQuxTuphnJ9ISpnJqaH4xcMLu4CCyeeLtDHqpdu4VJX+hsaHIz6Atqsiq1kkBiYITPXGpg==
X-Received: by 2002:a7b:c043:: with SMTP id u3mr910083wmc.56.1559205017089;
 Thu, 30 May 2019 01:30:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3da1:318a:275c:408?
 ([2001:b07:6468:f312:3da1:318a:275c:408])
 by smtp.gmail.com with ESMTPSA id y8sm1688765wmi.8.2019.05.30.01.30.15
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 01:30:16 -0700 (PDT)
Subject: Re: [PATCH 09/22] docs: mark orphan documents as such
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea534992-07ff-15d8-e48b-5fde37c88f73@redhat.com>
Date: Thu, 30 May 2019 10:30:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
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
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-pm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30/05/19 01:23, Mauro Carvalho Chehab wrote:
> Sphinx doesn't like orphan documents:
> 
>     Documentation/accelerators/ocxl.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32f429-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32f746-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32f769-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32h743-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32mp157-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/gpu/msm-crash-dump.rst: WARNING: document isn't included in any toctree
>     Documentation/interconnect/interconnect.rst: WARNING: document isn't included in any toctree
>     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
>     Documentation/powerpc/isa-versions.rst: WARNING: document isn't included in any toctree
>     Documentation/virtual/kvm/amd-memory-encryption.rst: WARNING: document isn't included in any toctree
>     Documentation/virtual/kvm/vcpu-requests.rst: WARNING: document isn't included in any toctree
> 
> So, while they aren't on any toctree, add :orphan: to them, in order
> to silent this warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Please leave out KVM, I'll fix that instead.  Thanks for the report!

Paolo

> ---
>  Documentation/accelerators/ocxl.rst                 | 2 ++
>  Documentation/arm/stm32/overview.rst                | 2 ++
>  Documentation/arm/stm32/stm32f429-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32f746-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32f769-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32h743-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32mp157-overview.rst     | 2 ++
>  Documentation/gpu/msm-crash-dump.rst                | 2 ++
>  Documentation/interconnect/interconnect.rst         | 2 ++
>  Documentation/laptops/lg-laptop.rst                 | 2 ++
>  Documentation/powerpc/isa-versions.rst              | 2 ++
>  Documentation/virtual/kvm/amd-memory-encryption.rst | 2 ++
>  Documentation/virtual/kvm/vcpu-requests.rst         | 2 ++
>  13 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/accelerators/ocxl.rst
> index 14cefc020e2d..b1cea19a90f5 100644
> --- a/Documentation/accelerators/ocxl.rst
> +++ b/Documentation/accelerators/ocxl.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  ========================================================
>  OpenCAPI (Open Coherent Accelerator Processor Interface)
>  ========================================================
> diff --git a/Documentation/arm/stm32/overview.rst b/Documentation/arm/stm32/overview.rst
> index 85cfc8410798..f7e734153860 100644
> --- a/Documentation/arm/stm32/overview.rst
> +++ b/Documentation/arm/stm32/overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  ========================
>  STM32 ARM Linux Overview
>  ========================
> diff --git a/Documentation/arm/stm32/stm32f429-overview.rst b/Documentation/arm/stm32/stm32f429-overview.rst
> index 18feda97f483..65bbb1c3b423 100644
> --- a/Documentation/arm/stm32/stm32f429-overview.rst
> +++ b/Documentation/arm/stm32/stm32f429-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32F429 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32f746-overview.rst b/Documentation/arm/stm32/stm32f746-overview.rst
> index b5f4b6ce7656..42d593085015 100644
> --- a/Documentation/arm/stm32/stm32f746-overview.rst
> +++ b/Documentation/arm/stm32/stm32f746-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32F746 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32f769-overview.rst b/Documentation/arm/stm32/stm32f769-overview.rst
> index 228656ced2fe..f6adac862b17 100644
> --- a/Documentation/arm/stm32/stm32f769-overview.rst
> +++ b/Documentation/arm/stm32/stm32f769-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32F769 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32h743-overview.rst b/Documentation/arm/stm32/stm32h743-overview.rst
> index 3458dc00095d..c525835e7473 100644
> --- a/Documentation/arm/stm32/stm32h743-overview.rst
> +++ b/Documentation/arm/stm32/stm32h743-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32H743 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
> index 62e176d47ca7..2c52cd020601 100644
> --- a/Documentation/arm/stm32/stm32mp157-overview.rst
> +++ b/Documentation/arm/stm32/stm32mp157-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32MP157 Overview
>  ===================
>  
> diff --git a/Documentation/gpu/msm-crash-dump.rst b/Documentation/gpu/msm-crash-dump.rst
> index 757cd257e0d8..240ef200f76c 100644
> --- a/Documentation/gpu/msm-crash-dump.rst
> +++ b/Documentation/gpu/msm-crash-dump.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  =====================
>  MSM Crash Dump Format
>  =====================
> diff --git a/Documentation/interconnect/interconnect.rst b/Documentation/interconnect/interconnect.rst
> index c3e004893796..56e331dab70e 100644
> --- a/Documentation/interconnect/interconnect.rst
> +++ b/Documentation/interconnect/interconnect.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> +:orphan:
> +
>  =====================================
>  GENERIC SYSTEM INTERCONNECT SUBSYSTEM
>  =====================================
> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index aa503ee9b3bc..f2c2ffe31101 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0+
>  
> +:orphan:
> +
>  LG Gram laptop extra features
>  =============================
>  
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
> index 812e20cc898c..66c24140ebf1 100644
> --- a/Documentation/powerpc/isa-versions.rst
> +++ b/Documentation/powerpc/isa-versions.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  CPU to ISA Version Mapping
>  ==========================
>  
> diff --git a/Documentation/virtual/kvm/amd-memory-encryption.rst b/Documentation/virtual/kvm/amd-memory-encryption.rst
> index 659bbc093b52..33d697ab8a58 100644
> --- a/Documentation/virtual/kvm/amd-memory-encryption.rst
> +++ b/Documentation/virtual/kvm/amd-memory-encryption.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  ======================================
>  Secure Encrypted Virtualization (SEV)
>  ======================================
> diff --git a/Documentation/virtual/kvm/vcpu-requests.rst b/Documentation/virtual/kvm/vcpu-requests.rst
> index 5feb3706a7ae..c1807a1b92e6 100644
> --- a/Documentation/virtual/kvm/vcpu-requests.rst
> +++ b/Documentation/virtual/kvm/vcpu-requests.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  =================
>  KVM VCPU Requests
>  =================
> 

