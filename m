Return-Path: <linuxppc-dev+bounces-9449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E517ADF326
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 18:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMqd15mJ4z30TY;
	Thu, 19 Jun 2025 02:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750265765;
	cv=none; b=h1UJe6+Ub8lHjVQ1y872miyO4PGgg1yjf287Y8E273mWJQZ1lVwLcbFISmKZIXSCcuNdfOXTkhJ/uBxftuFrTWthfTw7dcVDepSrU72kLOwufitJ7ZlmNsTAGRRs3k0v2UtiU/k3lDsxWN3IsqJxzTZNFA/xsohUhPJcxHubyhsb4T5PHiVCkHYg34gRdfPvf5eVYl80M6qFW3w7kz38QY0WkgaWcmsAtEuJcIp+NjhhFLSZNn8xmt0Ix69qgQLMxUVgQBP1MFie6pRijyE/xP1JnlJJI9LBcMvzerkf/+9kK7OBW34ad1MSPoQpUzyoxhzqUqaJGW8SEaYBsDc5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750265765; c=relaxed/relaxed;
	bh=lsH6Mcb5sOzQ2SC69uB9LMQwjmUITv6dqf33k1ZaAf0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Iyx4icHz5GnjpGWw1k06UBfzYXUCPt7SqrTyLI2cOr04c5TAAt+YQ2h6DNWG8G8zcDu0OhDz8YRyPoqzeUvvMKUjnQdsGeKFx7Z/OCRyTtqDRrpznelotI256ecPXjMeV2juJe4HK6AGssKYw//XpvXK49d/ITYUEoS4eEp1V89J7BOuJDLxZWpGHr5ytqZ+mb+RtlhwQ8eDmXjrt8jmsjQ+QncaaBcB00btta6oKwixy3pO7gl+4HVJx2za/oo93ZJur668XhtNb6Ly2ehKxs1mx+tpE34oT7ofpy1AzccmzpnBMvdspxJOLuexOKHrxWnDhYDkbL2vJGumb7qiNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=SG8+Ktpn; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=SG8+Ktpn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMqd06xjdz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 02:56:01 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 828C88286FBD;
	Wed, 18 Jun 2025 11:55:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 0aUYil_3E0-H; Wed, 18 Jun 2025 11:55:58 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 88B968287179;
	Wed, 18 Jun 2025 11:55:58 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 88B968287179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750265758; bh=lsH6Mcb5sOzQ2SC69uB9LMQwjmUITv6dqf33k1ZaAf0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=SG8+Ktpn6Q4bBiZ3ABXaM45t5s/V+sMoNCVSb0T9rxV1PPzYIoYLjKaXLaBLSAyY/
	 5qwfBhof6dKUdiJuk0rFFbPkEmcEk3yfkjd76FJk04zGXTK75NibzVgEerXqrYaRra
	 Bkvv+mo6EnYtnHZ71trKJYhcqqd6UJLdZHQWW0CA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Z7uLIchHfRBv; Wed, 18 Jun 2025 11:55:58 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 59BA28286FBD;
	Wed, 18 Jun 2025 11:55:58 -0500 (CDT)
Date: Wed, 18 Jun 2025 11:55:58 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <596516884.1310632.1750265758190.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1728509613.1310543.1750263002144.JavaMail.zimbra@raptorengineeringinc.com>
References: <946966095.1309769.1750220559201.JavaMail.zimbra@raptorengineeringinc.com> <aFJQ8AtYlKx1t_ri@infradead.org> <1728509613.1310543.1750263002144.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH 3/8] powerpc/pseries/eeh: Export eeh_unfreeze_pe() and
 eeh_ops
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc/pseries/eeh: Export eeh_unfreeze_pe() and eeh_ops
Thread-Index: bupdJGUzprnsSSzB+HYmaNkawJnfUc+y9UXi
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineeringinc.com>
> To: "Christoph Hellwig" <hch@infradead.org>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
> Sent: Wednesday, June 18, 2025 11:10:02 AM
> Subject: Re: [PATCH 3/8] powerpc/pseries/eeh: Export eeh_unfreeze_pe() and eeh_ops

> ----- Original Message -----
>> From: "Christoph Hellwig" <hch@infradead.org>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel"
>> <linux-kernel@vger.kernel.org>, "linux-pci"
>> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
>> "Michael Ellerman" <mpe@ellerman.id.au>,
>> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao"
>> <naveen@kernel.org>, "Bjorn Helgaas"
>> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
>> Sent: Wednesday, June 18, 2025 12:38:56 AM
>> Subject: Re: [PATCH 3/8] powerpc/pseries/eeh: Export eeh_unfreeze_pe() and
>> eeh_ops
> 
>> On Tue, Jun 17, 2025 at 11:22:39PM -0500, Timothy Pearson wrote:
>>>  /* Platform dependent EEH operations */
>>>  struct eeh_ops *eeh_ops = NULL;
>>> +EXPORT_SYMBOL(eeh_ops);
>> 
>> Exporting ops vectors is generally a really bad idea.  Please build a
>> proper abstraction instead.
>> 
>> And use EXPORT_SYMBOL_GPL for any kind of low-level API.
> 
> Fair enough.  I'll add a properly exported method for PE get_state() and update
> the series in the next couple of days.

Somehow I completely missed eeh_pe_get_state() the first time around.  I don't need to change the API, v2 incoming now.

