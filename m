Return-Path: <linuxppc-dev+bounces-454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38F95CC01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 14:06:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqzLJ2yFHz2yhZ;
	Fri, 23 Aug 2024 22:06:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724414760;
	cv=none; b=eIY84Auv5gXtA67UAyZFy0N6OJ4GamVPOUyNANrDGOmBn+3KYGgDXbqx3xlf3vJ1e+6jVtvepnEWQnx928Sultc21Cj0dtVSS+vVznqNKVpHSL/Kd0Z5A456slaC+o0DXDqmCOKv6VX2uIXyAB07fWG69XGaMbGQivdmf0VHKS1i5mWinyEF587d2t/hdH7Sq+fGiNLSLH3FQKMadH36I1RYy4/xXTFVIZi9oeBvyySfrH/kC/k+vOGu6rxo2w8SiMdqcrVyrq/Z1hSj4/73YrD8IN/Dz7mr41vWPc3cEDycj1vdH1DmNR5KbJJxWJnC9i9U1w2sBJqX6X0WHGKR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724414760; c=relaxed/relaxed;
	bh=NGZF0AvlZej7rqgff9jJof3mfOBatM8jwICNkXKrrqk=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=iOP8apUBPc9PKYVWAy+Vzz386WgydXs+YeeDp9+imzCWypUHFlP2aLH1/pb9LmR0qQ0d/gMi2/scEkSs5e/Ymv21/SpDB3Bs+VAiAcXQ0zJLP9G8zuyajN1aQa7DO6I65m60I7mJMERjNlmE1ayGnGSyACbRBFlpnJWaYJbVBpQwBoKJqsQlUWFqv8k66zQ7F59bvf8XoupE+LgWE9hJCFJSyrYT20RW4rmh7z83HH0SO9XS2HwjIBy+a4bKrCvvClz/z7MuhrWrlkZ4O3dptEi167Q69UdxdVUMst4Ci3PqbaFPUrlrgmTbpf/SzID638vd15a7uyBzxm/ebnX9MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.160.170; helo=mail-qt1-f170.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.170; helo=mail-qt1-f170.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqzLH70mwz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 22:05:59 +1000 (AEST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44ff99fcd42so10714521cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 05:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414756; x=1725019556;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGZF0AvlZej7rqgff9jJof3mfOBatM8jwICNkXKrrqk=;
        b=ibYf0Z/JBw+G+JTFd9hzy1jhRA1NTYjwUMCihcnu1Md7SxHbq0datxPsZPqLvxPSzd
         4pGrpoKNWvKbdKPGa0iME34uK7B0mO+KIeoRPHcO0YF90OJGNICQqesney8MR5JHPLzb
         Uhl+YlAokTp21Ijql2iW2VFMpDsfmuoDpPY2d1OR5WkfsGt41HyUKcpT0Wktr+Doe1ey
         dDn8/sObr5O7IyNhzPBYCKxghCGFBctGoXkWFWukuZDCD/BFSlX/oA2PBQPVmM5bwPgC
         vOgB+rrPJNhYUMzQ7S793oGcpASPZ3SP14uTzFWso+BDQzjIQ4eBZKCPGWrcM9gTrhby
         xDtg==
X-Forwarded-Encrypted: i=1; AJvYcCXMlMpZRONjxXsjeAhL4dxqSztt3CEpeO9R8IDCNVfdHF5Kft2V9Aojx1/GjwVOch2EtOV6IuXF6+8CQUI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFpgXxCQ/3kuK1a5sZlXY+X5oWajKTUqSvW763mNnIP19G7DqZ
	9CGoCWAVjh2lSOC29aT3tVdIfcKDnLsgR8f/XqMQbt60RMF2gGK7
X-Google-Smtp-Source: AGHT+IHUiEQ2UHjFnBpHefvI6CBVfER5s973r4J8f4wJcBtlNN4Eyl+cyb4eanEq6/83M/3CpkPpMA==
X-Received: by 2002:a05:622a:1f06:b0:447:f41a:aac5 with SMTP id d75a77b69052e-4550964738amr23293121cf.25.1724414756229;
        Fri, 23 Aug 2024 05:05:56 -0700 (PDT)
Received: from [192.168.2.219] ([65.93.184.127])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fe196d10sm16584871cf.71.2024.08.23.05.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 05:05:54 -0700 (PDT)
Message-ID: <e7629e1e-ab41-4400-85c4-e3b39cf5be2f@vasilevsky.ca>
Date: Fri, 23 Aug 2024 08:05:43 -0400
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
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
From: Dave Vasilevsky <dave@vasilevsky.ca>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 kexec@lists.infradead.org, debian-powerpc@lists.debian.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com,
 hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk,
 Sam James <sam@gentoo.org>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
 <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
 <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
 <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
 <dc4a1941-6671-4e89-90c2-3a1c19fd3e1c@vasilevsky.ca>
Content-Language: en-US
In-Reply-To: <dc4a1941-6671-4e89-90c2-3a1c19fd3e1c@vasilevsky.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-23 07:58, Dave Vasilevsky wrote:
> On 2024-08-23 03:16, John Paul Adrian Glaubitz wrote:
>> It should be disabled on m68k and sh by default as well.
> 
> Sure, I can change that. What's the reasoning, so I can explain in my commit message?

Oh I don't think m68k even has ARCH_SUPPORTS_CRASH_DUMP, so it will always be off. My question still stands for sh though.

-Dave 

