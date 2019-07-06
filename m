Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D060FC7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 12:08:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gnTg6JglzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 20:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hYCpxLDq"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gnS91T0NzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 20:06:48 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id c73so660140pfb.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=DLTvJfZ2fbtNvfDk3W1nu/ITfP3d6XpjiF4w9USBrTg=;
 b=hYCpxLDqI2gmIY7zncgcHN4MIiQcHS1WcjigN5H3lP8/cEYlcSlKwLkihstHiOurZH
 Z75vgKRPKamBEyd1mbaTMXFvAqUOemlCd1nwRLDei7/0EGSf05ZNZ7yD2YaxWCx12Tin
 0pQkTq5K7n2aslosYet7tfgp2jD1GYy9JcNST/5J7Hu+MCvdTEBvAEd3I7sRgUIiIYvD
 C9onAEqBFUOVnmMFoN+IaW5vGr09hW6hLIMtz8TrVaChZaZX5WxJe27MgcWqnrPByofA
 ZxoymIjwJMaiDo2MtvddffFMo3yU04kMBGE3u4KUttHHsmTlnDYB2m3LBHpVyBZ6j5k+
 a7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=DLTvJfZ2fbtNvfDk3W1nu/ITfP3d6XpjiF4w9USBrTg=;
 b=fBqhqRb9Y+szk2sUDSM9vztJ0yT0Jpoq2DxWEzFLyKRWFmaXG14HwpqSGsEmAksQY4
 /seosJyIR+e7DIAOYxRdyKxWldSl//7tolpeniE7tvPWpR1oGvzUeZPJLFVpT/dXRlj3
 L71fAeslj93v8ozF8MhiiMRApqllecomnmVJGrcVP1A5aWeHxppRTbj3SrheLtiDWobk
 G/nrb/jElVB79R4WIKvDL4cAA9YyEqF24Qf9SzFLlN380P6vjwcQYNFostaGNg4teFj6
 BcVHhU8lpbUtbo+AEHGuFn3K5fetNHkbJoymx4Kw9hQgNvVwQzosz6sivnb4Ldz1nRG6
 lX6Q==
X-Gm-Message-State: APjAAAVU5IHqn0SGsIIiAeJ6xksuQv55D5Ov1Z9A5lR9TEZNj5hjokoP
 ynREjNmLhXeY1BxwPN2K+9I=
X-Google-Smtp-Source: APXvYqyto1f+e+XXrgx2hfzX0J/R3QobMi2a2JpWlJshkaPmiljUHsQqipJuapeUAJ3JHqC7VXqJRA==
X-Received: by 2002:a63:5c7:: with SMTP id 190mr10076145pgf.67.1562407605846; 
 Sat, 06 Jul 2019 03:06:45 -0700 (PDT)
Received: from localhost (193-116-72-119.tpgi.com.au. [193.116.72.119])
 by smtp.gmail.com with ESMTPSA id t4sm19731457pgj.20.2019.07.06.03.06.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 03:06:45 -0700 (PDT)
Date: Sat, 06 Jul 2019 20:05:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v3 5/7] powerpc/memcpy_mcsafe: return remaining bytes
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-6-santosh@fossix.org>
 <af253c4d-8f0a-faba-77d7-3140358034f7@c-s.fr>
In-Reply-To: <af253c4d-8f0a-faba-77d7-3140358034f7@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562407411.6nsiykcmo3.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on July 6, 2019 4:16 pm:
>=20
>=20
> Le 05/07/2019 =C3=A0 23:26, Santosh Sivaraj a =C3=A9crit=C2=A0:
>> memcpy_mcsafe currently return -EFAULT on a machine check exception, cha=
nge
>> it to return the remaining bytes that needs to be copied, so that machin=
e
>> check safe copy_to_user can maintain the same behavior as copy_to_user.
>=20
> AFAIU, this behaviour is the expected behaviour for memcpy_mcsafe(). Why=20
> implement a different behaviour in patch 3 and then change it here.=20
> Can't memcpy_mcsafe() return remaining bytes as expected from patch 3 ?

+1

This approach might be useful if you copy an existing implementaation
exactly and then make some changes incrementally, but patch 3 is
already modified.

Thanks,
Nick
=
