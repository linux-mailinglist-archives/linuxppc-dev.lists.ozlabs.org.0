Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 761FA19D57D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 13:07:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48txww3xDnzDrGw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 22:07:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QKJvx6WR; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48txtZ4kLjzDrfw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 22:05:39 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 22so3311964pfa.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=x9Gh9Ne5hehOj6WK8fXAryOv2SRTsZsEIVDa4lvYavs=;
 b=QKJvx6WRjaROA10YzVatzEwmmznxq1ITVAMtYv++ze5uDv6j6xOlVP/VNt6ue3kGoY
 RBLVfU2HTNBI9fO4q81SJ38mUb+pfV1StfjzDocjBaFe4AkswiIL76gv/peKsu2JzD0W
 0+EINrDhU3d/1Ow/OKrXq1kcha/YwfD+6mP0Bi4AiDj2RaC1OlBu3S6+62+lfuXER/0v
 MDVzsst4lRcxBrHTk08NVs+VpRMQcSD6TB5ad+yejWecUIOk1HJ8Z77es0Cw0/8+mgRy
 QndZDBm44syZEy6UnKyMzdFV34SZgn0K7pRuc1ueFiMSvVy0bgyCOcwNPZBctt+rJEDr
 VUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=x9Gh9Ne5hehOj6WK8fXAryOv2SRTsZsEIVDa4lvYavs=;
 b=CCT7BGm0PD2CZJ2FYu8Jfi2P7CsGwkc1bb49kVmYC9TfQ1AZ63O4KCFakCpm/5JsKR
 Yh2bVeRzECDF4lfMqfSQpiDv8mgIw08JUjWEv7ZtC1xneI5kb5gnX2BtGya1rsD9aph1
 e7JBPOzvW7+w1LiystFpV50+hj4A6T9z0MymtZ5OqkaqWx5b8+0Xw9gkfdQETDuL6jqO
 OB0qMBPFhtxhEAcC7ty4kVSq5BhEgWGhedHi7Q3IFcUN6kt9nBPpUuGdDRbITfCI7wIm
 KaFeBXAFTawfcjjzoCNcd6XdDa0GXNmJU+an3hiQBSyeljk/EXJq7M65Yf4yeSHQCXzu
 jZNA==
X-Gm-Message-State: AGi0PuYXSTv/w7DnubvDtg4Jjg1NmxAoXi/kaZXM5pbyFis8HoSkMRf9
 jVLY8OshXCk6DhuwLLVG9Ts=
X-Google-Smtp-Source: APiQypITP86igCzfZB/PGqJtrjO/2PRknSxfizUBsnugT9boahO/Sg8qOx8MOCUdCQzhs+hzbU239A==
X-Received: by 2002:a62:19d8:: with SMTP id 207mr8084940pfz.278.1585911937914; 
 Fri, 03 Apr 2020 04:05:37 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id w15sm5607378pfj.28.2020.04.03.04.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 04:05:36 -0700 (PDT)
Date: Fri, 03 Apr 2020 21:05:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/4] powerpc/64s: implement probe_kernel_read/write
 without touching AMR
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200403093529.43587-1-npiggin@gmail.com>
 <558b6131-60b4-98b7-dc40-25d8dacea05a@c-s.fr>
In-Reply-To: <558b6131-60b4-98b7-dc40-25d8dacea05a@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585911072.njtr9qmios.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 3, 2020 8:31 pm:
>=20
>=20
> Le 03/04/2020 =C3=A0 11:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is no need to allow user accesses when probing kernel addresses.
>=20
> I just discovered the following commit=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D75a1a607bb7e6d918be3aca11ec2214a275392f4
>=20
> This commit adds probe_kernel_read_strict() and probe_kernel_write_strict=
().
>=20
> When reading the commit log, I understand that probe_kernel_read() may=20
> be used to access some user memory. Which will not work anymore with=20
> your patch.

Hmm, I looked at _strict but obviously not hard enough. Good catch.

I don't think probe_kernel_read() should ever access user memory,
the comment certainly says it doesn't, but that patch sort of implies
that they do.

I think it's wrong. The non-_strict maybe could return userspace data to=20
you if you did pass a user address? I don't see why that shouldn't just=20
be disallowed always though.

And if the _strict version is required to be safe, then it seems like a
bug or security issue to just allow everyone that doesn't explicitly
override it to use the default implementation.

Also, the way the weak linkage is done in that patch, means parisc and
um archs that were previously overriding probe_kernel_read() now get
the default probe_kernel_read_strict(), which would be wrong for them.

>=20
> Isn't it probe_kernel_read_strict() and probe_kernel_write_strict() that=20
> you want to add ?
>=20
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> v2:
>> - Enable for all powerpc (suggested by Christophe)
>> - Fold helper function together (Christophe)
>> - Rename uaccess.c to maccess.c to match kernel/maccess.c.
>>=20
>>   arch/powerpc/include/asm/uaccess.h | 25 +++++++++++++++-------
>>   arch/powerpc/lib/Makefile          |  2 +-
>>   arch/powerpc/lib/maccess.c         | 34 ++++++++++++++++++++++++++++++
>=20
> x86 does it in mm/maccess.c

Yeah I'll fix that up, thanks.

Thanks,
Nick
=
