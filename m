Return-Path: <linuxppc-dev+bounces-10702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E109FB1CFDA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 02:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by7l22yJqz3bcj;
	Thu,  7 Aug 2025 10:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a44"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754527582;
	cv=none; b=A6G6lCfVIwbZOBQvik3N5AulW37F8CgL4lI0ON+9/1Gokm+z5vsJ8++jmqBuncXs5/uvZ41NvSHUZ5Jw70ngLX4zLpQc6KWwkNq/MgFRLcci8BfFlazzfNbTXIV5QV5QX0ppPv00cEOh4ObGR2eu4wrqfQlM+6jBYV6E177NjyOUhGEuq6bgWQkWdkZyBU4GpPZl2TgPe781sg1ooYFlSivnK4hor7PvVpoZ4zDeDoRhKbdwPF7kCVnXi4LGfL4fU7o0iQlk/6MaD0BzRvVngCl7xiFPucoMLCgdS2RX3QbaSIRxlsnqHhgV6IgatbvNHbs7WC398sfu24tJeA3riQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754527582; c=relaxed/relaxed;
	bh=Rmc1rEtWWDIvM/pd+dlvLBSfFeCnTebznounEkESmm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cm8l/gLTB1xsJmUbyESLnkJ7k8xjM0f8ajhrt+lmwM7nV+h6rg9pfgLv1Qa5sC0Ta3oUtm4Res9F2Rcv2NdT4IWNf1AIQYsQcQ2gjEQzDp0KzkaegwXDMZu0XDJ404rPjR19YyYaiOAnAU9dCT7SaZmazMYAp/fjgpdZAMYmM40ydvsYUluKH2PqGgh1zPxhQxdh0HC+mKdzPlTjkzXDVGJ8bJzQBZQzNFyApHsfc9hv4QvSgr9AQwoXlP0cYwuXFPvO61kMiFYf8QU4a1H1OFZE/bAuocxqxSYLcQBTRF2yQLbg/kTKe5pP11A49ECKxaoocGFkxRpVvDoltXORZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V7Gi9Y2G; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a44; helo=mail-vk1-xa44.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V7Gi9Y2G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a44; helo=mail-vk1-xa44.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4by7l10Q4jz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 10:46:20 +1000 (AEST)
Received: by mail-vk1-xa44.google.com with SMTP id 71dfb90a1353d-5392bf8b590so334737e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Aug 2025 17:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754527578; x=1755132378; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rmc1rEtWWDIvM/pd+dlvLBSfFeCnTebznounEkESmm8=;
        b=V7Gi9Y2GJHjQjseZZc85CqYO7aPwODh4Bbe2eI8fBk6oFXney01NB7+WSm0ckivyNh
         vIXhoQjjxvnKn0q6xbfjt8RzKsIgNJJRxzIXsXVGEEHoQ+OnbM6BKjLlJ8SDPG21cqtw
         4eeY44rX7YRU+CbI7FottwsZC87VrNHRvwV+9M8+4p8iPIC/ZHnlXvMYie7M0a/BoH4Z
         fb/0pHPrTOyPqNgJw5JuMZXrGiM7sdn0Ek3aP6bZVHm68ZnlyqM0taArza5V1mbneXnZ
         IXqQltei9ROvAq5PnjN5qbaFrYM7kXXqR9a0RbWq8mTvTVVcICKwLcQ4k1IMSnUqhejf
         lBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754527578; x=1755132378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rmc1rEtWWDIvM/pd+dlvLBSfFeCnTebznounEkESmm8=;
        b=xOtETIKID5MrLuyKr73KWVL6jf3vXgHd/AVCYBaKS2Pcz3ttj6GZfKH/WkFRA0FL24
         Nej1Pk/YFscVpzLkfg4tgpmDZdMR+MpXK/j3vT49N+dtFDM7KT+SDV+ep95eDvwB6ECn
         3gd0uDKaSteEcXfza2mgYg17uDWJahyv7j5COrpOTfZ1gdTNdbsaKY/PuTvLeQXaXNhK
         fcvvRXCqEsTdGpZ2cARdcuPwX/eSwvgBnMrGeNM9coHzbk8yUkjdrxB0m9uQxX+JMUp7
         EEdOGyOc03nUZlD9FIkqELUFBY3jjxsD9Nxl54q4OA73zHTW5kzrtMPix9NIi8coBYdR
         TazA==
X-Forwarded-Encrypted: i=1; AJvYcCWkcmsjh71WtAeP2GMmVoJoCgKJcvs6bzwhjUC9BMcguhyV0+AbkNCL6vpnVDYHMYRs73r+Lb9ulVRcjkY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxVqmaadxS2iJfl8fjM3IKBNni4wv5PaywPIijMHmPivefElb31
	bPs+BVAUw7U7BZ0gVRo8m3C/OiXBUKiXlr8GRFUYwZKcxzO6u0Dcz7Nm
X-Gm-Gg: ASbGncsxMvPjQNgi5tJ9LgUZscB2iaQl8p69i9NQc3oaXvcsJIguEHKdxxuaiHDvr9P
	anmtw/I7t5micw1NYbI23nowNeZagGfOuCrlJrPyYquEjq8OTmwKVDCytf1zAY836Ax6PAbYPZD
	nKAX5iW+tmKv+f8hJhx+vcZvB8PWgrww+pC2mJ9uOLyQTcGIigPLTHc8p2qp9kP3hDRXm4qG88U
	3f9OA3NHl8R55mUeE7aoYQwlkcDmJQMD+ZS+R3n9kCGw2Y0Eai0T/xCt1elXC3VDRS5zUQ9/zzZ
	/l6OGZzhA0JOCXHZP7I3xcYc6aiImQpC3dqfAEsQ3ZJVjP2u3oWECM8EKKEhFbRLSJNMaHC4jic
	+NGopa9I9fXgykkwAe9dtkEZ0KvdSoxqMQDtg4g/7/yT43JWgb0FnYo+yg34I6+BGXEWEJLe3yk
	yqu59Jkz2936Xm8IGHAw==
X-Google-Smtp-Source: AGHT+IFZepYERxh2hTblseaMPrVinVFDPj77BmHfxlgef5ZJVdCxI3Rs/9/yOXAWQqnIRxoRQr+uHg==
X-Received: by 2002:a05:6122:2020:b0:539:4e00:dba0 with SMTP id 71dfb90a1353d-539a03d5349mr2625544e0c.4.1754527577649;
        Wed, 06 Aug 2025 17:46:17 -0700 (PDT)
Received: from [26.26.26.1] (95.112.207.35.bc.googleusercontent.com. [35.207.112.95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b02b2113sm121074e0c.31.2025.08.06.17.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 17:46:17 -0700 (PDT)
Message-ID: <3eca0594-ebe4-4b34-8463-555136199dc1@gmail.com>
Date: Thu, 7 Aug 2025 08:46:10 +0800
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
To: Breno Leitao <leitao@debian.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Jon Pan-Doh <pandoh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
 <50f6c23f-1f46-4be1-813a-c11f2db3ec4f@gmail.com>
 <umpfhbh2eufgryjzngc7kyvjlqf3d6fgzftgeb44yf4bbtizb6@x7iqbksbbcot>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <umpfhbh2eufgryjzngc7kyvjlqf3d6fgzftgeb44yf4bbtizb6@x7iqbksbbcot>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/6/2025 4:45 PM, Breno Leitao wrote:
> Hello Ethan,
> 
> On Wed, Aug 06, 2025 at 09:55:05AM +0800, Ethan Zhao wrote:
>> On 8/4/2025 5:17 PM, Breno Leitao wrote:
>>> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
>>> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
>>> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
>>> does not rate limit, given this is fatal.
>>>
>>> This prevents a kernel crash triggered by dereferencing a NULL pointer
>>> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
>>> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
>>> which already performs this NULL check.
>>>
>> The enqueue side has lock to protect the ring, but the dequeue side no lock
>> held.
>>
>> The kfifo_get in
>> static void aer_recover_work_func(struct work_struct *work)
>> {
>> ...
>> while (kfifo_get(&aer_recover_ring, &entry)) {
>> ...
>> }
>> should be replaced by
>> kfifo_out_spinlocked()
> 
> The design seems not to need the lock on the reader side. There is just
> one reader, which is the aer_recover_work. aer_recover_work runs
> aer_recover_work_func(). So, if we just have one reader, we do not need
> to protect the kfifo by spinlock, right?

Not exactly,
If the writer and reader are serialized, no lock is needed. However, 
here the writer kfifo_in_spinlocked() and the system work queue task 
aer_recover_work() cannot guarantee serialized execution.

@Bjorn, help to check it out.


Thanks,
Ethan>
> In fact, the code documents it in the aer_recover_ring_lock.
> 
> 	/*
> 	* Mutual exclusion for writers of aer_recover_ring, reader side don't
> 	* need lock, because there is only one reader and lock is not needed
> 	* between reader and writer.
> 	*/
> 	static DEFINE_SPINLOCK(aer_recover_ring_lock);


