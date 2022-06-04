Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0253D885
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 22:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFrxN5VQhz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 06:31:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=P9CwzByv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=mkhalfella@purestorage.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=P9CwzByv;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFrwr0k5tz30JK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 06:30:31 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 3-20020a17090a174300b001e426a02ac5so11551997pjm.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jun 2022 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HBb0ZDkKChS7u7W92q6z+RJ56Q8ZTddXO5nLVdm7Ds=;
        b=P9CwzByv7YgasmohkFwhBdbjzvwEj+asz8ddZId+WOAo1rW80xt71SlfNQjChfKryA
         wsOQcEWIagvMoLVuqx/Wl04bzWcJiucwtVHxpf+pl+ZTjtZY57pdASshNB27LMmG+Zjx
         uWQ1GkoBKbMEn58u3OWvQ2kPRb7gAZzYQXH8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HBb0ZDkKChS7u7W92q6z+RJ56Q8ZTddXO5nLVdm7Ds=;
        b=WElzD4R+g7NoF+kA0QNZal4/q+yeEHDNP9JauXDDHezDDBExNFZy20OpmOP7tj8eLV
         ZoiUaX0FbZj2VOtHD8X7yVyZJ9oxEp1Mmuv3kytTdezcsNa0Z3kJe1MrDjz+YYFdnkvj
         0Z99xrmWr1Oy1WvenH6erCg2ZrSKBmbTrTCx6TmhlNckZQEn/IOG9NmvFQGIHJW8vLzr
         EMVfKimKcHwMuV9kl24bgdbNNwlkVmfqDLgO/8J9aiVcN7pMVxhf1xiLJG4auNaU+4jN
         l8tp3Y/R+zm/6GShXPlQAcE5FAwoQMgfJnNuTSaPSbLcnQMA6pWd0RhtzOB2G5LKFdOi
         igDw==
X-Gm-Message-State: AOAM5326JK1Df4cFMaF1yxDuJTmhinuWWF/aPNQYsuQ2n53j0oI9NrZ1
	q9XScNkeTAmW1YTGKwy3KWVB7w==
X-Google-Smtp-Source: ABdhPJwtXs6I68jQqRzep0xqec3GlALJ3iL77SWf2Owq4SCVbCGHKE8Dm7lcxheeLXbH6VLIAOVrIw==
X-Received: by 2002:a17:902:eccc:b0:167:5c6e:31e4 with SMTP id a12-20020a170902eccc00b001675c6e31e4mr5543306plh.90.1654374628607;
        Sat, 04 Jun 2022 13:30:28 -0700 (PDT)
Received: from irdv-mkhalfella.dev.purestorage.com ([208.88.158.128])
        by smtp.googlemail.com with ESMTPSA id l63-20020a638842000000b003f61c311e79sm6530196pgd.56.2022.06.04.13.30.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jun 2022 13:30:27 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: helgaas@kernel.org
Subject: Re: [PATCH] PCI/AER: Iterate over error counters instead of error
Date: Sat,  4 Jun 2022 20:30:21 +0000
Message-Id: <20220604203021.10663-1-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220603235856.GA117911@bhelgaas>
References: <20220603235856.GA117911@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, msaggi@purestorage.com, ebadger@purestorage.com, oohall@gmail.com, stable@vger.kernel.org, mkhalfella@purestorage.com, bhelgaas@google.com, rajatja@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/3/22 16:58, Bjorn Helgaas wrote:
> On Fri, Jun 03, 2022 at 10:12:47PM +0000, Mohamed Khalfella wrote:
>> Is there any chance for this to land in 5.19?
>
> Too late for v5.19, since the merge window will end in a couple days.
> Remind me again if you don't see it in -next by v5.20-rc5 or so.
>

Thank you. I will keep an eye on -next.

>> On 5/10/22 14:17, Mohamed Khalfella wrote:
>>>> Thanks for catching this; it definitely looks like a real issue!  I
>>>> guess you're probably seeing junk in the sysfs files?
>>>
>>> That is correct. The initial report was seeing junk when reading sysfs
>>> files. As descibed, this is happening because we reading data past the
>>> end of the stats counters array.
>>>
>>>
>>>> I think maybe we should populate the currently NULL entries in the
>>>> string[] arrays and simplify the code here, e.g.,
>>>>
>>>> static const char *aer_correctable_error_string[] = {
>>>>        "RxErr",                        /* Bit Position 0       */
>>>>        "dev_cor_errs_bit[1]",
>>>> 	...
>>>>
>>>>  if (stats[i])
>>>>    len += sysfs_emit_at(buf, len, "%s %llu\n", strings_array[i], stats[i]);
>>>
>>> Doing it this way will change the output format. In this case we will show
>>> stats only if their value is greater than zero. The current code shows all the
>>> stats those have names (regardless of their value) plus those have non-zero
>>> values.
>>>
>>>>> @@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
>>>>>  	struct device *device = &dev->device;
>>>>>  	struct pci_dev *port = dev->port;
>>>>>
>>>>> +	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
>>>>> +		     AER_MAX_TYPEOF_COR_ERRS);
>>>>> +	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
>>>>> +		     AER_MAX_TYPEOF_UNCOR_ERRS);
>>>>
>>>> And make these check for "!=" instead of "<".
>>
>> I am happy to remove these BUILD_BUG_ON() if you think it is a good
>> idea to do so.
>
> I think it's good to enforce correctness there somehow, so let's leave
> them there unless somebody has a better idea.
>
>>> This will require unnecessarily extending stats arrays to have 32 entries
>>> in order to match names arrays. If you don't feel strogly about changing
>>> "<" to "!=", I prefer to keep the code as it is. 
