Return-Path: <linuxppc-dev+bounces-4468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 611179FBCFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2024 12:42:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHY0C71M0z2yWK;
	Tue, 24 Dec 2024 22:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735040539;
	cv=none; b=HDD8dMx02bg/+P7bqDYxIBKK4GsYaWIQDrtWaCnslErb6hwedqGelq87mqlbLgC4shpeAPPW3aV0Tx+rYm446FngQAh0NyFmvwFDKmzsnJoEHKFwIYN2zjQR2u25WLTSW64nnpn2+8wpBDqv4B/Y10rIpYax2QUurGq9hxWbP8zYlgXGkD+RBqVI9b0PRzlIFP/0+TbTauez3nYjCJ9uhKufi9hfcB20s++1nBAruxSO5e04Y1ED2YHMpHPOrhW4oCJ+k+YykeWAZSgkMf2fKXEc7UC1EOhPk09NcwPLu4gayl0rgi2fc3JEuz/JMhsWaFsHm0Yy1QS6zXvZYp+yuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735040539; c=relaxed/relaxed;
	bh=OsMm2kkhF+Z9V26v62JgcmGA5nEWPAdaI8pCOc96qj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXdhDCfteGssZ3/7l1C3nEuZeYZsBYtKeCdpu6wuTXQZGQH1nufxyfjyj8sK6OLtrzAlPtwJrPEm/ZKVlguyTh1pC0gjBa+p6qh7G+7WCAf2wQ+CNUxxMvDfQ5MDy345H026/3PNt9DJtyTwpwZVR09JDj5WoIpVeEt5hVMXggd/fNE6beE3k4cfO/wXYoR4Ox8BsWFyr6N4uu5vUuIkWlouc0l0o4uLp6vYwWrN/AWGpbvJYZ6N1GZf3MtfaiL5u+QtrQHB82olnXfAIxHOtHgeDaVIFxoXAcKIoruj1VHfImdQteuZ+4gnToNWs43XRKNmEyRq05mvVsFbZqU8Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HuKfOr+L; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HuKfOr+L; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HuKfOr+L;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HuKfOr+L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHY0B4Dx1z2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 22:42:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735040532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OsMm2kkhF+Z9V26v62JgcmGA5nEWPAdaI8pCOc96qj0=;
	b=HuKfOr+LvuE8i+K8zh7k6ZcIe2SRKLYDDe0kgIdnrxgOoxGSRbDLOZsUajgg71oySmFOVQ
	pTNwTEwYtVEFPQOLWXs1CssXj/h2lfgRHP6FsryRAojwtuyUFq2zufWG8LZvmC2rmlL8u4
	R0EEddY2B8q1C7RAV+NCIZqQ77/oVnA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735040532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OsMm2kkhF+Z9V26v62JgcmGA5nEWPAdaI8pCOc96qj0=;
	b=HuKfOr+LvuE8i+K8zh7k6ZcIe2SRKLYDDe0kgIdnrxgOoxGSRbDLOZsUajgg71oySmFOVQ
	pTNwTEwYtVEFPQOLWXs1CssXj/h2lfgRHP6FsryRAojwtuyUFq2zufWG8LZvmC2rmlL8u4
	R0EEddY2B8q1C7RAV+NCIZqQ77/oVnA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-Yf_FChu1N0Khsl6GkibNhQ-1; Tue, 24 Dec 2024 06:42:11 -0500
X-MC-Unique: Yf_FChu1N0Khsl6GkibNhQ-1
X-Mimecast-MFC-AGG-ID: Yf_FChu1N0Khsl6GkibNhQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436379713baso25615065e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 03:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735040529; x=1735645329;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsMm2kkhF+Z9V26v62JgcmGA5nEWPAdaI8pCOc96qj0=;
        b=ezVIrUl8zgidricyhjBgBBb5NeL97EvB81W6MA3hqraxHKw6h82PM9LTaWu9Th6/QS
         /ctAvnK4Y8KuuUM+WDnFjlt7OzPoNYaCp2GjMM8NPFmn6+JPcbVgVB7+dac/ruikdi+1
         a/cqzSJgrYDwUaf8npJCBAmF1y3M1Hhsd8ouk5hpj9z6mKh4eCNjDOr2nYchRN1X6VWF
         tuKSAZy1R1flwAo/ZN1b46GyURMN0FXwckt7AcP/MFN/GU3agQz825cW6ORJx5bu0WSH
         a88EEMhMEvy+BWgYSE8siEVEdAC4vfI0BMmvwBDsjPJY5M76kkonTYN8M6G49YTK+tA/
         bIVw==
X-Gm-Message-State: AOJu0YzOp1AQaL+bGbl/7zY2bR4Wy4Vl0+BRZQJ8uyuC3sV/lTCMjHCq
	PQnpjlIF6gL6NQh34U/xJC1eOlAGYVJN1mWOKtjhsrgwbJgRFdG+TadtfF5CzUvJA6KSt5GG+53
	ZEV7rXJZoxbmr6JKlRHdXjoUd4dU8dCQOil/RdlHxqaJsAcqHPW4atPk0DI/DhgoDsTjWZ0M=
X-Gm-Gg: ASbGnct+r9LgjSvAjIvSESrjkBVxQHRGvUQ9lDOO6Gh75I7df7Ijn76t/HqkHw7cJkQ
	XU3fiSp0Usnlpd0eNHjyPuncUsqOOqRoDhTp9LZEfxySEcUHcWlhLj0XtnJ5k+rtk2iqCK3+DvP
	vhf1Nh9yqFYP6kJwPC2pFpjIccWphy5HNvV8Us7phR/LAbaF1ulziTt0U1ryG1S26lb1mKEQaUi
	BxL1viUtzSbaySEXJ7WVdHQZ8zYGYhbnSeX/sjlonLsVBgP1HelS7aWX0kb
X-Received: by 2002:a05:600c:350b:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-43668643203mr169420475e9.10.1735040529211;
        Tue, 24 Dec 2024 03:42:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbMh6wotEMWfZpgZnRHDkBfi3Bo6yh/+8fe8z0DOTLB74hdFgMsTqORdX5QKmkwoOy37B4aQ==
X-Received: by 2002:a05:600c:350b:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-43668643203mr169420245e9.10.1735040528851;
        Tue, 24 Dec 2024 03:42:08 -0800 (PST)
Received: from [192.168.10.27] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b42757sm201972855e9.39.2024.12.24.03.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 03:42:08 -0800 (PST)
Message-ID: <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
Date: Tue, 24 Dec 2024 12:42:06 +0100
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
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z1H1xm5hsXiFxh4bRnsVuX5OkMhNCzBMw_IJStAXNkU_1735040530
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/24/24 12:05, Christian Zigotzky wrote:
> Hello Paolo,
> 
> Thanks a lot for your patch.
> 
> I tested it with the RC4 of kernel 6.13 today but unfortunately it 
> doesn't solve the KVM HV issue. The guest system doesn't boot and I 
> can't see any error messages. (console=ttyS0)

But do you see anything on the host dmesg (without and with the patch), 
for example a WARN?

Also you might try edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 + the patch, 
to see if there are two bugs.

Paolo


