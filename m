Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927C1FAC6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 11:31:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mNHr4L0BzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 19:31:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=jean-philippe@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n2zYcdJI; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mLv70QJ8zDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 18:28:34 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id o15so20522387ejm.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 01:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8IjNpcb5GlLP8oh8x0KUTPeP/cupRlI8efPDAe078Wg=;
 b=n2zYcdJI10LwDXrUDK71pELIpej3d4vK23sWHQIG+DTNiP7rBB2Ydlo3ni2NhqKlw0
 qmgjqRyWrTNKRJqtcN54fNNbVchNxv0UCZ8UD6A5n0N9veGqYXg67ZE1JHCqEN7GwO5N
 bEzMy2pQBU1i7k0Z/9BJp4fSpA1uwPrI9uPISnm1l2c83I4urBxMP6qXHOXcm7LqT474
 DkWGGV7iqbwvNUH1ffz861zJTpj+CcmYfrKxZNalIwc2nhiDZQK3HmY8x01t6j0g8Rzp
 21hq2PicDxmT3+wENPx4ZJnox12QbkNo3+5pkq+RlLl6x1a38Mh53C7YsX6mxJYhTMLu
 rlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8IjNpcb5GlLP8oh8x0KUTPeP/cupRlI8efPDAe078Wg=;
 b=R67qwXkv0mNOeuYhe0NuYZLu/lJbZAJYNmPAW9l0mJ61s5Qem/XMM9qraZurMlryzC
 CY9wIbk1uqRjtCFwE+bMy5XNhk0WHBI/wA82ae/PFSJpgv1t5a28s5N9ouxFNTFHZDCN
 QRdWgJ08by2xXf822eSJcDp0sanANrOqnceATVHfFWayh8Hysb9FmNBFmjVTZFiDZ74A
 4lQKT9dUnkBIIFM/rYwEuMw8ob4xP+H9rGNTmw7OtJkWy8SWq/ccUVz150WjrbrPOAFj
 vG/VhX+Wizt2aeP/OgrbqQGr3D5Uz8aOI2rkLBFJForjrjTjlxoof3lQkpvSPCdPFI5C
 xH6Q==
X-Gm-Message-State: AOAM532IR6S6FMSJhsz5JBpRP6idLKS12ULZKdvZxxnOu37G8P9yJ/iF
 nZfFnrPExyOnQHnn1UgVDoTBvg==
X-Google-Smtp-Source: ABdhPJwdmGZqCbPQVfP2PbF9SY5ULvsP9RvSngnjuu0AyNddv0ojHPfA/jhOP8zjYvYdGToRfiyJAw==
X-Received: by 2002:a17:906:6b92:: with SMTP id
 l18mr1733654ejr.145.1592296110725; 
 Tue, 16 Jun 2020 01:28:30 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id c4sm10680797ejz.104.2020.06.16.01.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 01:28:30 -0700 (PDT)
Date: Tue, 16 Jun 2020 10:28:19 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 08/12] mm: Define pasid in mm
Message-ID: <20200616082819.GA590740@myrica>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-9-git-send-email-fenghua.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592008893-9388-9-git-send-email-fenghua.yu@intel.com>
X-Mailman-Approved-At: Tue, 16 Jun 2020 19:28:56 +1000
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
Cc: Dave Hansen <dave.hansen@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Sohil Mehta <sohil.mehta@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tony Luck <tony.luck@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Jun Pan <jacob.jun.pan@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 12, 2020 at 05:41:29PM -0700, Fenghua Yu wrote:
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 64ede5f150dc..5778db3aa42d 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -538,6 +538,10 @@ struct mm_struct {
>  		atomic_long_t hugetlb_usage;
>  #endif
>  		struct work_struct async_put_work;
> +
> +#ifdef CONFIG_PCI_PASID

Non-PCI devices can also use a PASID (e.g. Arm's SubstreamID). How about
CONFIG_IOMMU_SUPPORT?

Thanks,
Jean

> +		unsigned int pasid;
> +#endif
