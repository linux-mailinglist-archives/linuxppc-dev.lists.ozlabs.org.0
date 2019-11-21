Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0010105975
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 19:23:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JnxL57VhzDr72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 05:23:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::3;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="RmueoAnx"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JnvD6L9PzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 05:21:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574360478;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=jNSqqBbrYyqRlctFmIILYVh2+dTk9ekgd8eo+LGizrs=;
 b=RmueoAnxTadN3RbmKmXIjwWVT8rWIrrkEtlKq3bs8Uw8MfH5gJRfeO9tyadwnKXTUY
 N4s14i5iUwZszxBxQA/w3msrgiF63kqGt5XsSAUS0/ZTJkhcrGz7li7MRRNhzabyKa8e
 H8tHrQHlAVIP1L+cMeW3hqSLlG/R3DzYArIYvTo0jI7vbDHbjo0VWc8F3fyTNC9lKQh4
 vvzwOysY68n0c3Vj2gz5/z1Y+ZgRnGKbxewbDV/UCdxcrysj7124kRJj9oz/JcdYv0iP
 R55X0QDbaBlUyb6Cf4ndWMmdlRPwqNHQ8jLdqD+9XUpqS34FlwcpOHld2VoEqKzyabvg
 ZkXw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaM9fNtIXuaJFG8GgaIfjP/sNprV1dfhtth/q6Z5w=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:31b4:3e86:1da2:8b32]
 by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id q007c8vALIL5lAy
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 21 Nov 2019 19:21:05 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20191121180226.GA3852@lst.de>
Date: Thu, 21 Nov 2019 19:21:04 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F53CCCE-738C-4024-9C3C-4BDEB0D0728C@xenosoft.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
To: Christoph Hellwig <hch@lst.de>
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
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org,
 mad skateman <madskateman@gmail.com>, "contact@a-eon.com" <contact@a-eon.com>,
 Robin Murphy <robin.murphy@arm.com>, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21. Nov 2019, at 19:02, Christoph Hellwig <hch@lst.de> wrote:

On Thu, Nov 21, 2019 at 05:34:48PM +0100, Christian Zigotzky wrote:
I modified the patch and compiled a new RC8 of kernel 5.4 today. (patch=20
attached)

We have to wait to Rolands test results with his SCSI PCI card. I tested it=20=

today but my TV card doesn't work with this patch.

I think we have two sorta overlapping issues here.  One is that I think
we need the bus_dma_limit, which should mostly help for something like
a SCSI controller that doesn't need streaming mappings (btw, do we
have more details on that somewhere?).

And something weird with the videobuf things.  Your change of the dma
masks suggests that the driver doesn't do the right allocations and thus
hits bounce buffering (swiotlb).  We should fix that for real, but the
fact that the bounce buffering itself also fails is even more interesting.

Can you try this git branch:

   git://git.infradead.org/users/hch/misc.git fsl-dma-debugging

Gitweb:

   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/fsl-dma-d=
ebugging

and send me the dmesg with that with your TV adapter?

- - -

Yes, I will test it at the weekend. Thanks for your help.

Christian=
