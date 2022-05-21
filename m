Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F952F69C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 02:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4kYw2s7zz3btV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 10:12:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DF9rXyl4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DF9rXyl4; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4kYD5C7jz3bY6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 10:11:59 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so9059507pjq.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 17:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=EpZbDGoibj8tGGstkdp9xsv/QvfeG0bonh/Jv8ozBeI=;
 b=DF9rXyl4ZAyPIWla8fcnWMcJGhyFnlDnJQP4mYfPTfL5aNVZubO1MzzAjcvDLmaJHF
 HFEwIcbrmnP8GOzksjcnf+NnVoZTdHzI7EoJP82yUQOpyKXPmxTGQ7zWx+1ObC3a4nxH
 Rc2OIEew3pxGHzQjL7xWJN70NS0EM9gOvAX8bxrNjVZa8hmn1eIGvpQCy7gbkAgy2cGo
 KkdE5PyY0jrmkxUW386LWmQRhF9ZN1z6uHxku9ID0fW9ePIYWTzGmhzv3H2AUV/CkUrd
 Gc2voCdlU02C4SuVTmc7pJsbKu08fa86qaM5juxc1bNxP4GUHKBdPaIRLyO2GGJA3aKW
 BytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=EpZbDGoibj8tGGstkdp9xsv/QvfeG0bonh/Jv8ozBeI=;
 b=WAe2MUeHFdV8R99gLg4OCuLrJNkMk6+/4XOnzUwU042rojTbSfs48tsoH4Ja3HDn2p
 NcKlVNFOVhOv54BiJCalXiKdR3Q0aUAf4Qb7/vDXI4NzU07iJUGswfkJqDrmjy2zRN1/
 p5YOuA8AjW4s2G5ZpoZQvEGQZMnuzJBV2H3n1smnkmjGtYxGwWY6ey8nm8JAbArx8gpC
 p5EpGHXvigwNRtLzkIhR4eKriruA6zQblHDOYDyUq0cgXeYLh5SzAwMzGpAl6jgDH3cY
 KdMM9YXg7OIIpQ0n8bKyPuvGa6m3SxVqfN4AWVGD21c+65TufX39GmTBGH4VoKn+lm/Z
 DEJw==
X-Gm-Message-State: AOAM5307IFy+JMFdVIzA6rmDTroITg2WPNKkNgLj9kaoeZPxBocxzvzw
 G0Cco5BnC+eQjfOZqvUJBYzOw4vLuuY=
X-Google-Smtp-Source: ABdhPJxtYU9CB3MAK5KjQbmPHGn58pwydkt3EmZP+j32Lbn1ME1olOrDtxjMA2C0deF77w05ZolUPQ==
X-Received: by 2002:a17:90b:1e06:b0:1df:f977:804d with SMTP id
 pg6-20020a17090b1e0600b001dff977804dmr6129539pjb.120.1653091914877; 
 Fri, 20 May 2022 17:11:54 -0700 (PDT)
Received: from localhost (124-171-74-249.tpgi.com.au. [124.171.74.249])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a1709029b9700b0015e8d4eb2c0sm279342plp.266.2022.05.20.17.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:11:54 -0700 (PDT)
Date: Sat, 21 May 2022 10:11:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC Linux patch] powerpc: add documentation for HWCAPs
To: linuxppc-dev@lists.ozlabs.org, Paul E Murphy <murphyp@linux.ibm.com>
References: <20220520051528.98097-1-npiggin@gmail.com>
 <c1f6c6c9-4cc7-0dcb-360d-9ae0df6378b4@linux.ibm.com>
In-Reply-To: <c1f6c6c9-4cc7-0dcb-360d-9ae0df6378b4@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1653091346.1a5h1ae3pd.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul E Murphy's message of May 21, 2022 12:21 am:
>=20
>=20
> On 5/20/22 12:15 AM, Nicholas Piggin via Gcc wrote:
>> This takes the arm64 file and adjusts it for powerpc. Feature
>> descriptions are vaguely handwaved by me.
>> ---
>>=20
>> Anybody care to expand on or correct the meaning of these entries or
>> bikeshed the wording of the intro? Many of them are no longer used
>> anywhere by upstream kernels and even where they are it's not always
>> quite clear what the exact intent was, a lot of them are old history
>> and I don't know what or where they are used.
>>=20
>> I may try to get these descriptions pushed into the ABI doc after a
>> time, but for now they can live in the kernel tree.
>>=20
>> Thanks,
>> Nick
>=20
> Thanks, this is really helpful.  I've been caught off-guard by some of=20
> the subtleties in the meanings of these bits at times.  I think it would=20
> be helpful to share what is implied by the usage of the word "facility"=20
> below.  It would resolve some of my questions below.

Yeah that's probably a good point. In the introduction we can explain
that the facility is a class of instructions, registers, and behaviour,
but that the specifics depend on the ISA version.

>=20
>=20
>=20
>> +PPC_FEATURE_HAS_ALTIVEC
>> +    Vector (aka Altivec, VSX) facility is available.
>=20
> I think "(aka Altivec, VSX)" might be more accurately stated as "(aka=20
> Altivec)"?

Yes VSX is a thinkso, should be VMX as pointed out.

>> +PPC_FEATURE_HAS_DFP
>> +    DFP facility is available.
>=20
> Maybe something like "Decimal floating point instructions are available=20
> to userspace.  Individual instruction availability is dependent on the
> reported architecture version."?

Yep, we can cover all these with a note in the intro.

>> +PPC_FEATURE_HAS_VSX
>> +    VSX facility is available.
> A small reminder the features are also dependent on architecture version=20
> too might be helpful here too.
>=20
>=20
>> +PPC_FEATURE2_TAR
>> +    VSX facility is available.
>=20
> Was manipulating the tar spr was once a privileged instruction, is this=20
> a hint userspace can use the related instructions?

It can be disabled with facility control, and I guess there was
some consideration for how it might be used, e.g., "system software"
could use it for its own purpose then clear the bit for the application.

In practice I don't really know what makes use of this or whether
anything sanely can, it's marked reserved in the ABI. Would be=20
interesting to know whether there is much benefit to use it in the
compiler. The kernel could actually use it for something nifty if we
were able to prevent userspace from accessing it entirely...

>> +
>> +PPC_FEATURE2_HAS_IEEE128
>> +    IEEE 128 is available? What instructions/data?
>=20
> Maybe something like "IEEE 128 binary floating point instructions are=20
> supported.  Individual instruction availability is dependent on the
> reported architecture version."?

Right, I just didn't know what architectural class of instructions
those are. Is it just VSX in general or are there some specific
things we can name?

>> +PPC_FEATURE2_SCV
>> +    scv instruction is available.
>=20
> I think it might be clearer to say "This kernel supports syscalls using=20
> the scv instruction".

Yeah good point.

>> +PPC_FEATURE2_MMA
>> +    MMA facility is available.
>=20
> Maybe another note that specific instruction availability may depend on=20
> the reported architecture version?

Thanks,
Nick
