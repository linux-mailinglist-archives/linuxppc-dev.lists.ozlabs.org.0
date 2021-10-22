Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F4A4374CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbK2t4Z07z3c8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 20:35:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R8rZoP21;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R8rZoP21; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbK1t5RBrz3cP6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 20:34:42 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id r2so2778845pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=QW9KzLSZHZ20WilS502klfz/m1xB46Dl6bii7GtBi1o=;
 b=R8rZoP21hFYoA9/CEFHkw5GvJI6CydVItM5sqfOVktY9P1tcu9O/Hbkn5ep3AQpwK+
 yViP9sq+PBwRvdE0MODUPcYWL1p2DJB3v53f/Bc8AgTozEBAhzh/aw0jZxpddE2MhDFr
 zVi63cWGrhi2QtB7+F+/p4E181mVGyr8eUkArL13Exi28KXscqERAHPowRfu6LjV9DIw
 vT/qm0LIE5z8mNU9oMsLViVx/Sf/dgZdahumRYK5WNpTxbQrvmG8l/QcarLOYuv+qnJV
 /VVLLBXeD9qydOZTf31u9nOZfEp/WZ6Nz1LxkM7L6Eg3qBQs4tkOpIWRiyqPRC455mh8
 Vwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QW9KzLSZHZ20WilS502klfz/m1xB46Dl6bii7GtBi1o=;
 b=R8ZBAD/fojao6tOYI4SZS5FLCs9c/tS/dVR586OaUeqH2AF7MWTnJ1TZ6bUF1vTb4x
 8W2pmLoszI95J1iVj+CI0gVvK6UG7idi4csRqYCBCHN12XR8QkWzUcYQzFyDiRVpEKP0
 3pkTyX9p81N8cShpTIfO47kl603+E8RqCKGQKaF4qONis3FzxJnbHc89/+wi4AUEYXsV
 SQFG4stPFTfnGwwsbkHWs83gVGF0Atyl3CXSeV11Fdq38Cv8EiXVRzSTUuFa/GvX3MUy
 OBc+xM90bkBQvUPNlT6SxidYwdgwM6exjGbchwdfL620jejBwbHfvy20KAY2UpuRXZAJ
 f6yw==
X-Gm-Message-State: AOAM5337MJy5vxMRaMN8cPwTwXDf5CzgDX76QhlMNGP1YYL5k2AtO3oP
 IfahRS9QJs6pYoxnIyq1IYQ2m11kViRatg==
X-Google-Smtp-Source: ABdhPJyDNcaGq+QDuovBI8WgWDnd9rgzsXPb+02j6JSHACL6BHjprX4Q8ehz+e7BBcyXKJ+uGH5Ubg==
X-Received: by 2002:a05:6a00:138a:b0:44c:b200:38d7 with SMTP id
 t10-20020a056a00138a00b0044cb20038d7mr11142159pfg.5.1634895280212; 
 Fri, 22 Oct 2021 02:34:40 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id v11sm7523276pgf.69.2021.10.22.02.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 02:34:40 -0700 (PDT)
Date: Fri, 22 Oct 2021 19:34:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 18/18] powerpc/microwatt: Don't select the hash MMU code
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-19-npiggin@gmail.com>
 <85899425-a0cb-7163-7c9c-5ed39a64f8c1@csgroup.eu>
In-Reply-To: <85899425-a0cb-7163-7c9c-5ed39a64f8c1@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634895262.apmr0vspb5.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 22, 2021 5:18 pm:
>=20
>=20
> Le 22/10/2021 =C3=A0 00:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Microwatt is radix-only, so it does not require hash MMU support.
>>=20
>> This saves 20kB compressed dtbImage and 56kB vmlinux size.
>=20
> I think patch 17 and 18 should be squashed together.

Okay will do. Thanks for the reviews.

Thanks,
Nick
