Return-Path: <linuxppc-dev+bounces-110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69621953D22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 00:05:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7DM8izQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZWyXpXXZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlK1r1xkWz2xYY;
	Fri, 16 Aug 2024 08:05:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7DM8izQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZWyXpXXZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wl9St6R63z2ydG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 02:24:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723739095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5gZYokzgkCL4xQW4GJraQSqmDBgypT9DDRopqeH444=;
	b=P7DM8izQeaIkf7TB2XHfRBSqDI0Ki4C9vh4OebcOZc5m/uGcfvyABR/rXToPHbjw+iv+wd
	ZD4SxrO4LupaWQC0Lz+i3BDq53AWJc7+/+gCW6sSiCSHavEeSMxgWb4F7E2Dlxykee+rc8
	l8CZ/sAbgqDK2H4jDVcMc7HRbvjUlG8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723739096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5gZYokzgkCL4xQW4GJraQSqmDBgypT9DDRopqeH444=;
	b=ZWyXpXXZDEI0WgZr4t57OsVeJo29VWAftwVAbKYf8CiSm79sR4Le6tAprDkasBSHwlZs4j
	jaWkqHQXhPn1e7VyZzSRx1XQHp+vVpXBMskA2IMe7wRG8ujScJwCURG8j3IJaB2JT6bLoU
	WQTAPghjVKtGSmOtH5M0GWqpFloDzDo=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-uOAKcJiEMOS4Iqlr4dlEqg-1; Thu, 15 Aug 2024 12:24:51 -0400
X-MC-Unique: uOAKcJiEMOS4Iqlr4dlEqg-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5d601a9376fso1016883eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 09:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723739090; x=1724343890;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5gZYokzgkCL4xQW4GJraQSqmDBgypT9DDRopqeH444=;
        b=CCaIb67jjSvFcqRpXsOLp5zbyzTVmv307jDNUTOIFPipgJJck0m2c9hUXVPUnWK/LL
         ZmzO3VyUXyPHqVTs2cJCQDp7h+1fgRda3DTGVOaU+BWUoD943CcnrrOjqDulby2NDP7x
         nXy7xzW4QQN6JKfikKJGnGHevUU6OOd/mhH6d8aINurTxMPuPxBVIYTdadNeLnN5btv4
         k1eP3OPggMYfGPybiivxIm+gDhRd9KisVzTTZvTtKNVX8I9KoQNDfdDeKAsAmN0YP1UI
         I78ha7rEgr6R1UEgPOuacfGufRf23HZA1del0p3f/0TKiIeekSdkfdc6Yi73IUYg4Vrg
         8O8A==
X-Forwarded-Encrypted: i=1; AJvYcCWbFM1uyoERjDAOQq7iKb7yZmYjrk+je58h4qOg9rUcGdBwTivyyV1xMpXYoLKllUEP2ZjjOK5uR/d48BKDKFuiuDq1x4t1vgneNgnOlg==
X-Gm-Message-State: AOJu0YySpHGA0/iLyisfexaj5/CSLW1l5ji9u2/vtJbzNa2aSylQFRVR
	f5P8PIg8bgbX62LXOBdDkj5EAEGyoc2nbUxwW39BxxiD+GGizCXHJC/h4qcS7AZ0AL+o5IpfB+R
	ZtwCW+Z0v5ld8DQRH8jk1+cUI1jti/NfDrL6fFnW4w2DC3fuhs6fXL/huWMaUB6s=
X-Received: by 2002:a05:6358:478e:b0:1ac:ef2e:5316 with SMTP id e5c5f4694b2df-1b393312da8mr41348855d.26.1723739089825;
        Thu, 15 Aug 2024 09:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhKEdpbUHkvG8Pr8ui0Xr7jkKYyc52uKUNdYvCcErevOSvpeAWflh+MfknPQLEAegEmwlNRg==
X-Received: by 2002:a05:6358:478e:b0:1ac:ef2e:5316 with SMTP id e5c5f4694b2df-1b393312da8mr41345555d.26.1723739089410;
        Thu, 15 Aug 2024 09:24:49 -0700 (PDT)
Received: from [192.168.1.9] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0e5b09sm76027885a.73.2024.08.15.09.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:24:48 -0700 (PDT)
Message-ID: <9ec85e72-85dd-e9bc-6531-996413014629@redhat.com>
Date: Thu, 15 Aug 2024 12:24:47 -0400
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Ryan Sullivan <rysulliv@redhat.com>, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Cc: pmladek@suse.com, mbenes@suse.cz, jikos@kernel.org, jpoimboe@kernel.org,
 naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
 npiggin@gmail.com
References: <87ed6q13xk.fsf@mail.lhotse>
 <20240815160712.4689-1-rysulliv@redhat.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on livepatch
 sibling call
In-Reply-To: <20240815160712.4689-1-rysulliv@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 12:07, Ryan Sullivan wrote:
> Hi Michael,
> 
> The r2 value is stored to the livepatch stack prior to entering into 
> the livepatched code, so accessing it will gurantee the previous value
> is restored.
> 
> Also, yes, this bug is caused by tooling that "scoops out" pre-compiled
> code and places it into the livepatch handler (e.g. kpatch). However, 
> since the large majority of customers interact with the livepatch 
> subsystem through tooling, and this fix would not pose any serious risk
> to either usability or security (other than those already present in 
> livepatching), plus it would solve a large problem for these tools with
> a simple fix, I feel as though this would be a useful update to 
> livepatch.
> 

Right, for kpatch-build binary-diff livepatch creation, the tooling
scans modified code for a sibling call pattern and errors out with a
report to the user:

https://github.com/dynup/kpatch/blob/master/kpatch-build/create-diff-object.c#L3886

and we advise users to manually turn sibling calls off as needed:

https://github.com/dynup/kpatch/blob/master/doc/patch-author-guide.md#sibling-calls

If I understand Ryan's patch, it would remove this restriction from
kpatch creation -- assuming that it is safe and sane for the kernel's
ftrace handler to do so.

-- 
Joe


