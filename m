Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1564825
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:20:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLtb3H1vzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:20:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="AwdPd/ng"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLnh1KHrzDqVC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:15:52 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id d15so1987446qkl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vODFuMSbeG4w9Dj8p2oXEkAy/A03DVwyuAKVY4sFSRA=;
 b=AwdPd/ngT3mJRYvTsNi7+k6Pexs7qADcyr631JXNtQYsxsI+pH7+y4Ce9rum+RXvxW
 m6QBM9fvhZyOBfFcND8pcYtyZWgTB4xQtqhO9xec9FnEJqGhT5MTG3e9VhN/LHD9dgZa
 f6KOC1WXJurqXAAjkgCghV2QgM6A9EVmh5WxWeFLyGZ145JlBsCAs1BNm9jIM7t9z+Hc
 EKiq9t1c2J3X+T5XD78LORMaSqOdjhRrOwldzb/ODveWc7eQ/bjHUQA8gV5DDMl8dAJ8
 rbTcSw4HlbgcmSJKmRzKBIRGpIR9wdnJ3ZyQy1J/UbNA1XsBCR8R5xEtifXe51rYR1ZI
 Q9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vODFuMSbeG4w9Dj8p2oXEkAy/A03DVwyuAKVY4sFSRA=;
 b=jlkLRDUkUKp9sLv2iFL0iqYwV4Oc7qZIphHI4CKwSfNAKtuPaUvHr5iJqLi7KV0uQW
 X+hluS5F5jTAMQaVUbVTxPcAGdcc6S3ZtaF671ItbdkJSETYCdWvRSCecWieH0EWj4JQ
 cHorXgWcl1/UNOf4HdQn72xdhDJAWoyn0blrhzcHDpu57SITITSGWCFfncqIMvHfe/+S
 I0sQavDXaVXr+hswJmaIEwNnk0kFxl0pgtIYs2KB3ySCFGCmgOqXRB+gjoMBFr3KfR+v
 s2rsfhK7cy7il2oSFU+1x+d/IAMf5hx/LItyq6+eIIHMVo3Qhm7SzvRs38lYolXMD9rh
 lNYQ==
X-Gm-Message-State: APjAAAVlmBdAqtKSZYW0ofn2HKJFAHXTSqkyovuP5ii+x44Bk2vKmqYi
 /fY/AFsW1ls23q1ow4kmYztaQQ==
X-Google-Smtp-Source: APXvYqwXdpeAq5FslPtKDZcIHkELBHHKwO4EIuzyaxhuC4csZ6L2yQ89iBXj5IXMg03W1UYI3SVt8w==
X-Received: by 2002:a05:620a:1456:: with SMTP id
 i22mr23125794qkl.170.1562768149112; 
 Wed, 10 Jul 2019 07:15:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id i27sm1079838qkk.58.2019.07.10.07.15.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jul 2019 07:15:48 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hlDNr-0001Pb-Qi; Wed, 10 Jul 2019 11:15:47 -0300
Date: Wed, 10 Jul 2019 11:15:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: janani <janani@linux.ibm.com>
Subject: Re: [PATCH v5 7/7] KVM: PPC: Ultravisor: Add PPC_UV config option
Message-ID: <20190710141547.GB4051@ziepe.ca>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-8-bharata@linux.ibm.com>
 <6759c8a79b2962d07ed99f2b1cd05637@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6759c8a79b2962d07ed99f2b1cd05637@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Linuxppc-dev <linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
 linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org, jglisse@redhat.com,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2019 at 08:24:56AM -0500, janani wrote:
> On 2019-07-09 05:25, Bharata B Rao wrote:
> > From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> > 
> > CONFIG_PPC_UV adds support for ultravisor.
> > 
> > Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> > [ Update config help and commit message ]
> > Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>  Reviewed-by: Janani Janakiraman <janani@linux.ibm.com>
> >  arch/powerpc/Kconfig | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index f0e5b38d52e8..20c6c213d2be 100644
> > +++ b/arch/powerpc/Kconfig
> > @@ -440,6 +440,26 @@ config PPC_TRANSACTIONAL_MEM
> >           Support user-mode Transactional Memory on POWERPC.
> > 
> > +config PPC_UV
> > +	bool "Ultravisor support"
> > +	depends on KVM_BOOK3S_HV_POSSIBLE
> > +	select HMM_MIRROR
> > +	select HMM
> > +	select ZONE_DEVICE

These configs have also been changed lately, I didn't see any calls to
hmm_mirror in this patchset, so most likely the two HMM selects should
be dropped and all you'll need is ZONE_DEVICE..

Jason
