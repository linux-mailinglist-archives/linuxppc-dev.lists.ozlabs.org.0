Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1D5E8053
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYz6k0b8Mz3cjD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 03:05:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=JfrxsHO/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=44.202.169.36; helo=omta037.useast.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=JfrxsHO/;
	dkim-atps=neutral
X-Greylist: delayed 340 seconds by postgrey-1.36 at boromir; Sat, 24 Sep 2022 03:04:38 AEST
Received: from omta037.useast.a.cloudfilter.net (omta037.useast.a.cloudfilter.net [44.202.169.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYz5y5r03z3cBm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 03:04:38 +1000 (AEST)
Received: from eig-obgw-5014a.ext.cloudfilter.net ([10.0.29.198])
	by cmsmtp with ESMTP
	id biEjofDdg7krOblzOol0wV; Fri, 23 Sep 2022 16:57:22 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTP
	id blzMoc7ZK4gRbblzMo3WW5; Fri, 23 Sep 2022 16:57:20 +0000
X-Authority-Analysis: v=2.4 cv=EMIVbnVC c=1 sm=1 tr=0 ts=632de570
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=FqOIB2A0pCpItkPd+H5VLg==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=xOM3xZuef0cA:10
 a=wYkD_t78qR0A:10 a=1Vq8JeZ7YxIarabX38cA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FLY2ZY7ymRr6++gvseBT22t1fbdbp4dMhqB4jOqPPM8=; b=JfrxsHO/L0pRqzR5yIPhwxR8tC
	PSS37c4n08S2ZiudUSufuraw+SgKPf8+MkA1dUQmo8Gm8OtQ7K2B+HM0EdWMSNFDu+Pm9L+Rn2bFb
	OS9JoS29kihy6g/Z4Y/kABajSDd+o92IszuhMmcytgmETEy70wrbu6VcILf6k+IXagWtZSJHieFi/
	bKzd3XbNaOo3LrqAHGwbttQChLl/dAgrHWEsaeC+bMcQaCsIATwgJMx6vZnLSTZk9mv2IWLWMmYxd
	fItcyeKzD1loGySu8CLY+EmFzvxWJTx+NYrEMSNUg+Nmm3nD7/q0+5+5dFzEQpFXRjZycD3K+81rV
	eD6acjLA==;
Received: from 187.184.158.46.cable.dyn.cableonline.com.mx ([187.184.158.46]:65034 helo=[192.168.0.24])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <gustavo@embeddedor.com>)
	id 1oblzL-0014A3-2i;
	Fri, 23 Sep 2022 11:57:19 -0500
Message-ID: <80657fb9-97cf-0677-bc2d-0dbbac2b610a@embeddedor.com>
Date: Fri, 23 Sep 2022 11:57:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH][next] powerpc: Fix fall-through warning for Clang
Content-Language: en-US
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Scott Wood <oss@buserror.net>
References: <Yxe8XTY5C9qJLd0Z@work>
 <166393161454.498456.8335142306216879652.b4-ty@ellerman.id.au>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <166393161454.498456.8335142306216879652.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.158.46
X-Source-L: No
X-Exim-ID: 1oblzL-0014A3-2i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.158.46.cable.dyn.cableonline.com.mx ([192.168.0.24]) [187.184.158.46]:65034
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHNBKqY9Q/78NuVv9WpcPb8ZZ1NjWdcjgj9Wrr93FseHtLdYdfbDw04YZug27GKXhmMeteVYN6Ts1tJj8AS5rpxdptW7acCVYD0rpIniOKRAqFwVZrdm
 qNIJLhZCVOZlkoWT2/0j2H4GHaelVjjy+NfaVeVUcqHWOJ+7dbaDY9heoag3OzMKrGhTgjQdC8ZDInH44Jz7uN7+1OGNN5Uti/E6mjGQbfeILYS6GcZNaDC/
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Applied to powerpc/next.

Great. :)

Thanks, Michael.
--
Gustavo
