Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2583BA61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 07:57:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HCEZMljK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLBTf6t1Wz3cSy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 17:57:26 +1100 (AEDT)
X-Original-To: Linuxppc-dev@lists.ozlabs.org
Delivered-To: Linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HCEZMljK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLBSr2L7Jz2yth
	for <Linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 17:56:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=DsBMx08ahP4nqAs1bOMhfx3wcDF6qcG7sqoIktziPcw=; b=HCEZMljKR5+t8v+JpnQaivf4Nm
	jsODc6YeSv7aYGUhKdicZLyMOxZVYj/+Ju7clddvv60JBGSmdh0WNWSZkvzd3vrj5GU5q+J59Y0Vo
	c1D15jCZFXiwezHrUQYwklavpzpdcKAaT6Z9MFbKNQavc3V+dG/42PtVfJaEj9DkznYqSysDaTCDr
	9B5tEGib58fgyk5LCcORckaDwcltNaZlvzqrk23i7uy8Ts4sf2/2WShM5V8k7LAfSW3Ru42391K7s
	nPL+Nb8X+CLu4Xdg90LOrLGYU9vgm70f1MQ9iU7EsvBrlS1oI9Bgesx0LcFEb4F0rnkVvTfJleKoi
	I6f8EXBQ==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.6])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStf6-00000004y2C-2NUr;
	Thu, 25 Jan 2024 06:56:33 +0000
Message-ID: <193e10a3-2eb9-49cf-a1b3-710dc1c1df9e@infradead.org>
Date: Thu, 25 Jan 2024 15:56:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ps3_gelic_net.c issue (linux kernel 6.8-rc1)
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 sambat goson <sombat3960@gmail.com>,
 "Linuxppc-dev@lists.ozlabs.org" <Linuxppc-dev@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <CAC1vu61dspNPx7eVSsV1htnC0d+p4m3pzuv+9jQcyAFJEF4Y3w@mail.gmail.com>
 <71205a49-86f7-48a7-94ce-cfd94e8b103d@csgroup.eu>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <71205a49-86f7-48a7-94ce-cfd94e8b103d@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 1/25/24 15:46, Christophe Leroy wrote:
> Hi,
> 
> Le 24/01/2024 à 09:41, sambat goson a écrit :
>> 	
>> Hi,
>> I've just test it and find below code not proper in function 
>> "gelic_descr_prepare_rx", line 398.
>> it causes error as my attached file.
>>
>> descr->skb = netdev_alloc_skb(*card->netdev, rx_skb_size);
>> if (!descr->skb) {
>> descr->hw_regs.payload.dev_addr = 0; /* tell DMAC don't touch memory */
>> return -ENOMEM;
>> }
>> descr->hw_regs.dmac_cmd_status = 0;
>> descr->hw_regs.result_size = 0;
>> descr->hw_regs.valid_size = 0;
>> descr->hw_regs.data_error = 0;
>> descr->hw_regs.payload.dev_addr = 0;
>> descr->hw_regs.payload.size = 0;
>> descr->skb = NULL;                     ---->line 398
>>
> 
> Looks like a copy/paste error from gelic_descr_release_tx() in commit 
> 3ce4f9c3fbb3 ("net/ps3_gelic_net: Add gelic_descr structures"), the 
> whole block is wrong I guess, not only the descr->skb = NULL;
> 
> Geoff, can you fix it ?

Thanks for reporting the problem.  I'll look into fixing it.

-Geoff
