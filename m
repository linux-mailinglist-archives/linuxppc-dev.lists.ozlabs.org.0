Return-Path: <linuxppc-dev+bounces-12730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D9BC777A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 07:54:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chzbj6Ttsz3cDN;
	Thu,  9 Oct 2025 16:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759989281;
	cv=none; b=XwpIymqcSye0t+UxMdWDvKfpwBst4B2CdHBCd5Nug/T/+QUDGqTl3pNpn4loCHew6mK0/X2tPpvlD3b5nkJgvQM8oxTvSM4nKZwOS3TKBiOc+N9DIEqv85ajBc9TvCkN0p0j74FP3OKtA7FDiCbKTOAG9l/3Cxon+gAdHGkTXZWP5r8WDhwXPbx8x8h/t0NU2f7PlxNL9D1WtH6bxx7PakGA5dfuAEuiK8YjEF6wGl/ml9reC/4UI5fu/cu6wHqJVStzliWnG1EBELjg1JbZYzNy6e7NwrWX0dlVFdEDs6gdXykse/bG9bOOnDRslNG/14Ylmf/WwV1yuBT9aqGjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759989281; c=relaxed/relaxed;
	bh=u/S2a92AjlzF3/ChlmUXuy0CrVE2bI2e7LqJxUHx9b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6f2wtwBgqWcm67KZ+tngeTQCIcjYRrjys17ma3ug9eBw/JotjyrQpsP7htQL1P+mHPQpM0Yk8l/ZDHwOkaRm7ORbyDK/3TX4KCheVl394/NPGmDUL+BrJ0PDzorwij+YjC7wxGptWnzPnXebS51Qqw3AFs8OEKLIZ8P3OOqaPiB/TQmYX2LShrgtQdrdpA+X6ylYtyPX8WFwPyLZOCwKOj6ipPYj03YtgMsbl6S8QFJ6DTu1poq8kjvFliDuAozqxI8VjpefQITzJx7pwE2xjzA6+TtbYApGLLZDQ0fxQGOxlKz00SZk/eXGcx6SgCR6qaouDgt6E/UIouj1N8rMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f51rVZZi; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f51rVZZi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chzbj0xw4z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 16:54:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80E3943DAB;
	Thu,  9 Oct 2025 05:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F0BC4CEE7;
	Thu,  9 Oct 2025 05:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759989278;
	bh=1Q+wmBbFXWTt8KRzTS2M2aX+iDE4wfTG3mxiGIUeyRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f51rVZZi6jPd1WhJjTdxAPFMKFq1voYst9ySH5AeJ6jkOJSM0bv3jn0ffRbLPEoDE
	 lQGZ/t/emT/0tPPQtVc6FhZ1Qrs9zpXEXUvii818U64WRtbovXt08pEiFvezy7UBnm
	 YhJfIteyIAkfYX72UAGSpA9Yi+saR6Bvfos1rpiPDWuQIUXDqoaRA2XjLJHIjU3tJO
	 xBIEZWVtDYgXAdrX8fCkB8sLXjVIsEJj48F1IDWxrniB7G2RnZXoUtDSQbFxyxVEhc
	 /sB3JZ8NJ0plFUgevI0pa/rsWk0Uo/IiIN/aQgc6lNt6CyMpR2GI0lclSoAk0MGUqk
	 NmnCtNLz0X3Eg==
Message-ID: <2d00ed57-3c74-492e-83ae-88ca1ce98311@kernel.org>
Date: Thu, 9 Oct 2025 07:54:19 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: pnv_php: Fix potential NULL dereference in slot
 allocator
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 christophe leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
 <2013845045.1359852.1752615367790.JavaMail.zimbra@raptorengineeringinc.com>
 <bf390f9e-e06f-4743-a9dc-e0b995c2bab2@kernel.org>
 <304758063.1694752.1757427687463.JavaMail.zimbra@raptorengineeringinc.com>
 <97746540.1782404.1759973048120.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <97746540.1782404.1759973048120.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09. 10. 25, 3:24, Timothy Pearson wrote:
> A highly unlikely NULL dereference in the allocation error handling path was
> introduced in 466861909255.  Avoid dereferencing php_slot->bus by using
> dev_warn() instead of SLOT_WARN() in the error path.
> 
> Fixes: 466861909255 ("PCI: pnv_php: Clean up allocated IRQs on unplug")
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

LGTM, perhaps also a lnk to the report:
Link: 
https://lore.kernel.org/all/304758063.1694752.1757427687463.JavaMail.zimbra@raptorengineeringinc.com/


Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

thanks,
-- 
js
suse labs

