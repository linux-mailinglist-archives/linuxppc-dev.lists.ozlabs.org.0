Return-Path: <linuxppc-dev+bounces-8807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FAAABEEF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:03:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2QSP6nHWz3bxC;
	Wed, 21 May 2025 19:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.142
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747818197;
	cv=none; b=niwIDWQLtX5bfVFR6jOmXstNBOHWvVAcHJCbLEjXICOylPm2Rxytd/4NExC4MpvXLAhyizGApQjYgOJZ6QWmQp6XiU9qFzKxYepjcsl7narMhcA+QyB+s/bYOW24niwRAyrNG4L2cx93xkEYWNqlUfUbktvIxO8saYCuTcjiafSwiE6klL16D06xn5RfbPPkDTHBps0KWWjjAZmhsBl6zxMAOkSog9MtCk8/RAWHldS4pEMFNhOZWw3+epsOj7h4reiBSsWT1j7fr5OopAl0MLfb3KXP8i66uWbP3JHiduh9OCN+J+O2gtr7RXMbTxcLd7k/8HFweHCQ6Hx7Na5ulg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747818197; c=relaxed/relaxed;
	bh=PcLZXiuxQaS428giR3RzU3lnofnEDkKQy05a9KBTIH4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JFRZ4VFo4R3SAs0IxkyPfCPd63NXhgQ76N9gmoajYun6/+cdssbgAPpAflTF1jVSTYTSD7izJD6DWyM1woc5sozTdSu0b4DU2IsEhvQRP+/X4FPHgQRdl4nHTcwTk5UITklNajCTK5AnPpYmZAayvs63EFHOdWQ30dsus1wH30fip7q5fQ8+EUOlBdNgrnWX/QHIZkf6bu2BUWlReqnYkUYHOCWNXg45BhbvwFYCSWCCPU/8OOyuVewrwHxIwWVsXD1U8YfUaBPE2VGbYXF43YX38KJMzKwo/fUxJAu9zlihAHPRp5ee1DMTiD2HURl8lzQuCBz92yNdwBhmzu9UJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=X0yqjwNO; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uI8WqM4U; dkim-atps=neutral; spf=pass (client-ip=202.12.124.142; helo=flow-b7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=X0yqjwNO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uI8WqM4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.142; helo=flow-b7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2QSL3r0hz3bwR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:03:14 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id A4BD71D40364;
	Wed, 21 May 2025 05:03:09 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 21 May 2025 05:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747818189;
	 x=1747825389; bh=PcLZXiuxQaS428giR3RzU3lnofnEDkKQy05a9KBTIH4=; b=
	X0yqjwNOIHFbbyAMp8e+lc734RzVhf2mttBdzb5/4PMjAjtGIoYyKTXWpp5LUMZY
	UYk5264j/flGcQAxn/0aipvCYsyakWYfCx48DeXYvCyUc0pAqKDLu8sNNiyT1e/3
	Z2Mbo/sMQjMw9+9EdqtU6tAymHAorktE8XdWGVj7oIF0XQUKXh0ka7bcfwAsiQE8
	7PIjkmLtm0yktW32JI/2jWDHgwnt3JRuAnKH9IONnmWPsAX7kzyKxjWbGYfFWARP
	C/bm1/lzAW3goAn6MDDykyzGJLy2xaGQLXgp8bUOmo0mnfnS8t/64LRPGu7y5cAS
	lCkbwZXNEBwQPb5RsEBKdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747818189; x=
	1747825389; bh=PcLZXiuxQaS428giR3RzU3lnofnEDkKQy05a9KBTIH4=; b=u
	I8WqM4URNBtG1O9aNSekfVbxmmyap2TCl0Pmz6PzkiJGnD+9EpKhvN6xyLAt3JcB
	LEamw0lRIAgkp/E3huSiNE/JYIl3XS4YlcgRiBahZaRkW9J40WM1u0VIbzIoqQou
	65VHiVv02T4e/HhoBS1vfS0B8TLisD+8ZohVUTsffs5sTpucQSRrdCoWVTkbikas
	nVXzMghonnpindYVmFOaZ/HQJD7B3BTLKN7tc29n+IcKE4NcUUDo/XAa75TjRgYx
	FRdfLNpr2qsb9tlw7vgH9k/PxSyohwf6/HzMzKZHjlZIfrn7LISVFAobmL61fZUC
	uL6OqFO8iVizmBcH5059Q==
X-ME-Sender: <xms:yJYtaOdG95h60oA3MHIpMPuHND39LFM-LzSwDe0DEcP9XfesCudnDg>
    <xme:yJYtaIPW5kEhj4amhl690E2cWDjdLEpBrH32igs0wa-xEso7VUfxp41ppEB7SJz6S
    khcBGMHzFtHCUb4YOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieejucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuc
    eorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedu
    keetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
    nhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsph
    esrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhr
    rghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmh
    drtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprh
    gtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhi
    tgesughighhikhhougdrnhgvthdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrih
    gurdgruhdprhgtphhtthhopegurghvihgusehfrhhomhhorhgsihhtrdgtohhm
X-ME-Proxy: <xmx:yJYtaPhfJ8b6ct5ipcOM5f3QyCrCXS7czDwni2auaNSZ0ENy_javHQ>
    <xmx:yJYtaL8YgIzNtJ5jUXMgbGYsCahl_vIECDUmEG1VMtT-Bw6d61zs3w>
    <xmx:yJYtaKvnHZepdP7D1Ngb2izf-LWz1u5WPzQIf6Iec_CTJjGcD73Lng>
    <xmx:yJYtaCHiaZKua2gNKTvNmZUEwVbXF10MOkbeJHgM-Fn64jfIYFGn2Q>
    <xmx:zZYtaClfmfNEy492Pjkj4JJJLU4jdO1kA6YMVNHGknn0sw_OUTdM-JYy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 341AD1060061; Wed, 21 May 2025 05:03:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
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
X-ThreadId: Tdb8541d917685bac
Date: Wed, 21 May 2025 11:02:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrey Albershteyn" <aalbersh@redhat.com>,
 "Dave Chinner" <david@fromorbit.com>
Cc: "Amir Goldstein" <amir73il@gmail.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 "Ondrej Mosnacek" <omosnace@redhat.com>,
 "Tyler Hicks" <code@tyhicks.com>, "Miklos Szeredi" <miklos@szeredi.hu>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 "Andrey Albershteyn" <aalbersh@kernel.org>
Message-Id: <d638db28-2603-448f-b149-b33eca821a64@app.fastmail.com>
In-Reply-To: 
 <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
 <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
 <aCsX4LTpAnGfFjHg@dread.disaster.area>
 <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025, at 10:48, Andrey Albershteyn wrote:
> On 2025-05-19 21:37:04, Dave Chinner wrote:

>> > +struct fsx_fileattr {
>> > +       __u32           fsx_xflags;     /* xflags field value (get/set) */
>> > +       __u32           fsx_extsize;    /* extsize field value (get/set)*/
>> > +       __u32           fsx_nextents;   /* nextents field value (get)   */
>> > +       __u32           fsx_projid;     /* project identifier (get/set) */
>> > +       __u32           fsx_cowextsize; /* CoW extsize field value (get/set)*/
>> > +};
>> > +
>> > +#define FSXATTR_SIZE_VER0 20
>> > +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
>> 
>> If all the structures overlap the same, all that is needed in the
>> code is to define the structure size that should be copied in and
>> parsed. i.e:
>> 
>> 	case FSXATTR..._V1:
>> 		return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1));
>> 	case FSXATTR..._V2:
>> 		return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2));
>> 	case FSXATTR...:
>> 		return ioctl_fsxattr...(args, sizeof(fsx_fileattr));

I think user space these days, in particular glibc, expects that
you can build using new kernel headers and run on older kernels
but still get behavior that is compatible with old headers, so
redefining FS_IOC_FSGETXATTR would be considered a bug.

I'm fairly sure that in the past it was common to expect userspace
to never be built against newer headers and run on older kernels,
but the expectation seems to have gradually shifted away from that.

> So, looks like there's at least two solutions to this concern.
> Considering also that we have a bit of space in fsxattr,
> 'fsx_pad[8]', I think it's fine to stick with the current fsxattr
> for now.

You still have to document what you expect to happen with the
padding fields for both the ioctl and the syscall, as the
current behavior of ignoring the padding in the ioctl is not
what we expect for a syscall which tends to check unknown
fields for zero. I don't see a good solution here if you
use the same structure.

      Arnd

