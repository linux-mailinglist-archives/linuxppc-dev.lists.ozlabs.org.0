Return-Path: <linuxppc-dev+bounces-781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C3A9655B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 05:37:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3kf6NZZz2yQL;
	Fri, 30 Aug 2024 13:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989066;
	cv=none; b=S7O4db2ZURZC3w3c4JnF/asxdUfDeWhHry0OZxd9xfS7V8muI9Hc2fBov4mKbMjB7xR8EJmulMvBxtXG5yt0jc59IbWbR6ZmVH5gbM8svE8T20Ou7fhr37vfbj2Lhw9DjS+ioRpP1RciXs+JcM82zsSk8KEruvU9aTSOAdo/GT9EC/OuMDqC28jVCu0j7EFmKYoDJ2FpM2FCVmjlOS3NReeOxiJi826ysYA83OnXyR+mG9ZasA4WcDA71xM1eqmVq12CmbaOa7d2/yI2/VlfySMnPdGgci7UxYdc+sresyJ8rgAVadGc1uEm0n+HIc5MVWg1IPDeIW7jqEhnJVVbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989066; c=relaxed/relaxed;
	bh=fo9L05Z0QSBRe+YpGa+Uw+0Mfbc5M8wNwQrY2Gw1TrU=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=PHIb3Q/cTqjft/hD10qxWruqJeOWnZE2AQsHd+YgXEZOg92FJZ8mgsiGXlHoNqMnr8Nh+KFe9GBVdk8iH25fGzpZxh/93YmmDKkyByrWeqhY7ijSeIHJVmFMtCK76y06Z/7tq4rEvIZLL+tHbqVGp3aIIcyqVLfI2Dz7rhZfpiAOgt5rqP/IbZUFQuHUKCIcbJ4EoA30vgGTw0/v7iJeGigzSNYwfxTBqgqqizapTzce/F7ab7XTLVPe6UNp8GyAEBtBCS1md68GlhAQnWgt7eqHLAijcR9BXv1HnmqCkJhiJ4a9ZSImXIIJkLZNohUt0UY6c5TYJGQUmVQsfu8kEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.219.53; helo=mail-qv1-f53.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.53; helo=mail-qv1-f53.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3kd5rHcz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 13:37:45 +1000 (AEST)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bf6606363fso7666156d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 20:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989062; x=1725593862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fo9L05Z0QSBRe+YpGa+Uw+0Mfbc5M8wNwQrY2Gw1TrU=;
        b=a391NKJuksVlxosaNHZEc4PfNJg2ho8oY8C9pydGBysk/oWhH2Roj1GYHC7Lhn7Jc3
         amcyYhv2ZeaNIJLqg4wg///SZ2NqSrk3jtEsUdDK0/dNtpcDD9O56LxsIujQS8HQJJVc
         79NUIXsaliyWUETPrdQEYukj3J7H3WAW7KIxJtLqjaKCm0WNputPRH/bwN8iFk1NJiOf
         R565LKG+anQ3JzVtg78jxqle4fIURYYr2MnPxsSjsJTHTDVJkf5CEJMry6B3nEz4/hSy
         eWwdpwz+1c/SyJIqtYvGwG16dR0bXqkixIbedrIQ9O+xXPvWHpJtPyNEUwRZ5+VMB51V
         75zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDZ6ftEG1GCdiZapkq0S1wGnZetM0V2CIS+fylQhhUTTSzpVl53Sdbx+ZYZTCMZN2BX9xwipVhRn3LJDw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEvGJnkTAKmD9oLQMaw2G82g+EJR3VPmoGSOMCC04Hrg6721EM
	JK49uSbozSQIGisePq0194YSQZfRdwK8wciNy4c37asgdt5pRRlG
X-Google-Smtp-Source: AGHT+IF5lvFeC41ykAP/5lmiaGuGSVJ62dpKhpYmw92FoqNUdVPe/V37Z2IbmmFTugcCgHwIe+E9QA==
X-Received: by 2002:a05:6214:3d9b:b0:6b5:d73d:918f with SMTP id 6a1803df08f44-6c33e4f053cmr61325206d6.0.1724989061710;
        Thu, 29 Aug 2024 20:37:41 -0700 (PDT)
Received: from [192.168.2.204] ([65.93.184.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340bfafaesm11005716d6.22.2024.08.29.20.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 20:37:40 -0700 (PDT)
Message-ID: <1568b378-5592-4d23-a572-4e09f3996331@vasilevsky.ca>
Date: Thu, 29 Aug 2024 23:37:29 -0400
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
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
To: Baoquan He <bhe@redhat.com>
Cc: glaubitz@physik.fu-berlin.de, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, mpe@ellerman.id.au, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Reimar_D=C3=B6ffinger?=
 <Reimar.Doeffinger@gmx.de>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <ZtE5Z/gDR1WixG9S@MiWiFi-R3L-srv>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <ZtE5Z/gDR1WixG9S@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-29 23:15, Baoquan He wrote:
>> +config ARCH_DEFAULT_CRASH_DUMP
>> +	def_bool n
> 
> If we don't add ARCH_DEFAULT_CRASH_DUMP at all in sh arch, the
> CRASH_DUMP will be off by default according to the below new definition
> of CRASH_DUMP?

Yes, that's true. But if we don't add it at all in sh arch, it looks confusing
in the search feature of menuconfig:

> Symbol: ARCH_DEFAULT_CRASH_DUMP [=ARCH_DEFAULT_CRASH_DUMP]
> Type  : unknown

So I thought it was better to explicitly set it to 'n'. What do you think?

-Dave

