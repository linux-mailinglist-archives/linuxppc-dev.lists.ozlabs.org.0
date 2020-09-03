Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCAD25B935
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 05:28:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhmVQ3J5PzDr1m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 13:28:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TwfrR7yr; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhmSY33LhzDqxW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 13:26:52 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 5so956308pgl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 20:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lYNxVzL5l70V80L5B0Ue2jMJbnoo4IGKc3sUTTOXxxE=;
 b=TwfrR7yrH/ZmCJKVq785xFnzcAW0rnrJtR2XAGj+ZbDY+vu1Bzp+l97m8nb8JpPUcN
 p8btnPGhknC5ymFX9NQp13zuslf6PXJBBlssl7s9dmeietFQ6hIhcpy/J9PwaJmrWffv
 32jsH4jdqFlLmsW++ObZL5lWUM2zfYC2PwAfo1my2rDxsy/jbBzY7jlHnuJdcWB8guKk
 1EDF7beW1xGiI4Tp/afrAOhNNdifprGE+enYaoD/xIiwiU0zssfWFLNt8BJnod33aGzs
 eDoH3yXto9deLRSw/Ead+1NvLFpo1Bek8s30VDf89NNTBImvQDMk/DFU0/Fp7Yrc9w3V
 Vxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lYNxVzL5l70V80L5B0Ue2jMJbnoo4IGKc3sUTTOXxxE=;
 b=XZLX7LVapZuVjuD7OL5v4V1W0l5pp317+09nZy8T3WqAn33CSCT7H/DIZdYTQlnvIP
 wYqecz2FRGFAw4p4L+mP9DMmH/gf8Rhp8kDt0FiqlqPorx4U2Z+EuTdKKEwOxQQFT+M7
 iC+OT+DXR8fK/Co8MAqTEXzY0pZbVTwLinmapgVf6uh8fACF3ZJRGPW1qPcpVaFX7QE8
 vkzVWdhCWwdT8HlpUby8tOsRf0MbTaDv1ky5f7rpyEks7RPqQ62sawJPwPMKqbtR09KH
 qT0XOG07k9ckXFShooeb4fVfGTWUKJg+H9OLiJ5n79Gloidgpt5JrhS/YQFO1cYmVv+N
 lSWA==
X-Gm-Message-State: AOAM533PZrlKFtcIFI76TpY+j2rLzi1MgQGkPTNyd5cBEuugnszaYLgq
 sOARUF4Wz3TRY0uBv+fecv8=
X-Google-Smtp-Source: ABdhPJyip7LHIa7QrFYS72EGsjmUF2oCbwaBJw2vq8sciVi3qTjTPlQFaDFcEKJyT/c1Yu9ACiqkAw==
X-Received: by 2002:aa7:9625:0:b029:13c:1611:66c5 with SMTP id
 r5-20020aa796250000b029013c161166c5mr98010pfg.16.1599103607264; 
 Wed, 02 Sep 2020 20:26:47 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r33sm740198pgm.75.2020.09.02.20.26.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Sep 2020 20:26:46 -0700 (PDT)
Date: Wed, 2 Sep 2020 20:26:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH 0/2] dma-mapping: update default segment_boundary_mask
Message-ID: <20200903032559.GA4517@Asurada-Nvidia>
References: <20200901221646.26491-1-nicoleotsuka@gmail.com>
 <2c8db0aa-e8b5-e577-b971-1de10ecc6747@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c8db0aa-e8b5-e577-b971-1de10ecc6747@linux.ibm.com>
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
Cc: linux-ia64@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, hch@lst.de,
 sfr@canb.auug.org.au, deller@gmx.de, x86@kernel.org, borntraeger@de.ibm.com,
 mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, ink@jurassic.park.msu.ru,
 tglx@linutronix.de, gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 tony.luck@intel.com, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 02, 2020 at 10:13:12AM +0200, Niklas Schnelle wrote:
> On 9/2/20 12:16 AM, Nicolin Chen wrote:
> > These two patches are to update default segment_boundary_mask.
> > 
> > PATCH-1 fixes overflow issues in callers of dma_get_seg_boundary.
> > Previous version was a series: https://lkml.org/lkml/2020/8/31/1026
> > 
> > Then PATCH-2 sets default segment_boundary_mask to ULONG_MAX.
> > 
> > Nicolin Chen (2):
> >   dma-mapping: introduce dma_get_seg_boundary_nr_pages()
> >   dma-mapping: set default segment_boundary_mask to ULONG_MAX
> 
> I gave both of your patches a quick test ride on a couple of dev mainframes,
> both NVMe, ConnectX and virtio-pci devices all seems to work fine.
> I already commented on Christoph's mail that I like the helper approach,
> so as for s390 you can add my
> 
> Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>
 
Thanks for testing and the ack! 
