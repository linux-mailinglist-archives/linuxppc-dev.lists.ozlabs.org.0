Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD87F75F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 15:07:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=F9LXCCsV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScGyp32rLz3vc3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 01:07:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=F9LXCCsV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=dimitri.ledkov@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScGxv68XWz2yhR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 01:06:59 +1100 (AEDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AFE0940614
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 14:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700834812;
	bh=Hd2BSh15WeOiby5+Hlvzp44TyB2SCXUbalAUBAOi7fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=F9LXCCsVwoSx8ZLYxbxf/CuFuuQqp+KctC9QjJRPhkZUJkVmaRnu7oEQe+UCfsOVd
	 iLG0rwiukpp3w6lMidDckw+mNrn4JKwo094vh0v0B21kdTelxLRPpqghO5bxDyLeb0
	 uMGjEtTI3NHgwlgn3t2bdIRkLfRkpLLfycVeIYoAUEYzjlN+fa3iUtA68sRL/HlcOn
	 P6zT75tkZbmG++ionQweMxYOMkt9Hh8ZzsECVfgktkkTC+QCwAqFafKrlWisdBcjHM
	 nuyPKU7+bFTEeP13ouY2ViOE2QoF8K19QV/FU9IhAZryu4UrwNxmyFh1keI3d3pvr2
	 9wqKZ3mocWqDg==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40b3712ef28so8775615e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 06:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700834811; x=1701439611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hd2BSh15WeOiby5+Hlvzp44TyB2SCXUbalAUBAOi7fw=;
        b=D+0BBMFD57HxTEyQ57EJcSSQJkppJ4z7m9d0EUPK+KbkUFdQjtRjD+gwj6y6YX2c6D
         1a4vT+4J5D838yKlLOrtwQCfN7WizGqPKk+O4ioo1B2LWkCtWEhaD07dYZwkh4jtQQFZ
         GJMHS/lq5Ujeu9L2RWFgHmQU6Iy84hHaJmmFHqLYcgi3ucC+YkW5uKFh/CJBNCHYbILy
         cnzlJl4286/Gd8MBvdjLokohXwgcZahpksC0yDQg+Q9z62NXyRQdMfvQeswdXnCLWKMl
         fVhrnIWRrvtnZBpaUF88pi0cROJEH96ZNqpMaTexeCkhlVlYIITVmD1mYQZNIjoj2rj6
         AltQ==
X-Gm-Message-State: AOJu0YwknVZqFvtxFwI7eLv3goJUuRflbyfkRagmkanUZeefGopYINux
	CP60Xbk++tfoiXan5sRRrYyO4rUXzNLtdsYtnJy6Sd3emk4vbdfAKH0fi7CG0+Zbvjrs9yWFKus
	NWm5w8l5GCpjS4T/vDddn4+Tki5nVjbfW1uGAGH7RdU372aDTnUy4a67fKNF0umTbBBc=
X-Received: by 2002:adf:fa04:0:b0:332:eb02:ae4e with SMTP id m4-20020adffa04000000b00332eb02ae4emr1411723wrr.43.1700834810591;
        Fri, 24 Nov 2023 06:06:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFis+/lLfxZjtJQ7lznz1VCAiRQQ9xJbnCkNfPYTvCrVFsZHuAsY8Z/MfThwtIZPu40bQy/vxN+vbYoffplrDk=
X-Received: by 2002:adf:fa04:0:b0:332:eb02:ae4e with SMTP id
 m4-20020adffa04000000b00332eb02ae4emr1411653wrr.43.1700834809828; Fri, 24 Nov
 2023 06:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20231124002042.1741578-1-dimitri.ledkov@canonical.com>
 <87sf4vrbl3.fsf@mail.lhotse> <20231124082512.GW9696@kitsune.suse.cz>
In-Reply-To: <20231124082512.GW9696@kitsune.suse.cz>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Fri, 24 Nov 2023 14:06:13 +0000
Message-ID: <CADWks+YP5Ros9xKvXSG=QRkoHN9mnCWoXJmYA+GfF6KtcE-HRA@mail.gmail.com>
Subject: Re: [RFC] UBUNTU: [Config] y2038: Disable COMPAT and
 COMPAT_32BIT_TIME on ppc64le
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Nov 2023 at 08:25, Michal Such=C3=A1nek <msuchanek@suse.de> wrot=
e:
>
> On Fri, Nov 24, 2023 at 03:59:04PM +1100, Michael Ellerman wrote:
> > Dimitri John Ledkov <dimitri.ledkov@canonical.com> writes:
> > > BugLink: https://bugs.launchpad.net/bugs/2038587
> > >
> > > ppc64le is exclusively little endian and 64-bit, thus there is no nee=
d
> > > for COMPAT_32BIT_TIME, nor COMPAT.
> >
> > To be pedantic, the ppc64le kernel does support running 32-bit little
> > endian userspace in compat mode (CONFIG_COMPAT=3Dy). It's a distro choi=
ce
> > as to whether you support COMPAT. Notably there are two other major
> > distros that don't support COMPAT for ppc64le, and the set of 32-bit LE
> > software is effectively empty.
>
> I have seen software that does not work when compiled 64bit so it would
> build 32bit binary even on ppc64le and abuse the compat layer to run.
>
> It quite rare, though.

Thank you! And yes, do not want =3D)

--=20
okurrr,

Dimitri
