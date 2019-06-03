Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B43832997
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:30:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRXy6QyFzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:30:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cdmw7rYu"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRWk1j0JzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:29:21 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0387272AC;
 Mon,  3 Jun 2019 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559546959;
 bh=jmnO7l1ruZcwM+mNh36XUyOOEx78E7S0eK3e1pZX2KU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cdmw7rYuHJ+r3SKtclwTsvMQbEcn5OewVFYC2Wzs8rXtfd5GvmYPT0LkjRj5qXIzu
 K4jOrMdqsy3qijKlxsuuL0qnFtmUBweRYE68vXKVbINOoQurMQHK0L1XkUguJMnQvt
 iqXC0aQTDSSkufpk+ubLEulzuXjsWovzMteuKBQY=
Date: Mon, 3 Jun 2019 09:29:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [WIP RFC PATCH 0/6] Generic Firmware Variable Filesystem
Message-ID: <20190603072916.GA7545@kroah.com>
References: <20190520062553.14947-1-dja@axtens.net>
 <316a0865-7e14-b36a-7e49-5113f3dfc35f@linux.vnet.ibm.com>
 <87zhmzxkzz.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zhmzxkzz.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-fsdevel@vger.kernel.org, nayna@linux.ibm.com,
 Nayna <nayna@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 cclaudio@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 03, 2019 at 04:04:32PM +1000, Daniel Axtens wrote:
> Hi Nayna,
> 
> >> As PowerNV moves towards secure boot, we need a place to put secure
> >> variables. One option that has been canvassed is to make our secure
> >> variables look like EFI variables. This is an early sketch of another
> >> approach where we create a generic firmware variable file system,
> >> fwvarfs, and an OPAL Secure Variable backend for it.
> >
> > Is there a need of new filesystem ? I am wondering why can't these be 
> > exposed via sysfs / securityfs ?
> > Probably, something like... /sys/firmware/secureboot or 
> > /sys/kernel/security/secureboot/  ?
> 
> I suppose we could put secure variables in sysfs, but I'm not sure
> that's what sysfs was intended for. I understand sysfs as "a
> filesystem-based view of kernel objects" (from
> Documentation/filesystems/configfs/configfs.txt), and I don't think a
> secure variable is really a kernel object in the same way most other
> things in sysfs are... but I'm open to being convinced.

What makes them more "secure" than anything else that is in sysfs today?
I didn't see anything in this patchset that provided "additional
security", did I miss it?

> securityfs seems to be reserved for LSMs, I don't think we can put
> things there.

Yeah, I wouldn't mess with that.

I would just recommend putting this in sysfs.  Make a new subsystem
(i.e. class) and away you go.

> My hope with fwvarfs is to provide a generic place for firmware
> variables so that we don't need to expand the list of firmware-specific
> filesystems beyond efivarfs. I am also aiming to make things simple to
> use so that people familiar with firmware don't also have to become
> familiar with filesystem code in order to expose firmware variables to
> userspace.

Why would anyone need to be writing new code to firmware variables that
makes it any different from any other kernel change?

> > Also, it sounds like this is needed only for secure firmware variables 
> > and does not include
> > other firmware variables which are not security relevant ? Is that 
> > correct understanding ?
> 
> The primary use case at the moment - OPAL secure variables - is security
> focused because the current OPAL secure variable design stores and
> manipulates secure variables separately from the rest of nvram. This
> isn't an inherent feature of fwvarfs.

Again, why not just put it in sysfs please?

> fwvarfs can also be used for variables that are not security relevant as
> well. For example, with the EFI backend (patch 3), both secure and
> insecure variables can be read.

I don't remember why efi variables were not put in sysfs, I think there
was some reasoning behind it originally.  Perhaps look in the linux-efi
archives.

thanks,

greg k-h
