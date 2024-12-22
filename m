Return-Path: <linuxppc-dev+bounces-4405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5F9FA4E3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 09:56:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGFP91Cmvz2xgv;
	Sun, 22 Dec 2024 19:55:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734857757;
	cv=none; b=nvVXJcfP7+m6H7ursZh6GEqUa9bZ7X1yYzmFv0UYxTNGbC/x2URsfmSCo9DGKH6rXveQi6pqDeVzvENvHWAVyRsyo3L7TvQBEIJAVWWA9IlMf+tYsYqdukojnt7Kua4Lj8zqPPK3nkXU/g2jXPkUKPVoICk8yXb60Z1zf53x2npBvs9YJVhUl8eoyVDtWH20K7O3m2mFhiGkswYsKA+iMpstZkso8CIZrPzV8zV3xt9XR6cVPd2s+kJ8zLU6A8SpxJLt3RJ5K2jb9atV9eorHpGH8MdGnCk6jPUX5UAJkU6TLegW1UUZpAG0jCdfrLw831rzL7aIOdbpexyH/ZQrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734857757; c=relaxed/relaxed;
	bh=y0ZAM3AXc9I+Ry2cL5oc+u0H81OK6W9itbK+V3oRBvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Tq92CDeXJkfM2kmZ7DgzUJsDmx+qsvZ/cA+16YPeH4fbdgi8vaO0Q6YRoq1t6DFEwubf72omU0ZO5KH74AUkyi9bOcaidmRDNta3OcitAojpcclrqZOGja8CAGtnumXgFKidfjGOm+eaglt/5BuDo/5J4kGu2f5UyM5XzcMI2U1+fYX1o5EHLz1fYVXY9PmvViBEYFP3Rb93Er9fuflkJTUZOeDE0k4Q4ts7AYFmbtfXJXTwv8GfLtgmPY+97vE7vNr6DQ2d5ToY0Ml/dVRhsHKhrLw1pNWbvob+qBlaYKgv8y8bVb5wD0ARk2gZw5w6mZUXzDaEie3bnsnp3+4Ong==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VzY6wDyC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gBripJmg; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VzY6wDyC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gBripJmg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGFP749ppz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 19:55:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734857746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y0ZAM3AXc9I+Ry2cL5oc+u0H81OK6W9itbK+V3oRBvs=;
	b=VzY6wDyC1Vp+P1/xHhuvbxnzFaeCru1PazShL1xVeC/K9nwF0314efkpN+EtQWwVRsh1xJ
	FjnVfvwg/ZaOBVpNxGJBv+AbdUDq2YdpGCAJEBgihtUqRurL3zbEJYnLNnu3GE3juyyM2S
	VHMWASPigg0g81IPHA5HRoQqgCkvrH4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734857747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y0ZAM3AXc9I+Ry2cL5oc+u0H81OK6W9itbK+V3oRBvs=;
	b=gBripJmg44x8jVLsezkHu4Ib1X/ndxuQlmZf18jcybPKZI+PXRogUGkBq06kGjPc7eCQvv
	EXRnSKwNhjwGhhs28TPitzyzTeeie55KilqkIL+xI3LhMeKbjR/vzpB8EMb2W3q7dvn65W
	qAuVqfsdshc89m/u6PtAZ2r3DWgCbN8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-byYRxUTiOVS4ALTE__x15Q-1; Sun, 22 Dec 2024 03:55:45 -0500
X-MC-Unique: byYRxUTiOVS4ALTE__x15Q-1
X-Mimecast-MFC-AGG-ID: byYRxUTiOVS4ALTE__x15Q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361f371908so25078145e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 00:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734857744; x=1735462544;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0ZAM3AXc9I+Ry2cL5oc+u0H81OK6W9itbK+V3oRBvs=;
        b=aNzTaQpG8C5ycInnEQTPY7aQGqMdwFLDhA7ZnRzYlZeVGA9rujrauwAl/TTBuqXi2L
         1Gi0dSKUPeRDU/7RqPzul/TNuMbpJT5IHensnk891cl4+x6Oo3/Knhamp0B++8oqCJiJ
         DlII9slrbjeD351Kemdv0tOtzEZ8QAU1AfbPeLSWVGwrVddIVX8T5pMCJ1zqWxkGq0rH
         RFkwu86EtNBVBme5r0J3CV9ics+OgEmNcfGYzInfgXVr+mePVe+DXmPStDK1EU19xEZX
         XeisSEogwvJQvZEgHD8wJFgswi8/I7vh5ipgjjyE4vlTfwghhFZ4CPnmwHQNifU+ckJH
         zPIg==
X-Forwarded-Encrypted: i=1; AJvYcCXCydoMgCODvKub2F3/bAo0GtjGB1selW/IiK7wJu4VEd1Gd5Bt9mhU8xNqF/TOZEA32OhSzjSK0sp39dg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxOW6EKTbhcMC/QOa4kDjMMaFKoNoa2BZzEZ/gpUkU0+Ai7RZY
	SRU8VZ7AIe7h/q+WKpHwLdVPN+gqLLJeoVcSfHcwfrITtWg4lC9d5iyCSfHyxsmUnLHjCOG1zVU
	BujdhjT5KfhvK/kt++mu9Xj+3jqMno6rhYGXjqSHN46WxmuAGEuRC7/0akLRNPOA=
X-Gm-Gg: ASbGnct1Lm1zV5JoJr8rGMWpuq3ZsGFxnvVjFLy+5c7wTk9eJGQoSkuAjCTi6pHtf56
	Hd/uFTlMxVF7CBSlrzjSpekOTkHyKIl9t7lSdrfZ8jGYutMA4nBS0F1AS3ZgO3+peYHqUdjuaRX
	JVHvFyDEuT13jQplSthdh4jGEMaPO3ryjSL88WkorRhmJEf1yH/EwnrQ2ZU+w5rlH6mAPtPadU6
	f/5408tF1yVJOHGCDZ8nliLlkRyhCuLhMH7FaKXAyme8+9nLHZmAu+VjFI=
X-Received: by 2002:a05:600c:1c1a:b0:436:1b81:b65c with SMTP id 5b1f17b1804b1-43668646aebmr83568365e9.15.1734857743749;
        Sun, 22 Dec 2024 00:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwQIaqX79Jsc08fWgLjZNlfLaWiLw3h95qj60CnnBCbqLOpL6NQRY1BKR2EveaHh7BBQQiow==
X-Received: by 2002:a05:600c:1c1a:b0:436:1b81:b65c with SMTP id 5b1f17b1804b1-43668646aebmr83568305e9.15.1734857743418;
        Sun, 22 Dec 2024 00:55:43 -0800 (PST)
Received: from [192.168.10.3] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c829297sm8639506f8f.4.2024.12.22.00.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 00:55:42 -0800 (PST)
Message-ID: <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
Date: Sun, 22 Dec 2024 09:55:41 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Psbo1T4bTHCC5Hzaf-CESqQfNVLCyaOzC2S1E0d0jHc_1734857744
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/20/24 13:48, Christian Zigotzky wrote:
> Maybe the kvm updates [1] from Paolo Bonzini are responsible for this 
> issue.
> 
> + Paolo Bonzini
> 
> I have found some changes in the e500_mmu_host.c file (a/arch/powerpc/ 
> kvm/e500_mmu_host.c) in the kvm updates [1].
> 
> -- Christian
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
> commit/?id=9f16d5e6f220661f73b36a4be1b21575651d8833
> 

That's possible, there were very large treewide updates.  Can you bisect 
my merge?

Paolo


