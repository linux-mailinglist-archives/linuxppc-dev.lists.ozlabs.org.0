Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F13BC2E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 20:50:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJZWP6j3lz30BX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 04:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Gwzn4MA6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.20;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Gwzn4MA6; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJZVr3Wwtz2yfh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 04:49:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625510988;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:To:References:Cc:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=e5KNPSK9E2QCRLdz49DqoWe3nFaZBxUbetvCBY18O8Y=;
 b=Gwzn4MA6xCDFTVDWjozaw/f9j/yMCnON9s8mNemOCLfN0fPWG/rC90TiM40ixebfIb
 ACpI8Z87nWHpMKf3ZErhi64fB8XNj3rq6j5qBJXSK0ogVP1Ve8lXorTtaC/iZ2ru+cpc
 WViQ8Af0mZKExrcf4GXdpa0nsvmX693XfR7T+gQg2PPfcpRzy/ThQE47knJWn/6xWV/J
 BlH4cRSAzAI4IPpQDZZfhxVp0QJAGx5W8EypoGpk9jkO7PasRvy7ESEBDt0FzKaDpmkd
 too18Ag9LWeJJPt4jPIcdc8bTnBg55yPOCGt3gM4WmEzOzhIBdFNVdaYoMB4v5K6Id8/
 S14w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hZQiYXCAp5NvAFkGNAfx9ALYQynABVYTFWoNejc="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a836:4cf1:442:36e0:ea94:ce76]
 by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id D02c3ax65InlNyr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 20:49:47 +0200 (CEST)
Subject: [FSL P50xx] IRQ issues
From: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <86de3024-c025-ec65-a45a-264585730c4a@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <cc1b16c0-47d5-2c50-fba0-9e1aa014ee8a@xenosoft.de>
Date: Mon, 5 Jul 2021 20:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <86de3024-c025-ec65-a45a-264585730c4a@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

Our FSL P50xx machines don't boot anymore because of IRQ issues. [1]

Please check the IRQ changes in the latest PowerPC updates 5.14-1. [2]

Thanks,
Christian

[1] 
https://forum.hyperion-entertainment.com/download/file.php?id=2592&mode=view
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=019b3fd94ba73d3ac615f0537440b81f129821f6


On 03 July 2021 at 09:57am, Christian Zigotzky wrote:
 > Oh dear, there is another issue after the latest PowerPC updates. The 
X5000 [1] doesn't boot anymore.
 >
 > Error messages:
 >
 > Oops: Exeption in kernel node, sig: 4 [#1]
 > ...
 > Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
 >
 > ---
 >
 > Unfortunately we have two issues at the same time. We are knocked out 
and unfortunately I don't have any time for bisecting.
 >
 > - Christian
 >
 >>
 >>
 >> [1] http://wiki.amiga.org/index.php?title=X5000
 >


