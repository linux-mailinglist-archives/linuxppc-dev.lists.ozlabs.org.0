Return-Path: <linuxppc-dev+bounces-5934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD9A2BDC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 09:24:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yq6TP43QYz30JH;
	Fri,  7 Feb 2025 19:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738916681;
	cv=none; b=KrzdPOXr+Wu8/0fwuYFYGHy7USyBn7uXoq0qr3fvqWWNdcsbBRMzLiK6Jwv3O6FifxszME5X64SlKdfYty9tzo6W/GBWbRuUmKXGjEbh5y2+6JxyvlR1QUA3vbzWVCS+oVSv9qLKWdsejrdbeK12iEXrg47UKqk8CWduKux+w21x7jqlp07AIN+Kx8vBbiZw6plz2eDw8vM5KpIIbPndLR+LdHLWHOjj9SRLlDTIzWj/fbECE3aZcq7GmkxDDQ2W+GnSghpFKT0sefbBNgNpPacWOnaWWezvuG/xVKY63BGbdQ2hva3019aKHo6kkMhSGMeK7oNBOKeE766p9QnsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738916681; c=relaxed/relaxed;
	bh=ChEKsW7bUGtSMUi0ZLck9YEHLb3Va32Z85kgd1/3Wxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGtcgkmL7J1s2YbPjnsg1Yn4xHK6Kg/eWaW1Esmn3/sXxWpWIu8VcJv62DoEd19H+4kygdiBfG7SivOxYJHZ2irzTK0UwvpxDpLrU0kCE0gg9d71Qa7zH8govc+Hk2q7B2bZELmI0dZHoYToV4d2hOksTO7qpD+Szj0DvGsDsAtRS3Ol8+C+Xj6sZ0GRIpYSm/iWvoF0RXT3M8x+rihZggncTQDswciNd8Bp14343T2eZMz671zN9RF6hdiV/FnCIDdwf5QuGJG8wxv7qVaeyDxWqvvgy8Ayc1bKZeJQa5pyZ6OukFSaL9qzQ2bwWpu6k2gVuzyER+Y6SvpEmbxK+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ore@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ore@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yq6TM5Yrsz301v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 19:24:39 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tgJep-0000UF-AY; Fri, 07 Feb 2025 09:24:15 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tgJek-003whN-2j;
	Fri, 07 Feb 2025 09:24:10 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tgJek-001cd8-2G;
	Fri, 07 Feb 2025 09:24:10 +0100
Date: Fri, 7 Feb 2025 09:24:10 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: robh@kernel.org, saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, olteanv@gmail.com,
	davem@davemloft.net, taras.chornyi@plvision.eu, edumazet@google.com,
	pabeni@redhat.com, sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, chenjun102@huawei.com
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <Z6XDKi_V0BZSdCeL@pengutronix.de>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207013117.104205-2-zhangzekun11@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
> There are many drivers use of_find_node_by_name() with a not-NULL
> device_node pointer, and a number of callers would require a call to
> of_node_get() before using it. There are also some drivers who forget
> to call of_node_get() which would cause a ref count leak[1]. So, Add a
> wraper function for of_find_node_by_name(), drivers may use this function
> to call of_find_node_by_name() with the refcount already balanced.
> 
> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/

Hi Zhang Zekun,

thank you for working on this issue!

First of all, let's take a step back and analyze the initial problem.
Everything following is only my opinion...

The main issue I see is that the current API - of_find_node_by_name -
modifies the refcount of its input by calling of_node_put(from) as part
of its search. Typically, a "find" function is expected to treat its
input as read-only. That is, when you pass an object into such a
function, you expect its reference count to remain unchanged unless
ownership is explicitly transferred. In this case, lowering the refcount
on the input node is counterintuitive and already lead to unexpected
behavior and subtle bugs.

To address this, the workaround introduces a wrapper function,
of_find_node_by_name_balanced, which first increments the input’s
refcount (via of_node_get()) before calling the original function. While
this "balances" the refcount change, the naming remains problematic from
my perspective. The "_balanced" suffix isn’t part of our common naming
conventions (traditions? :)). Most drivers expect that a function
starting with "find" will not alter the reference count of its input.
The term "balanced" doesn’t clearly convey that the input's refcount is
being explicitly managed - it instead obscures the underlying behavior,
leaving many developers confused about what guarantees the API provides.

In my view, a more natural solution would be to redesign the API so that
it doesn’t modify the input object’s refcount at all. Instead, it should
solely increase the refcount of the returned node (if found) for safe
asynchronous usage. This approach would align with established
conventions where "find" implies no side effects on inputs or output,
and a "get" indicates that the output comes with an extra reference. For
example, a function named of_get_node_by_name would clearly signal that
only the returned node is subject to a refcount increase while leaving
the input intact.

Thus, while the current workaround "balances" the reference count, it
doesn't address the underlying design flaw. The naming still suggests a
"find" function that should leave the input untouched, which isn’t the
case here. A redesign of the API - with both the behavior and naming
aligned to common expectations - would be a clearer and more robust
solution.

Nevertheless, it is only my POV, and the final decision rests with the
OpenFirmware framework maintainers.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

