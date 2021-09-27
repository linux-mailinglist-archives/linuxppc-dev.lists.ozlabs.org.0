Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F167341A3BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 01:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJJPT6fF9z2yNq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 09:14:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=y3IML/Ii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=y3IML/Ii; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJJNf4zVfz2yfb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 09:13:52 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id k24so19245068pgh.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 16:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4MzJ0yx9cD5fkatxhkgcIgfFDenItN2Wh8q8r9GPSA=;
 b=y3IML/IiRF9nk6cBsuR66v5EtYFXcqv9+kamXCWPCMEmblkdaeE1LDv5amUzTxiTzH
 smbfxg0LwR2V218iRSPpiFuCgmVRLUSkj7pYqhqmgQnV5vv2TqB24J5ubT28yxUUYXTo
 D0zbXxwlcZAJWgl4utsPM0PlopLNEmdM3vvLKn57U+H86myKPhwnJQq7IG/s2DwoyAAJ
 nYdarsvxXFoR6m5U8Ax9XOiRnxhWpSyPG8W9Gzhas3B0QBaG653TjG/ZCDCl3ABXKDFA
 NhSdzNY1WenPjh42aOdKY/IDxtuxgqRAmxJI5ZgWIONXlzwMUE/HGOxi3qv7aXY9d0cU
 8TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4MzJ0yx9cD5fkatxhkgcIgfFDenItN2Wh8q8r9GPSA=;
 b=ydgJtGNy3dCf7UcTyIBlcEvH8/Vtpsw7QBjlYo7CQxLeu/uMvEKWJv+m3BjeH16cnV
 RxUl0ZLG4NCaHqHnSuywLuCsUNt3Qa22GD8w+AJccJ6vS9movDj3V/RfFsAttfAeVkMw
 0pHaNL+PpTpfGY3iMbD3FEXeOk1zfbVQEFIhsrYZ9IwUBF5Evzx+WciFfyrLKwrn9LLR
 tMwLReH4ES96kMgDx9/VLWgGIxgoceb4G8ybr2bSD3XMHYYLM2mY0leXgL2U4EYtBRiq
 x5YXyS8dm8QFZGp76LoYTOX15XLZh8eJRKEK45Xh7QGGMIRZANs71nnX6WqsLW/+DpBs
 OZag==
X-Gm-Message-State: AOAM532lik/EYbpQT2bDhk0SVmbLsfrAmsbgjkG0nbEwsNC17Kl1pLIE
 tsv3Yijcb1kATK6XNc+gVfVXxCfhAOJ5RIlknTsjLQ==
X-Google-Smtp-Source: ABdhPJzlhMrLY74o1cFWM7LDOyTRznwGcz5LuxyrnypmeeMmsbLgr6YqtHQ2yRKjvE547QjRsLHUH/2m9VYlflG4fcU=
X-Received: by 2002:a62:7f87:0:b0:444:b077:51ef with SMTP id
 a129-20020a627f87000000b00444b07751efmr2120157pfd.61.1632784429227; Mon, 27
 Sep 2021 16:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-2-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-2-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 27 Sep 2021 16:13:41 -0700
Message-ID: <CAPcyv4gXiW7ap3dULCwcWLy1qkGOrgdJTBonfw5V7h6ZOQ-+AQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] cxl: Convert "RBI" to enum
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

Please spell out "register block indicator" in the subject so that the
shortlog remains somewhat readable.

On Thu, Sep 23, 2021 at 10:27 AM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> In preparation for passing around the Register Block Indicator (RBI) as
> a parameter, it is desirable to convert the type to an enum so that the
> interface can use a well defined type checked parameter.

C wouldn't type check this unless it failed an integer conversion,
right? It would need to be a struct to get useful type checking.

I don't mind this for the self documenting properties it has for the
functions that will take this as a parameter, but maybe clarify what
you mean by type checked parameter?

>
> As a result of this change, should future versions of the spec add
> sparsely defined identifiers, it could become a problem if checking for
> invalid identifiers since the code currently checks for the max
> identifier. This is not an issue with current spec, and the algorithm to
> obtain the register blocks will change before those possible additions
> are made.

In general let's not spend changelog space trying to guess what future
specs may or may not do. I.e. I think this text can be dropped,
especially because enums can support sparse number spaces.
