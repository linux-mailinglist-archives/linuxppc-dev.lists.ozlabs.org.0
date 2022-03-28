Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B84E95C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 13:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRrfM2ZJFz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 22:52:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=oUQch5Aa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=zBafXC0q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=oUQch5Aa; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=zBafXC0q; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRrdh387wz2xrk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 22:51:52 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id A34B5FA6AC; Mon, 28 Mar 2022 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648468308; bh=3Wi+uKVZkL99swRaVau3EJ8BXQXDlu9JC1kflQpPOrg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oUQch5AaF2NS4T0Fc7buc7qaKcaMKVG810YRJRo241bkl85duCMxS23fDm3GVMDw1
 xL8wfFwfguE7DE2l/k4vVmJ5m+zw1ufGo67LfJIKzisY6pcfbZGcdaFk0B9ghPqfKS
 I2W7g/SOQV7recVh3ztaUhpWJY1H9k0XjfmxF8AmYZ/fAW3ggk2byys8WeLu0ak9ah
 IgL+/CAYYREpGVUMMRCs+UZIGRhzVjykJ9daQ0sVnnmKwNo2ovBFc7vsiaUCV/jRSa
 ex0Ku60KERB06l+p4AJhX5EDQm9DgjMeTcaApMq8icB704ISrupDr4D5KxV4dtLzM0
 6HAU3bjLTErUA==
Received: from [IPV6:2a02:8109:a100:1a48::e7c] (unknown
 [IPv6:2a02:8109:a100:1a48::e7c])
 by stuerz.xyz (Postfix) with ESMTPSA id 96ED2FA6AC;
 Mon, 28 Mar 2022 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648468306; bh=3Wi+uKVZkL99swRaVau3EJ8BXQXDlu9JC1kflQpPOrg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zBafXC0qmHbBy2R0CwrqEVHxB0KbRcM6x7IR+QfcMB3oUVBkemOuTu17YEp7Cwbgd
 Lw+gvLver4LCPJCOHCL2eAzpr1O+pT/EX986F+oA22O2GOoGJb/57oYXvhAOACQpb/
 rN+svuiDvsbTolC94H1JtxdXdx0U3+g4ZYZxI9bHa94d/+r+oRSAJqz7+XAzj1cCh3
 ict551S0UMWEtEMaDv06/XFQYnv7JqCdIWuWPwV30h6+Z5RIA9IJAECe2MRFrynB4K
 mSzFCFSElIq/pRqE39gIg1HoMMEgNA6qMLNrZGciYbRFSH0ycDjGpa+qscnhjrtqTE
 wSGn8LEPrkJpQ==
Message-ID: <cc104272-d79a-41e1-f4de-cb78fb073991@stuerz.xyz>
Date: Mon, 28 Mar 2022 13:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 00/22] Replace comments with C99 initializers
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <8f9271b6-0381-70a9-f0c2-595b2235866a@stuerz.xyz> <87fsn2zaix.fsf@kernel.org>
From: =?UTF-8?Q?Benjamin_St=c3=bcrz?= <benni@stuerz.xyz>
In-Reply-To: <87fsn2zaix.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
 wcn36xx@lists.infradead.org, linux-edac@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devel@acpica.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.03.22 11:33, Kalle Valo wrote:
> Benjamin Stürz <benni@stuerz.xyz> writes:
> 
>> This patch series replaces comments with C99's designated initializers
>> in a few places. It also adds some enum initializers. This is my first
>> time contributing to the Linux kernel, therefore I'm probably doing a
>> lot of things the wrong way. I'm sorry for that.
> 
> Just a small tip: If you are new, start with something small and learn
> from that. Don't do a controversial big patchset spanning multiple
> subsystems, that's the hard way to learn things. First submit one patch
> at a time to one subsystem and gain understanding of the process that
> way.
> 

I actually thought this would be such simple thing. Do you know of any
good thing where to start? I already looked into drivers/staging/*/TODO
and didn't found something for me personally.

Should I drop this patchset and start with something different? If yes,
what would the proper way to drop it? Just announcing, that this is
going nowhere in a separate patch?
