Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E777464785
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 15:50:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kLD96pTFzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 23:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VrcajUFH"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kL992mSHzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 23:47:40 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id y26so2458617qto.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 06:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7U6Nt7OEfvKxcNWy+tvVorAtvgeJ3jhS1Gu2nX61T9o=;
 b=VrcajUFHnL11D6RL+P9on2xGE4JRl04eDGqwQa5qHE8yXtYmOepQdn7ImaobBudj7h
 BbrC4OOPHj5Qvw25DS/glET43DNZGXzIRQGBpRQUKbEsXspnhXlZ3KGsM7Pp4aC7bYcy
 xDwg42eG7T/GACYBefhfJvB8Acg/r/4AciCDj9FzSGNWN+gTJPVnDtkmPiLQt7KFx4lc
 xLv01uYuGtD+S7G0ERpM+v/8K6p9F4eb7g1kmAVVHkUxI/XZN8xEVEnCzMR1FKB74vmG
 gZV7WpiK/hm4dD2vXlBdZlSLCSy2C12W+pykqbzTB6uX0Io3B56dcV3GvUGjIDbdWAxJ
 3QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7U6Nt7OEfvKxcNWy+tvVorAtvgeJ3jhS1Gu2nX61T9o=;
 b=Lcj2ARBs8mbbfSMIElF3EDbnmwSI5ENpb4OPluEXhxlzQU+0oTNgj7bMLHNXXIYDDs
 JWZ8XsqTkyvdSBWMHMDFkhrYjb0c9Gk4eE9cASrM6GRkZvsZ2YyrRsgHR3I2hxyZAzzs
 RtPMpjr9/fGOlvQislMVgyyxFN6lROM2kAGfvatDMHtO+kaSvPV0IHmswv6yucQaPmLM
 ghU0P2tpZY8JtxNIc/locx6XsrGH7mf6HOpF6ZtPdrLnMoXKmh37DSXlw/PCbKZYUy/L
 heObKgd5y9h2C6NuUNV/HMqHRXFFgSsNLiaUAU8KBgpTf/GW/kDTwWXzjL80lj7Q3Baf
 4pSA==
X-Gm-Message-State: APjAAAVfXrz+N2A/O5I5u92DYthyK9YKV9cwdL9l8XvR0PZei9wlG7oO
 GfSR+knu/CaGufj7rp2zGujwYw==
X-Google-Smtp-Source: APXvYqygCMHzTUHQC/+aI1gVFaxUXYVDQQtJfFKzO9aN4lth9Iok18xe2Gb/ZZLBzuS0ZLO+5Jk8kQ==
X-Received: by 2002:a0c:8b49:: with SMTP id d9mr24649143qvc.178.1562766456016; 
 Wed, 10 Jul 2019 06:47:36 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o18sm1314520qtb.53.2019.07.10.06.47.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jul 2019 06:47:35 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hlCwY-00013E-UQ; Wed, 10 Jul 2019 10:47:34 -0300
Date: Wed, 10 Jul 2019 10:47:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: janani <janani@linux.ibm.com>
Subject: Re: [PATCH v5 1/7] kvmppc: HMM backend driver to manage pages of
 secure guest
Message-ID: <20190710134734.GB2873@ziepe.ca>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-2-bharata@linux.ibm.com>
 <29e536f225036d2a93e653c56a961fcb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29e536f225036d2a93e653c56a961fcb@linux.vnet.ibm.com>
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
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 09, 2019 at 01:55:28PM -0500, janani wrote:

> > +int kvmppc_hmm_init(void)
> > +{
> > +	int ret = 0;
> > +	unsigned long size;
> > +
> > +	size = kvmppc_get_secmem_size();
> > +	if (!size) {
> > +		ret = -ENODEV;
> > +		goto out;
> > +	}
> > +
> > +	kvmppc_hmm.device = hmm_device_new(NULL);
> > +	if (IS_ERR(kvmppc_hmm.device)) {
> > +		ret = PTR_ERR(kvmppc_hmm.device);
> > +		goto out;
> > +	}
> > +
> > +	kvmppc_hmm.devmem = hmm_devmem_add(&kvmppc_hmm_devmem_ops,
> > +					   &kvmppc_hmm.device->device, size);
> > +	if (IS_ERR(kvmppc_hmm.devmem)) {
> > +		ret = PTR_ERR(kvmppc_hmm.devmem);
> > +		goto out_device;
> > +	}

This 'hmm_device' API family was recently deleted from hmm:

commit 07ec38917e68f0114b9c8aeeb1c584b5e73e4dd6
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Jun 26 14:27:01 2019 +0200

    mm: remove the struct hmm_device infrastructure
    
    This code is a trivial wrapper around device model helpers, which
    should have been integrated into the driver device model usage from
    the start.  Assuming it actually had users, which it never had since
    the code was added more than 1 1/2 years ago.

This patch should use the driver core directly instead.

Regards,
Jason
