Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9C5758F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 03:01:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkY2z5GWKz3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 11:01:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MuHMvYw7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MuHMvYw7;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkY2N2MS5z3bnj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 11:00:59 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id fz10so4314154pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 18:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=Kg46N3kmwcOLg4EzYlkWBNcVyLxfrVU220KO8UaaL84=;
        b=MuHMvYw7mdZ7Yu6Xg4M1hr8LbB3y44cEAlzzcT1LUWWsJMdwMXWLSwdefqArUIlFlw
         gMEmMRw5K98A8xMyOHungjTYZGbiELlPNhyPQHiUmVYBVngsV7VdPtM/3M/EUd0Is4vu
         omjnN6WUtcy/CR0azOBiiuRPlxxTvnU5AQcyJUgcp3nxWwr6Wz8dwsji4/b4QHD4w+eT
         RDuecMwNtqPcU6A/as6NLeHpk98ySFiKpoOb6WHkcdhKAnWHOfwSCSYMv6C++deddbDo
         VPHbq0bj0FH7xpFbc8ET4N8Agte25jpui2qJ/EdQJ9fO6DdXSo9KpwOVmTlgQEV1Qqnv
         TaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=Kg46N3kmwcOLg4EzYlkWBNcVyLxfrVU220KO8UaaL84=;
        b=cQ+cGQVxFGs/qO+FQpnjVzqFKaUk1xJBXoAJUSWfrhyaCd8B0rk19ZnNZtFc/MqkuS
         iGEBqLJQK+foZCpG1ji0ZroGIYltxFbQgtoUxdp/skvl1yc7nJs2iLxQnse6JzEgtuwU
         tdlcUusCi7Sw16s8iyQdPE0okdS2Zopk52dv7e4kfBnVTuK3wBazWR3bLMdEUw2DQ+TP
         /26+pg+GKWqzqYTWZJI419IwWGv9IGs9FSBoaaI1cdlAxpKlzPPxSFOcYioxwvgbsJZP
         m9SMuk03GhoTN+t4/17CHernqZ32lD02EJ19MdVibwFAD4lu/j0i4hySvwOTXMOMc8Tf
         hNmg==
X-Gm-Message-State: AJIora/9tb7Fn2OO/zb+RfVLUYvoDLNsvIL7hu7lt8q5A+W6a2hlLmnj
	IEpQMVkIg6ceIt7v5FBZKL4=
X-Google-Smtp-Source: AGRyM1vLDkZcNf2vhjFAHeoowKsrRchKAA21wNj+h/XwZFTKCNFTJ4uvruc5zfSNiPt7ixPUKASMUw==
X-Received: by 2002:a17:90b:3c0c:b0:1ef:e647:ff48 with SMTP id pb12-20020a17090b3c0c00b001efe647ff48mr18744193pjb.173.1657846855140;
        Thu, 14 Jul 2022 18:00:55 -0700 (PDT)
Received: from localhost (61-68-63-70.tpgi.com.au. [61.68.63.70])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090a400c00b001ef7eb39be1sm2099619pjc.55.2022.07.14.18.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 18:00:54 -0700 (PDT)
Date: Fri, 15 Jul 2022 11:00:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH Linux] powerpc: add documentation for HWCAPs
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20220524093828.505575-1-npiggin@gmail.com>
	<20220524173814.GH25951@gate.crashing.org>
In-Reply-To: <20220524173814.GH25951@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1657845835.tt8ymcybhd.astroid@bobo.none>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Finally got some details about the icache snoop question so just coming=20
back to this now, sorry for the delay... (POWER10 does support the=20
coherent icache flush sequence as expected, there was some updates to
the UM wording but that will be fixed).

Excerpts from Segher Boessenkool's message of May 25, 2022 3:38 am:
> Hi!
>=20
> On Tue, May 24, 2022 at 07:38:28PM +1000, Nicholas Piggin wrote:
>> Thanks for all the comments and corrections. It should be nearing the
>> point where it is useful now. Yes I do think it would be useful to align
>> this more with OpenPOWER docs (and possibly eventually move it into the
>> ABI, given that's the allocator of these numbers) but that's not
>> done yet.
>=20
> The auxiliary vector is a Linux/glibc thing, it should not be described
> in more generic ABI documents.  It is fine where you have it now afaics.

It is already in the ABI document. In fact that (not the kernel) had
been the allocator of the feature numbers, at least in the past I think.

>=20
>> +Where software relies on a feature described by a HWCAP, it should chec=
k the
>> +relevant HWCAP flag to verify that the feature is present before attemp=
ting to
>> +make use of the feature.
>> +
>> +Features should not be probed through other means. When a feature is no=
t
>> +available, attempting to use it may result in unpredictable behaviour, =
and
>> +may not be guaranteed to result in any reliable indication that the fea=
ture
>> +is unavailable.
>=20

> Traditionally VMX was tested for by simply executing an instruction and
> catching SIGILL.  This is portable even.  This has worked fine for over
> two decades, it's a bit weird to declare this a forbidden practice
> now :-)

The statement does not override architectural specification, so
if an encoding does not exist then it should cause a trap and SIGILL.
I suppose in theory we could work around performance or correctness
issues in an implementation by clearing HWCAP even if the hardware does=20
execute the instruction, so I would still say testing HWCAP is
preferred.

>=20
> It certainly isn't recommended for more complex and/or newer things.
>=20
>> +verstions.
>=20
> (typo.  spellcheck maybe?)

Thanks,
Nick
