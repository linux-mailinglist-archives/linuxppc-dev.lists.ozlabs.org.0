Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FEA56059E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 18:18:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY6815lXSz3dsM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 02:18:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY67Y2Tfyz3bvb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 02:17:43 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25TGD56V017150;
	Wed, 29 Jun 2022 11:13:05 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 25TGD3U2017144;
	Wed, 29 Jun 2022 11:13:03 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 29 Jun 2022 11:13:03 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 02/12] powerpc: wiiu: device tree
Message-ID: <20220629161302.GG25951@gate.crashing.org>
References: <20220622131037.57604-1-ash@heyquark.com> <20220628133144.142185-1-ash@heyquark.com> <20220628133144.142185-3-ash@heyquark.com> <c760e444-57c3-0e1a-0e4d-f79d6ae9867a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c760e444-57c3-0e1a-0e4d-f79d6ae9867a@linaro.org>
User-Agent: Mutt/1.4.2.3i
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, robh+dt@kernel.org, paulus@samba.org, Ash Logan <ash@heyquark.com>, krzysztof.kozlowski+dt@linaro.org, j.ne@posteo.net, linuxppc-dev@lists.ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 29, 2022 at 11:58:18AM +0200, Krzysztof Kozlowski wrote:
> On 28/06/2022 15:31, Ash Logan wrote:
> > +	model = "nintendo,wiiu";
> 
> It's not compatible, but user-visible string, e.g. "Nintendo Wii U"

The "model" property in OF is documented as:

---
“model”                                                                S
Standard property name to define a manufacturer’s model number.

prop-encoded-array:
  Text string, encoded with encode-string.
A manufacturer-dependent string that generally specifies the model name
and number (including revision level) for this device. The format of the
text string is arbitrary, although in conventional usage the string
begins with the name of the device’s manufacturer as with the “name”
property.
Although there is no standard interpretation for the value of the
“model” property, a specific device driver might use it to learn, for
instance, the revision level of its particular device.

See also: property, model.

Used as: " XYZCO,1416-02" encode-string " model" property
---

> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		/* TODO: Add SMP */
> > +		PowerPC,espresso@0 {
> 
> Node name should be generic, so "cpu". Unless something needs the
> specific node name?

This is how most other PowerPC firmwares do it.  The PowerPC processor
binding is older than the generic naming practice, so CPU nodes have
device_type "cpu" instead.  This is a required property btw, with that
value.  (There is no requirement on the names of the CPU nodes).

There is no added value in generic naming for CPU nodes anyway, since
you just find them as the children of the "/cpus" node :-)


Segher
