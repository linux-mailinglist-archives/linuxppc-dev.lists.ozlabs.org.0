Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B811389684
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 21:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FljQ41C3Mz30BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:20:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Yg91ASxZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Yg91ASxZ; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FljPQ3g87z3084
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:20:10 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id 10so10608154pfl.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 12:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uMIDYXiQCge+lCPg7jWJZVlhfPYt5aTIXixKF3xFdtw=;
 b=Yg91ASxZAaNzg/r8+0Ydre6wM45Ae3A1iPokHrBnYytUGLfpFnHdf3IFz8HESX0/2+
 g821YtdozGCEBqe5IWPqRoORjgSuvSUsnUJvkFHQmi1Z8EyDysdL0ajJwNlL5xiTuXsv
 wFEKThjSNrz9xGLrgbp/gM/UJUw8aKgxniG4Yn3LJ2CAh4MiM/s09DXVGVwgC1M7Lc1O
 mqFqDRB1Z5q6tLXZhXMkex5oVmrXUvI0/xcrkwhwr72xMCAoZJcgyVejktim5H+sPgp9
 TLPqhl56m5cKFfFNduokObt8ZVxO6KXBoFBtUzi8i8SumVh20RnjYnxygdSMJ5gi3qzx
 uvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uMIDYXiQCge+lCPg7jWJZVlhfPYt5aTIXixKF3xFdtw=;
 b=NMrZ3u98rIHAPXIpA+d7Q0sGRrPHm15e15gwbtTUHKVlGkOzlVqSZ2Oz8+/uEfe+Ag
 A+VXEbMjmfhD2U8dP+hgHcnaEujpGVaUWs3A9JaoAvOI9Ss1AlPqaLTKyBQnF9wYYCWx
 3qV9ak55QWrxghM6t4dpO1PpGQswxRuLV49CcU1ccKSNsdwQxLtQfA2deY/d6A2+kc1l
 PGrBODd7mAM36GeB/wZrCY/bSp7VocpS4CB2SLdP790SxtGcRkSJgo8Md4hKvfU0k1IF
 f4IoltLhyxCATnQq90KRI3snUJG2DY5bS3shnzBCesLE+yoeuU/xor5rinWLAwvNA78Z
 vzzg==
X-Gm-Message-State: AOAM5323HEE8RtANHXeBDj+anch1H8PAwx4a/tjlM3Env1N97EmWrhiG
 mB/46Dn0rn3bV02aqfHlmN3+j6125uk=
X-Google-Smtp-Source: ABdhPJylNyq7yX8wc3qiI92uMNP4dk54r6bNs8/LZR+DzeCwuyO2pJ1p5Agdk04xE/qvY5oPdEYXRQ==
X-Received: by 2002:aa7:90d4:0:b029:28e:b912:acf with SMTP id
 k20-20020aa790d40000b029028eb9120acfmr661343pfk.43.1621452007052; 
 Wed, 19 May 2021 12:20:07 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id m5sm109361pgl.75.2021.05.19.12.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:20:06 -0700 (PDT)
Subject: Re: [PATCH v7 07/15] swiotlb: Update is_swiotlb_active to add a
 struct device argument
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-8-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6cae5ffa-f31b-ba08-c2cf-4a3dd76afb3b@gmail.com>
Date: Wed, 19 May 2021 12:20:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-8-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Update is_swiotlb_active to add a struct device argument. This will be
> useful later to allow for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
