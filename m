Return-Path: <linuxppc-dev+bounces-10508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63242B18294
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 15:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btn5F0Dckz2yfL;
	Fri,  1 Aug 2025 23:35:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754055328;
	cv=none; b=P0O9lEAZKv6SME7Df/2c1JoKPNmdvl9AmT3ZjFauJMUMDRJw19B9fnwL3pVe9bGQPf5ZPGxO5KEZY/n49lpBxeFWwtE2ICnP7igp7+Fz6mDHmVRYB2vWlOC6KJ1mc0MBkubicDoH09k0WICmrk9zsUbySsFzl/5cSRKk+mZT/1sDMYiXetqS4C9AJie3Z8GoV9slcEEtzupFGeIar3QMwoSaX+FOG/+sDY3RUtEI/Yozlf+gmKNBENh4RTTr+na2bZbFWIqu9Endcv506kDf9xTSE/xenh5R+ku4YSnEuT7O6IsWrOygIAlfKxBkW9wXUqydN7NMK4vJDAWF5SxvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754055328; c=relaxed/relaxed;
	bh=FkJqOZY9gQx1B/fUNojYy6xv/Z20wG9/a8d364iwDag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLdIXbwNU4HbDNd2BMGWb9POMT7eOc0wvEq0mqwoAHNxsqNRzqfHHZa4pfHZA4pVlIgmTLxtnrMHU7ale8wHxYsXl7TtRNEASVkCd2u3TXVMiPb3SOaH5Nz1BYxIZ2zsswPvYO/UVsXFJcY2afOKJMt4Xg7MJA9B+ZtZ5Ki2BhFTCiVlyLyO2buP2n+RB487A/8O6AiiFN5KF+SpOUsS5seMhf3KKZQzUeHEwZpY6muPfwmtWhsi65LIarVRIhvYKPmQwnSrfPiYNs0zTyMEDIPNl8xn542wG30EzuPNGaRGtFEUUtbY9dF/rWReio4AqmsY/HwoYrqZVMgwv3MN2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.42; helo=mail-ej1-f42.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.42; helo=mail-ej1-f42.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btn5C3m7yz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 23:35:26 +1000 (AEST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae9c2754a00so492084966b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Aug 2025 06:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754055323; x=1754660123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkJqOZY9gQx1B/fUNojYy6xv/Z20wG9/a8d364iwDag=;
        b=HUM2VXwlvqcb/JPRsRm3L3yipzxVXVuO+E3T0QGQJoMOtFTK+qbJKrX4Vp2mKsNYVM
         jSvGPFlptcPm3IJs6p5vriVizLTjmrVaEkLsQUbcX7pfCP67FfYxRTPWGpiFoEpuQARV
         ujRhpR6HKWoSg4/MnAHd2hlPNW8HYG7WOp3KKSEhEk6HbUfnGcl9NJEABRkET/xcOE78
         ka8c1eGIieVeDM9dGI5GENzzEAk2RJxIdAW8MqSm1vkCmINtay/i6hDvp0iwGlu2PL5r
         Ztu2fRjGPCvaWgRyChFQIACMpDeniZMDyr/bKYHaqC2s/0wd3Zg1f1x5yN7FQTHLVMGa
         T91g==
X-Forwarded-Encrypted: i=1; AJvYcCUlm/qOf4+5WkRWuyFKJfUIRPXgjuMGYO6ilAG/dm6Sf0KBXWCxyO8kOORAvglJ0yf7xN64JWVwzrbqpBI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxSS5EwyL+r3S+AG/F2MT6r4tcakAesBpEPO2Tki9dAdbuQRXd9
	/xxnTRnQlszMsnxk8agSOBmYaKUhaNCYj9qq2esnQIF605iasPLz0MmB
X-Gm-Gg: ASbGncvN6YIf4zhihvhPiktm3UhbGh6+w0gMH57XM6xWZ28B+9589LjWjrhJApWvb0D
	OT+XkxxFvYREYSDADX0cnpU0GtUZQ6/aCFo5fJrwDCfKtWT3BWCwJvTMIOwoI5Zi0PNISc5w7XF
	rM6aIsmbBtxdNCJxX2BrF5T/OIW5TPXSLQomRyU4/UdE4x+mfqBULmXP9ZBIRuGjzqvzpJVqQ1G
	UsiKVHhynWjunud2nA4PjwdwdxbACBByWuXa93pjlrsjKIwaJ1PuNGj/8F76+2Yet1K9W2v/hHH
	QBHe0ZMJviThYypGGw2jlTCa+W/rskzJSZaaDDug6614RzTGIgAiatQbIJ8et/ucD6sQ77+mmmm
	JpvM7t8FQPK22d5vogQCGF7Q=
X-Google-Smtp-Source: AGHT+IE6TimUKcL9EkqugmOrusVC7tsv5kIHhX4xmX8/o+AhqXrIgAFgHc7pfMLdutul6lrRmnEiPw==
X-Received: by 2002:a17:906:f595:b0:ae6:f564:18b5 with SMTP id a640c23a62f3a-af8fd728df1mr1397521766b.19.1754055323189;
        Fri, 01 Aug 2025 06:35:23 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c10asm290988466b.116.2025.08.01.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:35:22 -0700 (PDT)
Date: Fri, 1 Aug 2025 06:35:19 -0700
From: Breno Leitao <leitao@debian.org>
To: Bjorn Helgaas <helgaas@kernel.org>, pandoh@google.com
Cc: linux-pci@vger.kernel.org, 
	Karolina Stolarek <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>, 
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller <ben.fuller@oracle.com>, 
	Drew Walton <drewwalton@microsoft.com>, Anil Agrawal <anilagrawal@meta.com>, 
	Tony Luck <tony.luck@intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Sargun Dhillon <sargun@meta.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
	Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Bjorn Helgaas <bhelgaas@google.com>, kernel-team@meta.com, gustavold@gmail.com
Subject: Re: [PATCH v8 18/20] PCI/AER: Ratelimit correctable and non-fatal
 error logging
Message-ID: <f5tby75ifujq2ka3ku76ezuzar4i7ok7a7etygygdpt2k6n4ar@wful3braajua>
References: <20250522232339.1525671-1-helgaas@kernel.org>
 <20250522232339.1525671-19-helgaas@kernel.org>
 <buduna6darbvwfg3aogl5kimyxkggu3n4romnmq6sozut6axeu@clnx7sfsy457>
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
In-Reply-To: <buduna6darbvwfg3aogl5kimyxkggu3n4romnmq6sozut6axeu@clnx7sfsy457>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 01, 2025 at 06:16:29AM -0700, Breno Leitao wrote:
> Hello Jon, Bjorn,
> 
> On Thu, May 22, 2025 at 06:21:24PM -0500, Bjorn Helgaas wrote:
> > @@ -790,6 +818,9 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
> >  	trace_aer_event(pci_name(dev), (status & ~mask),
> >  			aer_severity, tlp_header_valid, &aer->header_log);
> >  
> > +	if (!aer_ratelimit(dev, info.severity))
> > +		return;
> 
> I am seeing a kernel NULL pointer in the aer_ratelimit(), where
> dev->aer_info is NULL. This is happening on linus final 6.16 commit id.

Upon closer examination of the code, it appears we can replicate the
functionality of `pci_dev_aer_stats_incr()`, which is similarly invoked
within this code path.

commit 1b4ef90e8397eaf2bc4d0f8a2127d2d75c7ff5e0
Author: Breno Leitao <leitao@debian.org>
Date:   Fri Aug 1 06:32:26 2025 -0700

    PCI/AER: Check for NULL aer_info before ratelimiting in pci_print_aer()
    
    Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
    when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
    calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
    does not rate limit, given this is fatal.
    
    This prevents a kernel crash triggered by dereferencing a NULL pointer
    in aer_ratelimit(), ensuring safer handling of PCI devices that lack
    AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
    which already performs this NULL check.
    
    Signed-off-by: Breno Leitao <leitao@debian.org>
    Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal
    error logging")

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 70ac661883672..b5f96fde4dcda 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
 
 static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
 {
+	if (!dev->aer_info)
+		return 1;
+
 	switch (severity) {
 	case AER_NONFATAL:
 		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);

