Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7A4D9E32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 15:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHxLV0mPpz30Ld
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 01:56:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=WDkdh6/u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=WDkdh6/u; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHxKp1V9Nz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 01:55:35 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id s11so20063319pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 07:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IT33os/gyb9Nj6BK4xBMhU9JHD8wbptBn+Fc9O72IfI=;
 b=WDkdh6/uuZbR03IvsRgdosgxWLPfMuOGlI9Vd0GA+e9SR6lM0095MrEXhQ2dNddQH7
 wXeWCs4KYAhbPFE6aXXfzwJSq9fCy8f1Um98oYu1ESDfy+d67egbllH7+1DX7I1COYjU
 nj54/h23VZRdwYMHUuRHAp717T3Oa5opsdJibfWK92s1djCvjgGGNcS/3pkFxl33y+mu
 FuYOUTlrAz1jG+ciIp7Lq7NI7w9mY8wyD3wUcARcN0xZVP4pQ/++7Njq78Q0drhUi+87
 2JUJx9l5cqtaT5fOcqojWrkpiyTUBwvso0Ww3/3l6ZVhtT2YnMZdOfOOD4DGaaTcUsbn
 Qw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IT33os/gyb9Nj6BK4xBMhU9JHD8wbptBn+Fc9O72IfI=;
 b=Ot/EBxH/wN1yd26o/HJGQthUfeANHA/akW/R90Xo8C9T7SC1+HlZYPoyrAedjyF/j2
 qOptDnNQlflvImzf0vFMyBt7bjrhWpAjg20BqmKWWOwbwU1ro3wQiEnK6lxrT9pnfPbd
 qpe6jxLg0mtmwmWebQD4F+SFS9+raWb+vzWjSzT4e2GkMZ+gZC/0ebXNSCZXpBpuKpuJ
 /ZP7AcdqIMMZfg//nyCSMDnr/kARdTXsWnXDOq7IMwyAJ5/IK+QoOMWPlH8oIgYgSc75
 fqulNQRDdJE4WMlPNmxuRKnC6FiNH8mDCk2wRa8S4YF8aOQgz/IQMGNkRwmNZL6ag6VH
 pPEg==
X-Gm-Message-State: AOAM531gsLWys5yZpwJjZfeZ2BUwDAyyh7Bwa3i3yZyCieVZUoAb7LlD
 71InrqCyAOJbl8rVehaWdNHR7dANR9jWo7cy/Lqyjw==
X-Google-Smtp-Source: ABdhPJzsFumlcq15TCtF1YTtFB4Y4vrUXRcgHz7PWWvEXTL+3AOPgjaRLecQdnP2aC/H+oHbQaXXeN4ZePk9MLzQ3pY=
X-Received: by 2002:a05:6a02:283:b0:342:703e:1434 with SMTP id
 bk3-20020a056a02028300b00342703e1434mr24341197pgb.74.1647356131234; Tue, 15
 Mar 2022 07:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220315191538.323eefbb@canb.auug.org.au>
 <874k3z4guj.fsf@mpe.ellerman.id.au>
In-Reply-To: <874k3z4guj.fsf@mpe.ellerman.id.au>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 15 Mar 2022 07:55:20 -0700
Message-ID: <CAPcyv4hAGXWD0OS_yB3uc-fk7ami65q1zB4BuxqkhWggn1cNEQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the powerpc tree
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 15, 2022 at 4:21 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the nvdimm tree got a conflict in:
> >
> >   arch/powerpc/platforms/pseries/papr_scm.c
> >
> > between commit:
> >
> >   bbbca72352bb ("powerpc/papr_scm: Implement initial support for injecting smart errors")
> >
> > from the powerpc tree and commit:
> >
> >   4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
> >
> > from the nvdimm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>
> Thanks, resolution looks obviously correct.
>
> Dan, this seems benign to me, I don't think any further action is
> required other than mentioning it to Linus.

Yes, it looks ok to me.
