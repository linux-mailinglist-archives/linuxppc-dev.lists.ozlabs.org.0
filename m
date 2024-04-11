Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7958A1626
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 15:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFgwl1yzZz3vdF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 23:47:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 396 seconds by postgrey-1.37 at boromir; Thu, 11 Apr 2024 23:46:40 AEST
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFgwJ3ZLVz3cT2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 23:46:40 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 5FE7E28013A52;
	Thu, 11 Apr 2024 15:39:50 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4AE723FFCDE; Thu, 11 Apr 2024 15:39:50 +0200 (CEST)
Date: Thu, 11 Apr 2024 15:39:50 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
Message-ID: <ZhfoJkIxJvRal8aF@wunner.de>
References: <cover.1712410202.git.lukas@wunner.de>
 <2024041128-huddling-humped-4304@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024041128-huddling-humped-4304@gregkh>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-efi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 03:07:46PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Apr 06, 2024 at 03:52:00PM +0200, Lukas Wunner wrote:
> > For my upcoming PCI device authentication v2 patches, I have the need
> > to expose a simple buffer in virtual memory as a bin_attribute.
> > 
> > It turns out we've duplicated the ->read() callback for such simple
> > buffers a fair number of times across the tree.
> > 
> > So instead of reinventing the wheel, I decided to introduce a common
> > helper and eliminate all duplications I could find.
> > 
> > I'm open to a bikeshedding discussion on the sysfs_bin_attr_simple_read()
> > name. ;)
> 
> Seems like no one objects, should I just take this through my
> driver-core tree for 6.10?

That would be awesome, thank you!

Lukas
