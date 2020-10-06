Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AE284355
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 02:27:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4ywC15yXzDqGM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 11:27:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4ytW4YNHzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 11:25:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HBHmDd9O; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C4ytW33hVz8tVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 11:25:55 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C4ytW2dLSz9sT6; Tue,  6 Oct 2020 11:25:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HBHmDd9O; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C4ytW1XVkz9sSs
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Oct 2020 11:25:52 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id l8so11160793ioh.11
 for <linuxppc-dev@ozlabs.org>; Mon, 05 Oct 2020 17:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrMAW2M8/+SB09mJWBAOym/xmLEfD8WO0pS5be4/76E=;
 b=HBHmDd9OemVo9bVQf4+Q+RSYwYE32cXgi9Yz4fbMu4g30qOJOScqtLUK03mkFss7dU
 Vt+DmfCMHHjlnFdoXWe2rJjMooVRDyl5P8Drfu+T64heS1MQ3wm60K9iw/W8NUwM1r9E
 pq9mqpGBuuAwqmIJI2tPC6Q9P+x1M1+c2SUrG3OrU8WrJRKwdU14iMx1h8Bum8S1E48o
 lJEK9bp5+aheUnE5MZ4GsqRCZqu90p4AKo1cyrJYdO+lPlkzotKUTeAJtX/k2Fj/8vTX
 oRDlES2tVuGTBuIa3jn21upJC0ytVaHZGuLzPStu2IoJY6S5eQT5lp6uDy2/MbUEnBy2
 JooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrMAW2M8/+SB09mJWBAOym/xmLEfD8WO0pS5be4/76E=;
 b=N2a6G5AwPVI69MZ80eOqwk+qdEBQ8mHDiBwL5SbSzddNjX+CR/CmWTMURGJSpIpJUV
 mPpZvLP2ap0LbyRcdH2IcEtFr+nefMVbjHuMZwsCUHBcch+Ie7uM5B5uCny3LWs90+U0
 m6uV2yQXKyRM9nLLVE2KJJIrzfzhrwh2G327cE045okVUjtyzwKWjIKIPZvgAVidKI9A
 CrsYC8c0oE6pqPtRTQh4x6aH9uVh3TmHHTfKienBRoOdzpT2oQC74x3Mx0Se00CGKFTs
 2H/odGbXCZB+cw+ZJLSlmRJIrU/mjGVjK4vd9ypG3trBOyKZ1Ow1epTkPfvgZP7vyqYO
 7YuA==
X-Gm-Message-State: AOAM531/oX/QYwRukJUcFOjQA3BbI4SqxXQT70XRoGoKU7gGuH5EzSQb
 xb8gUiJnu7aR2Ek8UU8TejF2CXne2wg7g4gfI4E=
X-Google-Smtp-Source: ABdhPJw8ZmrAZpZUdkxfHQ5Q0CxgsHkXMf+/vDxCoG2I/vSMaS5XFUhMcsB+s0wtUkhCWBng7/BFFCmHFtMEzj0IwLs=
X-Received: by 2002:a6b:4a17:: with SMTP id w23mr1933265iob.73.1601943950299; 
 Mon, 05 Oct 2020 17:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <160187115555.1589942.2124270585910076829.stgit@jupiter>
In-Reply-To: <160187115555.1589942.2124270585910076829.stgit@jupiter>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 6 Oct 2020 11:25:39 +1100
Message-ID: <CAOSf1CEx_vSrMNYCRrL7q168hXr+iEAG4jxhrjkXzqEMH5CkQA@mail.gmail.com>
Subject: Re: [PATCH v2] powernv/elog: Fix the race while processing OPAL error
 log event.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 5, 2020 at 3:12 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>
> Every error log reported by OPAL is exported to userspace through a sysfs
> interface and notified using kobject_uevent(). The userspace daemon
> (opal_errd) then reads the error log and acknowledges it error log is saved
> safely to disk. Once acknowledged the kernel removes the respective sysfs
> file entry causing respective resources getting released including kobject.
>
> However there are chances where user daemon may already be scanning elog
> entries while new sysfs elog entry is being created by kernel. User daemon
> may read this new entry and ack it even before kernel can notify userspace
> about it through kobject_uevent() call. If that happens then we have a
> potential race between elog_ack_store->kobject_put() and kobject_uevent
> which can lead to use-after-free issue of a kernfs object resulting into a
> kernel crash. This patch fixes this race by protecting a sysfs file
> creation/notification by holding an additional reference count on kobject
> until we safely send kobject_uevent().
>
> Reported-by: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
> Change in v2:
> - Instead of mutex and use extra reference count on kobject to avoid the
>   race.
> ---
>  arch/powerpc/platforms/powernv/opal-elog.c |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
> index 62ef7ad995da..230f102e87c0 100644
> --- a/arch/powerpc/platforms/powernv/opal-elog.c
> +++ b/arch/powerpc/platforms/powernv/opal-elog.c
> @@ -222,13 +222,28 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
>                 return NULL;
>         }
>
> +       /*
> +        * As soon as sysfs file for this elog is created/activated there is
> +        * chance opal_errd daemon might read and acknowledge this elog before
> +        * kobject_uevent() is called. If that happens then we have a potential
> +        * race between elog_ack_store->kobject_put() and kobject_uevent which
> +        * leads to use-after-free issue of a kernfs object resulting into
> +        * kernel crash. To avoid this race take an additional reference count
> +        * on kobject until we safely send kobject_uevent().
> +        */
> +
> +       kobject_get(&elog->kobj);  /* extra reference count */
>         rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
>         if (rc) {
> +               kobject_put(&elog->kobj);
> +               /* Drop the extra reference count  */
>                 kobject_put(&elog->kobj);
>                 return NULL;
>         }
>
>         kobject_uevent(&elog->kobj, KOBJ_ADD);
> +       /* Drop the extra reference count  */
> +       kobject_put(&elog->kobj);

Makes sense,

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

>
>         return elog;

Does the returned value actually get used anywhere? We'd have a
similar use-after-free problem if it does. This should probably return
an error code rather than the object itself.
