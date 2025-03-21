Return-Path: <linuxppc-dev+bounces-7265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CBA6BC85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 15:06:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK44S60Xqz305D;
	Sat, 22 Mar 2025 01:06:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742565992;
	cv=none; b=dcy6PURs+hEI0w+SeKmDPU6xnOCYnmjk/BX0fSAZuscxlPNyl5cFLo5kJgfbi1pwPTlaw4bOsEnzbOX0dS25Ytba7aU3SLak3qnm+CRg7/fW1U8j2UcQQrarkp+PWCeVVqqqWo/9f7xuig1kHZ52wsBMgTlhP9dcGi7y4tm0bEFrKu7EtmciWc4WHStBblDp0Lx2PM8RyTEXIcu30sFZaQCv5K2heuRgTPAspBi9DOjv6QUWDnS381kbYwNG5TyLxLP7BSUSAVjaNZ58RELdD2MT6OvSIngRGLT2/7qXJmkTliaeiXR9UW8kUKybf+iVa9swkNtIGNaSRVoEVk4fgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742565992; c=relaxed/relaxed;
	bh=PtfqZFqF8iFiel/s4I4nuuc5DqZUNdlFQlj2cWV2Ueg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2V2fl/UP5rSz5Qp85uhhwgy+pVzMrrKtYLhllQeWcx4VGty4esxgnAqi25Y3uB9I746EM1l2NeRicGCYG5tgsSf3jEFL0Oo6gZERIFmmecuCNXUButAa0ItA1Lk/bgmwt80bVVZg8ngE+Aa6CeBslDFJc8gfqC6bm+GBRYK1glg04ngFrdnHC9nJlnWcAyEi6ylsSQnKnq0zOhBiM3pkGQ5jWRKI/PbWK0KjWfYrxzsStj9kGx+TX6mQRCQmLiJj6ncX+l2fLnmW/3HQys4JElQg4+6FYXpOWDeAM9+sSdQ50lcKuDZ0O6T+rLM0nLzc5aALrdPECUcuKq9MrB9nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SKZT2Tqi; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QttLd1xs; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SKZT2Tqi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QttLd1xs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK44R4QWZz2ySN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 01:06:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742565984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtfqZFqF8iFiel/s4I4nuuc5DqZUNdlFQlj2cWV2Ueg=;
	b=SKZT2TqiGog31SHDGSOPh6FoplixFOL/dkNwDdujcHBcGU5FAD6mxcn45cyKrZkzOBuasu
	6j3t4TQIkBG/SH+U/NhJr0mUgMDw5cyVMs+XryHQ0cqjZTJd6RD0PcZeBUxCWBTjMN8jEc
	S3janHRmQwlT1tVcJMytvIPfKOGNgOY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742565985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtfqZFqF8iFiel/s4I4nuuc5DqZUNdlFQlj2cWV2Ueg=;
	b=QttLd1xsCLc9uEjGakyNZOf9Hnm8ceqor6tinnUALoO0R18EHmrTThPaqQstQaHfHq36Q1
	HcI0AR1UL3cEZYhH17IUvMjXv7f/lff7Qq4o7cI+W+Mo0NY/YXbJKgqJqDcL1hDKjHWhjg
	SgdWpm1ViGRiFFXVnUKiBUB4uLmzFgA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-RqmL6-_7PdG6lJcrNbRyoQ-1; Fri, 21 Mar 2025 10:06:23 -0400
X-MC-Unique: RqmL6-_7PdG6lJcrNbRyoQ-1
X-Mimecast-MFC-AGG-ID: RqmL6-_7PdG6lJcrNbRyoQ_1742565982
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3f6aaeb8bfeso397190b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 07:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565982; x=1743170782;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtfqZFqF8iFiel/s4I4nuuc5DqZUNdlFQlj2cWV2Ueg=;
        b=R4XwJObkgNmLJlKsPrK14iDF2mObVwLMBXHBTnKIWPKKIfj3zrjjbrFDr6VMBYNW+n
         GZswNGzBwVH4XQD3wpl3AoG3Hm5YbFFMC5lQiVpEcmHt8QE0aqClS95oYhLofj/1wjVv
         1HnPWKCYWAE7JgPijq/y+ZW2HluE+M6GaP5sQv7zYayhVKpTwCVlX0X8z8AEwwV3lOEI
         35iO7pD2wDTY8ypSddM77nq7AQ0wUSMggWusJP+Q1xefRV3G2S1J/OWLiYw0fggr2+8p
         eVra59r+i1FyJRSr3eJOwHcZIP4G286e4QmfxVPlRatUholgkh517R1RiQ3TY0BdvZFd
         ZEdg==
X-Forwarded-Encrypted: i=1; AJvYcCX+INDXD9nY0Wk19PmXdS3Ta7rkgtuBvKDtYr2dd8PFV6bq4o+d7PyfTJyHfqqhgDIp01qBTv173GSAq0s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxxg4MsHq3qiLuuWS8vGKuAnueujQTMw1eD5iE4Az4jC3+y7BoH
	Yy8yEw+9877pNjWERr5Ms3LTBWZZabQ4D6FqeLJQqZCFDtuK9r2oUoHGb9HLU/bpowhG0di8LMl
	YBz+2UsQ1wuJ4RdlgWLNcDM9iQ08GfQc25rutV66btoI4fL7vyfyu50eh6NL9lUk=
X-Gm-Gg: ASbGncsGB69kJk8bawwgURSzTxEUMfuFDvI5RuTN2y4lTd6QzO2rWSnjgvaIAKNY+e5
	zoYdKiLor4V7YXu+7f2mf18eNaNUxXJJ9eIxmRPejpRrCPfRccTZVWfHQKbx6GMLocQy5oIA074
	2yO6Ebm3nuMjM3lUf1ND0P+zlMbIa3ITxJigyn27yFfLdLhyIxaOQ7PWb8Gll7l+vIEk6w6ceBy
	cSh+h4/E4WIscxB3uN1FVoKa0PmcSrbH3GS6cyCJ3bThmGZ3nu+BRtMI7JSJZQIORH9ZoOdN16v
	MfEvdSv8zHLvf6Ws1/A=
X-Received: by 2002:a05:6808:6807:b0:3fe:b5d3:3f23 with SMTP id 5614622812f47-3febf793391mr842059b6e.5.1742565982322;
        Fri, 21 Mar 2025 07:06:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXrUa2CJtGUuPnUiUVvqG8OIHWW+85+a82cVLjG6j0tZ/F39gii6vY+WagE3AnL6fCZ04BMg==
X-Received: by 2002:a05:6808:6807:b0:3fe:b5d3:3f23 with SMTP id 5614622812f47-3febf793391mr842043b6e.5.1742565981807;
        Fri, 21 Mar 2025 07:06:21 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf7109ddsm335819b6e.26.2025.03.21.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:06:19 -0700 (PDT)
Date: Fri, 21 Mar 2025 08:06:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: jgg@ziepe.ca, kevin.tian@intel.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, yi.l.liu@intel.com, Yunxiang.Li@amd.com,
 pstanner@redhat.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] vfio: pci: Advertise INTx only if LINE is connected
Message-ID: <20250321080613.566cb6bd.alex.williamson@redhat.com>
In-Reply-To: <9131d1be-d68e-48d6-afe3-af8949194b21@linux.ibm.com>
References: <174231895238.2295.12586708771396482526.stgit@linux.ibm.com>
	<20250318115832.04abbea7.alex.williamson@redhat.com>
	<9131d1be-d68e-48d6-afe3-af8949194b21@linux.ibm.com>
Organization: Red Hat
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 68ttlV4ua2z6Zgzh3mGU659QVa-zt4xbTnIVKQXI7-c_1742565982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 20 Mar 2025 23:24:49 +0530
Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:

> On 3/18/25 11:28 PM, Alex Williamson wrote:
> > On Tue, 18 Mar 2025 17:29:21 +0000
> > Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:
> >  
> >> On POWER systems, when the device is behind the io expander,
> >> not all PCI slots would have the PCI_INTERRUPT_LINE connected.
> >> The firmware assigns a valid PCI_INTERRUPT_PIN though. In such
> >> configuration, the irq_info ioctl currently advertizes the
> >> irq count as 1 as the PCI_INTERRUPT_PIN is valid.
> >>
> >> The patch adds the additional check[1] if the irq is assigned
> >> for the PIN which is done iff the LINE is connected.
> >>
> >> [1]: https://lore.kernel.org/qemu-devel/20250131150201.048aa3bf.alex.williamson@redhat.com/
> >>
> >> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> >> Suggested-By: Alex Williamson <alex.williamson@redhat.com>
> >> ---
> >>   drivers/vfio/pci/vfio_pci_core.c |    4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> >> index 586e49efb81b..4ce70f05b4a8 100644
> >> --- a/drivers/vfio/pci/vfio_pci_core.c
> >> +++ b/drivers/vfio/pci/vfio_pci_core.c
> >> @@ -734,6 +734,10 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
> >>   			return 0;
> >>   
> >>   		pci_read_config_byte(vdev->pdev, PCI_INTERRUPT_PIN, &pin);
> >> +#if IS_ENABLED(CONFIG_PPC64)
> >> +		if (!vdev->pdev->irq)
> >> +			pin = 0;
> >> +#endif
> >>   
> >>   		return pin ? 1 : 0;
> >>   	} else if (irq_type == VFIO_PCI_MSI_IRQ_INDEX) {
> >>
> >>  
> > See:
> >
> > https://lore.kernel.org/all/20250311230623.1264283-1-alex.williamson@redhat.com/
> >
> > Do we need to expand that to test !vdev->pdev->irq in
> > vfio_config_init()?  
> 
> Yes. Looks to be the better option. I did try this and it works.
> 
> 
> I see your patch has already got Reviewed-by. Are you planning
> 
> for v2 Or want me to post a separate patch with this new check?

It seems worth noting this as an additional vector for virtualizing the
PIN register since we'd often expect the PIN is already zero if
pdev->irq is zero.  I posted a patch[1], please review/test.  Thanks,

Alex

[1]https://lore.kernel.org/all/20250320194145.2816379-1-alex.williamson@redhat.com/


