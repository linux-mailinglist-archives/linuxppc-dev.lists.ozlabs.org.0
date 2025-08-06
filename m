Return-Path: <linuxppc-dev+bounces-10684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D2B1BE79
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 03:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxYJz3RpBz2xck;
	Wed,  6 Aug 2025 11:55:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::542"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754445315;
	cv=none; b=DjJzgfqd7dEH8/asvEX6eXGVZPi+tw/0PE6SkOVMIaTYHTO20X0XMpvPhCysUWYhJ2FulxC9dMUZKcSdZmN8hj6rkdsu5f6VisHnUV/QZ0fFo6OMxwL5EmRJ7N5ejAusdZ1VB7M+nE4OMLjzc3fe5VsyHS0yVDHifCBdVqQPlbStIxL8mNxPO/em7P0FIMIt7hy4VW/M8Cga1xP6jxVjzDWX6/ozh1XhVbCAS3ViYoHGxajkf2ZaGyL/cjHoKqYTvRhiExbETDcTVqfU+woaNXCavs9vs1MW8mQ3vv/MeVEBLK0ACukTcNv7tc/0JXRcY4FhdFo8XJ9/NIR1lnU+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754445315; c=relaxed/relaxed;
	bh=SwUvDCDGNTjgSGRxvkjU5V1Z70GTc/BlM8QTHRxaQ9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BE7CeT2GG9dbYXM4HqAddiGCWl9ixsrk/F5gHpVA+degJFUuD/Y9nfuSX2ScrKiLcRmVq1KXwjOnz+MckLrrtQDTAUHoxj5oycHoBUWCN8ABMA6MUbxS8tnzbsPLDf3TLwTGT3xN94L8g7F+OcKjokLvH6rDoUuDPQUQHXMNu6z/k106MpsyoxH89RkMehA8+CeCzSECKOcg7/7b5bYA5V4PQ+4V0sywQlUySIylzkJM+lNGDJMF2VG9T8n4M7gEbAlevdHS1MynxcS2/mG/gn4/ex/66uyvpMmarxXUuGCJk7N0vPifJDnMLmMGN8xosV2pG0viePVA3RUZMWAF/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a5TLXZT+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a5TLXZT+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxYJx1ZgRz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 11:55:12 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-615c29fc31eso10090121a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 18:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754445308; x=1755050108; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwUvDCDGNTjgSGRxvkjU5V1Z70GTc/BlM8QTHRxaQ9I=;
        b=a5TLXZT+lyo28o0Nl6aDobekq0PhLomBYBHGjwl4eTEs42urXkJwYgvupTwNopGSlm
         ijZcBukzf8+5UE0nj6/a+LppHsX/56JAAjjKWuo1x4FVlclCtNlK3TzMcmLyDhHvxL0C
         KE95evFT57oI5JnjsWZH6Je7Ap1+Sv0sjeLfARAR51EmJM5mtzrfb7Q8hE++jwAbKquh
         TYOLWWHYh7yJZgxsmUM8Oqj1eKlkBEKxEMC2uI4iJW0/rS6Sn4cmguGVE+es7BsQ7YNS
         kpM6QcmOaNZ6nyReLE6X7OCjICbRtgOjTHG9rgaD5AuKkGhGdHkcPaCn4Wbhx9oB2oKz
         oosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754445308; x=1755050108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwUvDCDGNTjgSGRxvkjU5V1Z70GTc/BlM8QTHRxaQ9I=;
        b=sXhEA7O6fMt1aSY3kKCtxuezYmY6PIXoFqV18t8Dx6TAW0H7S9S3KNzdvMM2wbDE4s
         8QIVL5QISr28fNaeH6tP1/ezYZBAPbvm+ozJHenVQx/ScQRx2/az3rTGBnExId2dltQV
         fGKGWOG3on7ChQxslkanMMw5KyUy1UYBGkUg40jkT7AeXTLOsHWuOoXrEGJ08ZiPvQxx
         xY23VwrHmfRh9pxTXS+utRVeIDcNI04lni2JbNuL96pbJGhuiNou6ckRlCev5SdX4Mg6
         Gh2hpiH7WB5ipeM/y+WA039IvcCKIHpSde/d20zGOfneaCfQyhYwM8GccaJ4mWf2Kz7g
         AuGw==
X-Gm-Message-State: AOJu0YwG7WbDNDLkGILvpX//Sw7BNUu+Oj/togas1qd09v3QVOLFQlKI
	0E3zXScC+thnkVGWgyTTDE9kJZndchH9urczU48MV7DJ+Hc6pFfiGpZN
X-Gm-Gg: ASbGncsidXrRbeLnB84sRlC6Jd607BYmi/gK5/forNxi6HNeqnzltzzzn8e4s/1T06y
	/Avh5LZAZhfvSkOcfxXc6y1wjANytogY8XoQRaP7aCN4gEPaN3nHyTw1udHQ6ejkBO732AjEpQX
	UpCG29kARgGZVovcKtiaHzc3thuuK6Yfp8L5O+ACRBtgDqgJ+4FX9GcLEisj2LRoKENID3nAzXu
	5n88OGx4A0C6GTLqRMOCigIqmX5peKVbumCCCjNUD2CjDCH4dnCqcnL5tf54TvSYaTvbGxK3aho
	M2Wr0nC/ALC4UJJzdfp2SscS6FV4WvKsJKMyYRUbFqMQ9uA0lMTKN4PyM24k9YECewB6C6PBHVl
	mCSGyiWa+AxbR/iwFivjIcUv0LWRChKGOWb9DO3FVDu7ozEtXv3v19krwp3OeMM0m7GE9g19VRO
	cav8YelXYvdsMc4Rlf5qlE8z4Jxq5DrQ==
X-Google-Smtp-Source: AGHT+IGHGjRRe6J/8f38FMv+b/ctFpC2mzgoSfGhiIh3DMk0vlEB5YMRV5JVbv1qLNEU4LSdMZOlEQ==
X-Received: by 2002:a17:907:1c0f:b0:ae3:7022:b210 with SMTP id a640c23a62f3a-af99005e566mr101376466b.12.1754445308254;
        Tue, 05 Aug 2025 18:55:08 -0700 (PDT)
Received: from [26.26.26.1] (ec2-3-72-134-22.eu-central-1.compute.amazonaws.com. [3.72.134.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c076sm976544866b.102.2025.08.05.18.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 18:55:07 -0700 (PDT)
Message-ID: <50f6c23f-1f46-4be1-813a-c11f2db3ec4f@gmail.com>
Date: Wed, 6 Aug 2025 09:55:05 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
To: Breno Leitao <leitao@debian.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/4/2025 5:17 PM, Breno Leitao wrote:
> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> does not rate limit, given this is fatal.
> 
> This prevents a kernel crash triggered by dereferencing a NULL pointer
> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> which already performs this NULL check.
> 
The enqueue side has lock to protect the ring, but the dequeue side no 
lock held.

The kfifo_get in
static void aer_recover_work_func(struct work_struct *work)
{
...
while (kfifo_get(&aer_recover_ring, &entry)) {
...
}
should be replaced by
kfifo_out_spinlocked()

as
static void aer_recover_work_func(struct work_struct *work)
{
...
while (kfifo_out_spinlocked(&aer_recover_ring, 
&entry,1`,&aer_recover_ring_lock )) {
...
}


Thanks,
Ethan

> Signed-off-by: Breno Leitao <leitao@debian.org>
> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
> ---
>   drivers/pci/pcie/aer.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 70ac661883672..b5f96fde4dcda 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>   
>   static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>   {
> +	if (!dev->aer_info)
> +		return 1;
> +
>   	switch (severity) {
>   	case AER_NONFATAL:
>   		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
> 
> ---
> base-commit: 89748acdf226fd1a8775ff6fa2703f8412b286c8
> change-id: 20250801-aer_crash_2-b21cc2ef0d00
> 
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
> 
> 


