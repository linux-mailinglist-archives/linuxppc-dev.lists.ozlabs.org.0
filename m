Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9428434D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 02:24:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4yrP4fQ6zDqJ5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 11:24:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PNWwjk9c; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4ypj34KMzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 11:22:36 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id v8so11170592iom.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Oct 2020 17:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChNqQelqtDi5mA4avpiK37k7BL+FnbhdmXHdCKqhLDE=;
 b=PNWwjk9clDXJgyVtT4GbEbD0kRxKL8aa1OPBEdwfPhUMjReh5/XRd6SGT0LXqwaGbN
 uvU+vyDFe21T8zmDowWYSrY1gvCVeolr4XKAECnXiqFpd7jEfOPkGrSlQhx3hcKpzgYY
 2qSLJLClQHWU9e5TwUnmwezJWC5bxZj6OxMcn20CI/XoZwtXn3MPjfID1RmwnVNRnopn
 OsnLEr9ImVxzrqX2lUVgvQrhfhc3LxpKWVuz72vHbrkCvaqM7NFqwnCdmFQtwFzyZ7Dx
 GHL8ZMcg2DUx6Y0+ncoIKmU64wtd+yCLBySGM/C6CioP8CYNC5ex5NgH5qob+AURLr3D
 qTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChNqQelqtDi5mA4avpiK37k7BL+FnbhdmXHdCKqhLDE=;
 b=REJCMom7uMd1/BiL16y/v2Qvq3E0MEbgl0K+HHsrOAevidMggUdxY3E7ym9T/udbDg
 J6xKTaXAZShJkalHXGNTjreR8Zgvde+DyNJE8H7WTHJW38a8Imh0b4Pg2V6L5VTXdgnm
 ud1lUn4VaJ94gTBcsnFhp3lqqkY/5HQJqjwjoDULHE96iIhSTxzRp1A2sMZGuPhpqsoI
 /9uw2b6YIKGHM35eVXjxV09heqzREITQnS2joWqzzxToGYTYZ/GCVQ3LajthQuseQNG5
 FiDUcFHD9qN70Tq3JXVxNre/Gz5cs1d0L0iG9azIWRWKU7vExjgJnLCSeMCsr6cYD9wq
 k6KA==
X-Gm-Message-State: AOAM530bYBNUkRMmIWZzh5xGvrQr0gE5mjKT8vYzIYHhF+EezD2PSJmy
 3dcVPIP1kM8rmYkU1adhjjg0S0fKskozMvq0B4k=
X-Google-Smtp-Source: ABdhPJyQn9M1HNAaRR4XaPcmhA0e3DtNCMsdY3jTgXzLz13iv0bc2+TdaIoAusRjwHk+qai/bpxY4nrj/CxKLHfGoKM=
X-Received: by 2002:a6b:5907:: with SMTP id n7mr1887361iob.75.1601943752830;
 Mon, 05 Oct 2020 17:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <160187115555.1589942.2124270585910076829.stgit@jupiter>
 <df7cebd0-bec3-d716-5514-61c4043a6d30@linux.ibm.com>
In-Reply-To: <df7cebd0-bec3-d716-5514-61c4043a6d30@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 6 Oct 2020 11:22:21 +1100
Message-ID: <CAOSf1CHSTrT63ULFKTjXn9LjML5Tbwz7PJCw17pUEkvS784AdA@mail.gmail.com>
Subject: Re: [PATCH v2] powernv/elog: Fix the race while processing OPAL error
 log event.
To: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 5, 2020 at 11:07 PM Ananth N Mavinakayanahalli
<ananth@linux.ibm.com> wrote:
>
> On 10/5/20 9:42 AM, Mahesh Salgaonkar wrote:
> > Every error log reported by OPAL is exported to userspace through a sysfs
> > interface and notified using kobject_uevent(). The userspace daemon
> > (opal_errd) then reads the error log and acknowledges it error log is saved
> > safely to disk. Once acknowledged the kernel removes the respective sysfs
> > file entry causing respective resources getting released including kobject.
> >
> > However there are chances where user daemon may already be scanning elog
> > entries while new sysfs elog entry is being created by kernel. User daemon
> > may read this new entry and ack it even before kernel can notify userspace
> > about it through kobject_uevent() call. If that happens then we have a
> > potential race between elog_ack_store->kobject_put() and kobject_uevent
> > which can lead to use-after-free issue of a kernfs object resulting into a
> > kernel crash. This patch fixes this race by protecting a sysfs file
> > creation/notification by holding an additional reference count on kobject
> > until we safely send kobject_uevent().
> >
> > Reported-by: Oliver O'Halloran <oohall@gmail.com>
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> cc stable?

+1
