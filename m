Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B2E807B28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:10:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cy4olHDE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQHlKZQ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sls6k374Gz3cg1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:10:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cy4olHDE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQHlKZQ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlgWt2FRfz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 01:58:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701874708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lI8W6CO+u1S10tMvsZNrVhiLtm/T33ov+fTqgOUmfWo=;
	b=Cy4olHDELpz4Rg28Yn8xHshnwLc3VgCviD1EiP+dS/mamQr88N+/ut2eb2ls4E0VoBgNBa
	VMSmE1ZRHN4gIPQAp2MgzQr2i0SexGNwHGwPUJcSCCPFjwO5KS2K5vQs673tV5yI7FQJQt
	z7x+xyYBLS5/hBMSzKUgmlu9knrdO4A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701874709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lI8W6CO+u1S10tMvsZNrVhiLtm/T33ov+fTqgOUmfWo=;
	b=NQHlKZQ+QjLjgq3yDAMRCJSCDTQpFKaem1LWnuKjGvFULXQpJp7IkznGtUx9QcfXKjeztF
	uTrnTkaW4rkNxOBF+c7UBZ/1DCKyH1hOT5VsPXGESfDvxxIrbvblBIzqW7SBZu2QnbWvXU
	LasaTgC21LZAhXbLnaAm6oyj1xBFy2w=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-BjoiSxFBNHmZ76JMIr1k5Q-1; Wed, 06 Dec 2023 09:58:26 -0500
X-MC-Unique: BjoiSxFBNHmZ76JMIr1k5Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2c9f545220cso36301761fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Dec 2023 06:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874705; x=1702479505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lI8W6CO+u1S10tMvsZNrVhiLtm/T33ov+fTqgOUmfWo=;
        b=iSVfG5C1Hlv/7gW2OMpjE3bcm/Q5GcEEYfZ5asvP2EwKsV/sN1MkB4RbRuM23anJp1
         jwEzPyM0Vd087y/ehyUIGswB+M+CV+SaWVgD3vbhO0EHwoyYBz42Yr4D+MtU29GwReau
         PzC2ydPUxctoKx7vmMm/O4ZXQCGwsFyZm9uK+01eduRYBveI+aCNhqyUOBpFpPdoQJwt
         BOFRjVLegPJ0nYRNvkfeRCjlZmr75ghbo6YZoaS49AXJhBS9+h61b9n12A7e1v4wOBaO
         mLwO4JeQeFfDnPt5A1fYjHZSL4wm682sTrYmmxUIHORnI0zNy46DEc6GAHjKsDNkxTJO
         VAbw==
X-Gm-Message-State: AOJu0YwNXMTMd+z4QTZ3OvM8AxU6G8ieBhncLgl+UfQbaV/wLtAwL2Ey
	VqmEJvarRzy52PLuid3RYIiy98LBYVuAsq59babmO4bg7aTFhpe+DnmIX8K36b14jaTS1uOFCd4
	8FJW9Nv2asnHqD/e38k86pRaKLw==
X-Received: by 2002:a2e:879a:0:b0:2c9:f2ef:cf14 with SMTP id n26-20020a2e879a000000b002c9f2efcf14mr784404lji.67.1701874705523;
        Wed, 06 Dec 2023 06:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFAROg+Lxclo/3NuDIimFR4fm3oJ99oj3ElVJlPS5SozqYTKjUwT8fR42ApPqSVQx8pFmf9Q==
X-Received: by 2002:a2e:879a:0:b0:2c9:f2ef:cf14 with SMTP id n26-20020a2e879a000000b002c9f2efcf14mr784392lji.67.1701874705190;
        Wed, 06 Dec 2023 06:58:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id br20-20020a170906d15400b00a1dcfd8f95csm27081ejb.37.2023.12.06.06.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:58:24 -0800 (PST)
Message-ID: <6381d523-8f49-48e2-8576-b74a14eead30@redhat.com>
Date: Wed, 6 Dec 2023 15:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <CAHp75Vc=GAnzwhWQTifLzw8OA7Lb35hrJCDxK-RkgZnX8JmfOg@mail.gmail.com>
 <48ea90f9-922d-4a03-86da-cbb5aa9908b6@salutedevices.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <48ea90f9-922d-4a03-86da-cbb5aa9908b6@salutedevices.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Dec 2023 09:10:12 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, kernel@salutedevices.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 12/6/23 08:56, George Stark wrote:
> Hello Andy
> 
> Thanks for the review.
> 
> On 12/4/23 21:11, Andy Shevchenko wrote:
>> On Mon, Dec 4, 2023 at 8:07 PM George Stark <gnstark@salutedevices.com> wrote:
>>>
>>> Using of devm API leads to certain order of releasing resources.
>>> So all dependent resources which are not devm-wrapped should be deleted
>>> with respect to devm-release order. Mutex is one of such objects that
>>> often is bound to other resources and has no own devm wrapping.
>>> Since mutex_destroy() actually does nothing in non-debug builds
>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>> extended so introduce devm_mutex_init().
>>
>> ...
>>
>> Do you need to include mutex.h?
> It's already included in linux/device.h which is included in devm-helpers. Should I include mutex.h explicitly?

Yes you must explicitly include all headers you use definitions
from. Relying on other headers to do this for you is error prone.

Regards,

Hans


