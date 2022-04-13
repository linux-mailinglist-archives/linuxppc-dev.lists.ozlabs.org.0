Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F974FF554
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 12:59:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdfjY3QFLz3bfq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 20:59:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=23.128.96.9; helo=mail.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
X-Greylist: delayed 606 seconds by postgrey-1.36 at boromir;
 Wed, 13 Apr 2022 20:58:52 AEST
Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kdfj86WrVz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 20:58:52 +1000 (AEST)
Received: from localhost (cpc147930-brnt3-2-0-cust60.4-2.cable.virginm.net
 [86.15.196.61])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id 8D09684090C3;
 Wed, 13 Apr 2022 03:48:36 -0700 (PDT)
Date: Wed, 13 Apr 2022 11:48:31 +0100 (BST)
Message-Id: <20220413.114831.840569799075069520.davem@davemloft.net>
To: anshuman.khandual@arm.com
Subject: Re: [PATCH V5 4/7] sparc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
From: David Miller <davem@davemloft.net>
In-Reply-To: <20220412043848.80464-5-anshuman.khandual@arm.com>
References: <20220412043848.80464-1-anshuman.khandual@arm.com>
 <20220412043848.80464-5-anshuman.khandual@arm.com>
X-Mailer: Mew version 6.8 on Emacs 27.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Wed, 13 Apr 2022 03:48:39 -0700 (PDT)
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
Cc: linux-arch@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org,
 khalid.aziz@oracle.com, sparclinux@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Tue, 12 Apr 2022 10:08:45 +0530

> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. It localizes arch_vm_get_page_prot()
> as sparc_vm_get_page_prot() and moves near vm_get_page_prot().
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Khalid Aziz <khalid.aziz@oracle.com>
> Cc: sparclinux@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: David S. Miller <davem@davemloft.net>
