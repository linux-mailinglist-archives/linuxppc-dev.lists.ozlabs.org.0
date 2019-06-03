Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D76329B2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:34:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRd90Zf8zDqQ9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KCHA/+I2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRbs5HD4zDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:32:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45HRbj0L33z9tyqk;
 Mon,  3 Jun 2019 09:32:49 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KCHA/+I2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id f1ZXWwP5lEd5; Mon,  3 Jun 2019 09:32:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45HRbh6GzZz9tyqD;
 Mon,  3 Jun 2019 09:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559547168; bh=mFSnLp9SecdoefqVAi+zrsx7gCUNrqDDhzeAm7hNfcA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KCHA/+I2NHjkZkiR233EwpdRJt5jFkb7BB5WvTUHNfzd/oweFVHs6D+raJnJ4JYpd
 J+KQ8vTwYSp7XV7FCrl9nJmeWCQH+EPqi/mxK+DlAKOo2fjx8cf6H7S04ezRTgUM5E
 wPjjz8mFCLKIrimihcCu7Fs69Nna3fpjCg3CfU9w=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 704308B7B1;
 Mon,  3 Jun 2019 09:32:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eaNrRzoQGBQV; Mon,  3 Jun 2019 09:32:53 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C9028B7A1;
 Mon,  3 Jun 2019 09:32:53 +0200 (CEST)
Subject: Re: [PATCH 09/22] docs: mark orphan documents as such
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2891a08c-50b1-db33-0e96-740d45c5235f@c-s.fr>
Date: Mon, 3 Jun 2019 09:32:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
 linux-stm32@st-md-mailman.stormreply.com, Andrew Donnellan <ajd@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-pm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Georgi Djakov <georgi.djakov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/05/2019 à 01:23, Mauro Carvalho Chehab a écrit :
> Sphinx doesn't like orphan documents:
> 
>      Documentation/accelerators/ocxl.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32f429-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32f746-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32f769-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32h743-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32mp157-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/gpu/msm-crash-dump.rst: WARNING: document isn't included in any toctree
>      Documentation/interconnect/interconnect.rst: WARNING: document isn't included in any toctree
>      Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
>      Documentation/powerpc/isa-versions.rst: WARNING: document isn't included in any toctree
>      Documentation/virtual/kvm/amd-memory-encryption.rst: WARNING: document isn't included in any toctree
>      Documentation/virtual/kvm/vcpu-requests.rst: WARNING: document isn't included in any toctree
> 
> So, while they aren't on any toctree, add :orphan: to them, in order
> to silent this warning.

Are those files really not meant to be included in a toctree ?

Shouldn't we include them in the relevant toctree instead of just 
shutting up Sphinx warnings ?

Christophe

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   Documentation/accelerators/ocxl.rst                 | 2 ++
>   Documentation/arm/stm32/overview.rst                | 2 ++
>   Documentation/arm/stm32/stm32f429-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32f746-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32f769-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32h743-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32mp157-overview.rst     | 2 ++
>   Documentation/gpu/msm-crash-dump.rst                | 2 ++
>   Documentation/interconnect/interconnect.rst         | 2 ++
>   Documentation/laptops/lg-laptop.rst                 | 2 ++
>   Documentation/powerpc/isa-versions.rst              | 2 ++
>   Documentation/virtual/kvm/amd-memory-encryption.rst | 2 ++
>   Documentation/virtual/kvm/vcpu-requests.rst         | 2 ++
>   13 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/accelerators/ocxl.rst
> index 14cefc020e2d..b1cea19a90f5 100644
> --- a/Documentation/accelerators/ocxl.rst
> +++ b/Documentation/accelerators/ocxl.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   ========================================================
>   OpenCAPI (Open Coherent Accelerator Processor Interface)
>   ========================================================
> diff --git a/Documentation/arm/stm32/overview.rst b/Documentation/arm/stm32/overview.rst
> index 85cfc8410798..f7e734153860 100644
> --- a/Documentation/arm/stm32/overview.rst
> +++ b/Documentation/arm/stm32/overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   ========================
>   STM32 ARM Linux Overview
>   ========================
> diff --git a/Documentation/arm/stm32/stm32f429-overview.rst b/Documentation/arm/stm32/stm32f429-overview.rst
> index 18feda97f483..65bbb1c3b423 100644
> --- a/Documentation/arm/stm32/stm32f429-overview.rst
> +++ b/Documentation/arm/stm32/stm32f429-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32F429 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32f746-overview.rst b/Documentation/arm/stm32/stm32f746-overview.rst
> index b5f4b6ce7656..42d593085015 100644
> --- a/Documentation/arm/stm32/stm32f746-overview.rst
> +++ b/Documentation/arm/stm32/stm32f746-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32F746 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32f769-overview.rst b/Documentation/arm/stm32/stm32f769-overview.rst
> index 228656ced2fe..f6adac862b17 100644
> --- a/Documentation/arm/stm32/stm32f769-overview.rst
> +++ b/Documentation/arm/stm32/stm32f769-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32F769 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32h743-overview.rst b/Documentation/arm/stm32/stm32h743-overview.rst
> index 3458dc00095d..c525835e7473 100644
> --- a/Documentation/arm/stm32/stm32h743-overview.rst
> +++ b/Documentation/arm/stm32/stm32h743-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32H743 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
> index 62e176d47ca7..2c52cd020601 100644
> --- a/Documentation/arm/stm32/stm32mp157-overview.rst
> +++ b/Documentation/arm/stm32/stm32mp157-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32MP157 Overview
>   ===================
>   
> diff --git a/Documentation/gpu/msm-crash-dump.rst b/Documentation/gpu/msm-crash-dump.rst
> index 757cd257e0d8..240ef200f76c 100644
> --- a/Documentation/gpu/msm-crash-dump.rst
> +++ b/Documentation/gpu/msm-crash-dump.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   =====================
>   MSM Crash Dump Format
>   =====================
> diff --git a/Documentation/interconnect/interconnect.rst b/Documentation/interconnect/interconnect.rst
> index c3e004893796..56e331dab70e 100644
> --- a/Documentation/interconnect/interconnect.rst
> +++ b/Documentation/interconnect/interconnect.rst
> @@ -1,5 +1,7 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> +:orphan:
> +
>   =====================================
>   GENERIC SYSTEM INTERCONNECT SUBSYSTEM
>   =====================================
> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index aa503ee9b3bc..f2c2ffe31101 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,5 +1,7 @@
>   .. SPDX-License-Identifier: GPL-2.0+
>   
> +:orphan:
> +
>   LG Gram laptop extra features
>   =============================
>   
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
> index 812e20cc898c..66c24140ebf1 100644
> --- a/Documentation/powerpc/isa-versions.rst
> +++ b/Documentation/powerpc/isa-versions.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   CPU to ISA Version Mapping
>   ==========================
>   
> diff --git a/Documentation/virtual/kvm/amd-memory-encryption.rst b/Documentation/virtual/kvm/amd-memory-encryption.rst
> index 659bbc093b52..33d697ab8a58 100644
> --- a/Documentation/virtual/kvm/amd-memory-encryption.rst
> +++ b/Documentation/virtual/kvm/amd-memory-encryption.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   ======================================
>   Secure Encrypted Virtualization (SEV)
>   ======================================
> diff --git a/Documentation/virtual/kvm/vcpu-requests.rst b/Documentation/virtual/kvm/vcpu-requests.rst
> index 5feb3706a7ae..c1807a1b92e6 100644
> --- a/Documentation/virtual/kvm/vcpu-requests.rst
> +++ b/Documentation/virtual/kvm/vcpu-requests.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   =================
>   KVM VCPU Requests
>   =================
> 
