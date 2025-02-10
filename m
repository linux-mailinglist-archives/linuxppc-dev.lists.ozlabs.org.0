Return-Path: <linuxppc-dev+bounces-6075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51448A3046B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 08:24:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsXyL6bHgz2yFD;
	Tue, 11 Feb 2025 18:24:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739229071;
	cv=none; b=IwwNRSeVO2TnfU/SG/3fwmYRJFux4xkLEpXXZ46UTb2bCV4nflQo9JhjNciU72UkK5oxNoRqAnB/r1SfOXjZGsTWd4wkz6sY5c2imysGPr9CYKeC0ZYXBap0KVrUwYNdrA3YXrAhIsPCTuDIQQVRDTvvIAV6LA8gJE0jwFbgpEsvf5Y4ozkXA4+9ked9vsk6PhFSu8PzIetyWknj8+E0IaAR0vZOrYh8TN3oeCZXzsd0EI657uJOq+LJmf1LvwGRNYtYWo33yijNddtwJns0mYC0jUzUyGycJlBwtJXv09Arz9Cb9nU5I4Dt7bGqOzQayBH3hcbK4S5oWkbjcpcVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739229071; c=relaxed/relaxed;
	bh=x6ZHTPoBjg/uWcJFr6X1NHVKDtKY1RU4PIMNX3aAG8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTNskgTuI554dITfH1qccwy0UyfZLEv1S5ShfoG8LZ9lDetPy4eo+q9Hyv1BMXLQhDNeOevGLO9yzt0AsVs1JpGHgnM2Wcr4PEr/Hyvqihb6PSxs16qpWA3TUF6yAFHXYh8Hpxvg5WpnlpoeNBQSFNig98nHg6hM8sQ5BZfrjaXX0zuKDJIGs7dYJqaz6A5ALg6y1DHCysGh+HbfaOnuKj7Y9W4WD3Os7XaP9/SVf5rgEWQ95Ia24/8fsFP6X9kvS0noifZ0sc5gt8YZqKLC5HiMuY6HEh9VRS47pWqp76NaBfXMgMRZSrValkmSrXO0A7uoodet6TW9901Ib9H/1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnyvlnIL; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnyvlnIL; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnyvlnIL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnyvlnIL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsL0t0Nlpz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 10:11:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739229064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x6ZHTPoBjg/uWcJFr6X1NHVKDtKY1RU4PIMNX3aAG8g=;
	b=FnyvlnILYEIvHsANKB+DJRJqlm159WgUqDrMIe8ANpNvrWs+xT93AsUaZBVQAlz5U9UuTE
	8dDoVwbj5IPiJ3qH3H5nCPHqhhOp/NjZOT0gjbtucsJvJZpAHTOjen7zklTNmd2DU9wduP
	kY6tBJUaKYAnQSl73ZgbTDAFfUEfKzc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739229064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x6ZHTPoBjg/uWcJFr6X1NHVKDtKY1RU4PIMNX3aAG8g=;
	b=FnyvlnILYEIvHsANKB+DJRJqlm159WgUqDrMIe8ANpNvrWs+xT93AsUaZBVQAlz5U9UuTE
	8dDoVwbj5IPiJ3qH3H5nCPHqhhOp/NjZOT0gjbtucsJvJZpAHTOjen7zklTNmd2DU9wduP
	kY6tBJUaKYAnQSl73ZgbTDAFfUEfKzc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-2jwYDEcZPcOQppZbaMo1GA-1; Mon, 10 Feb 2025 18:10:59 -0500
X-MC-Unique: 2jwYDEcZPcOQppZbaMo1GA-1
X-Mimecast-MFC-AGG-ID: 2jwYDEcZPcOQppZbaMo1GA
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e5b4b8d71easo4565734276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 15:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229059; x=1739833859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6ZHTPoBjg/uWcJFr6X1NHVKDtKY1RU4PIMNX3aAG8g=;
        b=IvWExYa9mevne8ZAKvrc14jlB/6mmjtwO7Os/RUrDwu7VbwWbAU1A22SFvp08WFkM5
         Vw4/6RCGyZs/zud8bR/GocGxIbfG7KhMf0mCole7o48DfR2p6xJgRMS1wWQ4x54PIQju
         qAH++x7Qee2aMKtHQZL7xSn4PrvRKJN+iYrBV4iPOOB2F2sY3DRmx7Yh9nu806BXK7I9
         jzYO/ff9PBsRq4rzI+V04B/GZ95xNDGeHWVJ3+HTDSIO8HvQjebQCAOqitE+DoRhlPzp
         Y9TJhRpd7Ue/Kp73Bf2VI8xKCWf98MCa2yCnR+er0UHQz7S5CHs2fLx3P1SCNukVbFDB
         C76w==
X-Forwarded-Encrypted: i=1; AJvYcCWBTykKjiKmjg5P9NBGjWAFl3XdUZkdMq4gGtBg1RtDdnCucl6KuY+4t8FFHs4bGKQ53jDBtnZ/oZPtrt4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAWdajnmuKVH8qiIsaZWjZX7eAEcepRxi61EQM8qQEj+6sT0u3
	pLBBhcH6qXrynB2RnOwr16G7ZnvUniHwj60Bt98Gf33RFN47jyguWK+7o2aDIJ3NGFgoq8wbmdl
	Og2hFtJ+RlVReErBFNwoTI9Z0phYacxFsjIwVTfhnZEDh16vMCSdijsMigQd3XDbvFkwKLywk++
	PNJ5Bf+CTs9RLw5TQvxI/CBCtPCU44Ghm3NdkIKg==
X-Gm-Gg: ASbGncvYudGVxCjs+MZfzbYGQN1oKo3XhefwVdosrrRP6pvnBra37b0ojEQZLv2bIRD
	sBURKFoCYitbGHZUf7TY3SxUbmCTiF3maTlhRIClRnfsJ3fVchpXnAFU/d2u8v0z+Y/IHtmIMW+
	I=
X-Received: by 2002:a05:6902:1707:b0:e5b:21e4:d887 with SMTP id 3f1490d57ef6-e5b4619f375mr13712178276.19.1739229059279;
        Mon, 10 Feb 2025 15:10:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+uFDoQgt7ClLP9YRwsvG8gLINyPnKkvfjeiO8adNvnnks4vYT/H56Z3CUg+P5cCKTbi1EKyjELPBxs6+aa0U=
X-Received: by 2002:a05:6902:1707:b0:e5b:21e4:d887 with SMTP id
 3f1490d57ef6-e5b4619f375mr13712146276.19.1739229058920; Mon, 10 Feb 2025
 15:10:58 -0800 (PST)
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
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <8b4bb4f0-37fc-4215-a3a9-3771394f065f@redhat.com>
In-Reply-To: <8b4bb4f0-37fc-4215-a3a9-3771394f065f@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 10 Feb 2025 16:10:33 -0700
X-Gm-Features: AWEUYZnj374O6r-fMAMQWzYmUj3jVBsErlGEBDI0ezwDzb8h1N0CVNAmtj-2QQw
Message-ID: <CAA1CXcDXs7VRp=sfyDNTr6fR7MQ+pvb+w-o+gp-N6yTgdpMBRw@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yury Norov <yury.norov@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, David Gow <davidgow@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>, 
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UFMlGqXmpQF1XCrj-cLlp2B07yMNuFpAnHx85XTPA2s_1739229059
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 12:46=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 10.02.25 20:35, John Hubbard wrote:
> > On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
> >> On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> >>> On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> >>>> On 7/27/24 12:35 AM, Shuah Khan wrote:
> > ...
> >>>> The crux of the argument seems to be that the config help text is ta=
ken
> >>>> to describe the author's intent with the fragment "at boot". I think
> >>
> >> IMO, "at boot" is a misnomer, as most tests can be either builtin
> >> or modular.
> >
> > Right.
> >
> >>
> >>> KUNIT is disabled in defconfig, at least on x86_64. It is also disabl=
ed
> >>> on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> >
> > OK so I just bought a shiny new test machine, and installed one of the
> > big name distros on it, hoping they've moved ahead and bought into the =
kunit
> > story...
> >
> > $ grep KUNIT /boot/config-6.8.0-52-generic
> > # CONFIG_KUNIT is not set
> >
> > ...gagghh! No such luck. One more data point, in support of Yuri's comp=
laint. :)
> >
> >>
> >> I think distros should start setting CONFIG_KUNIT=3Dm.
> >
> > Yes they should! kunit really does have important advantages for many u=
se
> > cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the mai=
n
> > obstacle.
>  > > Let me add a few people to Cc who might be able to influence some
> distros.
> >
> > thanks,
>
>
> Fedora has it.
>
> CS-10 has it (-> RHEL-10):
> redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=3Dm
>
> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/blo=
b/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=3Dheads
>
> CS-9 has it (-> RHEL-9):
> redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=3Dm
>
> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9/-/blob=
/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=3Dheads
>
> So I think from the RH side everything is properly set?
>
> Let me CC Nico, he did some KUNIT work in the past.

Yeah that is correct! I enabled KUNIT in our environments a few years
ago. We enable it as a module and use our own wrapper to exercise the
code. For RHEL and Centos these kunit modules are only shipped
internally for testing; However fedora-rawhide makes these modules
available in the kernel-modules-internal package.

To test this you can follow this to install rawhide-vm:
https://developer.fedoraproject.org/tools/virt-builder/about.html
then inside the vm:
    yum install kernel-modules-internal
    add the kunit.enable=3D1 to the cmdline
    reboot vm
    modprobe kunit
    modprobe <test_name>

Hopefully that helps!
-- Nico



>
>
> --
> Cheers,
>
> David / dhildenb
>


