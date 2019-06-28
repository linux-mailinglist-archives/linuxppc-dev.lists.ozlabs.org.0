Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67712592F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 06:37:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZkXG5RJyzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 14:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jw/RJP7Q"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZkVp14lJzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 14:36:33 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id k8so9791480iot.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 21:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZ3mIsxtG/ob5JikjCiUW7sZgmNixL52pHverbhoK0U=;
 b=jw/RJP7QlBLQeSPlZ4FvBlLtj6w6KVR13MqJCu+0dsR5zWrGrueZCr8Aea2GCbItUu
 34SgxtKmxtB6sZHUyLJZ+okUWoXqQGs1twxL4sy5l+ZiNdVN8ngiOxdCNqvNAw8x6Vmz
 uTEPCvU9SCo+6E9ZD3DJbQ+30B/PmxqIIcBfzIeJ2Ea/gVOhE/A1F+x9JP1FUizw2Kx/
 dB/mZPgshPaheKOCs3y2LtbitEPBjHcuuN/uHYAGki4uQQC+BJVNrWdgkXh46VtqU+WR
 roewr01kYD8RsY9hOGpGiHWAhLNeGyAFFj6fzMHHrc1OyieHd6HCJsYPhfhwExRwbZfv
 A++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZ3mIsxtG/ob5JikjCiUW7sZgmNixL52pHverbhoK0U=;
 b=qOnE11uJ8Z9Hf26c4nDJ4CSAzxoIlEsqPHPJ36gbDtzvCfUaSY7x9HoPgxK6/bXARM
 hjZW+rDYVasiMPSFSKHQZ0dyq7T8Z+DQAk4izYA/2EVAHDhUsjPXXffLmc3w2N5u5e1P
 41TtHbHdULKFcFWWVI5gfsDXLo8A+GYCzfRu0MZgqjbUN+y//MVx2QKaYOC4xgYuMYpr
 jtMCZjUoByX4PI2mnJ+RQuo38HLWVX0G7it+MzNvWw5sbuMyQnpU5dwwLG45otDBWkUq
 w6+Spe7qkeIpLrsCd0Fisxej0JBjIqsINVC4XLgRI0Sk/1P1+lhVmIpJxyFHhBwysZ/G
 cYrQ==
X-Gm-Message-State: APjAAAWVvsf1EvRBvdjMsqbXy7VZunR6KhaOEAjivl5Tg0Z2YGNbYe+y
 d1wuN3eM8HFZqdaNI3lAFRhgtFI38WyYNKZK97E=
X-Google-Smtp-Source: APXvYqzqSG/fZqjIsE91jtHmYQHJk5NosEV0Zm2CMIztWJtTmjGJOSwmL2PmwIcaAcT+6Co7itOpIzxdRXYGyW+chZQ=
X-Received: by 2002:a5d:8404:: with SMTP id i4mr5003037ion.146.1561696590412; 
 Thu, 27 Jun 2019 21:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
 <20190626140404.27448-2-vaibhav@linux.ibm.com>
 <87h88as7iy.fsf@concordia.ellerman.id.au>
In-Reply-To: <87h88as7iy.fsf@concordia.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 28 Jun 2019 14:36:19 +1000
Message-ID: <CAOSf1CHS98Y9gwEUTkAmzjnWSW=yz89DWdXUnr1QijrvMTWvkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] powerpc/pseries: Update SCM hcall op-codes in
 hvcall.h
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 28, 2019 at 1:39 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> > *snip*
>
> How can we be changing the meaning of HCALL numbers without breaking all
> existing usages?

The changed one being changed here were never used by linux or
implemented by either hypervisor.

> Where are these hypervisor calls documented?

In an internal spec from one the phyp guys. I have been complaining
about it not being open (or merged into PAPR at the very least), but
it doesn't look like there's been any movement there.

Oliver
