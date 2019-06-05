Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF1356DF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 08:20:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jdv56WbVzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 16:20:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JdqW2mrpzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 16:17:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x556CH6A031484
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Jun 2019 02:17:07 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sx789aa6u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 02:17:06 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Wed, 5 Jun 2019 07:17:04 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 07:16:58 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x556Gvcn42533004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 06:16:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC6B95204E;
 Wed,  5 Jun 2019 06:16:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 27FF352050;
 Wed,  5 Jun 2019 06:16:57 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 110F4A01BD;
 Wed,  5 Jun 2019 16:16:56 +1000 (AEST)
Subject: Re: [PATCH v2 06/22] docs: mark orphan documents as such
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
 <4afa83787acec906c383978dc01f286940e28616.1559656538.git.mchehab+samsung@kernel.org>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Wed, 5 Jun 2019 16:16:55 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4afa83787acec906c383978dc01f286940e28616.1559656538.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060506-0016-0000-0000-00000284C794
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060506-0017-0000-0000-000032E1DAC1
Message-Id: <65ffdb35-1179-be57-6258-991a02a67a66@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050039
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Alexandre Torgue <alexandre.torgue@st.com>,
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

On 5/6/19 12:17 am, Mauro Carvalho Chehab wrote:
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
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

ocxl:

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

We should find somewhere to put it...

> ---
>   Documentation/accelerators/ocxl.rst             | 2 ++
>   Documentation/arm/stm32/overview.rst            | 2 ++
>   Documentation/arm/stm32/stm32f429-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32f746-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32f769-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32h743-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32mp157-overview.rst | 2 ++
>   Documentation/gpu/msm-crash-dump.rst            | 2 ++
>   Documentation/interconnect/interconnect.rst     | 2 ++
>   Documentation/laptops/lg-laptop.rst             | 2 ++
>   Documentation/powerpc/isa-versions.rst          | 2 ++
>   11 files changed, 22 insertions(+)
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
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

