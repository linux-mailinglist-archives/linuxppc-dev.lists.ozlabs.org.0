Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836F78C0C34
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 10:00:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ug9yakA9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N/HzUbKH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZkvd0fjrz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 18:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ug9yakA9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N/HzUbKH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZktw1ZhLz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 17:59:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715241569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yjn42W/o/LOj/jSJgIWj/Vg3N4yLF7R5ejTMZiQDXvM=;
	b=Ug9yakA99tM6TscDHY6KklxHdNYcGoS/n134dxw1o4+/R31QIFjp3nIBAjhBEVAKXjctWR
	mdKP/0G/r6rDhUrMDsN7Md/fJcHuHVFo5oBFxs3u4a6zKMiCoS1htVmhq9f4IZ1emhfh3v
	VewaCPuqhpKt+Mpswq632taG6c+wjNc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715241570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yjn42W/o/LOj/jSJgIWj/Vg3N4yLF7R5ejTMZiQDXvM=;
	b=N/HzUbKHa8P+14B3OF/3l96PG/HWioo2PJYtE1OEJaQBMp+znIkQ5wiVJSxgcoVmEmBAum
	vM0/5NqAXmf+3fOnBfuww6tGSan4gCLsVtFeypfOF2jvzipQd/RE9rGjeA19XU6P/z9/ZD
	AEbg/yWLSAwhdtOEkXLEZwhZJubonyQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-57n_jKjSNbSm7X55zsSGBA-1; Thu, 09 May 2024 03:59:27 -0400
X-MC-Unique: 57n_jKjSNbSm7X55zsSGBA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-34da4d75ceeso67034f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 00:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715241566; x=1715846366;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjn42W/o/LOj/jSJgIWj/Vg3N4yLF7R5ejTMZiQDXvM=;
        b=h21/V9aJ4MfNWhFDTlNbLCCagLEXnfVcEBHabxp9cGKmg7gUNs0YmquEh8g3hsdKBc
         KN1rGDWqftpvdLt1smF0Z+k9cy5INghtd/HpFhBiY89J66nyr0kIh0qDlP28Doc46ht/
         y6YBygp0l7M+WJHPYPOXyV5b9v7tdhYZhgbGGoLCS3/6g3y9CfoSCqDDdWIXwJH8LtFm
         5VWZWUPzowX0x/oxykhNx0mYfUCIUlP446kY0Wa7BKYahZ+slmoYA0Q69VfzKxW67gGQ
         TZSnOS/ydtQNpqaie9RgVt2oKWG4lD3fRPV15QQO9hpFzNb6iwV6HIwBrRw+JRU+N8DV
         S0/w==
X-Forwarded-Encrypted: i=1; AJvYcCV8pACOsRp4U/DNy6XWLT2fyrgXrvPOavjShu+8jq2tTqEiLdjUZPKrcbzuJHoQe/PNtp1v254qSwiPu8WEnMCVLso49jKKDN3WfXDtmw==
X-Gm-Message-State: AOJu0Yzb6afL6VHE9iKxRSL9b8gRw1Y6onLwEo0Q4nzJcFLsZy+WYFKL
	rK5ySx0oQP3VZA+qNmUSqSggUsY7X0yphMLTxr7l510bo9sM+Hjuwcs+W7dUOzMbuklFXfTit4A
	bPNyt6N7HoSHotbpTrx88MbxmWNiuowb9iSMLWnK859c/R1V+e76jdvjEozOTnBI=
X-Received: by 2002:a05:600c:b44:b0:41f:cfe6:3648 with SMTP id 5b1f17b1804b1-41fcfe63810mr6921455e9.1.1715241566715;
        Thu, 09 May 2024 00:59:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwrk8LgSZgMX3L0wE/e/4bo7w9alQYn6RfI6mS+/NPJ8rwhS/tbGTF5kFnddiBXFQPikowKA==
X-Received: by 2002:a05:600c:b44:b0:41f:cfe6:3648 with SMTP id 5b1f17b1804b1-41fcfe63810mr6921195e9.1.1715241566345;
        Thu, 09 May 2024 00:59:26 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1b68:1b10:ff61:41fd:2ae4:da3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8fb5sm15844475e9.9.2024.05.09.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 00:59:25 -0700 (PDT)
Message-ID: <e9633d41d0d004db3ec6e2b6d9dcb95d029dbb94.camel@redhat.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
From: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>, Allen <allen.lkml@gmail.com>
Date: Thu, 09 May 2024 09:59:22 +0200
In-Reply-To: <20240508201654.GA2248333@kernel.org>
References: <20240507190111.16710-1-apais@linux.microsoft.com>
	 <20240507190111.16710-2-apais@linux.microsoft.com>
	 <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
	 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
	 <20240508201654.GA2248333@kernel.org>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, borisp@nvidia.com, cooldavid@cooldavid.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, angelogioacchino.delregno@collabora.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, netdev@vger.kernel.org, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, bryan.whitehead@microchip.com, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.ne
 t, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-05-08 at 21:16 +0100, Simon Horman wrote:
> * As this patch seems to involve many non-trivial changes
>   it seems to me that it would be best to break it up somehow.
>   To allow proper review.

I would like to stress this latest point: it looks like the changes to
all the drivers are completely independent. If so, you have to break
the series on a per driver basis. Since the total number of patch will
be higher then 15 (maximum size allowed on netdev) you will have to
split this in several smaller series.

Beyond making the change reviewable, it will allow eventually reverting
the changes individually, should that cause any regressions.

Thanks,

Paolo

