Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D105E83DD43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 16:17:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgKWnD6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM1Xb5Jpyz3cXS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 02:17:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YdgKWnD6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM1Wn1QmQz30Dg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 02:17:07 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so293188b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 07:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706282223; x=1706887023; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycK1Stg6RqUITxTiNF6zYf2SsEC1R2ya33fUNr0wo3M=;
        b=YdgKWnD6mzYXpBgECyp9yMDoZuPn23K5B2wvFs8BZ8wWxmAMPrMEB+SpSON17TOaoL
         FKZzHHx/zLhcNlw6W+bRfs7S0sXXsWLsFpne9/ugZ9bYZd1Q2eqYPHUSXXF5F2hz3MOH
         3jzTaVjNNb7/vHO+5+jUJv364iDwkyGTHsHnONx88OFRJ6SIA/cJmOXkqqRLNn36j3Ko
         0XwVAeT9QNc7ODvduHUD06akOmdBe5j8GyojQw13BQsFyk13GK+FFQ3bfjBQL3qD6a2E
         KV02a2o28mDmnGj676+g0pjkVIMx6VW6UY0Fa/si+BJzHLmdoMOgX2bBANVA/l4Co8L9
         YaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706282223; x=1706887023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycK1Stg6RqUITxTiNF6zYf2SsEC1R2ya33fUNr0wo3M=;
        b=iN6+WvDE0dvJCGgm1Uq+meZKJ3iNFYTthtY/xovlSOpMoJ0jLASJLIQpWrGKFzFQ/P
         NKZOSkTnLG5ojECiKpDygE1LIPl7fZHFQduFVSGILGZGgYOCp93mHUg7r9lcnaadkkOO
         g8Rl5HNr2p7wHhWVUW9vYqyGj7kVLKClc6lPQgGAAAJ4DLXzX6b/1UXkOrNCc6V8SNnI
         /5jNWLikoRkuWjxy/ZVwTFD9bO0S+wH/3nS8BtaBYIxNEgw5WlbRjedKNIYo5xZ+X7rP
         u41SSvEE+QYrBNxLvPpnRLcDc50FLMcLgvkV9LP+e0OCK9kcjdjG37DZrDQpMQ0x9apv
         IdqA==
X-Gm-Message-State: AOJu0Yz9aNiQku5BPLYLdjZrrvdWaxdOi1OXW/k+V71FPtBMLgmiSEeQ
	MRFSoXLNDHVLQ7m5ACa14fW1qBsAGW/qAl87N38/hYBT+uB0NM8PLZJGdfaIUtg=
X-Google-Smtp-Source: AGHT+IFrt9nryZjWKK5XB8rdZZQ0ZLiVll/0WhFtuhH2eLFjwwzfbOmZXs5b/TpVTrjEAEXhJyZ8jA==
X-Received: by 2002:a05:6870:b1c4:b0:210:e14a:7a9c with SMTP id x4-20020a056870b1c400b00210e14a7a9cmr1359195oak.58.1706282222837;
        Fri, 26 Jan 2024 07:17:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id ns26-20020a056870ac9a00b00210cc6cc9eesm385454oab.33.2024.01.26.07.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 07:17:02 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rTNwz-009S0o-4e;
	Fri, 26 Jan 2024 11:17:01 -0400
Date: Fri, 26 Jan 2024 11:17:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc: iommu: Bring back table group
 release_ownership() call
Message-ID: <20240126151701.GZ50608@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <20240125155017.GW50608@ziepe.ca>
 <b825dd04-3d32-4fbd-91e3-523ddf96fc7a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b825dd04-3d32-4fbd-91e3-523ddf96fc7a@linux.ibm.com>
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 26, 2024 at 08:43:12PM +0530, Shivaprasad G Bhat wrote:
> > Also, is there any chance someone can work on actually fixing this to
> > be a proper iommu driver? I think that will become important for power
> > to use the common dma_iommu code in the next year...
> We are looking into it.

Okay, let me know, I can possibly help make parts of this happen

power is the last still-current architecture to be outside the modern
IOMMU and DMA API design and I'm going to start proposing things that
will not be efficient on power because of this.

I think a basic iommu driver using the dma API would not be so hard.

I don't know what to do about the SPAPR VFIO mess though. :(

Jason
