Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74EA2D4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 05:26:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KPyz1GmYzDrCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 13:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="TXbZK3dG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iwrew8u1"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KPvm3mTzzF0Qh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 13:23:48 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3594421CC3;
 Thu, 29 Aug 2019 23:23:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Aug 2019 23:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
 etGsw4xCUhT9PIhQQXTAlpcDahsdknpFbZ8oV/NAwZA=; b=TXbZK3dGJZP2E14H
 3WtFWvfYvpXRdbUXGuLrGSxww7ZRlKuhxYXfNfV/2YYELm+XQdaskDmghZuCXvkx
 EEpEmYBUy1sXUxKtNRjsMj/6yialABZaekk/uQmjo5Id6Fk1/3N2BzKjY/A2nzpL
 D+WiEFIiWpej/ri3VWjbCs0s39gjlD+x6elDn/lYoxaHzRDSYsWKDhLX5QxMZ5PC
 gYTFsSUltmbmMcjI0jqHW06+YsSHITHX49lv2F71WKJIga87OUeBRyCMuVKKeKhG
 VoJMiY4a2ItHU3vgAaNV1DSlEIRxloxjM+2oGbgt1ZMry46FMl/8idwzoSCdcfOe
 UujBjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=etGsw4xCUhT9PIhQQXTAlpcDahsdknpFbZ8oV/NAw
 ZA=; b=iwrew8u1NhrsOhMCABs2FT0LBSRaOlBnPZnJs26Gsy5j1Ayh3UzGz/GFL
 G6eGQ2yZUL+2OJYHkh9cXZ0tXd6J92XY0dyFOBmkqBlsCrSc84PXXs82NJcOs7kI
 OnvwTql91iE458CrqY7j4x+7xOAok0XgXDF8l8I4cNguChjZtYK3Jtsn/R00YCKD
 0lNetQkwn+S9tzRSWPv0b3BiNIgrT0doCfT3WfQsg2fCuFGX54xE2WstGfWzTdTl
 mO0SR2FYuA922QMPGUUhEeGAWjcL3aVAsCVyEJmIziDNvVvPdm7GkQXthZTSbW7B
 ZzQhmr/C2Pot6B1QhoTmzErN+cs6Q==
X-ME-Sender: <xms:wJZoXUGitbiEcDtXvEOSYzylW6DHWCEu0PGvC8mTf8GYRGTuaEqcIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggtnecuvehluhhsthgvrhfuih
 iivgepud
X-ME-Proxy: <xmx:wJZoXW__U0OJaQCwV8LTmIty8SrXVLqO2xrxmE1neQXNetNxNYOcwQ>
 <xmx:wJZoXRnk-gpnMpXd2TLwsYOGUBm4HXS7Ym56pVvrdREFx2j-of8pkg>
 <xmx:wJZoXc901XhqOc0v6H4ipPl1eVHFwUzQCwBuJctPBW5IHIKrw1Ccpw>
 <xmx:wpZoXa1rpPSXQm_sQm02Kigsag4OHjZ7hrvqgHPRiK1Bmq3_6jSnPw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C73380060;
 Thu, 29 Aug 2019 23:23:41 -0400 (EDT)
Message-ID: <f0789e57d3e57eecaadc3736541d8769e44fb67a.camel@russell.cc>
Subject: Re: [PATCH] powerpc: Replace GPL boilerplate with SPDX identifiers
From: Russell Currey <ruscur@russell.cc>
To: Thomas Huth <thuth@redhat.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 30 Aug 2019 13:23:39 +1000
In-Reply-To: <20190828060737.32531-1-thuth@redhat.com>
References: <20190828060737.32531-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-28 at 08:07 +0200, Thomas Huth wrote:
> The FSF does not reside in "675 Mass Ave, Cambridge" anymore...
> let's simply use proper SPDX identifiers instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Russell Currey <ruscur@russell.cc>

