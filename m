Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF9106E0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 12:16:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vDng5PbMzDqRn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 20:16:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rjwysocki.net
 (client-ip=79.96.170.134; helo=cloudserver094114.home.pl;
 envelope-from=rjw@rjwysocki.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rjwysocki.net
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vDmL53yBzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 20:15:13 +1000 (AEST)
Received: from 79.184.254.69.ipv4.supernova.orange.pl (79.184.254.69) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.213)
 id 16ecf9d589608daa; Wed, 1 May 2019 12:15:07 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH v5 00/23] Include linux ACPI docs into Sphinx TOC tree
Date: Wed, 01 May 2019 12:15:07 +0200
Message-ID: <3825811.MXkekUSqSZ@kreacher>
In-Reply-To: <20190425152034.u4q6wjhm3yfhbnzp@mail.google.com>
References: <20190424175306.25880-1-changbin.du@gmail.com>
 <CAJZ5v0i3iEyn1vBjPkA0X=8h_UrSeTNV_JduJq9qfYpgCOAPjQ@mail.gmail.com>
 <20190425152034.u4q6wjhm3yfhbnzp@mail.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Fenghua Yu <fenghua.yu@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday, April 25, 2019 5:20:35 PM CEST Changbin Du wrote:
> On Thu, Apr 25, 2019 at 10:44:14AM +0200, Rafael J. Wysocki wrote:
> > .On Wed, Apr 24, 2019 at 7:54 PM Changbin Du <changbin.du@gmail.com> wrote:
> > >
> > > Hi All,
> > > The kernel now uses Sphinx to generate intelligent and beautiful documentation
> > > from reStructuredText files. I converted all of the Linux ACPI/PCI/X86 docs to
> > > reST format in this serias.
> > >
> > > The hieararchy of ACPI docs are based on Corbet's suggestion:
> > > https://lkml.org/lkml/2019/4/3/1047
> > > I did some adjustment according to the content and finally they are placed as:
> > > Documentation/firmware-guide/acpi/
> > 
> > I'd like to queue up this series, but it is missing a patch to create
> > Documentation/firmware-guide/acpi/index.rst.
> > 
> > Care to provide one?
> oops, the first patch is missed. Let me add it next.

I've picked up the first patch from the v6 and applied this series on top of it.

 Thanks!



