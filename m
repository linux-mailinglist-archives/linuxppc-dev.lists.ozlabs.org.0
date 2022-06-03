Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BCC53D381
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 00:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFHG83tlCz3c8B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 08:13:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=HV4UoRzW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=mkhalfella@purestorage.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=HV4UoRzW;
	dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFHFb23hzz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 08:13:02 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id 134so720338iou.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 15:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YQaA0ysz+S1FZGYLa7EUyi8nddJMkVXVtwd4BwqcCVE=;
        b=HV4UoRzWQTlgPnhbgwevANk/jO/pR2mdRCjEqrQhcd5tWSRAUreuEBlIgi0N7EUe5A
         l4HXBsnEQLSSf3cI4CB6HWibojnau5wf0TBFvkKNvZAPcAbyAXQ2P8f/k9jT7lqGe+wt
         tVoesIjkL5kxbVbPY9AiNmv4RUob7joWxnksc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQaA0ysz+S1FZGYLa7EUyi8nddJMkVXVtwd4BwqcCVE=;
        b=tBhIkmVKkzHX9I+iQ8C2SqUhpYVKCGuXaplPaLvNkQc+Sb6TGqq2lHE4OM9rTqPWHo
         XWmEE50ZGuXzEWbQOwaN1demvtXqy31LpfVSLkPOxyEwFpeJb5czJrui+Y/1mxeIbiI+
         /fxUYjhLfznjM5tMfMrjnZGqhiOUvpbtiWRNGtH8hv9uh891oazskeO1RUssCDzBam//
         qSIfbgdWFcHmmQjUxeDCR8tAt3Q0U4vBxzTtloIAN8UIxQju06hY4ZUCeSMMhAGR+dto
         DELZaLTyrK//DrDAMcvRUutNFGpzT53VF6YQE8lmNxgfm6ZHSmoaOB5mIFnJ3hl0anpM
         Ua5g==
X-Gm-Message-State: AOAM531V0jqjoH3ZAoFCN/2yyeAie1y0IRTbhu/5hYLq8Qzq3D8omCIy
	idObpYm2sPyfs7B0B0K/Vc+x0A==
X-Google-Smtp-Source: ABdhPJwRZzdUFPObenCqqK8QSOyTpq8ELKioDcBezTTqdyBLuX1Qc4YsdPX8WvzjpdZYUeiXr7NzNw==
X-Received: by 2002:a05:6602:1653:b0:665:6f74:db21 with SMTP id y19-20020a056602165300b006656f74db21mr5723622iow.33.1654294378143;
        Fri, 03 Jun 2022 15:12:58 -0700 (PDT)
Received: from irdv-mkhalfella.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id e10-20020a92a00a000000b002d3ded31668sm2901016ili.41.2022.06.03.15.12.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 15:12:57 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: mkhalfella@purestorage.com
Subject: Re: [PATCH] PCI/AER: Iterate over error counters instead of error
Date: Fri,  3 Jun 2022 22:12:47 +0000
Message-Id: <20220603221247.5118-1-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220510211756.5237-1-mkhalfella@purestorage.com>
References: <20220510211756.5237-1-mkhalfella@purestorage.com>
MIME-Version: 1.0
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, msaggi@purestorage.com, ebadger@purestorage.com, helgaas@kernel.org, stable@vger.kernel.org, bhelgaas@google.com, oohall@gmail.com, rajatja@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Is there any chance for this to land in 5.19?

On 5/10/22 14:17, Mohamed Khalfella wrote:
> > Thanks for catching this; it definitely looks like a real issue!  I
> > guess you're probably seeing junk in the sysfs files?
> 
> That is correct. The initial report was seeing junk when reading sysfs
> files. As descibed, this is happening because we reading data past the
> end of the stats counters array.
> 
> 
> > I think maybe we should populate the currently NULL entries in the
> > string[] arrays and simplify the code here, e.g.,
> > 
> > static const char *aer_correctable_error_string[] = {
> >        "RxErr",                        /* Bit Position 0       */
> >        "dev_cor_errs_bit[1]",
> >	...
> >
> >  if (stats[i])
> >    len += sysfs_emit_at(buf, len, "%s %llu\n", strings_array[i], stats[i]);
> 
> Doing it this way will change the output format. In this case we will show
> stats only if their value is greater than zero. The current code shows all the
> stats those have names (regardless of their value) plus those have non-zero
> values.
> 
> >> @@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
> >>  	struct device *device = &dev->device;
> >>  	struct pci_dev *port = dev->port;
> >>
> >> +	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
> >> +		     AER_MAX_TYPEOF_COR_ERRS);
> >> +	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
> >> +		     AER_MAX_TYPEOF_UNCOR_ERRS);
> >
> > And make these check for "!=" instead of "<".

I am happy to remove these BUILD_BUG_ON() if you think it is a good
idea to do so.

> 
> This will require unnecessarily extending stats arrays to have 32 entries
> in order to match names arrays. If you don't feel strogly about changing
> "<" to "!=", I prefer to keep the code as it is. 
