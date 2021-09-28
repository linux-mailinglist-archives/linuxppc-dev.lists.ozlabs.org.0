Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF7E41B239
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 16:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJhw21dvsz2ywf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 00:38:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=pK4/7krj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=pK4/7krj; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJhvK0tdPz2yNM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 00:38:14 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id a3so30216538oid.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGm4HTeA31BZubMpoPdBi1gqAR87KKhwYyhwPLV50Xc=;
 b=pK4/7krjjquE59EU+0TI247YRWaA6knQJNe4F7rLad94asfYDS9Uoz2tbX98GYhPvK
 4qH6PzdbEwaexcsUPjwLGHFkfUivnlagajA0L3jaXcyGHOVmUkdCt/OMDS8/pVfvjUEq
 qIOFT86riEF0gVSfOfwHqrl71KaW9U4x3XYSF90IdCWiEWbR5Qga4P3T6wpLXCGeGSpT
 gEZO1o/2pvFqmBwbUfoiiKe8QYTYaFB0B8LMwrMQYNl7caAJ0ot2IGU16QGu6EUdiqar
 iDSzMgl7BDZ864Tl0LnOVNFZbOhxe83+7tuSJRyF3/x1ght5n6tgcx5SKmS7a1CEm5hd
 KV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGm4HTeA31BZubMpoPdBi1gqAR87KKhwYyhwPLV50Xc=;
 b=L5zI3tgbUhWpKJCde03i/zlj3NV58LOOhAuVskD6IRWVmf1b7GuaKh6onAzvN/aCGx
 YNLeQ7168+AfMiu3nVkonWTva9p6nQJBgAktPSoTauHqECwbJ+56D8+N/tNyq7ayySo3
 IV2allyGrRQpW+j4uTGj/BolE17pccY+4zIzYJ6G8jO8Z3v2kbUp0FEXq1H0ocnUfgoU
 uvumQy2xLny2xsKUghaRo/WXSXqeyYVvQURj4yZMVW5WgRZfZzOZtNwj6MysN8Cb0gZe
 jO9TBzl+Bkfs8eI+SL9kqoDY1/iP6ypofg76/QKHGRXZbRkIPtvPOrKZTNwI8YteBkdK
 Dr1A==
X-Gm-Message-State: AOAM533NkWg7+S/DoQCmk55Abmbb4cw2nRHUCF9oPVsAtj8rQf7J042h
 7+qBEjhb+Ke5k5fsmSNtBN+kJRIDqWUPmEAV2TFzcQ==
X-Google-Smtp-Source: ABdhPJzUc6fntGAtZikZSDIg6zrObw8kPGmDK5a9dwNK3dpklk7JeTD6NbitO+0iq0qRTr+Yc8Y0xKIRlG1DBZB16kY=
X-Received: by 2002:a05:6808:14d3:: with SMTP id
 f19mr3842224oiw.34.1632839890941; 
 Tue, 28 Sep 2021 07:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-3-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-3-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 28 Sep 2021 07:37:58 -0700
Message-ID: <CAPcyv4gyLKpOh4Scbbq8O8_5HByAymigrybek4F_3_+=3cQ9LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] cxl/pci: Remove dev_dbg for unknown register blocks
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Linux PCI <linux-pci@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-cxl@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 23, 2021 at 10:27 AM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> While interesting to driver developers, the dev_dbg message doesn't do
> much except clutter up logs. This information should be attainable
> through sysfs, and someday lspci like utilities. This change
> additionally helps reduce the LOC in a subsequent patch to refactor some
> of cxl_pci register mapping.

Looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
