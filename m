Return-Path: <linuxppc-dev+bounces-10617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A7CB1A812
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwjCP03hyz3bsy;
	Tue,  5 Aug 2025 02:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754326048;
	cv=none; b=G7LH4lG7v8W9pcBad1vBep/X4fHs1WfokE/448h4PFjOdBUzXZ+FxPd5c3ov3xiA7PeQzENWHzdTAW300t/IDrF6s3TiA0XFo7oZEqTAaJ/uIxJyhObVmyEsTdSminpIrdNYHu6GzA5ZdTw5ahsAtOhupbXhHD6MXk88NN6khiJZSCc/ayUDonONwrJ5ioZQFUEQlmCOGb2EPBH7trKXIT39e8QWwk5WZbDuba9CfjPc5RzCwiNgsvmtNd0QVR8w2Y3ejkWtUcEuKbSm8bxL9Q2R689bq9jaEDVNZWDxLp8FLzrh2vdbinLSvXJOEk5AJoYgsXVmb4tff2JWJA0dvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754326048; c=relaxed/relaxed;
	bh=+Mxo2ut3zRoMEZ0uIbzFNClsKHal7Spr1Oet4n2Jkkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqBif+WEHB0bi11dPEuCc0o83ruWpBStW7ww+QcPBatbSi/Hc9mILoz3m2Ys9ZqSr6VbtyJKWr4oEOm51fYn6Garn/NfQhhOTfx03WL+SV8MHzdgs8+nsVtaEc/8OZkZENnpKZRClZ+6wFxvFQ4vWkDMH2hSRjijjWukJzSWTwxLfgEWfrXAy2OejVmBwpWJEO7BPTk7xEpua0jrqePhYxW1JT0hgMrJJX+XiEKIWVP73Swjx/h2PcHR9+4MInmkuZerxGJKm81EzOeZ9uIPmkJHroK8FkYp5Vs5Rp6iwd0q77ZHbT80xt8nJ+liD/5JszRSA+Vfx3vJg9oLgRdepg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwjCN01NFz3bnq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:47:27 +1000 (AEST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af968aa2de4so201955766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 09:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754326045; x=1754930845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Mxo2ut3zRoMEZ0uIbzFNClsKHal7Spr1Oet4n2Jkkg=;
        b=hL9e0L7gK6xu10pLlEjK+5yZ6gPBwwHp+2BupljUH6ctRsUA0TsUaSyjb3QbKEDzpM
         DZpdgWs9ytP6rFNwjsTYraOVoopmcLOgB8wysV0WgTsd3biYb8wVsq36n1v+svKo1ObR
         jBC0P0R8UpiPiNB6RvgqUfjtHto+xCFSEBYMr4+sLB/vZte7HOry4vc23HuXIWLEa3Re
         P3WvOwaZVAP2vInNSfOQGzWewsIMZuCxblHfLKC0/T9b9npg6Lz3fK3Sai3YeFlWyxQq
         yJjFl8osFqBi5a2ed+AxDz/uZWMFZZH8mRBTJDiNad9sal06uJihrzeNPZQfPjCu7SW+
         4MyA==
X-Forwarded-Encrypted: i=1; AJvYcCUkadbaSMzrfsx1CkcAgNp56qvgX3gO/0lg/XoQBSLHtwxapqT/CLjQjSMtGE7HzJCEJQ6oSgEFDXrPd6Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWYUncFprTHKnUUVdMN7+i5k5Jt0CzKZhWbNwSCmlxJFp7stMD
	QcwfVDoZP65iBRqGzqTnFttDEh+qByDEkagSDr/Udyhxg6S15sU76Sh0
X-Gm-Gg: ASbGncvuaF9ZcJQWZ8wYze4j2JQlDLIMTCUDgVKvqgniAvhZT1PsjCGYQSr8itNh6oA
	PsGrM/ONy8CkDse7+USSebZvHdmuw4uY2PrDkiPSG86lJB6/R8oIQQGKUeh5Jh9/bnE2703E+Rj
	0xijMQS4yvtTkNIqQ8HXcf6GmAla8aFSPOb9kdgwITuvj7OtohME/LSkjj2dwkkduK1DemBQoWq
	wYK2RFgmqNv11R5c1ZE/giMQIuaK503g6IGQ8gxNsjZAwl9OQuVMnC6KOXvAvj1YQCIFElm8UKP
	llXo7DBv59CIlCO+Ghe9hULRJ27e/uM+H2EtEKddqSvqjUSJOdFbS9EctR0WazdRqwgykTJ/ym4
	qdeAZ453ULrxtxA8ot9BJCyf2
X-Google-Smtp-Source: AGHT+IE7J7XFqe2CWLwCuaGh0pIpjtaB3ZsoUi1fPUXC1a9sKKnxkU+tAZa8TjMkc7Xp0J+XSrRIDA==
X-Received: by 2002:a17:907:948c:b0:ae6:abe9:4daa with SMTP id a640c23a62f3a-af940079146mr1138489066b.27.1754326044549;
        Mon, 04 Aug 2025 09:47:24 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0753f9sm753604866b.20.2025.08.04.09.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 09:47:24 -0700 (PDT)
Date: Mon, 4 Aug 2025 09:47:21 -0700
From: Breno Leitao <leitao@debian.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jon Pan-Doh <pandoh@google.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
Message-ID: <cv67hkaimtzsok7ryrzup3ql7unsizw2vix5nanx252pqblifv@42d6eibemsvx>
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
 <9cd9f4cf-72ab-40f1-9ead-3e6807b4d474@linux.intel.com>
 <3kpkazpe4j4pws7rean5kelwmpfp5ij62psvdzvimcr37do47a@y2pvypskynno>
 <48e24c23-67d4-4d09-a5f5-2a458a47e2e2@linux.intel.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48e24c23-67d4-4d09-a5f5-2a458a47e2e2@linux.intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Sathyanarayanan

On Mon, Aug 04, 2025 at 09:11:27AM -0700, Sathyanarayanan Kuppuswamy wrote:
> 
> On 8/4/25 8:35 AM, Breno Leitao wrote:
> > Hello Sathyanarayanan,
> > 
> > On Mon, Aug 04, 2025 at 06:50:30AM -0700, Sathyanarayanan Kuppuswamy wrote:
> > > On 8/4/25 2:17 AM, Breno Leitao wrote:
> > > > Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> > > > when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> > > > calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> > > > does not rate limit, given this is fatal.
> > > Why not add it to pci_print_aer() ?
> > > 
> > > > This prevents a kernel crash triggered by dereferencing a NULL pointer
> > > > in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> > > > AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> > > > which already performs this NULL check.
> > > Is this happening during the kernel boot ? What is the frequency and steps
> > > to reproduce? I am curious about why pci_print_aer() is called for a PCI device
> > > without aer_info. Not aer_info means, that particular device is already released
> > > or in the process of release (pci_release_dev()). Is this triggered by using a stale
> > > pci_dev pointer?
> > I've reported some of these investigations in here:
> > 
> > https://lore.kernel.org/all/buduna6darbvwfg3aogl5kimyxkggu3n4romnmq6sozut6axeu@clnx7sfsy457/
> 
> It has some details. But you did not mention details like your environment, steps to
> reproduce and how often you see it. I just want to understand in what scenario
> pci_print_aer() is triggered, when releasing the device. I am wondering whether we
> are missing proper locking some where.

Oh, unfortunately I don't have these details.

I have a bunch of machine in "prod" running 6.16, and they crash from
time to time, and then I have the crashdumps.

I can get anything that crashdump provices, but, I don't have
a reproducer or the exacty steps that are triggering it.

If I can get this information from a crashdump, I am more than happy to
investigate. Can we get these information from crashdump?

Thanks,
--breno

