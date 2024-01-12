Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2994082B871
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 01:07:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QZ2/ZoXc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB20P4fWkz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 11:07:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QZ2/ZoXc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB1zW4gMkz30hY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 11:06:30 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d542701796so32951245ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 16:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705017987; x=1705622787; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKLPhbioWpfH1srd0q/IxvLCNQNb8nO9MyFbNf4pRe0=;
        b=QZ2/ZoXchdnQ+gi43iAhcwlIJG2dwp9woG8CnpgfKqPM1FUHdJYzYmySKI6H1wbj6E
         4HSta3DrZv1QK3ptRtGu+RhEspEhi1OcQ+uJjUeidfeHi4S0RNGDBw/SVJC7xtBD7MW2
         dRA8x5Ws5vEc2/ZHzguRY8R9niNn0YSZIp+M6gPYCC4gB44/W+c8QNZ5s8JnWplAcEjW
         /vHn9jhzdLYScwWDEeVFO27r7MEfnw28/RV6WTidYfrvK8v8saJTBXeQsGdN8ClNGBKF
         6sUmqvC7OrbTjqBBFG/CT4sUaYgZfB2OsAqhvnINJMiyqwxndWjBj5oQ9McFXmh5NPCV
         AZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705017987; x=1705622787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKLPhbioWpfH1srd0q/IxvLCNQNb8nO9MyFbNf4pRe0=;
        b=FkZ+raCd3q5htQRNvIr75GfolBdnRxAwgnakxr62P0g9OFJb2mYIFw2bdOv9N9TwlH
         E9vAHvlluAvLzf03ww97J8x3s+ViXpuhq2tZXDR0j9lhP+uugN2Vfc4mIXgGG8sSQwqe
         jW9hDAasVIGHRxxbWc6Z/R5qj873HdfI+zhzJzCfmGIcQHmndpjCVu+lV9k73byK653V
         hyj8ufM1EDYvnwZzhGPZFHA11gLXqKAgpZyBzXTyGhbrdtAN8ydO8ISl+Yw0dpKWIN45
         msXDeU5b2YjppADQlIOJMUt4X3fKo1Sw+rep4YC0tPZHrdr9nnZ+wSx8GNvajwgVhLWt
         bU4A==
X-Gm-Message-State: AOJu0YzbmsHWmWsNXNXihipaeXENsIG7j/EkMhjOUrUWYSkl1+SJ40Bn
	+le0x9F/Kcp+K0+ljXITVgT0t5spRMri1yTs8BwcPXdsTWDo3w==
X-Google-Smtp-Source: AGHT+IFbuLp6sm4bRgDDYFo7YqbafV2kTHANQ2/PIacmGMzOtgNkFdKGc2JOO7JvYBwf1FIXKoqFLeKFFqmQz/XZksY=
X-Received: by 2002:a17:902:bd87:b0:1d4:2473:e833 with SMTP id
 q7-20020a170902bd8700b001d42473e833mr94782pls.69.1705017987206; Thu, 11 Jan
 2024 16:06:27 -0800 (PST)
MIME-Version: 1.0
References: <674182417.2124034.1703736924982.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <674182417.2124034.1703736924982.JavaMail.zimbra@raptorengineeringinc.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 12 Jan 2024 11:06:15 +1100
Message-ID: <CAOSf1CFTM4A2akwBZUSv9Ys0UUWqxwoQ9xeAdvs13G5izM=L4w@mail.gmail.com>
Subject: Re: PowerNV PCIe hotplug support?
To: Timothy Pearson <tpearson@raptorengineering.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 28, 2023 at 3:16=E2=80=AFPM Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>
> I've been evaluating some new options for our POWER9-based hardware in th=
e NVMe space, and would like some clarification on the current status of PC=
Ie hotplug for the PowerNV platforms.
>
> From what I understand, the pnv_php driver provides the basic hotplug fun=
ctionality on PowerNV.  What I'm not clear on is to what extent this is int=
ended to flow downstream to attached PCIe switches.

I did a bunch of work on NVMe hotplug back in the day and it worked
fine then. Most of that work was done with Gen3 PLX switches though
which are considerably dumber than the newer ones though.

> I have a test setup here that consists of a PMC 8533 switch and several d=
ownstream NVMe drives, with the switch attached directly to the PHB4 root p=
ort.  After loading the pnv_php module, I can disconnect the downstream NVM=
e devices by either using echo 0 on /sys/bus/pcu/slots/Snnnnnnn/power, or b=
y doing a physical surprise unplug, however nothing I try can induce a newl=
y plugged device to train and be detected on the bus.  Even trying a echo 0=
 and subsequent echo 1 to /sys/bus/pcu/slots/Snnnnnnn/power only results in=
 the device going offline, there seems to be no way to bring the device bac=
k online short of a reboot.
>
> Hotplug of other devices connected directly to the PHB4 appears to work p=
roperly (I can online and offline via the power node); the issue seems to b=
e restricted to downstream devices connected to the (theoretically hotplug =
capable) PMC 8533 switch.

I'd suspect either the PCIe interrupt is not being delivered for some
reason (EEH might be isolating the PCIe switch port?) or the removal
is triggering downstream port containment on the switch. Check the
port capability status with lspci. IIRC pnv_php doesn't know anything
about DPC so you might need to have skiboot disable that by default to
keep the kernel happy.

> Is this the intended behavior for downstream (non-IBM) PCIe ports?  Rapto=
r can provide resources to assist in a fix if needed, but I would like to u=
nderstand if this is a bug or an unimplemented feature first, and if the la=
tter what the main issues are likely to be in implementation.

It *should* work and the WARN()/BUG() spew you're seeing are bugs that
just need fixing. That said, hotplug on PNV is a headache for a bunch
of reasons most of which are due to EEH. Something I was working
towards before I left IBM was refactoring how EEH worked internally so
we could eliminate the need for pnv_php and go back to using the
standard pcieport driver. Unfortunately, that's a big job and I can't
even remember how much of that work actually made it upstream.
