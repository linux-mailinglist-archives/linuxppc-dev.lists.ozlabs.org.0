Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02F672E850
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 18:22:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRfaLgMM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgYjz3lk6z30fx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 02:22:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgYj13jpFz30MJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:21:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=97aImOeixrL2gdg6gSWQ4e9JZgBEAU+a5A8NTT/u71s=; b=oRfaLgMMtbIMqJPVc/hkEPNr26
	L3rOOHyJPIe+koLJf49PpjS5Bzl2gO84UoC0tWhCX+A9jko0G85jTtSdgy9R+Afk6+nIPckMuK7Rg
	7LXM4/NPDTHR/2fhvZ7Rw91UiDQgQISdFdjrP1aF6vDsjyjgKWjaTKURGkQS9UN+fA7jbjb2ojrOq
	470LpKlqYcU/YUdw1/h+qAWu2K6SZW7sRDsiu2zLYxenjGQxYGj4hBzWKtq+lTnaZEAbeTgGGN3tb
	ilPN1ro5uHz1Yztm/n1O0vfHerOIEp61rGsDLKcF85vXh8JTGHxTAawpTPX9lcr87IspYoa47KrwT
	i3cWQVjg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q96ls-008a5f-1x;
	Tue, 13 Jun 2023 16:21:28 +0000
Message-ID: <8f9f8d38-d9c7-9f1b-feb0-103d76902d14@infradead.org>
Date: Tue, 13 Jun 2023 09:21:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: linux-next: Tree for Jun 13
 (drivers/net/ethernet/freescale/fs_enet/mii-fec.c)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230613165903.5cc10e58@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230613165903.5cc10e58@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Network Development <netdev@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/12/23 23:59, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230609:
> 

on PPC32:

../drivers/net/ethernet/freescale/fs_enet/mii-fec.c: In function 'fs_enet_mdio_probe':
../drivers/net/ethernet/freescale/fs_enet/mii-fec.c:130:50: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
  130 |         snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", res.start);
      |                                                 ~^   ~~~~~~~~~
      |                                                  |      |
      |                                                  |      resource_size_t {aka long long unsigned int}
      |                                                  unsigned int
      |                                                 %llx


-- 
~Randy
