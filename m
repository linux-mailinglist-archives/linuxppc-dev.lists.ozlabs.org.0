Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C462CA378
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 14:09:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clj9g4crxzDqM5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 00:09:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZbPk4tHw; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clj1k6GjwzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 00:02:34 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id q1so1569316ilt.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GujISGwhlbmPBHTK++whZ1M7hVGM+4rvkVOJDvu+Tpw=;
 b=ZbPk4tHwP3WguKetrkTHklUy3UcrKSyWgK6Uym2IZE3wBAOwdVH5c/IDdmwjZPuuqm
 3fBZ1XS0IiiaE//0AYRql3RFisscyQgiDg3DEC725uSg82KNi8qLfcIY1mvrrp0em8t0
 cxqPnFLueiusSfO/++oRYAXbjidQLywBD922gkvVqYDTx9GKI06POfQJ55if1kit6p9l
 cg0MpVzrpdbtvktESIAkHgYo8wSaE+CQbZcaXpPVaoXZGPd0UtmUXya+z7CZOP0Jcy7S
 /Gr2+bDlQj6GL3O6CRxPAO5tEP7e/pd5kFNcYys5eFtWBBHnhM55CGW1MYspSPy7xfnQ
 RBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GujISGwhlbmPBHTK++whZ1M7hVGM+4rvkVOJDvu+Tpw=;
 b=qt0896t3LUAbJ+sAAbORBTLTfDP9KfX5yD9oxsfuwo3ryTHXPRPf5iToV+fFLr3daq
 Tyes+EWUqydo9ze3KkhgNbvdK7yhuxRrAS/5xXh6SYE3h7slj376GyayJ5hbWv8yRdy7
 w/NA9d8NmFmBgepSRFeY20lPxn3+Eq15WafQuHYnb+0VDHHXMkTIoI4teZP8aSt3xH7G
 al2RMGdCj/YO9YvDmo9k6WYRW/zgJOCNwXpZWldTA5jmuvuZ15+tYNHcIdPBvlawvhrz
 gf1sI3heBRu72EiF/eDnz1yiwd8LTJSDJnf31fa3wYIdMzbieWB2HmuzjBelMwEQP/N8
 OYzw==
X-Gm-Message-State: AOAM533WZKEKmbB8za3yvQow9DPsk5I9RkDzIrEKToey7QQs7/rf5IB6
 jVvFIwhwI0KA7Z3QKr8ntx1iae8G/WRZBb7ke6w=
X-Google-Smtp-Source: ABdhPJxpbyyKEZVcWXZZ5bWcz5/0zeLgENsm2YN9RmeGEPYwjqWjjZ85QRhCQWvD9e7ZGl2BamxNDQpt1lIwTNgMtII=
X-Received: by 2002:a92:d40d:: with SMTP id q13mr2324683ilm.253.1606827739426; 
 Tue, 01 Dec 2020 05:02:19 -0800 (PST)
MIME-Version: 1.0
References: <160682501436.2579014.14501834468510806255.stgit@lep8c.aus.stglabs.ibm.com>
 <CAM9Jb+iPV470063QYq145znYW8CmqjNgdL=q6=3JXUJJt+z5gw@mail.gmail.com>
 <20035bbc-a1e0-82fd-105d-999e1afff029@linux.ibm.com>
In-Reply-To: <20035bbc-a1e0-82fd-105d-999e1afff029@linux.ibm.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 1 Dec 2020 14:02:08 +0100
Message-ID: <CAM9Jb+gS6z603kLwgB62zrHNpLOqW6FAEtDcbwiG5mGRzvZUVg@mail.gmail.com>
Subject: Re: [RFC PATCH] powerpc/papr_scm: Implement scm async flush
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: ellerman@au1.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >> Tha patch implements SCM async-flush hcall and sets the
> >> ND_REGION_ASYNC capability when the platform device tree
> >> has "ibm,async-flush-required" set.
> >
> > So, you are reusing the existing ND_REGION_ASYNC flag for the
> > hypercall based async flush with device tree discovery?
> >
> > Out of curiosity, does virtio based flush work in ppc? Was just thinking
> > if we can reuse virtio based flush present in virtio-pmem? Or anything
> > else we are trying to achieve here?
> >
>
>
> Not with PAPR based pmem driver papr_scm.ko. The devices there are
> considered platform device and we use hypercalls to configure the
> device. On similar fashion we are now using hypercall to flush the host
> based caches.

o.k. Thanks for answering.

Best regards,
Pankaj

>
> -aneesh
