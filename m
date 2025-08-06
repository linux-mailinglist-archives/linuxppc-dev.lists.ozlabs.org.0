Return-Path: <linuxppc-dev+bounces-10683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73534B1BE60
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 03:37:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxXvt6nrSz2xck;
	Wed,  6 Aug 2025 11:36:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::644"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754444218;
	cv=none; b=g+wFHDc89OhiiQMGWK73ndaUZINaisUiIBJW49ZjnkHSCsUfnrYJ18UNUpeu/nlgcA0WVcPtsZ0LatkAIYcA038tGZpFo4/sWwNnpvfk6kpxmchjgq5/rED7CzGwXUQVrDh1zi3KD6Mz2MzBZ5E9j4/VXgsAVtIMbyWAfJwLuHma9Seug1Lxtys0zgfA6CyZGrMATBl0mvdGpbjiH5VCHtofCoG8NBsybgmYKPFG9UzzNCWsmlccTPruiPy6Aqq5xctcaMwO9Lze/K5//dMS4dn90uyiSsWwvFU2T4zeoYbrjEGJUaPXHvd7rsFk8NnfKbjoABd2S5CoNnGSxL2rpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754444218; c=relaxed/relaxed;
	bh=ltkTJhVSvPYgOW3R/Jy3oXTODTSaDGZhQTqQ4qWXz80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cx/642cyFjONUfiHsvmMdguAO6hQTCHnFqD2fUuToUcFyWfyGcwIKckk09gAAzoz8xKJg95Mh0XLMmK75tUBIEmHZoVoF4rD6eR83QX3IPpAReTgiPVF/wgHZbVSuB99K/x5D9zG2IvIduGqqeBQVT7PQPdgZCOzgbnfL9tfdMIbVPPHemaFdVbD4xbIdBncMwYHk62vwslK1r7l2CudcXOKFXSAlBM9m7oK+ljNYl3QlXtKcg3nGQZpLcZBMmVvYeCPbBO4IA31qBa/uGWu2X0CHvinj8JnAITrDZ0vA4QsLSDPjSXt7utzd9/bxXNokhKFfKh44DgG3IF2YssyCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UW5ZFQYt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UW5ZFQYt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxXvs26VLz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 11:36:56 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-af98b77d2f0so157769766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 18:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754444212; x=1755049012; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltkTJhVSvPYgOW3R/Jy3oXTODTSaDGZhQTqQ4qWXz80=;
        b=UW5ZFQYtDOGOCIMXlOnHUa50QzvdDTiaPoooERdnQr4nsL771V24TDDi54N1oCZu4s
         ZcJeBpGmk4+roF04mDU7uLZrmkUMemMzmS+VwhYcBkvcWBkTJD9TZLa4VWHdMESmBHfZ
         +aVV6Rx3uaISHFGnSD9FItsTHZwFp26cTWo2HEs8Dv/cNdgDuPfogVUJY1ICm6GCgW4V
         xkDIbsg29cDGJ3Su3yXAaI+C4Tx7enHP//pntHmm4oyqk+sGrDUkl1kubR9MltxYXzi0
         fcMr8S/O30Z8m3XO54+XFSN55mu4u1TX1xPCjMSOg2XlpDrsWsl/LZM9HM1tFs+2NXVp
         nb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754444212; x=1755049012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltkTJhVSvPYgOW3R/Jy3oXTODTSaDGZhQTqQ4qWXz80=;
        b=RBupqJruAwip992h9t8A378Z+27J3160aYwyAkop4mBB+E8rlLS2ePxwDuO0UWSahZ
         XomFAUR9AGDC3lU5SpegxGop8IW7wM/wo+d2X34SMUS4CWjYwetabcMV+Y2S/Wvnrxga
         f82vUzS1YnbdtwpF9ArWysno8hluL8ybqWCSCvYxVT23jacE4BgPawoRju9d71guYp4B
         YprMLEm9jyJ3BhzaAueVadKh/WjN2UV50nzkBFWI4Dhk0GE1RTlTJbydfyovL6HhLxCg
         hJLK1khwKH/+PxpyuyojUygTVj6DuROD+MqjV16Um22NlvrwQuyUUf58LB4TKy2YyYIc
         XulA==
X-Forwarded-Encrypted: i=1; AJvYcCV6pJIobJlGzkM42kw//S6D3W5ObstH6Irie8n54FU10yi62m6AJvWwR8w4djIwFWpQwbz/b/0LWmVDAzw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGAiq5Px5VIurQi43R/tkSyJp7k5ZKfXKKQ0AREool15n6P74L
	LPzNkBYOcqr5lbgKGHh6SgYETjzwJPTaO5QCbTaUs5sPl+SQgH0HsniI
X-Gm-Gg: ASbGnctvPPvG5VanghOJdFo+jaSSFFvPEhDMWzII2nYN4q7ToU3jYktcPBoeRe69yt/
	z8fcWtINbHUDy25S+tj0vdGDYoiX2FnHSJri++3WQuXrg8lju8LKon8bjTmx7QLroORaq+SrmSV
	PT+tfZCi6Dw+zJdE0+T1dKIjlgHpq6dD1pdABSKiYhItQCsrr3mCHRjN/7ooUz31apJacQ7WNks
	unPNT/65JMK+rQZoma2DLC6ExbK6J3Ehd92tRsG+IQY1dVwdMt+BYPN8rTHXiT+hJCEwf0wfh72
	/pJ/bb3p2ZOZK7Ojw41fzCerjeOzZCOLcXBz6r0xDjHv7W2WLrRKQjHVEWIjLh1EF1WjCAqjQ34
	T0xWjEBySMkUY13erj6QXMScwGE3h9OqCRc7lbB692ZBFiMcsDFxmM/0n+qywSiRjwXbvDSb2yJ
	spPsgsPT9MwBpoIBsMjqLPq4dMza/fUw==
X-Google-Smtp-Source: AGHT+IFhWsSPQsq1gaew4kpXRNBKgFOVkQZZ2feJKAWyifD30L5W/2e+in5JWyeX4D+35oz8GqKBgA==
X-Received: by 2002:a17:907:3c91:b0:ade:316e:bfc with SMTP id a640c23a62f3a-af992aab4f2mr51539766b.21.1754444211712;
        Tue, 05 Aug 2025 18:36:51 -0700 (PDT)
Received: from [26.26.26.1] (ec2-3-72-134-22.eu-central-1.compute.amazonaws.com. [3.72.134.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a38aasm1003623266b.37.2025.08.05.18.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 18:36:51 -0700 (PDT)
Message-ID: <ae57a3eb-3914-4d44-a9dc-690a649d90fb@gmail.com>
Date: Wed, 6 Aug 2025 09:36:49 +0800
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
 <1e332191-e1b0-49e9-afa9-09e76779f72f@gmail.com>
 <kvh4pn3bemmrrxeeaydclvhsr6tnudc3hayr6up6oeuzfwzijx@f5corx6x3h6s>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <kvh4pn3bemmrrxeeaydclvhsr6tnudc3hayr6up6oeuzfwzijx@f5corx6x3h6s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/5/2025 11:18 PM, Breno Leitao wrote:
> On Tue, Aug 05, 2025 at 10:25:11PM +0800, Ethan Zhao wrote:
>>
>> Seems you are using arm64 platform default config item
>> arch/arm64/configs/defconfig:CONFIG_ACPI_APEI_PCIEAER=y
>> So the issue wouldn't be triggered on X86_64 with default config.
> 
> Not really, I am running on x86 hosts. There are the AER part of my
> .config.
> 
> 	# cat .config | grep AER
> 	CONFIG_ACPI_APEI_PCIEAER=y
> 	CONFIG_PCIEAER=y
> 	# CONFIG_PCIEAER_INJECT is not set
> 	CONFIG_PCIEAER_CXL=y
Okay, If so, I would suggest to check and validate the
struct aer_capability_regs *aer_regs before/in enqueue function
aer_recover_queue().

e.g.

static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
{
...
memcpy(aer_info, pcie_err->aer_info, sizeof(struct aer_capability_regs));

//validate the aer_info here

aer_recover_queue(pcie_err->device_id.segment
}

or

void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
		       int severity, struct aer_capability_regs *aer_regs)
{
//check and validate aer_regs first here

}

Would be better than dequeue side aer_recover_work_func() ?
BTW, the cause seems you are using a buggy BIOS.


Thanks,
Ethan


