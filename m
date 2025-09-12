Return-Path: <linuxppc-dev+bounces-12084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E3CB54F15
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 15:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNZhl6wsyz3dF9;
	Fri, 12 Sep 2025 23:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757683031;
	cv=none; b=Co+DZAsaJ13mn9nO2qSswm1Zyi91s0tjNKNfQnQkegGiaYaqsOTCcDx6cgKp5T6+SV0YpORbfMWeDol9QHvsIO/IyXejO0tPKiN8o+hYh/Yq1AQ9jnQ4/fJ1TtnvIg4WZJbTDkU9WMZc7kXtzmNOsL2rDNWxawnS6Vww+hRqd168c5++uRlZjgzSBZH6vXgD1LsmJKC6hddgxL60Z/yMBkhPpsPgVwH+9iRTIIHsJml7U90rWcs1GtxqpjEP/F76iy1zCWydSK2iCnO8DRhpKhc1MfPI1qfTdPT6gQ/mkLOkBslxH5Ypzwxp5b2OuW85iin7rfOczx2XguAIBp1APg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757683031; c=relaxed/relaxed;
	bh=O1QwMEVkzC77rV7TEVB4ZQxwruyo9VsaKM2Zj3Ph0wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KspAHHlUNt/eE0uMouGHQLTAHYSipjJtVzKvwRA7wFfaedM3bD8tBx7mVuuEhjjNneM3gWJICKVbGyZaNNBoDXdpY/jASGxn4wVfCbbxqSdG8lw/iRtJDqoiHdLLiIijDGj3mZYQ3+zoz9elM09hoEwBTK44NiXcf/Kv4acusO+dJo4zgrDRqItsCQACJxnFGo1wyUGM1S2NXTCTxzRoADIij8zVm/vlxIuJqb1qiIVz81yJ04oK3C8i4L4XsLRYKceg6pfrmrRQxm4tuvVXrYfBCOTxZpPPD4aKMYiCyDlkBbYgEy69y5J/QJ11nzFSZtV4RicOjlXPQEQka2XMSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNZhd3DMVz3dCt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 23:17:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O1QwMEVkzC77rV7TEVB4ZQxwruyo9VsaKM2Zj3Ph0wQ=; b=V7hbJdPnNgBvGak31eOz58Mf1P
	otiV4vFRfmengjQC3i3FF81bSu7SfBAe1eqxiJzNTi1R4gLaN8u0wpffGkz1JpY9jt3Yom4hqcBia
	EH96uZOoSoxiTz2Zj9io0vk5m2EHlsDzoA0vREw85DvJq2B06EH11KXlog8cNmVcJCJG39zhOd8bH
	mw/2V1agjKxuu9Vbd/bpA2oQZ2D7UqzEV3AGXt9sdRGaY3X9Wj3XwpXZotScYIF+ba+xeGTIUi/TN
	VO8oGIY/qzBSbT23U9PZt7aVPiRKyyRiP8iuAoGvZoxA6fv7XIBlghM+z0k6GaIFOdVxXRMVL3YMB
	LcM8h7vA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3e1-0000000GJeP-3Q7n;
	Fri, 12 Sep 2025 13:16:53 +0000
Date: Fri, 12 Sep 2025 14:16:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMQdRfcMGGZQrW1_@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
 <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 02:58:48AM -0700, H. Peter Anvin wrote:
> On September 10, 2025 10:38:15 PM PDT, Andreas Larsson <andreas@gaisler.com> wrote:
> >We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
> >used in LEON sparc32 configuration (using 36-bit physical addressing), a
> >removed CONFIG_HIGHMEM would be a considerable limitation, even after an
> >introduction of different CONFIG_VMSPLIT_* options for sparc32.
> 
> It really sounds like a self-inflicted problem... getting your customers switched over to the RV64 side is probably the best you can do for them.


"We only support configurations above 4GB when using the RV64 core".

