Return-Path: <linuxppc-dev+bounces-3819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C79E5127
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 10:21:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3pmf4Rmkz2ydW;
	Thu,  5 Dec 2024 20:21:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733390498;
	cv=none; b=XE3l7CnHDb6it/pIfblVwLo544nrRctdR2eDPBzZ1Eq0b7B2/vZ3RRhgmN/BhKV+BAB7eJdavI/bloise9uTsRX2wsxFAIEBW77bKHJJyT8mPYQuHpR1Rd2I8St8eVgemU8DpsDw0w39QVpllinUa/eDn1O7fPevvJON8SfUs1VAQaaHSwF1AQiNf8LLOWtv8L9QZSeRGtEP4PU8Cmu+3L87aQfXrG6Cd7M1NtsNeus3JUkGyWLiyHXtiPiVx/vHmyxQ2WSHyQOHgHa9VpSt0ayUf1WEtHmEiLQPYZ3aUWGHrCQRhURJnif7xyo0rS9yj2anidLBc2+eTTZBR6j3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733390498; c=relaxed/relaxed;
	bh=NhIFRytJ7J6YcXrMQq6LGhGesQm6LgaQBIy4YaNok7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPQtsdzfWOIl0Nv314fSU3LnjSKeQqzcjE6v8C3dvmx8hVSyDsZZvVytQ1mxm8um7N37bjLbaLsUcZrwqFwLpSF4Oooki236o42Zrz6QiJEwIUlyWTht+6biJjsXq0+coI6GJ2wTRr6CtsEFrzoPaOaJxVP153a+5c7rjyoWSCOA817jNoX4esP4WNJZ7V2XtNV4TJ1W7bavVnhq3SdlsjWKMHeIlDrUOOeZdwSC4nnuj5Ywp3niWZ46Rwnx0lFcY/sjc9JQGmogFcgBuKVN4fSbDn5wE8iuUC2D6uh354Sdb0ebRxCcQaxY3ZpBxKx0VdEp/WyRZeEiA+MALkVang==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bO+iAcht; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bO+iAcht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3pmd5lLTz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 20:21:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3B515C71ED;
	Thu,  5 Dec 2024 09:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DA0C4CEDE;
	Thu,  5 Dec 2024 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390495;
	bh=0NtFK3oCzvBSihoOheuwFu9KzJvVPyvwejVb22YMDX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bO+iAchtJ2xcasBhdzF+wbKSTg19ybb/JAHkdXYvclcrjO0D4X8bJ3DeLNUn2bEFa
	 77lJpJ0g3Pajml0kav68z3LlmOMFTdeTXhAtjxYw8F+oAacKePbD0UKw9UHzIMcqev
	 TvabFo0KBg2gviCqTfvyVJSA7M+9v5w237FTHKikw8hH5q8K4tncW5uvC4zwyHnzys
	 BtHac/HZX0UM+Kf69TC/JMuKcpkf83Lj3DCfPhTjX05rh/Eqn77fFYUts72J6jyaa8
	 29bEH6HxVThRRTUJK7Rj24nbhs18WAgJ6WPlYn9cXFCYWYTBplwHLHRuLnes8eWfid
	 QmTznu7igjaEA==
Date: Thu, 5 Dec 2024 09:21:30 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 5/5] scsi: arcmsr: Use BIN_ATTR_ADMIN_WO() for
 bin_attribute definitions
Message-ID: <Z1FwmmFEDKeEgNRO@google.com>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
 <20241202-sysfs-const-bin_attr-admin_wo-v1-5-f489116210bf@weissschuh.net>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-5-f489116210bf@weissschuh.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 08:00:40PM +0100, Thomas Weiﬂschuh wrote:
> Using the macro saves some lines of code and prepares the attributes for
> the general constifications of struct bin_attributes.
> 
> While at it also constify the callback parameters.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

