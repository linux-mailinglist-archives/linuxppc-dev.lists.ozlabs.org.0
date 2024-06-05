Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797148FC106
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 02:57:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lWmphl+D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8F54dPVz3dVw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 10:57:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lWmphl+D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv8DL03n3z3bqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 10:56:32 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f630e35a01so40496205ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 17:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717548990; x=1718153790; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9huCQo5OeMQ2GXZXH/PcOAOacIsXohZlshI/DLAZU3Y=;
        b=lWmphl+DX4+z8uOxhpbxbgRGH8pNFjODe9KHadRpGf2A3MHPxyEG1i5jM6QqzVLJaE
         aC/maX7AQmeVR0idM2swVyj0ACsIUCn+KJ51lbd8W2zW6ZyJ1tlh4fTcdaM438FvYwu0
         bqN1TM/hidKEBL4Tl+zCmdTFGtjpsOsWXAa95fTtApPfX42/WBMM8lfPopC1dvZTaClr
         3a+j0iOK80chK9GUk27v+WlIUydR9lmNqxM0ZwSTQQkUWA9WCdawV7t9iHbIqQb2OCDS
         Yu9uxJfBkuzAalmY1kHAWa58QO6kOj6Kfiznd15a32oyGBqYb5acMiOxSpabtnzQ+qiw
         0EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717548990; x=1718153790;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9huCQo5OeMQ2GXZXH/PcOAOacIsXohZlshI/DLAZU3Y=;
        b=lnR4vqPOT13KlXjpTutm6v/kxebh0hsVQm9I4P9Zjc1WnuQY80ruGcpRx3P+Zmu8+p
         SQFfxYd/mK2xJXD8tPtBKRsBZpMcBHEUZ+f/skMltEd+4W78r+fTcOprlYofIOhUG24M
         Yc7h2V1MkXyv4z31gVxh8Xq977EMhPbuom1csklefavrPRDHWORInyQrD/OOzw8ORSlr
         ZaBePe7XtkC9wEcCQ6dZXw/BILTwlQfwV+xiONbQRv1xtmHlGOP4wWYvWeot+lB2MuGm
         2jwPBwq8ZT5m3/VajFABPH8fGRzbk6lgLd/XqyVg8o+z1wR1bSydDLNsTUsv68HAvsF4
         m5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXMh1NleCi8rkal8igeu6JxxyCRe6gMa5Ycg7gD7hhhvR33MuOHILea9TYl9ZOo0+H8UP4A2D8Mk75ORWFIrkhWMasi4FEMKf+tn5Ms5g==
X-Gm-Message-State: AOJu0YzTKaOmTDWZUsRmGoDRlGe78hukCXTDCBuOT3aWbZRTa5tb1LvQ
	rtne8ETlCdzguNgoRQCkirZhIP7qYkhn5tbLGoO3iM3Jp6FIYworaDhq5g==
X-Google-Smtp-Source: AGHT+IFSpl4wPVJEy5u2D9rGJENCBEPO6VfjcqsxcBNhC3faz21X18sVaWwxbYFiyPgX03MuKJvycg==
X-Received: by 2002:a17:903:182:b0:1f6:6c52:7231 with SMTP id d9443c01a7336-1f6a5a0de72mr14897915ad.20.1717548989834;
        Tue, 04 Jun 2024 17:56:29 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6324115ccsm90454085ad.268.2024.06.04.17.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 17:56:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Jun 2024 10:56:24 +1000
Message-Id: <D1ROAUX2AA16.3V8OOJDK62KEL@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 19/31] powerpc: Avoid using larx/stcx.
 in spinlocks when only one CPU is running
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-20-npiggin@gmail.com>
 <d167cb31-11d4-4a0f-8b4e-056fc2afaaf0@redhat.com>
In-Reply-To: <d167cb31-11d4-4a0f-8b4e-056fc2afaaf0@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 4, 2024 at 3:27 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > The test harness uses spinlocks if they are implemented with larx/stcx.
> > it can prevent some test scenarios such as testing migration of a
> > reservation.
>
> I'm having a hard time to understand that patch description. Maybe you co=
uld=20
> rephrase it / elaborate what's the exact problem here?

Yeah that's wrong, "harness uses spinlocks *which are* implemented with
larx/stcx."

The problem IIRC was only testing migration of reservations, so I should
be explicit about that in the changelog.

You could leave this out for now.

Thanks,
Nick
