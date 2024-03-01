Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF486EC03
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 23:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tmjmc5Bt7z3vdb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 09:43:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=allandria.com (client-ip=50.242.82.17; helo=cynthia.allandria.com; envelope-from=flar@allandria.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2192 seconds by postgrey-1.37 at boromir; Sat, 02 Mar 2024 09:43:06 AEDT
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmjmB0Gygz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 09:43:05 +1100 (AEDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
	(envelope-from <flar@allandria.com>)
	id 1rgB1B-00050T-F9; Fri, 01 Mar 2024 14:06:13 -0800
Date: Fri, 1 Mar 2024 14:06:13 -0800
From: Brad Boyer <flar@allandria.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Boot failure with ppc64 port on iMacs G5
Message-ID: <20240301220613.GA18805@allandria.com>
References: <fc93d03b-581d-40cd-8ab1-762a9ee2c20c@tuxayo.net>
 <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
 <87r0gvg49s.fsf@mail.lhotse>
 <be7a1a66e9cc4789704d2c93f0b770ea391a4c28.camel@physik.fu-berlin.de>
 <87frxag1ew.fsf@mail.lhotse>
 <1768836b7e6895f3c2fb0cb4a01a40fee7473dd5.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1768836b7e6895f3c2fb0cb4a01a40fee7473dd5.camel@physik.fu-berlin.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tuxayo <victor@tuxayo.net>, Claudia Neumann <dr.claudia.neumann@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 01, 2024 at 03:47:26PM +0100, John Paul Adrian Glaubitz wrote:
> The problem is that the newer image doesn't boot and currently I don't know
> why because installing the exact same kernel later from the package manager
> into an installed system works yields a bootable system with the latest
> kernel.
> 
> The installer images are built from the same kernel package which makes the
> whole thing even more confusing.

Perhaps it's a memory allocation problem before the kernel has fully
configured the MMU? I know in the past the kernel could be touchy
about how memory was mapped in the very early stages of boot. If we
happened to be near some limit, even a small increase in the size of
the kernel might have pushed us over the edge.

I'm not sure of the exact details, but perhaps the memory setup is
slightly different when booted from the CD image. I haven't looked
at recent images, but I know in the past the boot process was
different on CD compared to after the install.

	Brad Boyer
	flar@allandria.com

