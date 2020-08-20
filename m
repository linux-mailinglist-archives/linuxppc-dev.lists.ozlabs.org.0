Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127A24AC86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 03:07:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX6261YnmzDr1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 11:07:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M00R2O+m; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX60C1YR6zDr0N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 11:05:44 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k13so132305plk.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 18:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=NEf6Bb5leCGG4mi86lTnbwKKXzwAcCH2rolSX6TJDj8=;
 b=M00R2O+mX1JlpY37UndU5zv0Xqdhia74qy3zqNHIbGsn3QYO8hckYh1Grc+ymBrAGS
 MBEjmYBQw1ixajg+bEXPimWELsUktMfH27O1rijjlmaEgLRaU/SPiXn3CGR7z5eZ5wyI
 m47lOxn/tHT/3MdHidpd9IyuodrKNvj7kbxpMzhPpMU332TBASTa12voSuIhR5q8Lv5s
 morErGE2qIKWlOYW6YOjuXV4tLMNjtKrxp2NnzCDEmM9w/i0tfaByyrOY7OY8eVBO919
 Y1QGAnr7RJfO7gHGsptd5RPqBcJ3NnOCssZ6eQloIsyCKy0EEok93tXylycmsKSJIIdx
 UIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NEf6Bb5leCGG4mi86lTnbwKKXzwAcCH2rolSX6TJDj8=;
 b=T0essEPkcAap2CzYBCnDWNZ2jNlq+3PbhjRWydvP0Fy0VG9r3+PTxxt0KEi099OG5r
 tY2JHYsJ0Zfa05j4BulpyNxND4VfbGsI2Xf7LP+EcMC897K96U4u9FbvnOje6HmlYt38
 fH2uqIneHe2WwbjUNEKKVBkomtt15uU3HREt+PE3kPxUS5b6oun4v8ynIVXkqOeS6PNG
 yZitIhuh3+NVxaHw2AJKS6Ky0GJfhePjW1R85si3hek7G0C+Vr1N+5+wTgLZ++fqT5h/
 H2cesfIkUxKwLGYHwzRPR93uZRlzLMfRcSFcAKoHF2OyzIif8F2IOPIgALDm7YgzXyKd
 +9bw==
X-Gm-Message-State: AOAM531SYz0k260IsbNJJ5hvm4B2U1Z2yS7yODQkOeSJW191d06mwS+q
 ymkN+TdnrEiWIwMkLQzPsh2XImlPUB0=
X-Google-Smtp-Source: ABdhPJzHmnguW9y/vtKdZnmFFrNHCrMlNJOLxoP5ByzzUOCcxYHmA4/yV5zDuUEa3VBKn7m4CK+Grg==
X-Received: by 2002:a17:902:7609:: with SMTP id
 k9mr648837pll.187.1597885540511; 
 Wed, 19 Aug 2020 18:05:40 -0700 (PDT)
Received: from localhost (193-116-193-175.tpgi.com.au. [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id bf8sm218536pjb.4.2020.08.19.18.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 18:05:39 -0700 (PDT)
Date: Thu, 20 Aug 2020 11:05:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: remove PROT_SAO support
To: linuxppc-dev@lists.ozlabs.org, Shawn Anastasio <shawn@anastas.io>
References: <20200607120209.463501-1-npiggin@gmail.com>
 <0c74bf2c-beff-c13a-7cfc-83b7d0433963@anastas.io>
 <1597733955.vlt37n2lw9.astroid@bobo.none>
 <3c053cc9-751c-9899-79ba-1013af140148@anastas.io>
In-Reply-To: <3c053cc9-751c-9899-79ba-1013af140148@anastas.io>
MIME-Version: 1.0
Message-Id: <1597884765.je0wrw0hd1.astroid@bobo.none>
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

Excerpts from Shawn Anastasio's message of August 19, 2020 6:59 am:
> On 8/18/20 2:11 AM, Nicholas Piggin wrote> Very reasonable point.
>>=20
>> The problem we're trying to get a handle on is live partition migration
>> where a running guest might be using SAO then get migrated to a P10. I
>> don't think we have a good way to handle this case. Potentially the
>> hypervisor could revoke the page tables if the guest is running in hash
>> mode and the guest kernel could be taught about that and sigbus the
>> process, but in radix the guest controls those page tables and the SAO
>> state and I don't think there's a way to cause it to take a fault.
>>=20
>> I also don't know what the proprietary hypervisor does here.
>>=20
>> We could add it back, default to n, or make it bare metal only, or
>> somehow try to block live migration to a later CPU without the faciliy.
>> I wouldn't be against that.
>=20
>=20
> Admittedly I'm not too familiar with the specifics of live migration
> or guest memory management, but restoring the functionality and adding
> a way to prevent migration of SAO-using guests seems like a reasonable
> choice to me. Would this be done with help from the guest using some
> sort of infrastructure to signal to the hypervisor that SAO is in use,
> or entirely on the hypervisor by e.g. scanning the through the process
> table for SAO pages?

The first step might be to just re-add the functionality but disable
it by default if firmware_has_feature(FW_FEATURE_LPAR). You could have
a config or boot option to allow guests to use it at the cost of
migration compatibility.

That would probably be good enough for experimenting with the feature.
I think modifying the hypervisor and/or guest to deal with migration
is probably too much work to be justified at the moment.

>> It would be very interesting to know how it performs in such a "real"
>> situation. I don't know how well POWER9 has optimised it -- it's
>> possible that it's not much better than putting lwsync after every load
>> or store.
>=20
>=20
> This is definitely worth investigating in depth. That said, even if the
> performance on P9 isn't super great, I think the feature could still be
> useful, since it would offer more granularity than the sledgehammer
> approach of emitting lwsync everywhere.

Sure, we'd be interested to hear of results.

> I'd be happy to put in some of the work required to get this to a point
> where it can be reintroduced without breaking guest migration - I'd just
> need some pointers on getting started with whatever approach is decided o=
n.

I think re-adding it as I said above would be okay. The code itself is=20
not complex so that was not the reason for removal.

Thanks,
Nick

