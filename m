Return-Path: <linuxppc-dev+bounces-947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBD996B15C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 08:16:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzC1y5PLtz2xHP;
	Wed,  4 Sep 2024 16:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725430337;
	cv=none; b=AhZFNGx86zL4Fz/sfCT5a+IOroNAyT/twpnzIme6D7TEg+gtPE6koU1TSHN0DfaR5RLcLVR/ngF/RPMxBZ2WYgMG2N1OAO3TN3mqvpT10yikrn843Cad+owI1iVtC5uultkS6rJ82/pPaWqzbDLAELFWgdR1qeTF1CttI85+iyT2WW6gUkyNZTJdhwIhOh6vnWqa+eYD5LofEJeGwFVb/fDQVEIG5N8g+N9PBrGB7/BNX32hmtjfuNG8SySJ+RWsNbDfB7Y4nb5EDK3IDDwbJLekdfDNK9dH5LEDPbdhzL48QYvZlKBuZrwigr20Io8hB0z4VMwypq3H05M9O4yRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725430337; c=relaxed/relaxed;
	bh=VABDIikbxbAbTSQHLomHWS+MkknfvcB6H0xPs5zD4TI=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type; b=RrS2XP61u7WOO9yvND22i7MZqnaanDvpb8JKfon7McFD4aYe24eDmhOPFsQa5X3QBoPiMYrY18qfqgfaOV2DHcsw+96sJSSN9qjTSOeG6H8ijfxXvQa34K0b+1cKu2gUbd7OrJPKUNGF+/ELNx+qQrG3GxdI6Kp06DtKCscUmpO6zcflVfZc5J73yGZBZzNzAW1Dj0QhPH45wviF4vCy7aEgEvzM3A2NiDMo9I3oPIVbmYnqrMK0GpElIUHHIsedm1zepjNoxjCIocc7Tyj+NoixwGO/ztJkgYK+vG11x8Oo5Zndsb5xYVgaHNUV6pnC7RkcigkEvIGF51BkMIlgdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIy0UfSB; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIy0UfSB; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIy0UfSB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIy0UfSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzBwd2Ztzz2xZQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 16:12:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725430334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VABDIikbxbAbTSQHLomHWS+MkknfvcB6H0xPs5zD4TI=;
	b=WIy0UfSB/f3RLe2W2iBnTV6cSwhisIqNQMUnlH6N07hQhXaOeadwTMmETzZ6kKy4Z7ywDa
	pdmJ2bVE9c1ZXM0zo1QadjzetepnK2IM1Pyt4/1i5+igPTnroYE+m2Xl3PtyTfv66zmVsB
	FSQW7MZ/daXVv8cfzPi01cHATbx2yLE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725430334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VABDIikbxbAbTSQHLomHWS+MkknfvcB6H0xPs5zD4TI=;
	b=WIy0UfSB/f3RLe2W2iBnTV6cSwhisIqNQMUnlH6N07hQhXaOeadwTMmETzZ6kKy4Z7ywDa
	pdmJ2bVE9c1ZXM0zo1QadjzetepnK2IM1Pyt4/1i5+igPTnroYE+m2Xl3PtyTfv66zmVsB
	FSQW7MZ/daXVv8cfzPi01cHATbx2yLE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-8299JEaXO02PqVHnhR39aw-1; Wed, 04 Sep 2024 02:12:12 -0400
X-MC-Unique: 8299JEaXO02PqVHnhR39aw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c23fffa44eso3373014a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2024 23:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725430331; x=1726035131;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VABDIikbxbAbTSQHLomHWS+MkknfvcB6H0xPs5zD4TI=;
        b=MshqF1GRIJnZGGngk7Dg6t7GQ7NCS4SnqjRcTyVagKijz0rwPGQSOv6c/GBBHlyRMN
         lZY8ahZowWcDObtbcII146WW3Qa6q+OPoQ4pifDw3b9ML1KGQP/+ysy10nZvDh/guph9
         zXWnyf5l75wEfX3Dkl2XaaAX0EUnCAeuKH+5beFrzm88cDsM4GTebf1clYdx+99REiTf
         Ae7GyHb4U500xBkpr93VSggOnj7f2LTniwThEbsqpJVthv8MaM5EcDFaONAfyLaVj1m7
         eC2EJDOkkICBfK6bsrPJyvs3ol00DuKMNAvwmTVk8RNs0h7O3R5RbKCu9ITi5pSLw311
         qW0A==
X-Forwarded-Encrypted: i=1; AJvYcCVWNmI4AIitkUgaMw6U4wjM68HxtbYJRemjp0ZSm0P1KAkbuNLPujXErrpwpn3WPw9KKG3gTUFznKMnjkk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDUil/OfoAr1rhAcwH5BcCe/PaSsKdxeB2aX1FHXkh/X79BynQ
	+sIqvcVL8xLx3RGdcbSxoZ932XDiueNkRbGKpZO+LdH4SHMi9GmxoJpS8L/GaCZwiKfCCRo/0Hp
	ODq/d/vJrMdyLoNuObmpy7lBsQdYZlwM4F1D9BACOmLnFlONJa+Z8Cs/IQSc7FzkB2qMvbOM=
X-Received: by 2002:a17:907:7295:b0:a86:9d3d:edef with SMTP id a640c23a62f3a-a897f77fa48mr1566625666b.12.1725430330835;
        Tue, 03 Sep 2024 23:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG45AYewg6tNE9To3cLQhgrRQm9CNbEwFJ8DttrdeygyFtBgrMme2ZadeOub7a84GejgI9cug==
X-Received: by 2002:a17:907:7295:b0:a86:9d3d:edef with SMTP id a640c23a62f3a-a897f77fa48mr1566623066b.12.1725430330337;
        Tue, 03 Sep 2024 23:12:10 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de. [109.43.176.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989215cb5sm762841866b.191.2024.09.03.23.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 23:12:09 -0700 (PDT)
Message-ID: <425f68ae-5d63-412d-a677-82d91b2d9935@redhat.com>
Date: Wed, 4 Sep 2024 08:12:08 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 3/3] riscv: gitlab-ci: Add clang build
 tests
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com,
 cade.richard@berkeley.edu, jamestiotio@gmail.com
References: <20240903163046.869262-5-andrew.jones@linux.dev>
 <20240903163046.869262-8-andrew.jones@linux.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903163046.869262-8-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2024 18.30, Andrew Jones wrote:
> Test building 32 and 64-bit with clang. Throw a test of in- and out-
> of-tree building in too by swapping which is done to which (32-bit
> vs. 64-bit) with respect to the gcc build tests.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Acked-by: Thomas Huth <thuth@redhat.com>


