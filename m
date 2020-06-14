Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B11F881B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 11:29:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49l8Lb4dq7zDqTD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 19:29:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WvtYMS/V; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49l8K11XjZzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 19:28:21 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id m2so5775446pjv.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=E61d0LRhqQuffQm3wvorBO9rJgQjrXpkF5cWiwhiwlI=;
 b=WvtYMS/VCZQGpXMiwvie3rods0URCWi/pqSEoCKYTL0fV5q2WunVcZNrEyAtdJJSWg
 THyGCKy+MtP1H0To0c5uwgAmi01avtcQM98gafyPFUVI474OklV+sLJbQAXMNOcFM5nz
 Q1VCvCEEsIdkGnnMXJz6DZp3x7PRDFuL0VDOTNAluq7h1litvvcXqyrZtVdw9WVXBQvj
 mPItRjshxcCfmbMcrkNPE/3OPmjLJmbRYUOCMVwrKZQWBhVYYfA2kGM0aKJAOKRykmhU
 t0Z/6HQwDMpbdwYhP/wwpXKgY+M38vI5BAjGCwW4e0UsVQZHOF/lkxS3hzJUgaXPzXHc
 6CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E61d0LRhqQuffQm3wvorBO9rJgQjrXpkF5cWiwhiwlI=;
 b=UPARd53JSvFt+H7C1Tllva2HXzOuq5IYJjz88JdqYfVipRQb7Ti4MYEO73sgqY4OyP
 NInmUZRpI7eXez7XlgAWCLigegL7IDfGC8YKlN3a0a72qhYGdQlLPEG4Chl768rA9Awt
 GewxvB5aIkOHxvpdE5PQ2FjeJqAodtc4QCweM1RaJ8IvTUbgU5ltGb0dlbMEquGUIda4
 cGgCP6qpAOm2RsE8D4m8YoMYV9a7EqrCZNETNIqZkX+mKxYC71+B/jYXfiYUKHJRRlil
 FDalGJ/CbaGAWayPon+ShI1sPvh6OHSI5o53jXDo21NjGMtAy6MnV27kQ8SbwtMtcOBr
 I95A==
X-Gm-Message-State: AOAM533wjQUmC4ZjSEPHwqi5sznSTqUqmd6wGy5MAktDtAPKqIXiMqHJ
 pTvCr9V4SH14z9kTVMktoVs6/Kwn
X-Google-Smtp-Source: ABdhPJyq5iXmxMeQIuw8fNZxhboaV2XfNEacjz4Yau/r8VmwO1pS/rNzYY/5rDmeRu9MBZqc67aQeA==
X-Received: by 2002:a17:90a:f993:: with SMTP id
 cq19mr7102952pjb.154.1592126897844; 
 Sun, 14 Jun 2020 02:28:17 -0700 (PDT)
Received: from localhost (193-116-108-230.tpgi.com.au. [193.116.108.230])
 by smtp.gmail.com with ESMTPSA id u8sm3167789pfh.215.2020.06.14.02.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 02:28:17 -0700 (PDT)
Date: Sun, 14 Jun 2020 19:28:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/4] powerpc/64s: implement probe_kernel_read/write
 without touching AMR
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20200403093529.43587-1-npiggin@gmail.com>
 <bbee54ac-63d1-3638-dce8-6a2bee66623c@csgroup.eu>
In-Reply-To: <bbee54ac-63d1-3638-dce8-6a2bee66623c@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1592126853.q8fphtdj5p.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of June 10, 2020 10:41 pm:
> Hi Nick
>=20
> Le 03/04/2020 =C3=A0 11:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is no need to allow user accesses when probing kernel addresses.
>=20
> You should have a look at=20
> https://github.com/torvalds/linux/commit/fa94111d94354de76c47fea6e1187d1e=
e91e23a7
>=20
> At seems to implement a generic way of achieving what you are trying to=20
> do here.

Yep thanks for that, I'll rebase this series on upstream now.

Thanks,
Nick
