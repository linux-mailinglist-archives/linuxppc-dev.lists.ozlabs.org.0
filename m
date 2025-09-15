Return-Path: <linuxppc-dev+bounces-12252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE726B58473
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 20:21:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQYJ750sHz3chv;
	Tue, 16 Sep 2025 04:21:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757960471;
	cv=none; b=Cy6W5ZA80zHSDDyxVxcjlEqP8RfD2s7gx4ymhUhYOJ6TdWZbF50umxcLtxxJqD1KglU/jE8cn7nv77URiIxvYruEtJvdgTTN0wIQKwxreVYNn+njyCXy+U6dpoNEwaJVeCYEXZ7H5H4mj66pKZ5t2ut1e0aedJPXGwdCodFL3Ta7rSmxd5qVqLvbmcKOxYbP0p4QJy8Op9OhUp5BmM4T24P/iOyNnh9duTO3+dOJD6qg1U9wfTf/G2S9LwwGi4RZ76z22s9cZlUTyMlmY8hcupbRWqeCbK4C29Me3eTS0kIWKjDKfVP5Okg1R7LK5MXhH4Hc1jsg9vkVaMTqqOdLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757960471; c=relaxed/relaxed;
	bh=D+GliT1Pd8d53HWEdMQBU1YHyq1rnSI3P+2j/fil2q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5zPt5tElvORmVF3jFTW88HIryibXO0qIfCah7CpNS51rDbmykDpse2zeR2f0E5pBZwRVfG2hTeU3NTpg4REDwAEt+l2PZKDNvd5TXV0IYNRnVEazvHdMdVBLvMUXpvqatfSpTN1QtdudqaO+igVR1461JUpl6K7OsAjUFBwUniYbd353vXsiPTntFnIma9xPNvdZtRZm6qnNORnCzgMXBmCLQmc2U7Ma4dg2jJx9CaEmxZNFqQrPxn7JuYgSd4J+Wweo7NJgA74z7tMiYzdF1oguR2no59Sknc4v3Z1xkSgdRVeK3PIxItbgH6+HnrqGX/hLWmmoSZtjp5wB1niQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TFs/NJU5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=sunjunchao@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TFs/NJU5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=sunjunchao@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQYJ70Flwz3cgQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 04:21:10 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-72e565bf2feso31443017b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757960469; x=1758565269; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+GliT1Pd8d53HWEdMQBU1YHyq1rnSI3P+2j/fil2q0=;
        b=TFs/NJU5vQ10sMQxC3odp3S0aQ0kkMGIGVLz/D1xF8btf+AygCfYdVOm8U0fakanb1
         SqsC7sCJXee95a7rKquiwQ2TtlWDwS1fkixV1HMYQYwHAxBcrP3uOJe4/CpZ61viG3sp
         hfE4lKB3NTYXsKcntQvvYYaY8ot1lm0cDqMtbnMbbno93E2CVhEIc1/3qhvxa0FRFmPP
         r8vZz31lg48uEMdSRkh+YsrMDV6mLgkVHLKsgQjpj/qbFhO6oCOxBqiAMsqXSLQNfpcj
         LH3WgLASKFxtc2gt0X6CZZEkpELbaoNuEL9r+MQLCMOkO8K6Pq4HVk+pxGldvs64eDnY
         O8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757960469; x=1758565269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+GliT1Pd8d53HWEdMQBU1YHyq1rnSI3P+2j/fil2q0=;
        b=NuuYvzf4G0vWakZWE5vs6tVyYYvvFXAT/vvTKca000vKNMuSUV1Q6nMfTMvemie1kz
         QDXCS6ONcYWLqDrHXRL9VCdbe4s1YJcfXP45MbC3jKIW8jqNpnXYOzD7SxWdUgFJJLoE
         UvHN8ENfkkSNlAwyN4fQk02VsoGquF0QjhR6kPbGTo4wR3nprG1gD5uWiCbYE64UAHD9
         KYXVANq6gi7pPW/SkdZyohuSrHa77OH15UFbouM+Mz/0npYQrhhboQR44wwrGNFPwmwW
         SDrUpPr/11m0TabdGjBEntA//MOd++yE3B4WKcnr/6FrUYp378iveMMloemfslCwHXor
         0cQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbgv8NMBT+xOhO/t5eMw72BVdLop5raMWatHvMj53YBlASmmH84L7kpVOuJOVEomvAuoyLpJiR6nA236k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz58WluXmLhi6w4+MM1ux86Q1YbiQmgtH4/1YsvtbuuUQ03vzud
	MfuJMaS0nYSUDCIfcSkiZ+uLOAmuNZcxOJiHAcD62NO49iLInPaUPcNxm2j42pO+Z5uQqdk9+q8
	D5NhyNDCJE2AWPeZgKKV+U4oskvGLH1Bb8tSWJTd3/A==
X-Gm-Gg: ASbGncsZd/q+YcupU2s/V2jMuBeYzmWLiO6SvqWliMJpbDIijFquZGRdl+W7XrhRTM/
	x3Vfw6dV7bSTAiCavaYKEozWguzm3R1XhxwbnlPwf5FQKNjJ0ARpAhboAZEGiWfVrPdj81tT550
	3fOatoC4Bu3BThWSttvbkqXs9cAN40Yv6HToHOss5vm2eiEO84mGNkQSHOYt6S+IiABxGP7M91P
	KmXbB7Rj6yumA4=
X-Google-Smtp-Source: AGHT+IEDp5ZYxkbjon4yCrRZanz3ywO+1Dqvmg43vzDGc4l+oL6FL33NrpAa1korZr0/WJwLYzGBFv1kfMtD4v4LVjo=
X-Received: by 2002:a05:690c:9c0c:b0:71c:1a46:48d5 with SMTP id
 00721157ae682-73063480b69mr133022797b3.21.1757960468639; Mon, 15 Sep 2025
 11:21:08 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com>
 <BAEAC2F7-7D7F-49E4-AB21-10FC0E4BF5F3@linux.ibm.com> <CAHSKhteHC26yXVFtjgdanfM7+vsOVZ+HHWnBYD01A4eiRHibVQ@mail.gmail.com>
 <240A7968-D530-4135-856A-CE90D269D5E6@linux.ibm.com> <20250915142612.1412769A80-agordeev@linux.ibm.com>
In-Reply-To: <20250915142612.1412769A80-agordeev@linux.ibm.com>
From: Julian Sun <sunjunchao@bytedance.com>
Date: Tue, 16 Sep 2025 02:20:55 +0800
X-Gm-Features: Ac12FXz4gtGN6Jqt9p3sI4NDKpM8RKfj3WgCz5dLwYdzbiuc_wRBtKzbSNJCafg
Message-ID: <CAHSKhtc-514tQoyCSukK1sLbDbc+Ne_TnwEks-h+gQWv8ZKHOA@mail.gmail.com>
Subject: Re: [External] Re: [linux-next20250911]Kernel OOPs while running
 generic/256 on Pmem device
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Venkat <venkat88@linux.ibm.com>, tj@kernel.org, akpm@linux-foundation.org, 
	stable@vger.kernel.org, songmuchun@bytedance.com, shakeelb@google.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mhocko@suse.com, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, riteshh@linux.ibm.com, 
	ojaswin@linux.ibm.com, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	cgroups@vger.kernel.org, linux-mm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Mon, Sep 15, 2025 at 10:26=E2=80=AFPM Alexander Gordeev
<agordeev@linux.ibm.com> wrote:
>
> On Mon, Sep 15, 2025 at 07:49:26PM +0530, Venkat wrote:
> > Hello,
> >
> > Thanks for the fix. This is fixing the reported issue.
> >
> > While sending out the patch please add below tag as well.
> >
> > Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
> And Reported-by as well, if I may add ;)
>

I'd like to but I will resend the whole patch which is used to address
another issue.  Thanks a lot for reporting anyway =E2=80=94 it=E2=80=99s ve=
ry helpful!
> > Regards,
> > Venkat.
>
> Thanks!


Thanks,
--=20
Julian Sun <sunjunchao@bytedance.com>

