Return-Path: <linuxppc-dev+bounces-10186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF5B014BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 09:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdk2s36khz30Vb;
	Fri, 11 Jul 2025 17:33:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752219189;
	cv=none; b=fmSZZ/nSDU9tVn36biPfF8klATu/N1QZyPdYq3UPen/gTE1bBbKfW4PrvDFDHuJ6REq9nfOwXzmYPXkS5k4I4dlakebZApER8g36PNE/xwBgpx7McwIIytT9l2W0AyMvmY9KQ1lzpJKgSBKfvjsSC0qi6XdsjZ7rRftgZlwVAo0YtrMvXZ+uPQDyaibynodwugj86W+d5go2YCq/S9jhJb3UCNyk6y6VBO2pWMKria4wTQ+3KPMcDzQdZU5RYB9uBrQhcDWFJwhwwgGORsNYjtrW/R/1JRqpSRoYUVe4WBC2UFdgwgW0WYZ9n3YVTXmFBc4t6u8qQ3eTcSstXwUYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752219189; c=relaxed/relaxed;
	bh=4+cMq7WmCP7QhJEBuMAp8KaJDQvkZ/CG9iiej1+tkVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O00IKF7dkVrlVA1L4YBiPJD6ZUvyzsHT17m3nZTr6/E4atFjitn8olxExKhmGdT6P250CibdjwK4rI7VRYATclY1+FNhBLnwpU6IOVu2oqXkUb6n1IOeWe9mPDN/6V30m8DedH7LBc+2X8U//6wV2qOI7EyxDneqmSBo5bKOhsWeTWeIuPbNk+hRlGhf+zjtDXtFqYBBwCTSh2DbGyhGRyW5/vhbEuwOmPxSDVbK1zk3ix1lLhYjLk72INardWelVuzsZ/FzKs/I0w05T7ucdv140bSoB0uFA5xF6eOtiprSdRjAAiG+b3db5bOj9uMGkUQBRkqcaES9A12BVQpLig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+ed71352b9bc4c4c95692+7992+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+ed71352b9bc4c4c95692+7992+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdk2l17rXz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 17:33:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4+cMq7WmCP7QhJEBuMAp8KaJDQvkZ/CG9iiej1+tkVo=; b=XNWRWlQ4dgmJ6wpuZvxs5QUPjb
	HN6OlB+k1idOw1y0xPiAzlZRJd4/RLvfKq2eqTe4IvanbkVeSmJGXNEYogwnKoR9NO2bhSYOfVnW7
	k+2uJVD6cvasP5jDsN0n6V+h1CAFG0LPxwv2czLF5KH/8qJuFm6i4FjMaP76W4N2rZNHS4M/oGesI
	Nz4DWWmpjgycR4V0Z/IzXAGxcplRWE7jEryFRWZbRFUSqVa22aBYPS80dCT2CLwFHEa2aRfcjK1G5
	Ht19QJbmhOGoH+mLrfTTQUDyB7+kzBykLRZDayXLMqlov0lsLKthJ9yi67NPQp4OeGHELod7npE9Y
	zyH/ZxZA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Fd-0000000DzJT-3ext;
	Fri, 11 Jul 2025 07:32:57 +0000
Date: Fri, 11 Jul 2025 00:32:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-spdx@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Message-ID: <aHC-Ke2oLri_m7p6@infradead.org>
References: <20250711053509.194751-1-thuth@redhat.com>
 <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com>
 <2025071152-name-spoon-88e8@gregkh>
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
In-Reply-To: <2025071152-name-spoon-88e8@gregkh>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 09:30:31AM +0200, Greg Kroah-Hartman wrote:
> That's a crazy exception, and one that should probably be talked about
> with the FSF to determine exactly what the SPDX lines should be.

It is called the libgcc exception and has been around forever for the
files in libgcc.a that a lot of these low-level kernel helpers were
copied from as the kernel doesn't link libgcc.

