Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F312BE29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 06:22:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CgfM73WzzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:22:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="CkaVy05q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XILWvQa7"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Cgcx4z4szDqJg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 14:20:49 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BB96B69C;
 Tue, 28 May 2019 00:20:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 28 May 2019 00:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 +QbJWGmfxyU7YzhqvNrv/9g6RQdfUiHFjpHPLSroHEU=; b=CkaVy05q5eQjv478
 th+h0QXcBk6C3sGRdxrxARG6jcU6B+blSMzRAQPh5OkrJC6YrSVuyf7rV4EG/6kd
 n7oN/lCg3NLHCn/rLdiGOm95PEH+TsPzrS3LaaOHGVZMUpb9Y2YThSTeKZ5nWkgD
 RXqPQ6oWt8RESPX8qrnUGVpxVPo7xoX3sgE7YGGyfErYIhuTGuI5wJAvueG3QXkn
 bfEKjoQLvYrQD/T1AR8SZtuVNeGQiMlOJeqQuSuCL+ETPEITWYXhSHnObOvXN27+
 FLBQzgnzTcTaaFTECYm308/1trM2Y1W0GlGbBIrT3vyUr50KVEG1PG60F3BZlBqF
 VnGcPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=+QbJWGmfxyU7YzhqvNrv/9g6RQdfUiHFjpHPLSroH
 EU=; b=XILWvQa73i20nIaEgypLLA8hoOtzeJ0Hog9WhknVRfylAz23var2+iHA6
 sVdZFd1HiqD1u9YmNLAjbRfs/g/aOGTQDUJIbNQDZe0Rte2ZNUzX/rCvOXzS9VeV
 MnnBjo5M0O2FJZRRYbFh9/sq4xgFhGFhuWNW4i8K29C5uvn4Kck6Td8IVM7FhhVB
 Piiws+uF0M0g5ViuXW2WHfFjB073plBeGWt7NOlMSt+YnTpBKnGm4+Mu3hByOnaX
 RgR/yHVRGn/HLW303vfkOVgP1ngzjZXGBo2hACgS1NL01O8y16qhaRf5C1B/R5QD
 gemRf7J9sRuiFOQ93OPWOxw9DY8RQ==
X-ME-Sender: <xms:HLfsXNHifz5en5r9TCvVsyJrEXtOqYMghyAQCG-kgY3CPiPJP5AnMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvgedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggtnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:HLfsXL8LfLRseeklVe4GcTZI8fwROuHD36Vg0S2qzQfWkj4nmiKl0Q>
 <xmx:HLfsXPKRRHON3cyXaWK1Ep8ZEL184LORSMWS8gVXyp6poEcBF0YQLg>
 <xmx:HLfsXGaY50oXDXrZZPaQpaNXe8m57I9ZVwdpgqcm4D0aV6DVa507vg>
 <xmx:HbfsXKJ3p_hyA-mRrPUetON6JDrk32NxTXONZE4ummqCEU8arbxqrw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E30048005A;
 Tue, 28 May 2019 00:20:41 -0400 (EDT)
Message-ID: <e71300940ea33af8e655af8117cd68084cd6567d.camel@russell.cc>
Subject: Re: [TRIVIAL] [PATCH] powerpc/powernv-eeh: Consisely desribe what
 this file does
From: Russell Currey <ruscur@russell.cc>
To: Stewart Smith <stewart@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 28 May 2019 14:20:39 +1000
In-Reply-To: <20190528032925.8836-1-stewart@linux.ibm.com>
References: <20190528032925.8836-1-stewart@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: sbobroff@linux.ibm.com, oohall@gmail.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-05-28 at 13:29 +1000, Stewart Smith wrote:
> If the previous comment made sense, continue debugging or call your
> doctor immediately.
> 
> Signed-off-by: Stewart Smith <stewart@linux.ibm.com>

This reply intends to implement the ack dependent EEH patch on powernv
platform.  Actually, the reply was created in order to fully ack
support.

Fully-ack-supported-by: Russell Currey <ruscur@russell.cc>


