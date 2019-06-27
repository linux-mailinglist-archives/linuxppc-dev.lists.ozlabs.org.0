Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D657A1D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 05:41:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z5KG50KKzDqdc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 13:41:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j2tyy2tF"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z5HR3kVWzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 13:39:31 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id r185so1581168iod.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 20:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDFVHT1KmNrap8pDI85p6YP+/mhWbFCZbajiJIyvZ7M=;
 b=j2tyy2tF5aUIBxrrgfELCveLoguVnOhIVu40EF/mUucUf1dApv28L+zKW9zP42QK2r
 w3+GB33JKewONV1hE2OYbaUn4ePaMsmkf8LYUGBs1jnERtJByXz+tr9nt3k/7k1zji3t
 S3QJORCUU+h5zEbSDzT/zSPV8/BYLlXf5CmsR7L0TyRUcr+1uXVuUmVIDKf7tO829ffq
 ymOG+pTA6P7qhh+BJWu/jwcLX9+UpjM4qGlPHHkUw8c9NIEZJ3WcINJdjok+5PWdnqEM
 UXbMERsLncP6nGxZkT/6V3mNdndbYDeETKQNgjsYvUdiP7w7eGWEVn7ls44oCsIxQl4Y
 o0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDFVHT1KmNrap8pDI85p6YP+/mhWbFCZbajiJIyvZ7M=;
 b=RnZrTA2mb1axvhRnbmRnwS6H5jkis4jTqfjOu/Qb2v2WpSbgPd9xuVWQY6R/GnMpS+
 GH6zldr3LuxxZW2nrDTSgqB7URr71d4dB67YOsl8tdrHfFDUBUOKbnTJ8ew0Te9KMC9I
 FxnW8QtEorDrIg/Yx17TX68Ms1NGKHoiyOmmo4oWCDQsolqE/mgPWkBEgmbuo8lcKrmR
 wmTXzWHkph1vmOA+7qweqhCBGHVavK/FcF3YTXER2CCm9QLphMGuwh0jM79J/3ywPZmI
 CiSMxTy3wYo4BILIGzP/jm61EHbUGz+yLe9XQzoryfhtA7U5vrX/XtrIkoqG1FNncqRO
 C+0Q==
X-Gm-Message-State: APjAAAXzMg7kYiQnkPyTYpb526pvX+VuFlPn8F9MvStA0jQFHe2OZJqi
 mnG6n36vPhs4lbzx6vHf/xuEzW7MkhB3Ek6WuCI=
X-Google-Smtp-Source: APXvYqxX0SHd1DCAUZN+A/K7NBDUdlVnv5ZnwWuaY7y82tnOpUSVfhkVIGSqc6ruNUVO/ulytkTKOflbqmajUTposaA=
X-Received: by 2002:a5d:8404:: with SMTP id i4mr1991040ion.146.1561606769136; 
 Wed, 26 Jun 2019 20:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
 <20190626140404.27448-4-vaibhav@linux.ibm.com>
 <87k1d8z3jw.fsf@linux.ibm.com>
 <CAOSf1CEPZcq-hkJCxRnb7nZ8Smib6uDm6J_Lp6ec5sP7+DQDEQ@mail.gmail.com>
 <87h88bzqfd.fsf@linux.ibm.com>
In-Reply-To: <87h88bzqfd.fsf@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 27 Jun 2019 13:39:18 +1000
Message-ID: <CAOSf1CEgrRcYHLyiktPUboxWD0MFws5PAxSTkBKMxe2yn4xL2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2019 at 12:58 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> "Oliver O'Halloran" <oohall@gmail.com> writes:
>
> >> > +             rc = drc_pmem_bind(p);
> >> > +     }
> >> > +
> >> >       if (rc)
> >> >               goto err;
> >> >
> >>
> >> I am also not sure about the module reference count here. Should we
> >> increment the module reference count after a bind so that we can track
> >> failures in ubind and fail the module unload?
> >
> > I don't really get what you're concerned about here. The error
> > handling path calls drc_pmem_unbind() so if there's a bind error we
> > should never leave probe with memory still bound.
> >
>
> In the remove callback, if the ubind fail should we allow the module
> unload?

If the drc_pmem_unbind() in the driver's remove function fails the
driver will still be unbound from the platform device for that DRC.
You can try re-bind the driver to the platform device and it'll hit
the unbind-then-bind again error path this series introduces (which
might also fail), but that's fine. The only reasons I can think of for
drc_pmem_unbind() failing are bugs in the hypervisor or bugs in the
driver. Forcing the module to stay loaded doesn't help either case so
I'm not seeing the benefit.

Oliver
