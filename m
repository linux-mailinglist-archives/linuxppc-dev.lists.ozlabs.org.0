Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C279E745371
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 03:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvSSd5F7Dz3c0w
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 11:07:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lichtvoll.de (client-ip=2001:67c:14c:12f::11:100; helo=mail.lichtvoll.de; envelope-from=martin@lichtvoll.de; receiver=lists.ozlabs.org)
Received: from mail.lichtvoll.de (lichtvoll.de [IPv6:2001:67c:14c:12f::11:100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qv6KN4Cvsz2yxK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jul 2023 21:29:43 +1000 (AEST)
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id 800BD72B00B;
	Sun,  2 Jul 2023 13:29:28 +0200 (CEST)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, axboe@kernel.dk,
 Michael Schmitz <schmitzmic@gmail.com>
Subject:  Re: [FSL P50x0] [PASEMI] The Access to partitions on disks with an Amiga
 partition table doesn't work anymore after the block updates 2023-06-23
Date: Sun, 02 Jul 2023 13:29:28 +0200
Message-ID: <3200191.5fSG56mABF@lichtvoll.de>
In-Reply-To: <48ded6f5-242c-a1b7-39b3-0585be4b848a@gmail.com>
References:  <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
 <0a8cabbf-89c6-a247-dee8-c27e081b9561@gmail.com>
 <48ded6f5-242c-a1b7-39b3-0585be4b848a@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Mon, 03 Jul 2023 11:06:49 +1000
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
Cc: linux-m68k@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, linux-block@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael.

Michael Schmitz - 01.07.23, 04:05:30 CEST:
> The RDB format description URL that appears in one of your messages
> from the 2012 thread has gone dead. I'll try to find it on Wayback
> later. In the meantime, I will submit a patch to fix the new bug ...
> We can has out details in the inevitable review process.

Hmm, I think they just went for prettier URLs:

https://wiki.amigaos.net/wiki/RDB

But there is not much on it.


Not sure whether there is a more detailed explanation anywhere on the 
net. I am pretty sure there is more in the NDK/SDK tough. And indeed 
there is:

AmigaOS 3.x NDK

https://www.hyperion-entertainment.com/index.php/downloads?
view=files&parent=40

I found it in: Include_H/devices/hardblocks.h

This is at least an include with the exact structure of the RDB and of 
the partition blocks. There are some explanations in the comments. Maybe 
there is something more elsewhere in this NDK.

You can unpack this using lhasa, easily available in Debian based 
distributions.

AmigaOS 4.x Software Development Kit

https://www.hyperion-entertainment.com/index.php/downloads?
view=files&parent=30

This is a bit more time consuming to dig through. I skip it for now.

Best,
-- 
Martin


