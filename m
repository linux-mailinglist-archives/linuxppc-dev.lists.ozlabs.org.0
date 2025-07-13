Return-Path: <linuxppc-dev+bounces-10230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B9B0311E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 15:27:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bg5pz6sH9z30Vs;
	Sun, 13 Jul 2025 23:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752413259;
	cv=none; b=Qw3QFQU3XoOIFWn21fCgyra8tVmzx1YDGCWFAom652301IhV6AjdJ80FyPTG4ww7zBVZmPitysr/r2suWQf/gNqjV269VeYglBDdLfqRuLT0+lYL1eQ0/2vl8ktBpSQmkhDLGd+NKn+TZPYRndMEz/49v2nRzm87hgfr95AclktrL2XTMtsp7CLlq5kcTl/7WswE77ADGgAl6yV2V2cxtmlWj4RdvUJ+nx99nwruHOJyHk0M5GomtH5M49ZkE49EYEGVLoLXIM3SVAbDRYff1CXhKIlVMWGWJFYM2UuGYctDMrJJvHqn2HHSooYA/lOt6aXa4L7bqYV6SdsLKha5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752413259; c=relaxed/relaxed;
	bh=SbPUMGX8ZxgFnHeeV/hiD/+ZSjBKC2dEHsGM22BJ5fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loKgAiHenaNUDH+mjDso5+lp4icmljLwEGk2yh1lo6Opyq6D87Vf/R150ERw7oBM7qvlWruom8rzFYOHe7t+ruAj2aDThtnQ2Cob8Y/JQrpmXwwazsU/jWclg8rm1QrVXEdHhzEHT/3TBKVA/IKY/eUViHPyaiZWKl4Q78lvOmySyMNx22ldOjHnBWwNzEuOlGpihfzlL2/SgCby+rRveStzrknBkQNoRcpNlOOYtWSbwJzqb0Efgtd2QJXqI4LL8NuqyMHo1+KxWg9g1+Ev/stsN3K3GwzxqH94hE/uu47EjroPy1hJo4/iJiKb38laAEq87RTnFvpfMz3QHWjBVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y9nKTHnN; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yqz/Re7r; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y9nKTHnN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yqz/Re7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bg5py3fdbz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 23:27:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752413251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbPUMGX8ZxgFnHeeV/hiD/+ZSjBKC2dEHsGM22BJ5fQ=;
	b=Y9nKTHnNcGr0lK+YsUzaMMdSz4yTGJJHlyCAO2LVC1NvvQKWj+J1S6y48NZU7CsEpLsnfu
	RrnlJljfjuLoKaGDpVF/hNf6+aK5XOCBZaDlYsRlrnAYLCgsjBTJhja9oy8MtNNU0W2A8N
	QRYWHqYtUODyPcQlsOwO+ardGPl3d7U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752413252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbPUMGX8ZxgFnHeeV/hiD/+ZSjBKC2dEHsGM22BJ5fQ=;
	b=Yqz/Re7rU+qFWQosH+71KNw8cn1yhYd16Hfspjmv8MPZvT7gVscM2+CiA468f7Mg766n3A
	mEBMLMCqA4ieq5r0ISjIU87VVrqpcGLW8udE1dZGp+Dsad8jU+t5tvD/XXczWjL17hbiki
	cpXXXj0F635CxitBNHUaAxtfA9jkMhM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-SiY4tL5qPz2nVGv4YVFEVA-1; Sun, 13 Jul 2025 09:27:29 -0400
X-MC-Unique: SiY4tL5qPz2nVGv4YVFEVA-1
X-Mimecast-MFC-AGG-ID: SiY4tL5qPz2nVGv4YVFEVA_1752413249
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-60835716983so4044383a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 06:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752413249; x=1753018049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbPUMGX8ZxgFnHeeV/hiD/+ZSjBKC2dEHsGM22BJ5fQ=;
        b=QKhquDp2T+8pWfNNjiWq8rDu1/6Vhc4DzUMJ4mXxl8uyt1CY/TK62bVPtDOvl0wjpA
         H14zOFjuovazm3jwZKHKT+Ta+6Fz2kTyAxB/b2Cd9PcO3wzSPLO6vPVyaEg3Rak0U3Hd
         6t/1R8X9ssW6i8BkiVxY6+GWSj7CoQXPInt6bri1p8DIZqRIqwFrBrwx0fVz7eXGkt31
         kcP4XGxLjAoCGWXxbJnEayvLSHEPPFKfqLipxVO0aF76Erpm8T9gLaDcK1H+wnQO0nec
         EJjKn+TapSV4sOBqdlIlsoShArtFHu+WoPVR+rfOolRIVHQErIPr3nLQnQjy3YMS7vhb
         1aSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUka0pWvwMDVudyhIiMReeXFjOR1Gfbu+CnDfsiSMEy1Yi0jhEqR+xPSzzogh+3qSWawh6KE9wfrI55H84=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxu1wAejImOAZpBu6T1vgRi+cdFQeRG25bzXgcTcrMRI3sjIjBE
	S51Ke8dWVMwldaVj08rrQAGLjZ47N+WrDksJXp5sZSSVIH0PqS/+4mDqGOpU47nE+Iy7TNZYwV+
	GKdIB7n+vBCcXIYgDDwhz5xeTrJPD+6puf8Z5nI7xbxfHRSMn7/agPaTVOUbgmLWq1qTpgrMW8n
	EinbJehke04ueuaiZY13MDhg+JBBxKlIX53/XShxWVSQ==
X-Gm-Gg: ASbGncsIy0Dfhh45m40G8O8qXIGr/mXrwqS8l7K7sX5Us3SZnrbOD40+UTbPOcrofPl
	1dquQ/38co4MhlC2Ec9hQ1VfWXNKQiZjZZom13JUk4vX8DcvgV3S0yBy4liGo+pcCQCMb3kle+Y
	n5xmbg9AMHGq9Ogru/E0htwQ==
X-Received: by 2002:a05:6402:5208:b0:602:e002:9602 with SMTP id 4fb4d7f45d1cf-611ed0b48a3mr8984296a12.22.1752413248644;
        Sun, 13 Jul 2025 06:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIlJvPutpwR+W9sYxwViMZl/nxrPvYhgmffq4XbNJHFHpRjpXPpPQW6Oj3vKgX0RqUfCjFSDen0AZNhqrle4U=
X-Received: by 2002:a05:6402:5208:b0:602:e002:9602 with SMTP id
 4fb4d7f45d1cf-611ed0b48a3mr8984268a12.22.1752413248167; Sun, 13 Jul 2025
 06:27:28 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250711053509.194751-1-thuth@redhat.com> <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com> <2025071152-name-spoon-88e8@gregkh>
 <aHC-Ke2oLri_m7p6@infradead.org> <2025071119-important-convene-ab85@gregkh>
 <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com>
 <aHGafTZTcdlpw1gN@gate> <CAC1cPGzLK8w2e=vz3rgPwWBkqs_2estcbPJgXD-RRx4GjdcB+A@mail.gmail.com>
 <alpine.DEB.2.21.2507122332310.45111@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2507122332310.45111@angie.orcam.me.uk>
From: Richard Fontana <rfontana@redhat.com>
Date: Sun, 13 Jul 2025 09:27:17 -0400
X-Gm-Features: Ac12FXxrW3BGCO-1ZfGLfyWGLr1WX6guqRW-xwVntrFMkfEbUP4U2wTWbTptYug
Message-ID: <CAC1cPGwa=0zSL_c+HrjQoPryus6w_LCw9Cha7uENKHqCKOQkRQ@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Thomas Huth <thuth@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-spdx@vger.kernel.org, 
	J Lovejoy <opensource@jilayne.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _jcuRXVWjXaGlj35J9AWUN2H6GJJnUjihQQ_25vZ_Fw_1752413249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jul 12, 2025 at 6:48=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Fri, 11 Jul 2025, Richard Fontana wrote:
>
> > > > while this one:
> > > >
> > > >  *    As a special exception, if you link this library with files
> > > >  *    compiled with GCC to produce an executable, this does not cau=
se
> > > >  *    the resulting executable to be covered by the GNU General Pub=
lic License.
> > > >  *    This exception does not however invalidate any other reasons =
why
> > > >  *    the executable file might be covered by the GNU General Publi=
c License.
> > > >
> > > > does not seem to be in the SPDX exception list. It is very similar =
to
> > > > `GNU-compiler-exception` except it specifically mentions GCC instea=
d
> > > > of saying "a GNU compiler".
> > >
> > > https://spdx.org/licenses/GNU-compiler-exception.html
> > >
> > > is exactly this.
> >
> > No, because `GNU-compiler-exception` as defined here
> > https://github.com/spdx/license-list-XML/blob/main/src/exceptions/GNU-c=
ompiler-exception.xml
> > assumes use of the term "GCC" rather than "a GNU compiler".
>
>  I don't know what the legal status of the statement referred is, however
> the original exception as published[1] by FSF says:
>
> '"GCC" means a version of the GNU Compiler Collection, with or without
> modifications, governed by version 3 (or a specified later version) of th=
e
> GNU General Public License (GPL) with the option of using any subsequent
> versions published by the FSF.'

> which I think makes it clear that "GCC" is a collection of "GNU compilers=
"
> and therefore the two terms are synonymous to each other for the purpose
> of said exception (in the old days "GCC" stood for "GNU C Compiler", but
> the old meaning makes no sense anymore now that we have compilers for Ada=
,
> Fortran and many other languages included in GCC).
>
>  NB up to date versions of CRT code refer to the exception as published
> rather than pasting an old version of its text:
>
> 'Under Section 7 of GPL version 3, you are granted additional
> permissions described in the GCC Runtime Library Exception, version
> 3.1, as published by the Free Software Foundation.'
>
> References:
>
> [1] "GCC Runtime Library Exception", version 3.1,
>     <https://www.gnu.org/licenses/gcc-exception-3.1.html>

I think we're basically talking past each other. The definition of
"GCC" in the GCC runtime library exception 3.1 is irrelevant because
that file does not refer to that exception. In SPDX, license (and
exception) identifiers are precisely defined. Unless I'm missing
something there is no official SPDX identifier that corresponds to
this text:

  As a special exception, if you link this library with files
  compiled with GCC to produce an executable, this does not cause
  the resulting executable to be covered by the GNU General Public License.
  This exception does not however invalidate any other reasons why
  the executable file might be covered by the GNU General Public License.

I'm not personally a major supporter of SPDX and I'm the last person
who would want to be associated with SPDX pedanticism but it's a
standard and if the Linux kernel project is going to use it IMO it
should conform to that standard, otherwise you're basically making ad
hoc definitions of pseudo-SPDX expressions or redefinitions of
already-defined SPDX identifiers, which seems to defeat the purpose of
using SPDX expressions at all. Under that standard, there is currently
no SPDX identifier representing the above text (as far as I can tell).
The solution is either to propose a modification of
`GNU-compiler-exception` so that "GCC" is accepted as an alternative
to "a GNU compiler", or to propose a new exception to be added to
SPDX's exception list, or to use a custom-defined `AdditionRef-`
identifier.

Richard


