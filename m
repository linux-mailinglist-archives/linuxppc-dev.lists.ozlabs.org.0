Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D852532BA09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 19:53:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrNSN61Lxz3d2t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 05:53:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=XkAcJK6N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.80; helo=rcdn-iport-9.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=XkAcJK6N; dkim-atps=neutral
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrNRy15Dwz3cJy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 05:53:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2586; q=dns/txt; s=iport;
 t=1614797598; x=1616007198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NhiyH3foSNEt6lkCV9u0ibo4udmRICreeAo5BgksPTA=;
 b=XkAcJK6NhNeY78iRyhtoAH3SVk0CAVzeYOgMiArKKpjaKwxBAcSytKF0
 X2tasKeRxMFTr5kC93ivpnBVtH2og8DzmTJBBpr3unV0rWQdGy8+PPLPo
 +rF+36U0iN1Yhb5Sjpbb8gPwyU3B9+1fsG5P5IoWwk+YdGZSCYukSjXPV g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BOAwB12j9g/5NdJa1iHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgU+CK3ZWATkxlh6PehaMOwsBAQENAQEjEQQBAYEUgzQDAgK?=
 =?us-ascii?q?BegIlOBMCAwEBCwEBBQEBAQIBBgRxhWENhkQBAQEDATIBRhALEgYuPA0OBhM?=
 =?us-ascii?q?bglaCZiEPrT10gTSEPwELAYRTgT4GIoEWjUMmHIFJQoQrPoJcBBeHPASCRoE?=
 =?us-ascii?q?7c4IBkEuCS4otm3uDBoEfiCCSUjEQgyeKT5VQoBKSGg2EOQIEBgUCFoFrI4F?=
 =?us-ascii?q?XMxoIGxU7gjUBMxMMMRkNlyKFZiADLwIBAQEzAgYBCQEBAwmMEwEB?=
X-IronPort-AV: E=Sophos;i="5.81,220,1610409600"; d="scan'208";a="778466374"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
 by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 03 Mar 2021 18:53:10 +0000
Received: from zorba ([10.24.1.194])
 by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 123Ir8xP021729
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 3 Mar 2021 18:53:10 GMT
Date: Wed, 3 Mar 2021 10:53:08 -0800
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/7] Improve boot command line handling
Message-ID: <20210303185308.GH109100@zorba>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <20210302173523.GE109100@zorba>
 <CAL_JsqJ7U8QAbJe3zkZiFPJN4PveHz5TZoPk2S8qQWB6cm5e5Q@mail.gmail.com>
 <20210303173908.GG109100@zorba>
 <59b054e8-d85b-fd87-c94d-691af748a2f5@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59b054e8-d85b-fd87-c94d-691af748a2f5@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.1.194, [10.24.1.194]
X-Outbound-Node: rcdn-core-11.cisco.com
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 03, 2021 at 07:07:45PM +0100, Christophe Leroy wrote:
> 
> 
> Le 03/03/2021 à 18:39, Daniel Walker a écrit :
> > On Tue, Mar 02, 2021 at 08:01:01PM -0600, Rob Herring wrote:
> > > +Will D
> > > 
> > > On Tue, Mar 2, 2021 at 11:36 AM Daniel Walker <danielwa@cisco.com> wrote:
> > > > 
> > > > On Tue, Mar 02, 2021 at 05:25:16PM +0000, Christophe Leroy wrote:
> > > > > The purpose of this series is to improve and enhance the
> > > > > handling of kernel boot arguments.
> > > > > 
> > > > > It is first focussed on powerpc but also extends the capability
> > > > > for other arches.
> > > > > 
> > > > > This is based on suggestion from Daniel Walker <danielwa@cisco.com>
> > > > > 
> > > > 
> > > > 
> > > > I don't see a point in your changes at this time. My changes are much more
> > > > mature, and you changes don't really make improvements.
> > > 
> > > Not really a helpful comment. What we merge here will be from whomever
> > > is persistent and timely in their efforts. But please, work together
> > > on a common solution.
> > > 
> > > This one meets my requirements of moving the kconfig and code out of
> > > the arches, supports prepend/append, and is up to date.
> > 
> > 
> > Maintainers are capable of merging whatever they want to merge. However, I
> > wouldn't make hasty choices. The changes I've been submitting have been deployed
> > on millions of router instances and are more feature rich.
> > 
> > I believe I worked with you on this change, or something like it,
> > 
> > https://lkml.org/lkml/2019/3/19/970
> > 
> > I don't think Christophe has even addressed this.
> 
> I thing I have, see https://patchwork.ozlabs.org/project/linuxppc-dev/patch/3b4291271ce4af4941a771e5af5cbba3c8fa1b2a.1614705851.git.christophe.leroy@csgroup.eu/
> 
> If you see something missing in that patch, can you tell me.
 
Ok, must have missed that one.


> > I've converted many
> > architectures, and Cisco uses my changes on at least 4 different
> > architecture. With products deployed and tested.
> 
> As far as we know, only powerpc was converted in the last series you
> submitted, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=98106&state=*


Me and others submitted my changes many times, and other architectures have been included. The patch
you submitted I've submitted similar at Rob's request years ago.

Here a fuller submissions some time ago,

https://lore.kernel.org/patchwork/cover/992768/

You've only been involved in prior powerpc only submissions.

Daniel
