Return-Path: <linuxppc-dev+bounces-845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82179670E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 12:30:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwrrZ43DVz2yF4;
	Sat, 31 Aug 2024 20:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725100238;
	cv=none; b=Zk9NVqiR8uP2VgXeOUDQwQwIlGXt/uSeN9ulHxlLmsK7LhU9zEdw/XychsY8vgTFJk+VJ8suom/p333UgF91vEGxp1YpqgBa5QaGIi9rU6P9LMTF4yACR8+VE6ErKT6++bSAiz2LPwbCOo6q5+NOUyObCWqnYPLmGrYpuGEX3ALzk6dTbdVEbce0T/Y5Bx10UYM7pZnV0tiDHt5ShpzdC3oVyxyKOZ/oGvUhHZhWb/Q6xLBRD6ap7Eea4lY6KXhy6XzMe+P6Rc6T+bhfoJ9izJpBh40tJ5SV9yudgxIjIg8TGyoEp465RqmbKc6RFNcCNsjq9SFdVRksWD9CFrfhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725100238; c=relaxed/relaxed;
	bh=MnX/IGVIP89663Ock/GpjByC6wPR8nm9yFoq3qfpgKk=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding; b=FWDu8rXvInd1/OkNfdET7gRGiQb5xS9g0FxOMD+jshvLri+Q4+/hx1BTbvk69wFZeI5O9El5QDXkI2Edf6hGpVjmVyb5ZoUwVS6TT2xFirs+YWKo5jZ/DFwfeYtPaw2kaKau7F2E67ubgoUX7w2o/ZOS2v8daZ5wi5GKCN6Gel5iF+19xfNOwMv/GlQmws9waHPkjuqmpfnXJZf1XIi0PeaPMU4NOXw8lURMYZcxF1aeIp7r48Jv8TRRAmwBxMhHlHCnwFkadv58qseuDDoOxaPTgFS3b32dvGHduIY3H+EcbFhgSaHh1ySr6vJ6hNu18SqZQg6YvSrmgEtyv9cAdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEffq0MX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEffq0MX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwrrZ1WqKz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 20:30:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA64FA402DF;
	Sat, 31 Aug 2024 10:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E1FC4CEC0;
	Sat, 31 Aug 2024 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725100232;
	bh=6SWTTgTAzp6pqg4Vm4RZubkX3UCuusQwF+vJGG/x2vQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QEffq0MXDsWJWK5sRvImQL8mf+7JPH7FqWXdrsgY3Cd7NXJR8fmTHMuusiYMGnyhC
	 MHZRnQPI2BQBNzCli8vVmgh+dEdC0uxBsz/fRD4SJemPO70j2WI5R14ofbm4VjUpqj
	 kjhuO/TmLT2Aem8eyujuJ1mvRbendpbr22r/NmZB8VHlPSpsUMXOsVwaG1aQ4wijVU
	 RybOdpY2DoFelEtVjQyRLTVrH9HyaFC1lbjOm1n7PKyWOTl8dYcRCY4yp8Qh8GHVki
	 ymaipbd5WA6OB41R7ckuL0rn3ouJJGPlz4pdjabaARYh6JkylN/XBqkaD8dQdf/vUx
	 XFfHdhi7Y3qYw==
Date: Sat, 31 Aug 2024 11:30:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Kousik Sanagavarapu <five231003@gmail.com>, <andrew@lunn.ch>,
 <sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
 <herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
 <christophe.leroy@csgroup.eu>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <nm@ti.com>, <ssantosh@kernel.org>,
 <petlozup@nvidia.com>, <pshete@nvidia.com>,
 <christophe.jaillet@wanadoo.fr>, <ulf.hansson@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
 <krzk@kernel.org>, jonathan.cameron@huawei.com
Subject: Re: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with
 scoped for each OF child loop
Message-ID: <20240831113021.08a9010a@jic23-huawei>
In-Reply-To: <598efadd-da27-0be3-6d1c-dee50e71c811@huawei.com>
References: <ZtCapIwWZolY7oMH@five231003>
	<598efadd-da27-0be3-6d1c-dee50e71c811@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Aug 2024 11:24:14 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> On 2024/8/29 23:58, Kousik Sanagavarapu wrote:
> > Jinjie Ruan <ruanjinjie@huawei.com> writes:  
> >> @@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
> >>  {
> >>  	struct device *dev = kdev->dev;
> >>  	struct knav_region *region;
> >> -	struct device_node *child;
> >>  	u32 temp[2];
> >>  	int ret;
> >>  
> >> -	for_each_child_of_node(regions, child) {
> >> +	for_each_child_of_node_scoped(regions, child) {  
> > 
> > Are you sure using *_scoped() is better here?  Since it seems that we
> > need the memory pointed to by "child" in cases where we don't go into an
> > error path.  
> 
> Hi, Jonathan, could you help review this code?

I don't understand the review comment.
The reference counting before and after this patch is the same, just
with the error path handled in a simpler fashion and the scope of
the child variable reduced.


> 
> >   
> >>  		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
> >> -		if (!region) {
> >> -			of_node_put(child);
> >> -			dev_err(dev, "out of memory allocating region\n");
> >> -			return -ENOMEM;
> >> -		}
> >> +		if (!region)
> >> +			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
> >>  
> >>  		region->name = knav_queue_find_name(child);
> >>  		of_property_read_u32(child, "id", &region->id);  
> > 
> > Similarly in most of the other cases in this series where a similar
> > change is done.
> > 
> > Also FYI, as for dev_err_probe(), I think I covered all of them in this
> > file and a patch for it is currently sitting in ti-drivers-soc-next.
> > 
> > Thanks  


