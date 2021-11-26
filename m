Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9945EBA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:31:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0rdc2Nj6z3c6m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 21:31:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V3M31PqK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V3M31PqK; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0rd16sMwz2xnb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 21:31:17 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id x131so8499721pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zQCbbZWjAORYJRuTWIme2ylQk/0CIwG5L2sfdHUWp1M=;
 b=V3M31PqKPNni3g4YDIFWObta0+4lho7U1zg/A3F0wISM8WBuHcpDxjoOCbcIu2xGmY
 qrGLFWSPFXhSFJVoqf79Y2jucjbi7V3UnBhMsUQ78TcSyRzOl8hQaBzLR0RmP1qmp/Gc
 9rxQpkP3iAPqmc5a6ag4fgV2kqY4AhqXF0JgbFZikZOIhe2ScipwXetJWG2/Zf9mJCFM
 007R5/v7eE9abiAOVtvvONLom385Eb3YyibzkYOZoEp6CTVeF4Yj8VoxNWijpeBcB/FD
 hgYJzksVtuB1ZGn8VSWRYrnDnG9/fm8A+/7UNt0iWeOdtkxCm5davEpGNIWF5IRT6yOK
 B1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zQCbbZWjAORYJRuTWIme2ylQk/0CIwG5L2sfdHUWp1M=;
 b=uVcqKC2SNU9F3u56RLWEpzp2h6cX88Zlca42Q5asQyMSwkDfXsEl6rvIoaxRcNI/cW
 sM1Lb0Tmxl30uca//pPoZC6/1WhjhyoGPSyq2Lfy+cVCQIlVAkuQ76TP2jhSzf+JfZhB
 MNXlowngBTGVjtPe1stDgzatB1cPbZDNZgtMAokYvY5nBx2/ukGLE29J/fdlwQmaPK/k
 rqUwAcDeS7iyXDO1QGyJ8PeJE/HBgzLMr3ZVGtJI5HBWUKq25Ea8GvljvJnIGNd00sUz
 gQfR/PmHegtEbVl43UjHTG1gQRdwdJy/8hSISp6SSoEsXBEQlGDQRYEQ+DSINBWxJ0rD
 oq9A==
X-Gm-Message-State: AOAM5306npsCZXhUeSK8XjAAvc8x4NpNrjw0cHyyMigKKlz7oI0yAa0p
 CoqWXqHgZDhjfG7PpsMOUTqiZ8RFgyE=
X-Google-Smtp-Source: ABdhPJxh2lzb3EP+vl3WABBTRVW8mRPixcy0y/ObcpLDhQMk70UZtFGa93Ba8fGK+DpkjZvPJPHY5Q==
X-Received: by 2002:a05:6a00:1584:b0:49f:e5dd:f904 with SMTP id
 u4-20020a056a00158400b0049fe5ddf904mr20545823pfk.55.1637922675129; 
 Fri, 26 Nov 2021 02:31:15 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id rm1sm10873799pjb.3.2021.11.26.02.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 02:31:14 -0800 (PST)
Date: Fri, 26 Nov 2021 20:31:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Don't print an error when VAS is
 unavailable
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20211126052133.1664375-1-npiggin@gmail.com>
 <43d21c1a-9122-d698-2229-e56c77a91313@kaod.org>
In-Reply-To: <43d21c1a-9122-d698-2229-e56c77a91313@kaod.org>
MIME-Version: 1.0
Message-Id: <1637922573.8ofrolskkj.astroid@bobo.none>
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
Cc: Haren Myneni <haren@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from C=C3=A9dric Le Goater's message of November 26, 2021 5:13 pm:
> On 11/26/21 06:21, Nicholas Piggin wrote:
>> KVM does not support VAS so guests always print a useless error on boot
>>=20
>>      vas: HCALL(398) error -2, query_type 0, result buffer 0x57f2000
>>=20
>> Change this to only print the message if the error is not H_FUNCTION.
>=20
>=20
> Just being curious, why is it even called since "ibm,compression" should
> not be exposed in the DT ?

It looks like vas does not test for it. I guess in theory there can be=20
other functions than compression implemented as an accelerator. Maybe
that's why?

Thanks,
Nick

