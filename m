Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0671049AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 05:38:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JRf828pbzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 15:38:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IPT/kmgu"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JRYl1lxzzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 15:35:06 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id s3so1883328ioe.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 20:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0aWjvrFQsMqlMwqzCxDbtNFyA46VGNwla0h4qR52QJQ=;
 b=IPT/kmgueD6O+fARg5S2/11XZ4JM4nSNohde3+SaVTXFPkZlfEpEJQID81xoYMkozT
 oKF14brpMVtGGFIwcJipqdfsaJnSXy5sD//UitpmeCYvYRmTlp/ysLWVCOau2cgdxdI3
 5xVT7qfHnqOfeAq7uobmMSA4lqNwm+jxDUXWrjYgnBtsO1gsgEhteiaYBfKekdV0KybO
 J3pYGHKEaU02VD+PLu2Nm1w3I4/KyhJIjt1PRJOzB/fmo1TLwW3NY7szITXitcYBNjOG
 SHANPeeDGU415z7pqRAXxz37+//BmEJKnpZua0rSEGuONLAAL+rpwcPSBFBSD1Bqr8J0
 r1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0aWjvrFQsMqlMwqzCxDbtNFyA46VGNwla0h4qR52QJQ=;
 b=Q3VnQngFUmWcwHFq11IIZwKCqK+2M/bPQaY6lNrRLJRLXFIuo6QKJN1uAqb7fUI/yk
 a38SCildfI8XxbS8SMJHi8UXO8SvWbuyj2XNNy94Avs9ZYKegXdqBrUIEUliN4cXMPcY
 kG3Vu1nTzT34dkKei2D04mBra02vMvB+sJrros1icRRNnlkM7nO3NDYhncko9hqVk8F4
 09dLGsjPPwtweh2oQdYh7BPabj2tdH4wVyBlJ2d3IptXqSfhHEzqIbKzZyRNwfM0qtcB
 J2i+2vXunJW5Dr7rxIK8OkU/AWJi1swtp6rVOM5ytc3jbvChAubiN/nA/AGF+QUhq1ct
 Ri9A==
X-Gm-Message-State: APjAAAWQ8KTQPU30yEeMegJMG5OAcepZCc/JJLCj2O5teTnOcuVEJZ5b
 hX3y+JIJuiKCF7axyDE+UdU0cw3VVmesEaxSDps=
X-Google-Smtp-Source: APXvYqyWajK3GtJ3ihR6MuCRoIKRqi51R37ot06mJQJd+8qgM9o2zCPbXN4CIAsTa/JMaxKL/yC7CUvcdKQu7/3tnV4=
X-Received: by 2002:a6b:3707:: with SMTP id e7mr6001145ioa.293.1574310904664; 
 Wed, 20 Nov 2019 20:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-2-oohall@gmail.com>
 <3c3431d7-98ea-b3d1-b815-a020a480db98@ozlabs.ru>
In-Reply-To: <3c3431d7-98ea-b3d1-b815-a020a480db98@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 21 Nov 2019 15:34:53 +1100
Message-ID: <CAOSf1CFZK2e_QpQrt=aHB7Q9UNqdXwAW-_SmRFfGrtWdO+5JaA@mail.gmail.com>
Subject: Re: [Very RFC 01/46] powerpc/eeh: Don't attempt to restore VF config
 space after reset
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
Cc: Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 21, 2019 at 2:38 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 20/11/2019 12:28, Oliver O'Halloran wrote:
> > After resetting a VF we call eeh_restore_vf_config() to restore several
> > registers in the VFs config space. For physical functions this is normally
> > handled by the pci_reinit_device() OPAL call which requests firmware to
> > re-program the device with whatever defaults were set at boot time. We
> > can't use that for VFs since OPAL (being firmware) doesn't know (or care)
> > about VFs.
> >
> > However, the fields that are restored here are all marked as reserved for
> > VFs in the SR-IOV spec. In other words, eeh_restore_vf_config() doesn't
> > actually do anything.
> >
> > There is an argument to be made that we should be saving and restoring
> > some of these fields since they are marked as "Reserved, but Preserve"
> > (ResvP) to allow these fields to be used in new versions of the SR-IOV.
> > However, the current code doesn't even do that properly since it assumes
> > they can be set to whatever the EEH core has assumed to be correct. If
> > the fields *are* used in future versions of the SR-IOV spec this code
> > is still broken since it doesn't take into account any changes made
> > by the driver, or the Linux IOV core.
> > Given the above, just delete the code. It's broken, it's mis-leading,
> > and it's getting in the way of doing useful cleanups.
>
>
> There is still a prototype for this in arch/powerpc/include/asm/eeh.h,
> and pci_dn::mps as well.
>
>
> With the history of this explained offline,
>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


The commit message used to have some of the background, but I thought
it was too long already and took it out. I'll add it back in I guess.
