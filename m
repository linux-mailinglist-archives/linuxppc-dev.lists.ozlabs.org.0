Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF04A6C45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 08:23:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpYDN2LN0z3cD1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 18:23:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1wqBK4V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P1wqBK4V; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpYCf1hTkz2yfh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 18:22:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 658EC61794
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 07:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678A3C36AE2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643786537;
 bh=O+VeT6kS/QZzo+vk1G1yxaRHbOqFbZGg5og/oLWm1Fs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P1wqBK4VLPcsSCCX8ADOp44iyouvWdXz3Ew9sma6j3G/dxv6boPNe/i6SSKicRJtf
 uzS6MftbV++AvPa+LnY+MpKjkl62AthyLBJmqEiILZHPk2+0V3Ric8bETO3SOMTZ3z
 at+vTaIPd2Pvw5O/+iPqUDdrpgXMP63Rgrq1WUPTaDqtXV9753C3Lb/BT8v7iyMk30
 JeZTIqbX54vzX4H1eDvpsZLPftaICnpvcHlDlhm53rWS3K42WIAYKtIcwFnta8Q9Of
 m5gu66nQgjWrSGAms9e8MiLCk4nVHFuEnd6iRqLF68nwmH3EtBn1royOupqMrugrwK
 OIiS/rjOg4VcA==
Received: by mail-wr1-f52.google.com with SMTP id e2so36585389wra.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 23:22:17 -0800 (PST)
X-Gm-Message-State: AOAM532/4YOAb7Lq+7+62o+y/XBwPXbLc6O8PyysA4/TX44zMQKqpdh1
 QkbF+wpgABhjeXyLRo4cA7LBeEmTBSWS6iFXZnM=
X-Google-Smtp-Source: ABdhPJx/DUF02WjEBxR5lO2KyQN3KE6QQwqhneznoWnTKv8K7TJm1sP/njFj9yvLe8O6wO1ZJvARMK7Seuogti1UW54=
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr24149922wrw.189.1643786535556; 
 Tue, 01 Feb 2022 23:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org> <YfotMyQiQ66xfCOQ@kroah.com>
 <20220202071023.GA9489@srcf.ucam.org>
In-Reply-To: <20220202071023.GA9489@srcf.ucam.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 2 Feb 2022 08:22:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
Message-ID: <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
To: Matthew Garrett <mjg59@srcf.ucam.org>
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Lenny Szubowicz <lszubowi@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, gcwilson@linux.ibm.com,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@suse.de>,
 "Serge E. Hallyn" <serge@hallyn.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, dougmill@linux.vnet.ibm.com,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>,
 Dave Hansen <dave.hansen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Feb 2022 at 08:10, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
>
> On Wed, Feb 02, 2022 at 08:05:23AM +0100, Greg KH wrote:
>
> > I see different platform patches trying to stick these blobs in
> > different locations and ways to access (securityfs, sysfs, char device
> > node), which seems crazy to me.  Why can't we at least pick one way to
> > access these to start with, and then have the filesystem layout be
> > platform-specific as needed, which will give the correct hints to
> > userspace as to what it needs to do here?
>
> Which other examples are you thinking of? I think this conversation may
> have accidentally become conflated with a different prior one and now
> we're talking at cross purposes.

This came up a while ago during review of one of the earlier revisions
of this patch set.

https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/

which describes another two variations on the theme, for pKVM guests
as well as Android bare metal.
