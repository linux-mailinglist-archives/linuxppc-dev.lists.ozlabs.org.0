Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E93AA7D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 01:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G52Gn011yz3c0W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cAce7FEX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cAce7FEX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G52GL3cxfz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 09:59:06 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A243760FD7;
 Wed, 16 Jun 2021 23:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623887942;
 bh=EIxI0VmomUpgT7/iZ3xMEinSY8OYAHPRUBOAfgdZDYE=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=cAce7FEXeesB3Eakd7FgmWGf9Fh349iEWi+MqQzZ25859UgzlcGjhB2BDd2939UFF
 swbXKFMMUdw4Lf+O1slRiUqFuttqF0etwHzTY0wHeB6RSCkLyVoM4XBLPGqhXnD8Vy
 ors7qsDhNt7P21cKbCRelkAgERBZrb2NfrWqltsCsQrFLWLgM+gW3v3AlI/4BV+8VO
 sxLxp5xmR56CzdHm9PQuO8mg7UR72l1k5JO6rm0gX/1n5is9oztdoCCHVum8UcJWpy
 FLV26Q2SGb/zFJ7VnfiNVIwdJ7shRlHNP9v1agEMM8Gg1M5S7s7YYTabA6xg0Ktcxg
 +WhRvMO37fYtg==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailauth.nyi.internal (Postfix) with ESMTP id A561627C0054;
 Wed, 16 Jun 2021 19:59:00 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute2.internal (MEProxy); Wed, 16 Jun 2021 19:59:00 -0400
X-ME-Sender: <xms:QZDKYGayzehKC7WKofAuiaTI_p_AXBTXjR97NC1qdb2U7WrkOwJohw>
 <xme:QZDKYJa12h8h2X7FlDPPbwMvsBHD72ykVvc_boJ7rN7E57BomoCnpua3usi4AiYoX
 EB4LHQMkB4zFscDaiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeftddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 hicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenucggtf
 frrghtthgvrhhnpeegjefghfdtledvfeegfeelvedtgfevkeeugfekffdvveeffeetieeh
 ueetveekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedukeeh
 ieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinhhugi
 drlhhuthhordhush
X-ME-Proxy: <xmx:QZDKYA9t7IAn3EgEhT7Si9BB0h1DUXL8hkKKGUIYkWMoV_34tvkjsQ>
 <xmx:QZDKYIpVXR-AAN4T8sDDSYyKYiHet_5trvbmKPNYhNBss_hnzQgqWw>
 <xmx:QZDKYBosE_nForDcuC7qt-yJ__5SNPLQalZxTjeeqoHM9EnxGzFFPA>
 <xmx:RJDKYC6Cm1vS3Ti_WH1_dNhaA6MfvzVejlUbA17GfozO0IOY3qXJd184TWvlGDmL>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A4AE751C0060; Wed, 16 Jun 2021 19:58:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-526-gf020ecf851-fm-20210616.001-gf020ecf8
Mime-Version: 1.0
Message-Id: <ec728634-d7d3-4dbe-9989-d039c733bd6b@www.fastmail.com>
In-Reply-To: <20210616102026.GB22350@willie-the-truck>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <20210616102026.GB22350@willie-the-truck>
Date: Wed, 16 Jun 2021 16:58:37 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Will Deacon" <will@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_8/8]_membarrier:_Rewrite_sync=5Fcore=5Fbefore=5Fuse?=
 =?UTF-8?Q?rmode()_and_improve_documentation?=
Content-Type: text/plain
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021, at 3:20 AM, Will Deacon wrote:
> 
> For the arm64 bits (docs and asm/sync_core.h):
> 
> Acked-by: Will Deacon <will@kernel.org>
> 

Thanks.

Per Nick's suggestion, I renamed the header to membarrier.h.  Unless I hear otherwise, I'll keep the ack.

> Will
> 
