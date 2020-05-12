Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B07891D02DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 01:07:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MD3172RSzDq9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 09:07:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.67; helo=mail-oo1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MD0q6SQnzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 09:05:15 +1000 (AEST)
Received: by mail-oo1-f67.google.com with SMTP id s139so2125149oos.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 16:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XSdR85TAgJOs38DEsZUyX0dfieZdKEmO5MKyADhHcpo=;
 b=AK+NzHCBCiDSdqvMa9c20/g0Z81olKYGegcvEJgsoeRs/0EwOhZtbJE7V2g6giO2Xu
 DFzICtTWX/P5+9WuMkPysHY78KwE5PWzj6aS1AcvCYgAsbJbLvxJtwWDJxCyYkUnMgj3
 WNZBoEEbLnM9x8CYp6Fpx1flMPaDG+y30h7RzQz0pjYeSrJPWGnIkGNrGSK3Hmsqu8Rq
 PiItgFQfetq/OuRQTBTHQdVj7UKmvLEEtRGPCkRxfdvwQfyLYbmvENJqPkchX0+8/2za
 /f31hObD95PAxyIh2eMhXoDIVjqhgzjnMuYQxD1ynsIn4YU5/8F10VnDfadUgEcpwB/2
 fH6g==
X-Gm-Message-State: AGi0PuauGXespPHhbGziXtzsjCy3xN5S0KkxxM8xECwU2mZ7N+fyBBsN
 J8cIUDrvqdjwpkTlN7UpqQ==
X-Google-Smtp-Source: APiQypJzTOsA4MMcw+8ySuTf7bsiFc+0EPM0GrRH186HNMYZE+s5iB7eFAI4H9VokzQcmzwFYB4qXw==
X-Received: by 2002:a4a:9413:: with SMTP id h19mr15437109ooi.52.1589324712398; 
 Tue, 12 May 2020 16:05:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f8sm1601703oto.47.2020.05.12.16.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 16:05:11 -0700 (PDT)
Received: (nullmailer pid 9890 invoked by uid 1000);
 Tue, 12 May 2020 23:05:09 -0000
Date: Tue, 12 May 2020 18:05:09 -0500
From: Rob Herring <robh@kernel.org>
To: Prakhar Srivastava <prsriva@linux.microsoft.com>
Subject: Re: [RFC][PATCH 0/2] Add support for using reserved memory for ima
 buffer pass
Message-ID: <20200512230509.GA2654@bogus>
References: <20200504203829.6330-1-prsriva@linux.microsoft.com>
 <20200505095620.GA82424@C02TD0UTHF1T.local>
 <e8c7d74e-74bf-caa3-452d-23faa649e825@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8c7d74e-74bf-caa3-452d-23faa649e825@linux.microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, kstewart@linuxfoundation.org,
 gregkh@linuxfoundation.org, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 will@kernel.org, nramas@linux.microsoft.com, frowand.list@gmail.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 hsinyi@chromium.org, tusharsu@linux.microsoft.com, tglx@linutronix.de,
 allison@lohutok.net, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 06, 2020 at 10:50:04PM -0700, Prakhar Srivastava wrote:
> Hi Mark,

Please don't top post.

> This patch set currently only address the Pure DT implementation.
> EFI and ACPI implementations will be posted in subsequent patchsets.
> 
> The logs are intended to be carried over the kexec and once read the
> logs are no longer needed and in prior conversation with James(
> https://lore.kernel.org/linux-arm-kernel/0053eb68-0905-4679-c97a-00c5cb6f1abb@arm.com/)
> the apporach of using a chosen node doesn't
> support the case.
> 
> The DT entries make the reservation permanent and thus doesnt need kernel
> segments to be used for this, however using a chosen-node with
> reserved memory only changes the node information but memory still is
> reserved via reserved-memory section.

I think Mark's point was whether it needs to be permanent. We don't 
hardcode the initrd address for example.

> On 5/5/20 2:59 AM, Mark Rutland wrote:
> > Hi Prakhar,
> > 
> > On Mon, May 04, 2020 at 01:38:27PM -0700, Prakhar Srivastava wrote:
> > > IMA during kexec(kexec file load) verifies the kernel signature and measures

What's IMA?

> > > the signature of the kernel. The signature in the logs can be used to verfiy the
> > > authenticity of the kernel. The logs don not get carried over kexec and thus
> > > remote attesation cannot verify the signature of the running kernel.
> > > 
> > > Introduce an ABI to carry forward the ima logs over kexec.
> > > Memory reserved via device tree reservation can be used to store and read
> > > via the of_* functions.
> > 
> > This flow needs to work for:
> > 
> > 1) Pure DT
> > 2) DT + EFI memory map
> > 3) ACPI + EFI memory map
> > 
> > ... and if this is just for transiently passing the log, I don't think
> > that a reserved memory region is the right thing to use, since they're
> > supposed to be more permanent.
> > 
> > This sounds analogous to passing the initrd, and should probably use
> > properties under the chosen node (which can be used for all three boot
> > flows above).
> > 
> > For reference, how big is the IMA log likely to be? Does it need
> > physically contiguous space?
> 
> It purely depends on the policy used and the modules/files that are accessed
> for my local testing over a kexec session the log in
> about 30KB.
> 
> Current implementation expects enough contiguous memory to allocated to
> carry forward the logs. If the log size exceeds the reserved memory the
> call will fail.
> 
> Thanks,
> Prakhar Srivastava
> > 
> > Thanks,
> > Mark.
> > 
> > > 
> > > Reserved memory stores the size(sizeof(size_t)) of the buffer in the starting
> > > address, followed by the IMA log contents.
> > > 
> > > Tested on:
> > >    arm64 with Uboot
> > > 
> > > Prakhar Srivastava (2):
> > >    Add a layer of abstraction to use the memory reserved by device tree
> > >      for ima buffer pass.
> > >    Add support for ima buffer pass using reserved memory for arm64 kexec.
> > >      Update the arch sepcific code path in kexec file load to store the
> > >      ima buffer in the reserved memory. The same reserved memory is read
> > >      on kexec or cold boot.
> > > 
> > >   arch/arm64/Kconfig                     |   1 +
> > >   arch/arm64/include/asm/ima.h           |  22 ++++
> > >   arch/arm64/include/asm/kexec.h         |   5 +
> > >   arch/arm64/kernel/Makefile             |   1 +
> > >   arch/arm64/kernel/ima_kexec.c          |  64 ++++++++++
> > >   arch/arm64/kernel/machine_kexec_file.c |   1 +
> > >   arch/powerpc/include/asm/ima.h         |   3 +-
> > >   arch/powerpc/kexec/ima.c               |  14 ++-
> > >   drivers/of/Kconfig                     |   6 +
> > >   drivers/of/Makefile                    |   1 +
> > >   drivers/of/of_ima.c                    | 165 +++++++++++++++++++++++++
> > >   include/linux/of.h                     |  34 +++++
> > >   security/integrity/ima/ima_kexec.c     |  15 ++-
> > >   13 files changed, 325 insertions(+), 7 deletions(-)
> > >   create mode 100644 arch/arm64/include/asm/ima.h
> > >   create mode 100644 arch/arm64/kernel/ima_kexec.c
> > >   create mode 100644 drivers/of/of_ima.c
> > > 
> > > -- 
> > > 2.25.1
> > > 
