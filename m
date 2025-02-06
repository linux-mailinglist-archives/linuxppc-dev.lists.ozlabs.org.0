Return-Path: <linuxppc-dev+bounces-5912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A15A2B35E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 21:28:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YppZf2jxpz30MY;
	Fri,  7 Feb 2025 07:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.63.210.85
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738846048;
	cv=none; b=NlPInPtTQqN6xJuGcbkFOnqQ/zDNb2lFFupuJ/ILEuC41iZgVE0xeLDA7jf9I2FVA7vsT39JywkzD4q8CElgvT/WQsyk2Wyj8au0IxHWYtO3YJ8XXqYhu/jQOYF8v9BWDzI15KhXbbdkRdyjWgsV2MJXuo7gqU5f0D2qt3urCg1JDTlKJQRe7LqDyYsIlSTylZ9qkoYOC9jfH4YL4GNTolCyW7gbzgiQqXUWWtGOy5966I2aerA3gmSlfrXsYsCbUT1Ri1UksLS1GooDXeowRWQ3PGxhf3WEoEUTeTFAIOLVNEjxkS6V+tM36h+obpD0CYSMSzXQnY53N3eerRfWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738846048; c=relaxed/relaxed;
	bh=gGjxLpCbPBjW2Ych8XSy3B16+07LZI5NC9HXokxFssw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JjcRbdsiJr9WSSUAlEMwm12mTESwjI074BOlQMQpV69On66UN7t7o/frHirEEwClO8CGDQGR3Dmb7dKH2t3mlqygOGW5uSqnEe2nbDf2YLm6P9OmEl34FPbdj+JRzQndZkevtUFB9XsQ8IpBRtgWWWFIaoZZMlPpq7i3U2J/Y4mrq5/6XnRxMsl0calbGq5xq2F3xQGTEaDN4RHKbncri5tEsDKC2J37J94RmTYipO4hXt4ml0ShA9fvXtFzoohzG+ZlVi4QrEUxfUYT59o1JdiLHg02BwixnQ6shKuG3f3euyFurLszstKy5SEcGnN5Viknm+Ckd40x+pZjc7vJWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.a=rsa-sha256 header.s=default header.b=nwevoDBb; dkim-atps=neutral; spf=pass (client-ip=212.63.210.85; helo=mail.marcansoft.com; envelope-from=lina@asahilina.net; receiver=lists.ozlabs.org) smtp.mailfrom=asahilina.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.a=rsa-sha256 header.s=default header.b=nwevoDBb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asahilina.net (client-ip=212.63.210.85; helo=mail.marcansoft.com; envelope-from=lina@asahilina.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 366 seconds by postgrey-1.37 at boromir; Thu, 06 Feb 2025 23:47:25 AEDT
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpcM15xqtz307V
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2025 23:47:25 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 309B343A93;
	Thu,  6 Feb 2025 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738845671;
	bh=gGjxLpCbPBjW2Ych8XSy3B16+07LZI5NC9HXokxFssw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=nwevoDBbC0UeG2eDXtUawSqdQxRm+euSZHd3ngRpkByL0DD9kCFf49BH0SVwqgk2n
	 VbPbgsXeuo5qKxEQitzDnNoYRnRhrDKUdwnfZEkFo1hN7pvdu935hNtstjc2/IZoPD
	 wZ84XMWJKbaTiwQ/YcDC3VxbjMRTo+8kUIfTzRhKhmMvCUS0mMfOHTpNhAIUJH1Hco
	 bUkn/83a2NXwoIF45+wABskiOXwaXu9MjBUmoX7JF/ca3nB3DXUGRGPVqXmKTz2oWw
	 XQrIRRijvdh5im9KZQEg5MV7prp92svrz8nBInZM8ksGdBxRXC4dm5xe52/WWrZvPA
	 ZkBWJ4Sif4Mvw==
Date: Thu, 06 Feb 2025 13:41:11 +0100
From: Asahi Lina <lina@asahilina.net>
To: Dan Williams <dan.j.williams@intel.com>, Vivek Goyal <vgoyal@redhat.com>,
 Alistair Popple <apopple@nvidia.com>
CC: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 alison.schofield@intel.com, zhang.lyra@gmail.com,
 gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com, jack@suse.cz,
 jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
 willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com,
 david@redhat.com, peterx@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com,
 hch@lst.de, david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
 German Maglione <gmaglione@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
User-Agent: K-9 Mail for Android
In-Reply-To: <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com> <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com> <Z6NhkR8ZEso4F-Wx@redhat.com> <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <A1E3C5B2-CCD8-41BA-BBC8-E8338C18D485@asahilina.net>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On February 6, 2025 1:10:15 AM GMT+01:00, Dan Williams <dan=2Ej=2Ewilliams=
@intel=2Ecom> wrote:
>Vivek Goyal wrote:
>> On Fri, Jan 10, 2025 at 05:00:29PM +1100, Alistair Popple wrote:
>> > FS DAX requires file systems to call into the DAX layout prior to unl=
inking
>> > inodes to ensure there is no ongoing DMA or other remote access to th=
e
>> > direct mapped page=2E The fuse file system implements
>> > fuse_dax_break_layouts() to do this which includes a comment indicati=
ng
>> > that passing dmap_end =3D=3D 0 leads to unmapping of the whole file=
=2E
>> >=20
>> > However this is not true - passing dmap_end =3D=3D 0 will not unmap a=
nything
>> > before dmap_start, and further more dax_layout_busy_page_range() will=
 not
>> > scan any of the range to see if there maybe ongoing DMA access to the
>> > range=2E Fix this by passing -1 for dmap_end to fuse_dax_break_layout=
s()
>> > which will invalidate the entire file range to
>> > dax_layout_busy_page_range()=2E
>>=20
>> Hi Alistair,
>>=20
>> Thanks for fixing DAX related issues for virtiofs=2E I am wondering how=
 are
>> you testing DAX with virtiofs=2E AFAIK, we don't have DAX support in Ru=
st
>> virtiofsd=2E C version of virtiofsd used to have out of the tree patche=
s
>> for DAX=2E But C version got deprecated long time ago=2E
>>=20
>> Do you have another implementation of virtiofsd somewhere else which
>> supports DAX and allows for testing DAX related changes?
>
>I have personally never seen a virtiofs-dax test=2E It sounds like you ar=
e
>saying we can deprecate that support if there are no longer any users=2E
>Or, do you expect that C-virtiofsd is alive in the ecosystem?

I accidentally replied offlist, but I wanted to mention that libkrun suppo=
rts DAX and we use it in muvm=2E It's a critical part of x11bridge function=
ality, since it uses DAX to share X11 shm fences between X11 clients in the=
 VM and the XWayland server on the host, which only works if the mmaps are =
coherent=2E

(Sorry for the unwrapped reply, I'm on mobile right now=2E)

~~ Lina

