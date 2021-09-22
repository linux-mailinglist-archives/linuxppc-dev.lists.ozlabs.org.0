Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51988413EAE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 02:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDfjc1bsyz3069
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 10:45:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jEV6CpbX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=jEV6CpbX; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDfhw4fCsz2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 10:45:13 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 67-20020a9d0449000000b00546e5a8062aso1069129otc.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 17:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q1iP5KefHqJWJ5qGAUDoYDJOyAD6pRFAZFOdaM0VUL4=;
 b=jEV6CpbXyr07JLXO1bp0yl7i+yms+T5LIGT6MwHF6pP/qG0RKnqzaXHP3PbaieYwko
 eiScBzgb/WsN+NvJnLl4t8FPVlcFSgH/ZYjXW0/dbKO8sDVbmqypt0rMXr/wg/O17Tkw
 VCUIukQzVQgK1p7wiXp5KbANB4eSFvjqbS6OufBZMTspLK6VKofrcLONrnjzcIffavOC
 sNTa24qsbj2zFf23cxhht8n9gEF7RhZZo41SmCRXkMlwxpqSt58N/iAWCoubiKQXzd6R
 P/Cfteln8igvgHe402qPDEmVCaUsIYLBxJvVa7PNvlpLnWka4d7kIA4Xvn0Ali7BjTJS
 KdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1iP5KefHqJWJ5qGAUDoYDJOyAD6pRFAZFOdaM0VUL4=;
 b=x2RaZd/0tT43Iwdn85BAZQUKFEt/TQveuyl2ps2qWM38RuqIv80J4hXXxo4w0rL5DX
 mxerLX5yGJq8b5+paRUZq33WwUf5udqoI9DJgo2Z7dcg14XVejPmzjr5l6ilAP1XlqoF
 ERP0R7K5WMPa8ctkBPnpMUWF1bLRDjWd/bHPup154M04dPNkQ7XvYF4E66rrYvwjdvcv
 xakWllaCJcsgaSf2hDpSF6EUAKINyd9KF29Sx/CypcZ796RCu/VGY4Lw+IZANyv1rLMo
 VKz49fRZd823hEshV9XHrFEhbmrYDQYIE6nPOtrOssMXSZuaZrzgGn3XUJ2FDBNyOgT1
 aEvw==
X-Gm-Message-State: AOAM531vpebcd/LQo1uDSnJqknsW+Rb0HU015+Y1/msAR4KQKVCRZHt/
 qTvpr96TCD9iuhxURKBUSA3HLJrpuIRBJmEg6cX+Bg==
X-Google-Smtp-Source: ABdhPJwmYVkzrdW65h9xNSUrnW1faCzIMwKQt+WpaGKLoqWCC3rgZnXMLk+Dnzi5GMg1Owh3toA9VWsUpQuh0BoWQos=
X-Received: by 2002:a9d:6359:: with SMTP id y25mr28065477otk.274.1632271510013; 
 Tue, 21 Sep 2021 17:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210921220459.2437386-1-ben.widawsky@intel.com>
 <20210921220459.2437386-8-ben.widawsky@intel.com>
In-Reply-To: <20210921220459.2437386-8-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 21 Sep 2021 17:44:58 -0700
Message-ID: <CAPcyv4h4QHAQF+ogMvOXrkdyR5Jceo8yp7TQNN+836=v0QwdDw@mail.gmail.com>
Subject: Re: [PATCH 7/7] ocxl: Use pci core's DVSEC functionality
To: Ben Widawsky <ben.widawsky@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alison Schofield <alison.schofield@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Ira Weiny <ira.weiny@intel.com>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-cxl@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 3:05 PM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> Reduce maintenance burden of DVSEC query implementation by using the
> centralized PCI core implementation.
>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  drivers/misc/ocxl/config.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index a68738f38252..e401a51596b9 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -33,18 +33,7 @@
>
>  static int find_dvsec(struct pci_dev *dev, int dvsec_id)
>  {
> -       int vsec = 0;
> -       u16 vendor, id;
> -
> -       while ((vsec = pci_find_next_ext_capability(dev, vsec,
> -                                                   OCXL_EXT_CAP_ID_DVSEC))) {
> -               pci_read_config_word(dev, vsec + OCXL_DVSEC_VENDOR_OFFSET,
> -                               &vendor);
> -               pci_read_config_word(dev, vsec + OCXL_DVSEC_ID_OFFSET, &id);
> -               if (vendor == PCI_VENDOR_ID_IBM && id == dvsec_id)
> -                       return vsec;
> -       }
> -       return 0;
> +       return pci_find_dvsec_capability(dev, PCI_VENDOR_ID_IBM, dvsec_id);
>  }

What about:

arch/powerpc/platforms/powernv/ocxl.c::find_dvsec_from_pos()

...?  With that converted the redundant definitions below:

OCXL_EXT_CAP_ID_DVSEC
OCXL_DVSEC_VENDOR_OFFSET
OCXL_DVSEC_ID_OFFSET

...can be cleaned up in favor of the core definitions.
