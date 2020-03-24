Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3D1909A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 10:41:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mmTx4WrhzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 20:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p00-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5300::5;
 helo=mo6-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=BYfBWL3B; 
 dkim-atps=neutral
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mmRf3lwDzDqgd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 20:39:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585042755;
 s=strato-dkim-0002; d=xenosoft.de;
 h=Date:Message-ID:To:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=Gwl2h3GNvYfVv90EPjKun2l1SaGFbScTt+776gsm3oY=;
 b=BYfBWL3B99R8Wmv7f3yB5fzsr4jX6U0zmeU5i6CZpuTLdeq3ctuCJgUVONQ3aSWcbR
 IfTHBzsXVAILZkmeR0exUdT7pUdJc5osk28YSx+ddOHJ4VK4d2WMeOCuAE4echsIgBPj
 48IpNvaSy3/SAJEVr7MGtXRth9PRYp1tEJ6xtlesM2oupeN+RGXW50zMoAzlyvO/XaDA
 Zsfi0UJ5psLZjzlLV7Eq1MZO2R59+Kq+p/cTqNbdyvlrTvrI82mStqf56t/OkG+Xu4Zh
 06btepvD7WkrEj9vumP87XNnq85/9C94aKtcRaYItb0UERkFfQ9WD7X+g4H8OVAFM2l1
 Wf0g==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhbIiUk77uUvFUDxSnbkn8iTdu0XQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:8496:804d:517f:11cf]
 by smtp.strato.de (RZmta 46.2.1 AUTH) with ESMTPSA id c060e4w2O9dDTWo
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <linuxppc-dev@lists.ozlabs.org>;
 Tue, 24 Mar 2020 10:39:13 +0100 (CET)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to, struct
 device
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <d5d933f4-35c5-652a-4760-f99e243de113@xenosoft.de>
Date: Tue, 24 Mar 2020 10:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

The DMA mapping works great on our PowerPC machines currently. It was a 
long way to get the new DMA mapping code to work successfully on our 
PowerPC machines.

P L E A S E  don't modify the good working DMA mapping code. There are 
many other topics which needs improvements. For us (first level + second 
level support) it is really laborious to find your problematic code and 
patch it. It takes a long time to find the problematic code because we 
have to do it besides our main work.

P L E A S E test your code on PowerPC machines before you add it to the 
mainline vanilla kernel.

Thanks,
Christian


On Tue, Mar 24, 2020 at 12:00:09PM +0530, Aneesh Kumar K.V wrote:
 > dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
 >         unsigned long offset, size_t size, enum dma_data_direction dir,
 >         unsigned long attrs)
 > {
 >     phys_addr_t phys = page_to_phys(page) + offset;
 >     dma_addr_t dma_addr = phys_to_dma(dev, phys);
 >
 >     if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
 >             return iommu_map(dev, phys, size, dir, attrs);
 >
 >         return DMA_MAPPING_ERROR;

If powerpc hardware / firmware people really come up with crap that
stupid you'll have to handle it yourself and will always pay the
indirect call penality.
