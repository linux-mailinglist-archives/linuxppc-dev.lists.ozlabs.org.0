Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0752263A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 23:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyW9t6xFVz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 07:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=YOVGXr/J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=mkhalfella@purestorage.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=purestorage.com header.i=@purestorage.com
 header.a=rsa-sha256 header.s=google header.b=YOVGXr/J; 
 dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyW9M17WKz3bpr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 07:18:11 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id a191so57114pge.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=awoehg3DVkTpMr0e5SN/82sAnQC4XZwnwHUruoursgM=;
 b=YOVGXr/JNn7NPSjYf6oP+U8flXTU/H4OMQVFHnoQVQuCp2dBXGFb9os69kFhKPM+jU
 XxEUW2pDQQ+IGcYmCKHU98xeAA4ITlEn3HdAuXDn3DLswU8FXoXJ65NYjunr3bbwVYNI
 uGqjwirWmx1i3EU+2R9eK6WKw7QiCvfCoeX6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=awoehg3DVkTpMr0e5SN/82sAnQC4XZwnwHUruoursgM=;
 b=3jOQAWZKqImnfbCx5mrsjvihFshckcP701gz7hiBQrGu9zqupVsiK1XYbwLqLrJKxE
 1ILFmp34GNUe+yaEM9e6/8+2I5CHRvqwZRbcf8cS02sJ+9lCIafZhPxaarD65ZhtGmWv
 1SZl8p7jzsVmWHQ6wV5JwfLTJfehKXEWP1umB8+xiDNbh+2bGKAi4hj1KX72r20ghVdo
 UyTLssyLKcvRi1xfwccDN+Gpckd6wVWkZ1D8R9N/rv2/h/OfWySNx22bp9AzbUXGXTdO
 8DF4GZNIPcrGQs0ngjLeUktIwR14UpWylnpuUIz51dGO4yBDr7eFcWdSNam01BWvHzUz
 MYiw==
X-Gm-Message-State: AOAM533N7BEbFo/ybckGG23pIuGuLh1Q6ME9cS9hX18Ub/hoiWAZA4H9
 3DV4MUJ5Nf9MEnprNgvg3+LKOQ==
X-Google-Smtp-Source: ABdhPJx2RIAdUHBPstsH1ktBxYBfA3XcFRMgePn6fEJlQiEEWiujS3M+X1iD3LDGO6ShbUNTSTT8ew==
X-Received: by 2002:a05:6a02:11a:b0:3c3:dabd:eafb with SMTP id
 bg26-20020a056a02011a00b003c3dabdeafbmr18680769pgb.87.1652217488225; 
 Tue, 10 May 2022 14:18:08 -0700 (PDT)
Received: from irdv-mkhalfella.dev.purestorage.com ([208.88.158.128])
 by smtp.googlemail.com with ESMTPSA id
 s55-20020a056a001c7700b0050dc76281a2sm6618pfw.124.2022.05.10.14.18.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 14:18:07 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: helgaas@kernel.org
Subject: Re: [PATCH] PCI/AER: Iterate over error counters instead of error
Date: Tue, 10 May 2022 21:17:56 +0000
Message-Id: <20220510211756.5237-1-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220510164305.GA678149@bhelgaas>
References: <20220510164305.GA678149@bhelgaas>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 msaggi@purestorage.com, ebadger@purestorage.com, oohall@gmail.com,
 stable@vger.kernel.org, mkhalfella@purestorage.com, bhelgaas@google.com,
 rajatja@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Thanks for catching this; it definitely looks like a real issue!  I
> guess you're probably seeing junk in the sysfs files?

That is correct. The initial report was seeing junk when reading sysfs
files. As descibed, this is happening because we reading data past the
end of the stats counters array.


> I think maybe we should populate the currently NULL entries in the
> string[] arrays and simplify the code here, e.g.,
> 
> static const char *aer_correctable_error_string[] = {
>        "RxErr",                        /* Bit Position 0       */
>        "dev_cor_errs_bit[1]",
>	...
>
>  if (stats[i])
>    len += sysfs_emit_at(buf, len, "%s %llu\n", strings_array[i], stats[i]);

Doing it this way will change the output format. In this case we will show
stats only if their value is greater than zero. The current code shows all the
stats those have names (regardless of their value) plus those have non-zero
values.

>> @@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
>>  	struct device *device = &dev->device;
>>  	struct pci_dev *port = dev->port;
>>
>> +	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
>> +		     AER_MAX_TYPEOF_COR_ERRS);
>> +	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
>> +		     AER_MAX_TYPEOF_UNCOR_ERRS);
>
> And make these check for "!=" instead of "<".

This will require unnecessarily extending stats arrays to have 32 entries
in order to match names arrays. If you don't feel strogly about changing
"<" to "!=", I prefer to keep the code as it is. 
