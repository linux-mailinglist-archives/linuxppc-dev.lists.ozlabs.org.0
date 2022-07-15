Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3F5766D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 20:34:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll0Pq4cCmz3cff
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 04:34:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=T+0xYXeu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com; envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=T+0xYXeu;
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ll0P72yWzz3c5B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 04:33:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eHY8ml2kSNhWyc+Lu2y+Au3hBhDY7pHCci4IztLK7Xc=; b=T+0xYXeuOGrOK3gFQFS+sISKGh
	SDcLCeRHEaBPMmX4jDC7KMCJofTE7poUJ25T5Hm5Ghl3XGw6nWsSxelviFUhyN/YlhEzgdbj9f5ih
	olPqVatvSPG5Sc5rZOo06VaWxw6lfj5ZPP2fOAW/5wgVOWaCaY7QSOji3e0Qu1oz+DbUaxNRgKbRX
	OaOi/f4vU6kiIXqyJ6eCFVFPeLdxxNLk85+O8x5Zq6ixFC3LSE6iIyVwm4PBNS/iq6PyHxOWoKS08
	78UnOdFJvuZ13GZT2WXs5AF/18wy9kkVeN0xISlEW/m+DNkWZsbGzOvzLmQUtEjf+9+Rawd9DEcgE
	AMaaI8/w==;
Received: from 201-42-109-188.dsl.telesp.net.br ([201.42.109.188] helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1oCQ7j-000aT2-DH; Fri, 15 Jul 2022 20:33:12 +0200
Message-ID: <15432ee0-3a33-0b53-b39b-f8b53a7e4345@igalia.com>
Date: Fri, 15 Jul 2022 15:32:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] powerpc/pci: Add config option for using OF 'reg'
 for PCI domain
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <20220706102148.5060-1-pali@kernel.org>
 <17fb8d12-60f9-09d5-91fa-09d5a5a9a4fd@igalia.com>
 <20220715171132.ujaexzm4ipad7o4f@pali>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220715171132.ujaexzm4ipad7o4f@pali>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Guowen Shan <gshan@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/07/2022 14:11, Pali Rohár wrote:
> [...]
>>
>> I found this sentence a bit weird, "in the similar way like it is doing
>> kernel for other architectures", but other than that:
> 
> If you have some idea how to improve commit description, let me know and
> I can change it.
> 

Oh, for example: "in similar way the kernel is doing for other
architectures". The sentence idea is perfectly fine, it's just that it's
a bit oddly constructed IMHO heh

Cheers!
