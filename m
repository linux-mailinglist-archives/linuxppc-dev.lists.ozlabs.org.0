Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA14136816
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 08:16:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vDmr0kHTzDq7W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 18:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::4;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=ryuxb3It; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vDfQ17bmzDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 18:10:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578640244;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=TC+tjX/Lt65GMWtVyL5Xhep5tinocrAB9X7xhvNdnXY=;
 b=ryuxb3ItNMa1Isr2G1e8onNpXkaMlYjPWedMDqwCWLyLcN6BuFn0mmRINkpHwBLwzN
 QzFN4Xgp52ZbTcKo3Xnjf8Fu0Wrf2UitS5yDcFvt3/1Cv35o74hjTwnqlECLmMsq8mvp
 7dGZhZd4z9JUPrO1JCIIspMYmAchlaW52ZsOZfBgZc7G5E0erD10aZE1pKTaSEvslLRS
 5LkqJG/b8Xoc0ChRGujTLaBR2278BzUzRnISdOS2LL8hOhEGhymPFjwguD53BFZ/yiaU
 NskBz8jlYMo5Ry3fYiKiaqf60iaxDcU7iFHQFs7I8Od+hb6SPaL2k6Q8lq+euobOaTXy
 UIag==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7NWd5jbpkxCcXi3g8qXe4kYOYilnn348Kw8dzMjA="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:8086:10a9:904f:8bb2:ac2:590a]
 by smtp.strato.de (RZmta 46.1.4 AUTH) with ESMTPSA id c05c1aw0A7AT8Ab
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 10 Jan 2020 08:10:29 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
Date: Fri, 10 Jan 2020 08:10:28 +0100
Message-Id: <533E86ED-00F4-4FB2-9D91-D4705088817D@xenosoft.de>
References: <20191204085634.GA25929@lst.de>
In-Reply-To: <20191204085634.GA25929@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mailer: iPhone Mail (17B111)
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, mad skateman <madskateman@gmail.com>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

The SCSI cards work again. [1, 2]

Sorry for bothering you.

Thanks,
Christian

[1] http://forum.hyperion-entertainment.com/viewtopic.php?f=3D58&p=3D49603&s=
id=3D1adf9e6d558c136c1ad4ff15c44212ba#p49599
[2] https://bugzilla.kernel.org/show_bug.cgi?id=3D205201=
