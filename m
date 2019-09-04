Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD65A8350
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 15:02:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NkVc3rYCzDqn5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 23:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NjKH1F7PzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 22:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Prkw+Bw8"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46NjKG6sg9z8t3b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 22:08:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46NjKG5mfjz9sDB; Wed,  4 Sep 2019 22:08:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Prkw+Bw8"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46NjKG3zLqz9s7T
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Sep 2019 22:08:50 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id b136so19538902iof.3
 for <linuxppc-dev@ozlabs.org>; Wed, 04 Sep 2019 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lqaK3n67Red/VcPGrjUnY2GXE84+MKMIWyN1XBc9vkY=;
 b=Prkw+Bw8UgsDUmWS1Ubo2s3b4AbhRQE0TehOR4r4WXnMqADS99ItGEibVJFGQJZj7X
 rPtPHWhQi8hsEUnYECxkxUDAtl4TcIIg5mReJOc7t5/A+Us4Jo+8B37S9JSlaXSe7pzZ
 xt658WwkKW1wYudxAStL3wvvRiK9m/2iArm913JyUJA+l8yBE9PKc4Ok7F0SX5PmB3aI
 qSolQfEK1Cjf9yX1EXD4I3DWoZQ1gQcW8mmo8P1XAV1Un5dmteCJjKYuMnkELGJfA0+y
 z2+GCDiWpTbBF+BYpj2CvdhjPDVe8cVMgbA94CyUdef5VLFVi+a/+TbalXywPwuscHgC
 OYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lqaK3n67Red/VcPGrjUnY2GXE84+MKMIWyN1XBc9vkY=;
 b=dDfYJGXwLYRFl9J4Zx5mDIM9McPWXk9Zff++ndMEwYw0tZd9P8CYfZgrBC20IGHY1M
 WaEDe4O/6t49KzAzof2MrmKYgJa75UxGmKTAQU4SCjagFbWp0Wd6Qjipsx6/3YX5dNTb
 X3oexcjqpR6+ue3SDJBVJay5UEzY+L1pljOQjgUobhZhltObdlqr05OwqsqQgxVadaaA
 oLwyst6EtATjdMY5oEDK2zBLvGNnB9u44Mboh86U0z4BwdOoHQHYgR6H7r81uGyaTNNE
 a+nbHVv1pg3q5juybMGHsVti4JI2XzY7Dz4KpD+1E0ErrGyPVOqwz9RwhIRWNnCwwJ/n
 DrOw==
X-Gm-Message-State: APjAAAWZc6uIxjqltTQC9MWFopsSOwn5noN7JzQ4SW/y5VHM1ZnTtpG2
 Y7m0AVbq/uQdnVgRHKGzJsfOdEL1+JdzeL+YOy/9Ug==
X-Google-Smtp-Source: APXvYqzLAXO5kfZ0jpTB6+NGrHenUbenmDPd4PNJ5RZlMi7z3GktdyL/jHtEfT7vCaJgm2jgWwChwkUEMNzhMv81pdw=
X-Received: by 2002:a02:9a12:: with SMTP id b18mr7498097jal.70.1567598928359; 
 Wed, 04 Sep 2019 05:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630278711.8896.9799921270260662672.stgit@hbathini.in.ibm.com>
 <87y2z4p9dh.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y2z4p9dh.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 4 Sep 2019 22:08:36 +1000
Message-ID: <CAOSf1CEnhfT5n3sZBiuVM8k8_VTYaoDrSVy3dS-8Tb=pZTQTXw@mail.gmail.com>
Subject: Re: [PATCH v5 19/31] powerpc/fadump: Update documentation about OPAL
 platform support
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 4, 2019 at 9:51 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hari Bathini <hbathini@linux.ibm.com> writes:
> > With FADump support now available on both pseries and OPAL platforms,
> > update FADump documentation with these details.
> >
> > Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> > ---
> >  Documentation/powerpc/firmware-assisted-dump.rst |  104 +++++++++++++---------
> >  1 file changed, 63 insertions(+), 41 deletions(-)
> >
> > diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
> > index d912755..2c3342c 100644
> > --- a/Documentation/powerpc/firmware-assisted-dump.rst
> > +++ b/Documentation/powerpc/firmware-assisted-dump.rst
> > @@ -72,7 +72,8 @@ as follows:
> >     normal.
> >
> >  -  The freshly booted kernel will notice that there is a new
> > -   node (ibm,dump-kernel) in the device tree, indicating that
> > +   node (ibm,dump-kernel on PSeries or ibm,opal/dump/mpipl-boot
> > +   on OPAL platform) in the device tree, indicating that
> >     there is crash data available from a previous boot. During
> >     the early boot OS will reserve rest of the memory above
> >     boot memory size effectively booting with restricted memory
> > @@ -96,7 +97,9 @@ as follows:
> >
> >  Please note that the firmware-assisted dump feature
> >  is only available on Power6 and above systems with recent
> > -firmware versions.
>
> Notice how "recent" has bit rotted.
>
> > +firmware versions on PSeries (PowerVM) platform and Power9
> > +and above systems with recent firmware versions on PowerNV
> > +(OPAL) platform.
>
> Can we say something more helpful here, ie. "recent" is not very useful.
> AFAIK it's actually wrong, there isn't a released firmware with the
> support yet at all, right?
>
> Given all the relevant firmware is open source can't we at least point
> to a commit or release tag or something?
>
> cheers

Even if we can quote a git sha it's not terrible useful or user
friendly. We already gate the feature behind DT nodes / properties
existing, so why not just say "fadump requires XYZ firmware feature,
as indicated by <ABC> device-tree property."
