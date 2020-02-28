Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 485191730F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 07:24:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TKJC6VyMzDrJJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 17:24:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aCiWPejf; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TKGZ5YQ7zDr1g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 17:23:02 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id h8so2285670iob.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DuTOFF1N+0jfCoOnm+K9/yIAbEzJTEhAb8FgQMl5RCs=;
 b=aCiWPejfRtg4tr/zyh+vkBP374VidOeRRwL5P3kwIVoUhl1AVb37179on4ut47TkCb
 DKz2nqNbszQLSWBaCEza/YuWnhzwIbDSoGDzGI1dGN/KkVRtprqStaildf5CynTPB8YH
 wWrZCFnw+kibmyolcpZZYPNNKS+ZXDULutHc8q8JDhxLJP9s2QzQ0O4cxF6DY7vtUyhT
 TO5Ehg4u2z1pEYM09PHTSN+6zF8/X5YUKSAZPnZWLUUMnXRwSsoyTl9XxKS+60Xtzbea
 99eBpM/KFox3b8zaKlNbJI4xg/3C1rbHV/+tDaAbjvg6uFNyom1G6qch1ER5NUPcpsUz
 lHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DuTOFF1N+0jfCoOnm+K9/yIAbEzJTEhAb8FgQMl5RCs=;
 b=qDiroBe+1AhWmKMuxqTZPRUK02UDc3woe+ejKAD3Asfk2Atezmof99eRBgdOH8xldA
 V4+GchlKPo9WdWVaoV8KcAP8lKL996rKtmjQPYObgF+c3xnZ8KoW8RfFFbpx8zMzKLXk
 AvCYwl5D71UHdqdGdOXMJKcRm00h/48tR8GzXWPwordqM4URT8QCGu+6VISHknIWUP/Y
 rtMTiGoeJWS7Avj7QwTU7FeUYpMu3lPL0OnnO+7Btc4AMO/LAPlI7ZXCuHmr8q6jwvwD
 +lELVirbjWlsW8C7dim7jRa/VXebgeFal36POC7cb/lensytSxLl/cz2XNuzulFthne7
 RFTg==
X-Gm-Message-State: APjAAAV3YADFNMxgsGg8In1kB0itVWZ06MBoihuZcdEZhi8xkIk2rFRi
 GveF/5uA/Uu2wjHT7XE4xrYJhawYewDewd5A4g==
X-Google-Smtp-Source: APXvYqxHE8gWaNcZZa2L+3c0huHd3lfG7kjSTtYKOvlbqXd27L5SYx1pvP6W2T2x6f4TjIpqv1ubeL/97DgpQVFxGmE=
X-Received: by 2002:a5d:8448:: with SMTP id w8mr2484449ior.161.1582870979227; 
 Thu, 27 Feb 2020 22:22:59 -0800 (PST)
MIME-Version: 1.0
References: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
 <44745496-9d30-45cb-b67c-0ca283c4c90d@linux.ibm.com>
In-Reply-To: <44745496-9d30-45cb-b67c-0ca283c4c90d@linux.ibm.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Fri, 28 Feb 2020 14:22:48 +0800
Message-ID: <CAFgQCTuFGMHw+9vr5ZCJ_vRTEAtHFTu+Trq=vMrnq4t+OU=_EA@mail.gmail.com>
Subject: Re: [PATCH 1/3] powerpc/of: split out new_property() for reusing
To: Andrew Donnellan <ajd@linux.ibm.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 2:03 PM Andrew Donnellan <ajd@linux.ibm.com> wrote:
>
> On 28/2/20 4:53 pm, Pingfan Liu wrote:
> > Since new_property() is used in several calling sites, splitting it out for
> > reusing.
> >
> > To ease the review, although the split out part has coding style issue,
> > keeping it untouched and fixed in next patch.
> >
> > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > To: linuxppc-dev@lists.ozlabs.org
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Cc: Oliver O'Halloran <oohall@gmail.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: kexec@lists.infradead.org
>
> Which tree does this apply to? I don't see a new_property() in mm/drmem.c...
Sorry, there is mud in my git tree, I check, either linux git or
powerpc git tree does not have this function.

Nack this series, and I will send out V2 for patch 3/3.

Thanks,
Pingfan
>
> --
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
>
