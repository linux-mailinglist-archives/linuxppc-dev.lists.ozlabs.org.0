Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0D8113C97
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 08:47:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T79G4ltdzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 18:47:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="T4Z69q5B"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T76r4r4HzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 18:45:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575531921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLzWEpcaGa6wr1EPFEAf/c8lYv/KcVaU9tGJq04LnjA=;
 b=T4Z69q5B0pUkCLeRbvXTUy2eC4iMczRw8pnFFi/auB+ZcIsbrN24Ny7N2v7DQue4ZMDDl1
 Tsm6ewLSmeeNje2cW5QhzWK4AiFihIhrKacnPbkTWP4YdNtNdAtLxnwrPXx5Iwh0oHXOzr
 jfOhsG3CUGpog8VqaBOaKa31wlKrobE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-mR8DPW_zPGW4GrcNbu7aIA-1; Thu, 05 Dec 2019 02:45:17 -0500
Received: by mail-wr1-f69.google.com with SMTP id y7so363960wrm.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 23:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=SLzWEpcaGa6wr1EPFEAf/c8lYv/KcVaU9tGJq04LnjA=;
 b=gwFabBrPsgYisg0K+F/o9IW/HUglJiRvxVjOfl6kMj4LVc/SdUIHwXNLQOxmgqXHQT
 38lEXd7Hx5EncpV6zd0JkJ738FjZU5SmkUWDsM+vMpiAQ4OSwsTLkpODBjKyg0BMLOLX
 XsJot8Nhzo1xQOdegKLK60ebvKxCmbDfca/di33qqDXMmOqE1o8SNlRcd9ma/JIwxirA
 ejW8+AKFyWoacUhfH2dp1UXDjda7YpLtQuboXbIgwQZGALQNRZNj0SiyOa3okQMdoSy5
 V0nBgwT8fh1YG9b9ZOzsn5/ArRxOz78Xl7wxdCAW3h4nZoGBLflcJxmaIydauKg5jMcX
 qKpQ==
X-Gm-Message-State: APjAAAWTUk8b7gOATyPV5NH/oRlzP74MLxb9ll0jI4rMUvrXbLOHicjP
 vtGP3HwpcbNdCy23gy2OyhLkSekNDabtgl9JypTcOsRSv2gjkGtJzlXt+c9j66MO+194wWVLoEu
 fmybTQMxJQptma/0aY/++GB7jAQ==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr3499785wmc.81.1575531916746; 
 Wed, 04 Dec 2019 23:45:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqyblt0LQhJu2lbPkXSi/NOLkFJ0Nhe+YL7hP+cdrXAjP0Xv03YzI+OOYAz1OuW7MJuzWvri9A==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr3499774wmc.81.1575531916543; 
 Wed, 04 Dec 2019 23:45:16 -0800 (PST)
Received: from [192.168.3.122] (p5B0C6028.dip0.t-ipconnect.de. [91.12.96.40])
 by smtp.gmail.com with ESMTPSA id
 t5sm11346030wrr.35.2019.12.04.23.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2019 23:45:16 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] powerpc/pseries/cmm: fix wrong managed page count when
 migrating between zones
Date: Thu, 5 Dec 2019 08:45:15 +0100
Message-Id: <478F1889-B2F7-4866-80E6-0128EBDAEA86@redhat.com>
References: <87h82feau2.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h82feau2.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (17A878)
X-MC-Unique: mR8DPW_zPGW4GrcNbu7aIA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arun KS <arunks@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> Am 05.12.2019 um 03:59 schrieb Michael Ellerman <mpe@ellerman.id.au>:
>=20
> =EF=BB=BFDavid Hildenbrand <david@redhat.com> writes:
>> Forgot to rename the subject to
>>=20
>> "powerpc/pseries/cmm: fix managed page counts when migrating pages
>> between zones"
>>=20
>> If I don't have to resend, would be great if that could be adjusted when
>> applying.
>=20
> I can do that.
>=20
> I'm inclined to wait until the virtio_balloon.c change is committed, in
> case there's any changes to it during review, and so we can refer to
> it's SHA in the change log of this commit.
>=20
> Do you want to ping me when that happens?

Sounds like a good idea, we have time until 5.5. I=E2=80=98ll ping/resend.

Cheers!

>=20
> cheers
>=20

