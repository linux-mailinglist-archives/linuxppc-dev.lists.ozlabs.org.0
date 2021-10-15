Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D732742FE90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWMT43gfWz3cPr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 10:11:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WhznUYR2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WhznUYR2; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWC5f2rqLz30MC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 03:53:41 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id z20so40666777edc.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DFAfhL2wTnA/x1oOiRIEIccRhRGZWYerK6em4KwuQr0=;
 b=WhznUYR2nkpwiwbTRwmHKoc047JsFdk3RvHIe/jtOLSDmdxX07MCX9Eow0Bi+yLoQp
 EyU08OzLxLG5ZCsUs7GUsgWdhql+ygc3SL2hgpQj7qkueaPaH4FCl+VEJFbTT66B35gH
 GDagaCdrbJmPFv3m1vjK25dlCo+SurtmwsJpbtn+lVZ1hUtQu8pPUJ/3APaMcce/rMb+
 gK4/JKJga2A5DLyU3cXWQ467mYYMbHs26I04bEcKD9mvTuveZ0BpijvVaw9Fg5WzWNNW
 l7COh3PfIisjI8gWM0rsyxYaukEsrZpFMim7hIuXFIwI4NkGZUXxkbzqxVTnksr3mpP4
 SUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFAfhL2wTnA/x1oOiRIEIccRhRGZWYerK6em4KwuQr0=;
 b=x5uKYJOLTN4STFh+UtoJ3W9mQFgaPJExQR2pLUxtKvjmpqQLAF1CPSaaHMovNIM5XP
 sgyuB8pwPaIEmT7PV9X7BpuewxJFHPkQJBo6EsbzhAmiB3Ptv0mazwQ3sOFLNUWvW8cZ
 LvUDGjZeQ7wl+kLGHKqHErT0TreKUDNxWyN+QjokKuF2VepdGFh+b+noRhBZWJfKQhRc
 uuB31hwuHtqAbOdVV7e5vTca2INuYrX2XMKh1yzW2/kalnVZgQvquDxxOhovnwRsjsVL
 PupOt+5hwSBcWcyOLlJsbSBXylktsDvBbJ41I9rUqhIvg7QhnAZu7fADbW4lOKZnWT4M
 4tNw==
X-Gm-Message-State: AOAM530J1z+l1py5r4++Cdr3IUZrA8zFJa8JS6QGdfJOvt0VsJLhD5IA
 /wxv2ddTclGGR/BEM7c/LlP25PJ5j7sd/iAz1Xk=
X-Google-Smtp-Source: ABdhPJw1GMYkf4/DzQ6xCdDldbViFURlmc0YnNdhDKa/6j1hrF7JWMyfM92nI6tIEj+fn7ChYTDQotvOC+uhf3cE48A=
X-Received: by 2002:a50:e188:: with SMTP id k8mr19911628edl.119.1634316813165; 
 Fri, 15 Oct 2021 09:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <YWbdvc7EWEZLVTHM@smile.fi.intel.com>
 <20211015164653.GA2108651@bhelgaas>
In-Reply-To: <20211015164653.GA2108651@bhelgaas>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Oct 2021 22:52:45 +0300
Message-ID: <CAHp75VdpVwvOkjDWHcnWA-qZFm062UBp7VwdcpWbkdVR=i75Hw@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 16 Oct 2021 10:07:44 +1100
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexander Duyck <alexanderduyck@fb.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 qat-linux@intel.com, oss-drivers@corigine.com,
 Oliver O'Halloran <oohall@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marco Chiappero <marco.chiappero@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Fiona Trahe <fiona.trahe@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ido Schimmel <idosch@nvidia.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Simon Horman <simon.horman@corigine.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jack Xu <jack.xu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Wojciech Ziemba <wojciech.ziemba@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, netdev <netdev@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Tomaszx Kowalik <tomaszx.kowalik@intel.com>,
 Taras Chornyi <tchornyi@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 linux-perf-users@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 15, 2021 at 7:46 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Wed, Oct 13, 2021 at 04:23:09PM +0300, Andy Shevchenko wrote:

...

> so compared to Uwe's v6, I restored that section to the original code.
> My goal here was to make the patch as simple and easy to review as
> possible.

Thanks for elaboration. I have got it.

...

> You're right, this didn't make much sense in that patch.  I moved the
> line join to the previous patch, which unindented this section and
> made space for this to fit on one line.  Here's the revised commit:
>
>   https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?id=34ab316d7287

Side remark: default without break or return is error prone (okay, to
some extent). Perhaps adding the return statement there will make
things robust and clean.

-- 
With Best Regards,
Andy Shevchenko
