Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CEA50E825
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 20:25:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnD3Q26PFz3brY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 04:25:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h89QdhM+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h89QdhM+; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnD2p6Cmnz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 04:25:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 916E7615FB;
 Mon, 25 Apr 2022 18:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2731C385A7;
 Mon, 25 Apr 2022 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650911119;
 bh=gCj8tP61DIZ+SscAk7zW7+DVq2kq6kkliP5TRJB1L+o=;
 h=Date:From:To:Subject:From;
 b=h89QdhM+wLCrz0WjuLKWSKbpkm/+Pp4EUHyq6MpFbiUJtT1r87GCX64rrtHmYSYoj
 +sQCDymkP9Yy32L9o3VGeHDT6XZrl9kv5Hkc6p/TClxq4rsbU8MWFgwNMVijA22eUs
 nzLfkG0sGkhJy6c0G3Zmxahc1KYpy4mCU6oQUMIcXA3bvouv080TET2j0KarHiDatJ
 70+znNpdjVn+1LKF3opXVu2I4S6AiOEp6wh656HEAdRbGgb2I9hNm/bVmk25U9OAh/
 6uQjboQKr++fXwjwZy2whbnpRkqpdWvMWV10MtoPhNU86J9ksr5dPdK2YhzuSC6yk7
 x46xsOdJ8iV7A==
Received: by pali.im (Postfix)
 id A0D0C4A32; Mon, 25 Apr 2022 20:25:15 +0200 (CEST)
Date: Mon, 25 Apr 2022 20:25:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: L2 SRAM on PowerPC e500 and Caching-inhibited bit
Message-ID: <20220425182515.4dm37qbzjzpggce3@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

I started playing with PowerPC e500 architecture, it is something really
new for me and I suspect that I found a bug in U-Boot code which
configures L2 cache as initial SRAM (L2 with locked lines).

U-Boot code for the first half of L2 cache sets Caching-inhibited
(MAS2_I) in TLB and for second half of L2 cache it unsets this bit.
And I think that this is a bug as it seems strange if one half of L2
should be mapped differently than second half.

I wrote about it email to U-Boot mailing list:
https://lore.kernel.org/u-boot/20220413092633.gmz4rqpiha4rwecb@pali/

I discussed about it on U-Boot IRC channel and developers suggested me
to write on Linux PowerPC mailing list as there could be more skilled
people.

Michael, or anybody else, could you help me with this? Do you know if L2
SRAM entry in TLB for e500v2 / BookE architecture should have MAS2_I bit
set or not?
