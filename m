Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E8C0B5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 20:36:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g0r65ZqjzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 04:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="cFaZ9992"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g0my5yz9zDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 04:33:54 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 17EE87E01A;
 Fri, 27 Sep 2019 13:33:21 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1569609201; bh=wk1mdhZxXbNyN8NdhJA3cUtm/ZxciUydA26w8eVYR2s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cFaZ9992JNzVHC7adO3hByHpKrVvF0DrbMWzA0uMqlQjiXnmacmrnHaIUWPOrF2mn
 tsPygIlxWfZ07ObOtzM6C4EH1iMtsiXA3UB3bUvfhqZLGuWaXZ2XlqPNWuAoOXhRHU
 K0JboLNKfVKiSFsOCamrNMA7tDmGBkO78rPCYK9xPTe9nLI5otyTxQW29pD8gy1kWM
 ki0p/2PGet+olyl8xU2rOghW4izlfxC1aR+jmtrk4GkmLpIbQ9Xv5/kbkQcOXaMq7w
 kwDKPNyQIHbG92Zvz8TTcxC/w9dwD9RxhLELedwEiAP5a02cN2w5lhe3L0TyE9DpKA
 cJBjNphpaeNVw==
Subject: Re: [PATCH v2 1/1] powerpc/pci: Fix pcibios_setup_device() ordering
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20190905191343.2919-1-shawn@anastas.io>
 <20190905191343.2919-2-shawn@anastas.io>
 <e090d238-d452-6c82-d21b-aeda5f5310e6@ozlabs.ru>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <57bb4467-40ab-bdf7-4091-adc0236c3ea3@anastas.io>
Date: Fri, 27 Sep 2019 13:33:19 -0500
MIME-Version: 1.0
In-Reply-To: <e090d238-d452-6c82-d21b-aeda5f5310e6@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: sbobroff@linux.ibm.com, lukas@wunner.de, oohall@gmail.com,
 bhelgaas@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/9/19 2:59 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 06/09/2019 05:13, Shawn Anastasio wrote:
>> Move PCI device setup from pcibios_add_device() and pcibios_fixup_bus() to
>> pcibios_bus_add_device(). This ensures that platform-specific DMA and IOMMU
>> setup occurs after the device has been registered in sysfs, which is a
>> requirement for IOMMU group assignment to work
>>
>> This fixes IOMMU group assignment for hotplugged devices on pseries, where
>> the existing behavior results in IOMMU assignment before registration.
> 
> 
> Although this is a correct approach which we should proceed with, this
> breaks adding of SRIOV VFs from pnv_tce_iommu_bus_notifier (and possibly
> the bare metal PCI hotplug), I am trying to fix that now...

Were you able to make any progress? I can think of a couple of ways
to fix SRIOV, but they're not particularly elegant and involve
duplication.
