Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0B41B540
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 19:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJmrq6mc9z305T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 03:36:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wZ2qK0vD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=wZ2qK0vD; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJmr85lCzz2yNM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:35:51 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 u1-20020a17090ae00100b0019ec31d3ba2so2246501pjy.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4rpZbh5fY0GJmvqTpqKPOJUU3/CkuLxZ3x2vaW47gs=;
 b=wZ2qK0vDwa/x+WmO54A8bVqDnaE4MxcyOEaPNfghMs0xFBaF5wolp8j+kq8NVd53dl
 rsImtXgdg957L8wghBAufVSqgLyC4EmLedX89tGCu9hdbwa/j0bK+igN5QxEz+2sSMn4
 Jkpzph4lS6pupyWbeuUVoT7QYa/faQ1K5gWMxS69D0LVU584l+LYqEdHM36t5UUJP8KZ
 Ox8vtfVgQGLnLqDI7aAS7eftEkVJGtu441BAiHEGfxU6S8AyhzXUAUXd3857Wfq2hmsT
 U/DpbWTh0lWZxkH3nJrhEHTL0R210cPEJQldelq0QNJ765EUoU+wh6cTG8Wqc7Jl6mzu
 QXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4rpZbh5fY0GJmvqTpqKPOJUU3/CkuLxZ3x2vaW47gs=;
 b=yz+QAauZM7h2fvVaDnkj51XZmDdY9K+OOFU8utrBThHZGv+6Wy+cS+vCyZbIjX5qMd
 G2psb8CbfQz2X4e3xeIyx67CSwPoVb1+S2wgRWu/Z62wkWTfwtfG8R+utUki/XRszEfp
 rVWdybi9icplF33Qq/4X2moMhZfKCenaN/MN8YUPveJOpbZhHCnrbAUYvAo4QL53p1Oi
 kPBHJuiyme69DPpKCa4ed7pCOqRRNFl6xPVZUBb3uPFOrp4ylXki1o9BRucHaPWeitsR
 tqS3SSxEV0vmvtsQhQkHz9uzMxzdCdol8dJTVBEjj9mPxdArC63zIuH+NnbDhW8sbSsS
 7K6A==
X-Gm-Message-State: AOAM5339rQl7uz4ffXXMWnABLAmRCzApSg73PdG8Coh7vuoTIWxum5iL
 nHBKkXD1cz4Pk8pXrmp4GjFdxXF3OpVv44ilEIcCUg==
X-Google-Smtp-Source: ABdhPJw3YufFCASrMQKrr5qR62jfqEobEWU5JH/XKYq1dn6X8ous0KD9EnMyS9mGmOC2Zwa4E1WW3YScKPZdcYfFVq8=
X-Received: by 2002:a17:90a:d686:: with SMTP id x6mr1302865pju.8.1632850547865; 
 Tue, 28 Sep 2021 10:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-5-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-5-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 28 Sep 2021 10:35:34 -0700
Message-ID: <CAPcyv4i7Dytarp3Hxi_ECtCU+Ve985dNCh07a8wJX0sTgCnR0Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cxl/pci: Refactor cxl_pci_setup_regs
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
> In preparation for moving parts of register mapping to cxl_core, the
> cxl_pci driver is refactored to utilize a new helper to find register
> blocks by type.
>
> cxl_pci scanned through all register blocks and mapping the ones that
> the driver will use. This logic is inverted so that the driver
> specifically requests the register blocks from a new helper. Under the
> hood, the same implementation of scanning through all register locator
> DVSEC entries exists.
>
> There are 2 behavioral changes (#2 is arguable):
> 1. A dev_err is introduced if cxl_map_regs fails.
> 2. The previous logic would try to map component registers and device
>    registers multiple times if there were present and keep the mapping
>    of the last one found (furthest offset in the register locator).
>    While this is disallowed in the spec, CXL 2.0 8.1.9: "Each register
>    block identifier shall only occur once in the Register Locator DVSEC
>    structure" it was how the driver would respond to the spec violation.
>    The new logic will take the first found register block by type and
>    move on.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
>
> ---
> Changes since v1:

No changes? Luckily git am strips this section...

Overall I think this refactor can be broken down further for
readability and cleanup the long standing problem that the driver maps
component registers for no reason. The main contributing factor to
readability is that cxl_setup_pci_regs() still exists after the
refactor, which also contributes to the component register problem. If
the register mapping is up leveled to the caller of
cxl_setup_pci_regs() (and drops mapping component registers) then a
follow-on patch to rename cxl_setup_pci_regs to find_register_block
becomes easier to read. Moving the cxl_register_map array out of
cxl_setup_pci_regs() also makes a later patch to pass component
register enumeration details to the endpoint-port that much cleaner.
