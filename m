Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3D14FB6F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 05:39:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489JC80q9KzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 15:39:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489J9g1MjZzDqcm
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 15:38:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 489J9f4lWSz8tFp
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 15:38:14 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 489J9f3HhWz9sRY; Sun,  2 Feb 2020 15:38:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=T7l4+/A3; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 489J9d5whtz9sRW;
 Sun,  2 Feb 2020 15:38:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4oWUZJaR7Jx+L3WxZYUTftOrPw0KXFITkchU6eONNQ8=; b=T7l4+/A3xrUaQ52FJYISmxjnG
 duMEZTL96r95Umj+7OgsE+FIk3i0RC11BPcq5vSR88P1L6PQ/+njvBj7lf2gdLCAHlsX+FOBg9DqO
 QxAM9/lQXJUr8oiveKu19VxkDskDkaQGwAOv29Has4EKNvva0RQx8JwaDFkv0wDXVV6BwUV5GIp/a
 BYtForHRfejzD3vR0REa6j2y/s99V41bG/bmlNC8ohl3Y3UgBBTfkUi/je8SQRpm7J4XnrvBH0Nnu
 vk7aX3Y0Z6UqKQoQ/msYTtf+sX0t9w5oej3LFg05ncHlnUgg/6DFicMgXsTD1snYT65GNUZZZsqH/
 T3pN4f51Q==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iy717-0006gy-4o; Sun, 02 Feb 2020 04:37:53 +0000
Subject: Re: Latest Git kernel: avahi-daemon[2410]: ioctl(): Inappropriate
 ioctl for device
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200126115247.13402-1-mpe@ellerman.id.au>
 <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
 <58a6d45c-0712-18df-1b14-2f04cf12a1cb@xenosoft.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c9c7de30-dea8-f162-f049-a16b2bcf7b7c@infradead.org>
Date: Sat, 1 Feb 2020 20:37:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <58a6d45c-0712-18df-1b14-2f04cf12a1cb@xenosoft.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[might be network related, so adding netdev mailing list]

On 2/1/20 4:08 PM, Christian Zigotzky wrote:
> Hello,
> 
> We regularly compile and test Linux kernels every day during the merge window. Since Thuesday we have very high CPU loads because of the avahi daemon on our desktop Linux systems (Ubuntu, Debian etc).
> 
> Error message: avahi-daemon[2410]: ioctl(): Inappropriate ioctl for device
> 
> Could you please test the latest Git kernel?
> 
> It is possible to deactivate the avahi daemon with the following lines in the file "/etc/avahi/avahi-daemon.conf":
> 
> use-ipv4=no
> use-ipv6=no
> 
> But this is only a temporary solution.
> 
> Thanks,
> Christian


-- 
~Randy

