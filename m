Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560935272C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 10:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBXY73RN0z3c5h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 19:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=U9dwJtEZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U9dwJtEZ; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBXXh6Lwdz2xy5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 19:00:20 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id y32so3116580pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Apr 2021 01:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=wOijT//IMj59m8cCgG2XbQCTTHrerAFLfWPuTxOxNQY=;
 b=U9dwJtEZL6yIXnu7E0YCJFhKAGqRd869O7YQE6nSGk/Y4RsVE3jrjNgR2cPqN27K8V
 /hbcJjbcIeFWQv4/1Djt04BRi3vYMgNKgWU4B8wgSjUyRvSuiRWZo0Wb78mBYDXaJbQf
 1MbYrZ0AQaGNuy41ExumMPIu5oOmxbR8UQ6clyZiYKj0oOt1fu1ne7fpf7/IrlcIZxdY
 1x0Qbldfjjy2i5Agnwaw5gNZlZgF4U37zd1J4Ku+/pnEjgtIM1UcWI2StDmjhXdFde5D
 LA6RSHjHRaUNpTIHjl/sZzhrdH8BIrvlUfEQt8o0ZojU4zNYsji/Cj55j9ysSZMmtPQG
 148g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=wOijT//IMj59m8cCgG2XbQCTTHrerAFLfWPuTxOxNQY=;
 b=Y3tV3TjGrJ/6BFowzGcMzduNMdybUf1h1fqIm5xGy9MovR6eEIBja5g2NQZHQKpZRA
 GVfkI7h0CNrGgyOYeXaCmu6fDJD/Jxm5Ps1xNO+UVRoQ8ALyVyHvGPgCs8uxv6Vdzklo
 PG1TPIaK8zDEdU6IZN4iInjYmai8Ozg42aJaXM7SNX9//9IXLEqlK3d1unlKerbPc1Vq
 Cn1KX6NLC5iAdRoFjYFC7NnnpHSzhBK459EWvckRlF4OUfK63NTcuTRo56x0vOBldxr+
 tPpZ+yYbGXfN4MzY2bw9PuGDvpLcNSXDFb9rPh1LqdAzyS2NBQCGfzBlGJne6+sFGplf
 DHAQ==
X-Gm-Message-State: AOAM5318aRUK7zqRj4ZeyP5v9jG9OeLm8m6hzDtGynMbNU+12Z6F/qau
 +OTnsLkoMMXmm5pYxIvENdk+iPB7Ue3TIw==
X-Google-Smtp-Source: ABdhPJylQnFwxI5eOynUAw+T1LVXq4IwiQAM1TIM1+Ii/03Kq41sKr22GoatqweKN4jMML8iOEdI6w==
X-Received: by 2002:aa7:818e:0:b029:215:2466:3994 with SMTP id
 g14-20020aa7818e0000b029021524663994mr11398510pfi.48.1617350416333; 
 Fri, 02 Apr 2021 01:00:16 -0700 (PDT)
Received: from localhost ([1.128.194.255])
 by smtp.gmail.com with ESMTPSA id q5sm7045976pfk.219.2021.04.02.01.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 01:00:16 -0700 (PDT)
Date: Fri, 02 Apr 2021 18:00:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1
 processors
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210402024124.545826-1-npiggin@gmail.com>
 <0f41c067-7b9f-5b98-0993-c81cbaeea265@kaod.org>
In-Reply-To: <0f41c067-7b9f-5b98-0993-c81cbaeea265@kaod.org>
MIME-Version: 1.0
Message-Id: <1617350337.h91a37wruo.astroid@bobo.none>
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

Excerpts from C=C3=A9dric Le Goater's message of April 2, 2021 4:10 pm:
> On 4/2/21 4:41 AM, Nicholas Piggin wrote:
>> Starting with ISA v3.1, LPCR[AIL] no longer controls the interrupt
>> mode for HV=3D1 interrupts. Instead, a new LPCR[HAIL] bit is defined
>> which behaves like AIL=3D3 for HV interrupts when set.
>=20
> Will QEMU need an update ?=20

Yes you're right it will, we need to do that.

Thanks,
Nick
