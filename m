Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D193AD6FD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 05:23:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6Lhx1jdvz3c9P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 13:23:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DIK4FeNK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DIK4FeNK; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6LhX3wWFz2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:22:52 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so7036550pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 20:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6TdDLes2Gw5ionLs5FEcoq+qBpg/39isQHw8hmOU2DM=;
 b=DIK4FeNKIz4uCyjknxXRGeur2lOR4V6Rm15a9SC3QuG8+LEAXvJu/F4FUwHaev8Yo8
 ysyUTIRpWZLUXV5rhUDSGKfc0+2GSqtZkhOHf7HHmK4ijX97R3k5mkjCAtUIm/l+/CJN
 mOV+R1jkEWDQiyy4vqqQZXOLJQn1zQj/m9C4lXUXmNFyobuYc/T5CQ8sDPD53x8GNo+O
 BH9v2VW8TlG6JqB/pCd6rtoausxb04nCUwFtvVp4wDKEJoajRDyoXib/2StggY7vD86U
 DMWYrj19QZvxlLJ7aZQTvLrpUOueNo6HthLIfHhFbl8nTXpTvqZh8FzqX+RIoYH+EKPS
 JHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6TdDLes2Gw5ionLs5FEcoq+qBpg/39isQHw8hmOU2DM=;
 b=nCbYz/Jk0HYwPqCLm51ANLk6b1RYCezrexo8ecnKKnNjw3mSsqaBVY/3vlIkG1bQIz
 jUq3/S6gsWXykZ7obpKdU/H29Gt/wvFo8bU0+V2go6+qergxHgccH2DUO50ZBtIGezVq
 NiNN04gZbM7pZzoEwp7Ap829PgHMlw/Y65BpxCS5OhaZvR2pA53b09nGb4/8Bk9j016A
 QzgzxGMKDyXZ5NlNYbxxvA91uDpkL7tkoyA9uqIUtDtaiqinRJko+4NvxU+97TYCuHZf
 HfKaLTARwTnERo+BqAniJKAUDghSrJ7rOcl3zRXZr5Ji2M+1VqCnl/ptgmpOYlKUOfmh
 oCJQ==
X-Gm-Message-State: AOAM533RitYEfism9ce37STQbRqyEgoG1qDhWmYxAafgRiK9NuP9inPN
 0QjMrmWJ0LoctPtLhPosBLI=
X-Google-Smtp-Source: ABdhPJwOI/w4OXi61+N0pqTaQ2lOXCarNRIDwPwwwOCgihfmzYj4yCU8eDlQ17zFLpoz9uKa3wf7GA==
X-Received: by 2002:a17:902:6904:b029:fb:42b6:e952 with SMTP id
 j4-20020a1709026904b02900fb42b6e952mr7625233plk.16.1624072969252; 
 Fri, 18 Jun 2021 20:22:49 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id q23sm10014316pgm.31.2021.06.18.20.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:22:48 -0700 (PDT)
Date: Sat, 19 Jun 2021 13:22:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 13/17] powerpc/pseries/vas: Setup IRQ and fault handling
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <b8fc66dcb783d06a099a303e5cfc69087bb3357a.camel@linux.ibm.com>
 <1623972635.u8jj6g26re.astroid@bobo.none>
 <a19e7839316c9ec4f7901e97b551fcf4219de82f.camel@linux.ibm.com>
In-Reply-To: <a19e7839316c9ec4f7901e97b551fcf4219de82f.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1624072930.d9ivbdzz50.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 18, 2021 12:09 pm:
> On Fri, 2021-06-18 at 09:34 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of June 18, 2021 6:37 am:
>> > NX generates an interrupt when sees a fault on the user space
>> > buffer and the hypervisor forwards that interrupt to OS. Then
>> > the kernel handles the interrupt by issuing H_GET_NX_FAULT hcall
>> > to retrieve the fault CRB information.
>> >=20
>> > This patch also adds changes to setup and free IRQ per each
>> > window and also handles the fault by updating the CSB.
>>=20
>> In as much as this pretty well corresponds to the PowerNV code
>> AFAIKS,
>> it looks okay to me.
>>=20
>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>>=20
>> Could you have an irq handler in your ops vector and have=20
>> the core code set up the irq and call your handler, so the Linux irq
>> handling is in one place? Not something for this series, I was just
>> wondering.
>=20
> Not possible to have common core code for IRQ  setup.=20
>=20
> PowerNV: Every VAS instance will be having IRQ and this setup will be
> done during initialization (system boot). A fault FIFO will be assigned
> for each instance and registered to VAS so that VAS/NX writes fault CRB
> into this FIFO. =20
>=20
> PowerVM: Each window will have an IRQ and the setup will be done during
> window open.=20

Yeah, I thought as much. Just wondering.

Thanks,
Nick
