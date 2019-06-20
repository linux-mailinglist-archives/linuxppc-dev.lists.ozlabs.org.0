Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C061C4C5EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 05:47:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tnnq5svwzDqsl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 13:47:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HyW5DLL4"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tnlm03BDzDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 13:45:39 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id i10so935647iol.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 20:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZPyXbSMMXcl1mLdquv3ab0eaDgC5j4gm7PvbosOLKA=;
 b=HyW5DLL4sI4Wss/UuyJ241/UF3wliGHa0hUHHArhvOv+WwmyW+UkWN105j+uvwdqlU
 iELSS1PvJar+xs6w3AeXFwwhwwltuaoXvx5o0U5ShwhCiux9qhyvyiRQqqAbNxLs+vaZ
 WAQrhUgLLOmcrnhkBn9/F5iVCb2zALAhaQ9k//39QxlxOkEg+EQwFWKmlcISi2aVHHsH
 DxrGfD02zbYAaz73tNDJ8ZFVmn0pczjuxZode9P1Vwd2Wb5NHBM6ymeFq+Lc5hlkdVKw
 yONQa7eOKMi0s1BXXYAg7TJzOUHhIYe+ujtEZYJTGxzgC8bWd+iMwY1gXI4Wi8Vlr/Ly
 hNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZPyXbSMMXcl1mLdquv3ab0eaDgC5j4gm7PvbosOLKA=;
 b=Ku6JkvVb0CfM0tEwxs4OPeIbg1iHSvUnj3iRKos/3XExiqSpR0e3ytvxNGFaKUW4Lc
 /wkgG6Lies5C1fKNvdmt9CdDzi+TAZ55uBWkZQOIp1hZoJlNU8BwdezblczKtAvtEtuv
 +sGOItnHTBZZgpZZ3BxJG6TcxVT8c1DZ8s+pRVvHlSjje16iu48sg/f7m4fXwTVFM1uD
 2Zr5MQxvTPjJj0Efip9SzNA8w6IRI9gbon33q496x72TCdXmPBKKTNVjix0qwTASnXaW
 MOR2X0WAe36/S0B4rNSyUoaOyNmflEF9fGYpzYmS1zzVdfqHKnl2fS0IUsECN7WGKElC
 bjQQ==
X-Gm-Message-State: APjAAAXPzvSslIi+rhrHnhFAgKHc3q0MBB90sy1eAAQQJfcGQMx/Bg4i
 cHVlPVB45yRI/Ch+csUZSwlQB947sVBSX6CaBU9Dbg==
X-Google-Smtp-Source: APXvYqw127HHQ+AvHwkn5NIKbLlAU1dgI/rwTgmfoojebpJwjwC6KKYnjyLhmrl6AGdWp8TrNbAg3M0vtWBJb9ZDAJc=
X-Received: by 2002:a5d:8497:: with SMTP id t23mr16251599iom.298.1561002335703; 
 Wed, 19 Jun 2019 20:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
 <8deaedffad8ed3327f296a561c2a31c930c65f88.1557203383.git.sbobroff@linux.ibm.com>
 <ef181b9d-54df-23f9-2f06-f0f4d0bd8e8a@ozlabs.ru>
 <20190619042706.GA24143@tungsten.ozlabs.ibm.com>
 <e8f68068-bb62-6d2e-f484-d6a111811fbc@ozlabs.ru>
In-Reply-To: <e8f68068-bb62-6d2e-f484-d6a111811fbc@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 20 Jun 2019 13:45:24 +1000
Message-ID: <CAOSf1CFwj93TYGppJVU5djEe4TN6ezo36G=DxWbFU4buaCWM4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] powerpc/eeh: Improve debug messages around device
 addition
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2019 at 12:40 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> On 19/06/2019 14:27, Sam Bobroff wrote:
> > On Tue, Jun 11, 2019 at 03:47:58PM +1000, Alexey Kardashevskiy wrote:
> >>
> >> On 07/05/2019 14:30, Sam Bobroff wrote:
> >>> Also remove useless comment.
> >>>
> >>> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> >>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >>> ---
> *snip*
> >
> > I can see that edev will be non-NULL here, but that pr_debug() pattern
> > (using the PDN information to form the PCI address) is quite common
> > across the EEH code, so I think rather than changing a couple of
> > specific cases, I should do a separate cleanup patch and introduce
> > something like pdn_debug(pdn, "...."). What do you think?
>
> I'd switch them all to already existing dev_dbg/pci_debug rather than
> adding pdn_debug as imho it should not have been used in the first place
> really...
>
> > (I don't know exactly when edev->pdev can be NULL.)
>
> ... and if you switch to dev_dbg/pci_debug, I think quite soon you'll
> know if it can or cannot be NULL :)

As far as I can tell edev->pdev is NULL in two cases:

1. Before eeh_device_add_late() has been called on the pdev. The late
part of the add maps the pdev to an edev and sets the pdev's edev
pointer and vis a vis.
2. While recoverying EEH unaware devices. Unaware devices are
destroyed and rescanned and the edev->pdev pointer is cleared by
pcibios_device_release()

In most of these cases it should be safe to use the pci_*() functions
rather than making a new one up for printing pdns. In the cases where
we might not have a PCI dev i'd make a new set of prints that take an
EEH dev rather than a pci_dn since i'd like pci_dn to die sooner
rather than later.

Oliver
