Return-Path: <linuxppc-dev+bounces-1154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6317197099C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2024 21:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X213W4vJpz2xfq;
	Mon,  9 Sep 2024 05:57:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.176
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725825479;
	cv=none; b=kk8el/XNsE/rmpHJs5OAhKcAa3h/Bp0hINtBGN4zBNy+AyldDIVdVshmHvtPOON2bwHWJ4w3kjFWFLMQOR4ZRpN6Z0WS7nzuCbG+R1ArA/D/JfCXLs0B5yJ3oOSjWSHHy9CwjOD3J5GAhrVAYBx5IxrAnDVhD/qaJYFN5S79c+CpMnfuyt6i3K8DZOoVH6PjaqG0sEZ84Hkusban6DK/nhTs81DQ2ibpYPblwF681lWRkuYb6dbRAh1NDwrW5bKyScXkyVHWSpzAxg6f4dUlu2c+0qGXXfnJzI1pjdn6Zmz6iAvUJ69oBIi5iHxkZ8Dx+J0l+LBLT6+JkiiX9OG7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725825479; c=relaxed/relaxed;
	bh=6iRQ4ycMPuueLuQbrmkO5BYrgQaV5z5SVussbCyOKoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f83/wSByvSKhy1P0xKEEymYMEiNjC/wCNCw76TuGtc1mFUMPnJH7DDIZTfP3225zWiPHZFdw+EwQg1600S1lDsGC4FfDJEeH9WLKQA4zjf8o3qEnXUGnKPmAOYRTxj7lWAjSzgOYdPi1TuPj7myJ4sliZ8cOdYvhNE5X4zLe2Z/k7jukxVV5SjG+FGpOtQbvRiS7L/ZXfjoRt9JQmikb605zzzMDrnIM5evugjrMqcoRKWSpnWk515+EzYIr4sOJWJkdk9TmzETWtHhUG5O4dbyxRmEQaqECO9hxUn9rJ0gGjBNnA6mpjvnS6wtfAkTDNAireHcJ46/3GcHwGh2rxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.219.176; helo=mail-yb1-f176.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.176; helo=mail-yb1-f176.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X213V5vJ0z2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 05:57:58 +1000 (AEST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso3939274276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Sep 2024 12:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725825475; x=1726430275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6iRQ4ycMPuueLuQbrmkO5BYrgQaV5z5SVussbCyOKoM=;
        b=AKQTHdglXaFX5IewSeL/6J71Idhz2CDKT5DuajggbKNyWRsTzJmWoOb+TfmDCOUSR+
         pFVt428OfY0yi36wWyvIrQOcUqQJlcS8FwIkx2ATh7D64iywb3o82RoUG6ZvKwgOhagK
         ocgD5Yvr3eeoUHUPAXcW1B3cAOfvDojFE5vvFZ2KGXbGSt2f/wI3HC2utYJKp0JRDw9q
         s7QFP/+zDIAjFGKeP1NnORGMTPFaXYr2QTjgH5YF7FjAJqSxa9cyNpaoHhdfGSvKE5Yq
         bK6RzNpD+uRjjA2ElAnG3ygb5nAck8hUAxGR+OhsC38QXdK+0K7Ey45rhEUghZYrfEOl
         fJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0UBkzeG9sIlHBislpUPQkT2T/Gwj+dH0eZQurQsb9ytu7UGbmEB75uHNuJMgp6aoeFGN2L1ds3XsL2ME=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyiPLRH3U1MQwPt265T/xz56KaIXbg9cHXk6CZqtbrJdA4zfAhM
	wCZQi641/Dddspz9uFwex9cDHbm2OvF7sZl089uJ9f2k7/HPmOhs
X-Google-Smtp-Source: AGHT+IHbDiMdtH2pqnAbxLEMjAlHcuY4ygwDQW8Q8ews50/boV7RDQlibc4OTUwRVZ+TyW4cporrAg==
X-Received: by 2002:a25:cece:0:b0:e1d:436c:3b4f with SMTP id 3f1490d57ef6-e1d436c3bd7mr5094797276.50.1725825474790;
        Sun, 08 Sep 2024 12:57:54 -0700 (PDT)
Received: from [192.168.2.254] ([70.24.204.168])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822e7723asm14597531cf.22.2024.09.08.12.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 12:57:54 -0700 (PDT)
Message-ID: <c04fe24a-26e6-44b5-a2dd-00eac589e36b@vasilevsky.ca>
Date: Sun, 8 Sep 2024 15:57:42 -0400
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
To: glaubitz@physik.fu-berlin.de, bhe@redhat.com,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, mpe@ellerman.id.au,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Reimar_D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <20240823125156.104775-1-dave@vasilevsky.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I received a notification from Patchwork that my patch is now in the state "Handled Elsewhere".[0] Does that mean someone merged it somewhere? Or that I should be using a different mailing list? Or something else?

I'd appreciate some guidance.

Thanks,
Dave


[0] http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240823125156.104775-1-dave@vasilevsky.ca/

