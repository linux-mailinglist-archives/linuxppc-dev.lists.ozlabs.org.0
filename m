Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C427D45EB87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:27:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0rXw3nyyz3c9h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 21:27:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gr08mkKv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gr08mkKv; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0rXK6gFvz30BM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 21:27:11 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so7684138pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 02:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=jAzbhlOoy1JOJ624doMMI0Mtdl/7EbgNmQhsfM7Bxok=;
 b=gr08mkKvtdEsvn8m83pu+9HnHyQtdndqIRX2Qi3rqrWQMqXDViPNtsXLARUkvLx/mz
 rGX0idp+0I52wccrn2Nbvb8WJEkW+qZHZLXs4wVOJZedzOaawrY8UlvDfN3JRylNHXdb
 FcppdAw13ZlaMrMXHk9EI4JrsZA6VohKXH3olTKiHWuN//iWWWaTjFp2tu9xj1KopInZ
 2wBvqW28rEzaqjox/cMp7hGkUwoCjRH1ak8NoTajXs/QSCB/P2/Mu+RJX8CE9zVPPd3u
 UISPgqSnoI2VnubvkcLOp4bWmLu2ljU/A5nd4JBMKBxkDzWe1pRq7sIVZ8KWeZ1ha1GG
 yfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=jAzbhlOoy1JOJ624doMMI0Mtdl/7EbgNmQhsfM7Bxok=;
 b=V2ucVrSJVsUTGOjO3CYx6IaSBFXyi9x9TqdQnqQa1N9uriibAs+vja6jqXii8Y4R1K
 kUfSyteypobSjkVFRlBm0kNUaZEsksMmFgOLzhtBQ2elozyf/0YIlDt7GYFxU1l7nlUf
 rf/W12573Ss+RkX9kSQCxfvgebiqvBmgMCjyVhNgMTSslkiJoib/0g+l008b7KF+uKNV
 QIcv3xWnPilNe3+aCNgtcF8i2FZc5iiz4435Adga0YcR1abGklbhKC6Evg2IPEI560kp
 e/wTtNL5SxLqHx0qpGssmztX+gp1ur/6xDIdWqKaXNSmEALGs/KORpEtau1e5lCdevcS
 37Vw==
X-Gm-Message-State: AOAM532xAU526VEcKxUzIYsaeYsqdLzqco41nKfWL6I1peoWds0O3P2a
 /1iV9vf4VVAuIJpvi5tvn631ghPS8DE=
X-Google-Smtp-Source: ABdhPJyTRhifvOn7uVvPyCtWTrMJ9IvmLHUe7XyNUVxHABAJB5E6L37FL1/HnC/LU17YKjrR1nLU9A==
X-Received: by 2002:a17:902:ce85:b0:141:de7d:514e with SMTP id
 f5-20020a170902ce8500b00141de7d514emr37492628plg.0.1637922427720; 
 Fri, 26 Nov 2021 02:27:07 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id d19sm4552038pgi.11.2021.11.26.02.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 02:27:07 -0800 (PST)
Date: Fri, 26 Nov 2021 20:27:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/code-patching: work around code patching
 verification in patching tests
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211126032249.1652080-1-npiggin@gmail.com>
 <f9e53405-b5b9-15d1-eaf9-0616a5b87424@csgroup.eu>
In-Reply-To: <f9e53405-b5b9-15d1-eaf9-0616a5b87424@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1637922388.sidg5s6in4.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of November 26, 2021 4:34 pm:
>=20
>=20
> Le 26/11/2021 =C3=A0 04:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Code patching tests patch the stack and (non-module) vmalloc space now,
>> which falls afoul of the new address check.
>>=20
>> The stack patching can easily be fixed, but the vmalloc patching is more
>> difficult. For now, add an ugly workaround to skip the check while the
>> test code is running.
>=20
> This really looks hacky.
>=20
> To skip the test, you can call do_patch_instruction() instead of calling=20
> patch_instruction().

And make a do_patch_branch function. I thought about it, and thought=20
this is sligtly easier.

Thanks,
Nick
