Return-Path: <linuxppc-dev+bounces-250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F2959007
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 23:56:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpNbF0V4Zz2yGL;
	Wed, 21 Aug 2024 07:56:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qe0CMftu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=landley.net (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=rob@landley.net; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpNbD3BhXz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 07:56:38 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-44fdcd7a622so32991481cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1724190995; x=1724795795; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eN6vzCvlT/pCItFp6f4PyJvyvmOiWowl22YtM6dmQFA=;
        b=qe0CMftuWaaN9mHpB5xw/fdsjvDz4lE9gkgULhnC4/FpNoZMSAiat5w6X6lVWmXgMp
         oLWvI2W3oP6NRAwRMltpbRmQaMgHKY0RXZZdR/lf22YmBflPqb3INXSwAqw/4+KSudb4
         QNnFU3UteYNc5r1R77Jb54G3RzHhOtWSKL7xuO9CfC4LWUNu2xjBCiQf0FbqiKhZV3uv
         ez0utb7P97pbezZPZAI0F5oWqCSkH05aZR8e01nGqLSi/d8sLckNwtGYS5xHukv1v51u
         fsLg8tG2Hp8XtEuqP2idP5iyoN95lsF9+kPi95NdxkNFH1J2eEEtWZsUMmNPBonLZkns
         yy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724190995; x=1724795795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eN6vzCvlT/pCItFp6f4PyJvyvmOiWowl22YtM6dmQFA=;
        b=fVc9sqr8IsBTqv/O14vfNVL4VnsaJX/6LBTnbSSogZ6wR85C9rbNlQ41PK0UvE3Zq9
         lCJeYZ1syU62F4kdBjTjgsdPeDnx94UxiWG+P8Sr1s3CUTIc17VqB8pHzlK/uPfXhnrY
         phxJ5SamVC+ezTqgfw7Rewh49ppYflwbkCioT/DUmeKjL3joxjLiVNEBEPDyJg6G3hKM
         72sM/rsOuIsdoL9H7gv4MPb2Rj44rYzkoy9/Jg0uLeE+ODuZYWM3ahJAes3B01+vLdfk
         0Jx5H48oIpHN7dTdYc4LPwRx2eqiHZzH+1J+LD3c+5nuM1xsd+NP492H9SRXXMqDHdUy
         3fuA==
X-Forwarded-Encrypted: i=1; AJvYcCVMFnxPGAY6AiZaDpn+R1PhoweFil6U2dIfyFdHDI0pX9iBTSWd40Wx2hUB9C2wQeOh5p4lY9M1ml+qYes=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwR+9YRFXl1kMEUVDlTjGwwzu8CqbxsrlP0LA+CUv1wN6lDFo2o
	UOYXedmUQZ+voKTvs+dDbpJd2Th8fE9iUuY31FajDjxIGOYVTvZcRgwra8XZkAI=
X-Google-Smtp-Source: AGHT+IHXvZQTYbODvbtiWMvtKaWw7MfhUsJrv1XSsVar7SrJFLG58wKSOeDH8tFL+40SZRU1vcMC1A==
X-Received: by 2002:a05:622a:260b:b0:454:ec22:dd79 with SMTP id d75a77b69052e-454f2218babmr3430781cf.24.1724190995315;
        Tue, 20 Aug 2024 14:56:35 -0700 (PDT)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454de4fa40esm18021631cf.21.2024.08.20.14.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 14:56:35 -0700 (PDT)
Message-ID: <67108df9-7374-a64e-ca82-8c46d67fb55b@landley.net>
Date: Tue, 20 Aug 2024 17:10:32 -0500
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
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@quicinc.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org,
 christophe.leroy@csgroup.eu, jeffxu@google.com, Liam.Howlett@oracle.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com,
 pedro.falcato@gmail.com, linux-um@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon <linux-hexagon@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240812082605.743814-1-mpe@ellerman.id.au>
 <20240819185253.GA2333884@thelio-3990X>
 <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
 <20240819195120.GA1113263@thelio-3990X>
 <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
 <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com>
 <87y14rso9o.fsf@mail.lhotse>
 <CAHk-=wiS7PMtL6oR6acNgWZr0NN4Ax4PQD_CYJKCiKS0mT=Z7A@mail.gmail.com>
 <dff57198-7955-ec09-8909-671982834673@landley.net>
 <CAHk-=wj78UV2ep6i5JZ-1qhLPZPHV4eUOtjWqqh_3zcqJ7pK-Q@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAHk-=wj78UV2ep6i5JZ-1qhLPZPHV4eUOtjWqqh_3zcqJ7pK-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/24 16:31, Linus Torvalds wrote:
> On Tue, 20 Aug 2024 at 14:17, Rob Landley <rob@landley.net> wrote:
>>
>> Hexagon also has &&vdso_page which I don't understand (but have a toolchain for
>> somewhere to at least smoketest...)
> 
> The '&&' is just a typo. It should obviously be just a single '&'. As
> mentioned, the only testing that patch got was a x86-64 UML build
> test.
> 
> Fixed locally.

I deleted the extra ; and arch/sh4 built and qemu-system-sh4 booted to shell prompt:

Freeing initrd memory: 556K
Freeing unused kernel image (initmem) memory: 132K
This architecture does not have kernel memory protection.
Run /init as init process
8139cp 0000:00:02.0 eth0: link up, 100Mbps, full-duplex, lpa 0x05E1
Type exit when done.
# cat /proc/version
Linux version 6.11.0-rc4 (landley@driftwood) (sh4-linux-musl-gcc (GCC) 11.2.0,
GNU ld (GNU Binutils) 2.33.1) #1 Tue Aug 20 16:45:25 CDT 2024
# head -n 3 /proc/cpuinfo
machine		: RTS7751R2D
processor	: 0
cpu family	: sh4

Tested-by: Rob Landley <rob@landley.net>

Rob

