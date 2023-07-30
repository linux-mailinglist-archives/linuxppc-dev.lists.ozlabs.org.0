Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A37D7684C2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 12:11:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=j63J9JaS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDHFz66ylz30fs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 20:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=j63J9JaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDHF40jb9z2xVW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jul 2023 20:10:29 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso3549058b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jul 2023 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690711824; x=1691316624;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vbeat7gc1TyWboucLMJalCXXcPp9smqPJ03/W7eXSI=;
        b=j63J9JaSlJIUF3sFV5WmTAMBIoHyYuOkNwkIpkJTij4KBS5mab7ZUiy4LAXSDDwkUj
         LITuA89SuPsgaXdTI30Xl/ZwvNJ2BLYgJzqaOpYct9U3vCLGDmwTojfwiRMHAGdvkRHi
         yXwztAWCc9t7BqvzcVqOM0pv+DEDOXU6lj/k6VRQsLJ+GBtKxUfgJJqGMhNBLWxQGP0S
         p7w2dZa1BOxcALrAsaE/rM9HMzAWOYitun0k8v+waZx/mZaLvqLUDzUKdwFUQMVR3HDC
         kFTyeEkCTJgF0JD6E6b4T9sdWWeV0YL1dxH0IUOEDgNE0CO2eZgxXu+O8robTjfCAy53
         W6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690711824; x=1691316624;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7vbeat7gc1TyWboucLMJalCXXcPp9smqPJ03/W7eXSI=;
        b=R1inPmuximOjsYMVh/69kQAEr8tSQYmKpT912s9JxYk9F+OTlgr4K5BuoUbyixz9qw
         V95iUfWdhoO2SRWO5xYbmYEZYGA1xLjov/lS6dPoOmoet59lA2d0X+oOe9VuDSy+QW78
         HktO7KDtkd23MP+HkybOkuwzNdu9FKWKuYtstvyxDnJ+u11vjkGia1xSjFfE57/LpYM5
         nd3VxjyxSA5hupc8yKb2U+HtpjoXD5IpSVquT4n+++3tUM4nSxZsrIo2LL6DYXfR5NBG
         mTuf0PDnbZQ3mt7SBIGQEb7LbCDWGihkseox+FB0SK/+v7y9DfcZQHzYR2jYu5ih0w2A
         egbg==
X-Gm-Message-State: ABy/qLbxlSqUdu4qI5FKRH4Yd+jKsPFGJJXxjCvSa1cvC2/ZqoxIKni2
	86OKJhil8dt5Bci9/8u4eNs=
X-Google-Smtp-Source: APBJJlEBrgkD2QYBcps3fbNIU4lA96u0yMPXej/dwdD6CAG3iCQPZaRyytvsoXRZeACgNm5t1xfbuw==
X-Received: by 2002:a17:902:e542:b0:1b6:6f12:502e with SMTP id n2-20020a170902e54200b001b66f12502emr8710163plf.49.1690711824038;
        Sun, 30 Jul 2023 03:10:24 -0700 (PDT)
Received: from localhost (110-174-143-94.tpgi.com.au. [110.174.143.94])
        by smtp.gmail.com with ESMTPSA id jh22-20020a170903329600b001a6f7744a27sm6426015plb.87.2023.07.30.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 03:10:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 30 Jul 2023 20:10:19 +1000
Message-Id: <CUFFBJ9KF120.11CLOEQAA477Z@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
Subject: Re: [kvm-unit-tests v4 00/12] powerpc: updates, P10, PNV support
X-Mailer: aerc 0.15.2
References: <20230608075826.86217-1-npiggin@gmail.com>
 <f2d4d019-4a77-7ba9-d564-6e39b194a5d8@redhat.com>
In-Reply-To: <f2d4d019-4a77-7ba9-d564-6e39b194a5d8@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jul 3, 2023 at 11:27 PM AEST, Thomas Huth wrote:
> On 08/06/2023 09.58, Nicholas Piggin wrote:
> > Posting again, a couple of patches were merged and accounted for review
> > comments from last time.
>
> Sorry for not being very responsive ... it's been a busy month.

Hah that's okay, I'll say the same thing. I was meaning to get
back to Joel and your comments but lots on all of a sudden, sigh.

> Anyway, I've now merged the first 5 patches and the VPA test since they l=
ook=20
> fine to me.
>
> As Joel already wrote, there is an issue with the sprs patch, I also get =
an=20
> error with the PIR register on the P8 box that I have access to as soon a=
s I=20
> apply the "Specify SPRs with data rather than code" patch. It would be go=
od=20
> to get that problem resolved before merging the remaining patches...

Thanks for this, yes needs a bit more polish. I'll try to get to
it now that qemu is mostly done for 8.1.

Thanks,
Nick
