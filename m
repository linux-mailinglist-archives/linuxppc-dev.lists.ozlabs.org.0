Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98083383B91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 19:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkRNc2ZyGz3093
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 03:45:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.53; helo=mail-wr1-f53.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkRN93nNnz2xyC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 03:44:39 +1000 (AEST)
Received: by mail-wr1-f53.google.com with SMTP id d11so7307052wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 10:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1xJsrGFsO/kpHa0x/GqMcGe+uNXmw2829mAM4URjK74=;
 b=icelpsGV0n/C9m0WSgBG4IVUEdgDf3WL8GDy8I0JZ0PnM+n/x1WL5BuLurMTfj3q18
 T32eHXWCKFNKathnevrD7J2n5q1JKNMhFmZh2oKKNjCTIeUIwtaGiElraUvF7mAuCk8z
 b+Y8uEGa/wODxrlUwFK1gG+a+RxyBVxKaoXU+cr8ViGwOw5Zjo/4VOlynm9y3YEjNj5x
 7ByAYW3zVGofCzZ5KxzeBNiRVj8le1h+MSGxsltDRFITM0LV+FZp2Gp64KClyIc6kR1W
 Cf/6MWiRvfAaf5cWHvQPFwC/yzLldMw6IO2SVruwLdPQ+Ie2GIu4QtSFGxVAVpezVTZO
 IQUA==
X-Gm-Message-State: AOAM5325Fb6AErc4mPpkCsPYhHrQBQ3QRMaM4qz5/dr2XQm8JZ+qoGcs
 XIjDz/mHkGjXdApgtTe08iI=
X-Google-Smtp-Source: ABdhPJzT2r7sQeAsamGw6i7dzUA0bWMsvliwY5s/1lWt2smvT6jVQa7dTh/i6mIgfsxgYsYXWzprsQ==
X-Received: by 2002:a05:6000:1089:: with SMTP id
 y9mr1006825wrw.121.1621273475302; 
 Mon, 17 May 2021 10:44:35 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id a129sm168731wmh.20.2021.05.17.10.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:44:34 -0700 (PDT)
Date: Mon, 17 May 2021 19:44:33 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v2 01/14] PCI: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Message-ID: <20210517174433.GA278212@rocinante.localdomain>
References: <20210515052434.1413236-1-kw@linux.com>
 <b3be37d4-5d98-474e-05ca-afce4782c359@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3be37d4-5d98-474e-05ca-afce4782c359@deltatee.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 Vidya Sagar <vidyas@nvidia.com>, Joe Perches <joe@perches.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, linuxppc-dev@lists.ozlabs.org,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Logan,

> > The sysfs_emit() and sysfs_emit_at() functions were introduced to make
> > it less ambiguous which function is preferred when writing to the output
> > buffer in a device attribute's "show" callback [1].
> > 
> > Convert the PCI sysfs object "show" functions from sprintf(), snprintf()
> > and scnprintf() to sysfs_emit() and sysfs_emit_at() accordingly, as the
> > latter is aware of the PAGE_SIZE buffer and correctly returns the number
> > of bytes written into the buffer.
> > 
> > No functional change intended.
> > 
> > [1] Documentation/filesystems/sysfs.rst
> > 
> > Related to:
> >   commit ad025f8e46f3 ("PCI/sysfs: Use sysfs_emit() and sysfs_emit_at() in "show" functions")
> 
> I re-reviewed the whole series. It still looks good to me.
> 
> Very nice solution in patch 12 to the new line issue.
> 
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> 
> Thanks,

Thank you!

I will send v3 incorporating the style change as per Joe's suggestion
and carry-over your "Reviewed-by", if you don't mind, as it will be
a trivial change.

Krzysztof
