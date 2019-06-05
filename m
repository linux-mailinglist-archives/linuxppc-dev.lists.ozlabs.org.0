Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33635856
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 10:14:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JhQT5bnGzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 18:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="eqPEzhfm"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JhPG3vvnzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 18:13:06 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 455772075C;
 Wed,  5 Jun 2019 08:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559722383;
 bh=93lPZPoK1JhJhOgE1GB3XAmEenhb5pgYNCcngZSfVCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eqPEzhfm+mkz1rP0CgJZV9awvJBNXBuRcqT+ilCPLoP0gwknLDHMvX4F5m9zCop8U
 84TzlNrABj84RSwcqTt7WMtw0TxXzVI4dOemlR3jLbM3yROOl0NbxjQ+Je/v/S3/uE
 3dotGPa8vedQPR0A4+Y4tbeeBVzDaLiAssy7PsEc=
Date: Wed, 5 Jun 2019 10:13:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Garrett <mjg59@google.com>
Subject: Re: [WIP RFC PATCH 0/6] Generic Firmware Variable Filesystem
Message-ID: <20190605081301.GA23180@kroah.com>
References: <20190520062553.14947-1-dja@axtens.net>
 <316a0865-7e14-b36a-7e49-5113f3dfc35f@linux.vnet.ibm.com>
 <87zhmzxkzz.fsf@dja-thinkpad.axtens.net>
 <20190603072916.GA7545@kroah.com>
 <87tvd6xlx9.fsf@dja-thinkpad.axtens.net>
 <b2312934-42a6-f2e7-61d2-3d95222a1699@linux.vnet.ibm.com>
 <CACdnJutpgxd0Se-UDR4Gw3s+KfTuHprUTqFqxq+qu17vd4xr7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACdnJutpgxd0Se-UDR4Gw3s+KfTuHprUTqFqxq+qu17vd4xr7Q@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 George Wilson <gcwilson@us.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2019 at 01:05:45PM -0700, Matthew Garrett wrote:
> On Tue, Jun 4, 2019 at 1:01 PM Nayna <nayna@linux.vnet.ibm.com> wrote:
> > It seems efivars were first implemented in sysfs and then later
> > separated out as efivarfs.
> > Refer - Documentation/filesystems/efivarfs.txt.
> >
> > So, the reason wasn't that sysfs should not be used for exposing
> > firmware variables,
> > but for the size limitations which seems to come from UEFI Specification.
> >
> > Is this limitation valid for the new requirement of secure variables ?
> 
> I don't think the size restriction is an issue now, but there's a lot
> of complex semantics around variable deletion and immutability that
> need to be represented somehow.

Ah, yeah, that's the reason it would not work in sysfs, forgot all about
that, thanks.

greg k-h
