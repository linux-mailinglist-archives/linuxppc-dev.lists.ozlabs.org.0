Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B77363AD6FB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 05:22:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6LhG3cwyz3c0y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 13:22:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Idn92CI+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Idn92CI+; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6Lgr5dLmz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:22:15 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id x73so9181053pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 20:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3T7Odnlsnem8BkJlC2xSfftmUKp4jKXmmLUMcPJbBEA=;
 b=Idn92CI+h8pY9q7HPYIz/0jW5jkAufr8GnNY7FFeQORmQ9SmvmYuuchs68QAnUofxU
 j642JXTnUvarg9FzIqNT/YOT2fQI3R9Vtura966K0T4HlNM7dtsb10gmwK6VcTMp3+UH
 N3woyo0zlsbbqlXbiO6+9V/oLRxLtbCUU8bVcVwbj7h2lf9RNRXweiUkKF3GCEmHaSSH
 KafqbdAdbLJrLdIdcEZ2Kf4sRBTBdRNTPtfl5EytC4bp713rC04HrKsQeisymGVv+1GK
 5TyTIo1xfYdMRjh1/PaiAJ+KAoPzLTmFKNIQW+sBfs9FFviPd9f1vFvzcH2M65Vbtjlk
 DdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3T7Odnlsnem8BkJlC2xSfftmUKp4jKXmmLUMcPJbBEA=;
 b=s28c9lGvXayeWRRmpBQOCOo2wq8UDtPggD3n553BVr1/4Br3SLMF9Iwmom5Vk8mHQX
 XP0Ak5kPEix8zEXixiaStyQLmDA1YFVVrungYPLXhmXld/4ugdDhsT+9H8ImRp8+ZAB/
 Zqaqo0aVsVJjALa0VkT2vnadDcl64ndqwAwawjh4DAehj3gsY+C9wu51v/spFKOnmucC
 LrE3Urf4tMrzs1WBp3bJ5GLoWYFbGWAbts/m/Yt1FfpUV1PxUYKIaovm6Vl6EOcZ9uCq
 uj4qVyNv5qyzS5JOsKlWEwiLVNh/OUh8mqrAbhgPxD5Op2K8FIhrPqVawOYrcntTop/J
 ACKw==
X-Gm-Message-State: AOAM532X4rZKgi9b+WxNARbzGJ+2KYTmidtRHahjNvAbK8chC24yjb4w
 i92da+gF2tSgp+vuMKpeEOw=
X-Google-Smtp-Source: ABdhPJxXGfqiBU57ZsFrW4SrZNw5czQwAVUp1ykENVQ7Brhf201hESYNXZjgUGMvo2czRDaZpX0NhQ==
X-Received: by 2002:a63:ef44:: with SMTP id c4mr12840074pgk.162.1624072931781; 
 Fri, 18 Jun 2021 20:22:11 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id h8sm8736847pjf.7.2021.06.18.20.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:22:11 -0700 (PDT)
Date: Sat, 19 Jun 2021 13:22:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 12/17] powerpc/pseries/vas: Integrate API with
 open/close windows
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <e8d956bace3f182c4d2e66e343ff37cb0391d1fd.camel@linux.ibm.com>
 <1623971609.844odc55aw.astroid@bobo.none>
 <0d6ca1ec553a61b219f42ebf6699dd6c56e2e978.camel@linux.ibm.com>
In-Reply-To: <0d6ca1ec553a61b219f42ebf6699dd6c56e2e978.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1624072607.4axs4cpe7w.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of June 18, 2021 5:49 pm:
> On Fri, 2021-06-18 at 09:22 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of June 18, 2021 6:36 am:
>> > This patch adds VAS window allocatioa/close with the corresponding
>> > hcalls. Also changes to integrate with the existing user space VAS
>> > API and provide register/unregister functions to NX pseries driver.
>> >=20
>> > The driver register function is used to create the user space
>> > interface (/dev/crypto/nx-gzip) and unregister to remove this
>> > entry.
>> >=20
>> > The user space process opens this device node and makes an ioctl
>> > to allocate VAS window. The close interface is used to deallocate
>> > window.
>> >=20
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>>=20
>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>>=20
>> Unless there is some significant performance reason it might be
>> simplest
>> to take the mutex for the duration of the allocate and frees rather
>> than=20
>> taking it several times, covering the atomic with the lock instead.
>>=20
>> You have a big lock, might as well use it and not have to wonder what
>> if=20
>> things race here or there.
>=20
> Using mutex to protect allocate/deallocate window and setup/free IRQ,
> also to protect updating the list. We do not need lock for modify
> window hcall and other things. Hence taking mutex several times.

Right, at which point you have to consider what happens with=20
interleaving allocates and deallocates. I'm not saying it's wrong, just=20
that if you do credential allocation, hcall allocation, irq allocation,=20
and list insertion all under the one lock, and remoe it all under the=20
one lock, concurrency requires less attention.


> Also
> used atomic for counters (used_lpar_creds) which can be exported in
> sysfs (this patch will be added later in next enhancement seris).=20

That's okay you can use mutexes for that too if that's how you're
protecting them.

>=20
> Genarlly applications open window initially, do continuous copy/paste
> operations and close window later. But possible that the library /
> application to open/close window for each request. Also may be opening
> or closing multiple windows (say 1000 depends on cores on the system)
> at the same time. These cases may affect the application performance.

It definitely could if you have a lot of concurrent open/close, but
the code as is won't handle it all that well either, so there's the
question of what is reasonable to do and what is reasonable to add
concurrency complexity for.

As I said, you've got it working and seem to have covered all cases now=20
so let's get the series in first. But something to consider changing
IMO.

Thanks,
Nick
