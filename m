Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30728773C00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 17:59:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d17bUPYC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKyY80g7xz3bsx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 01:59:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d17bUPYC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKyXF5n2xz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 01:58:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1C11625E1;
	Tue,  8 Aug 2023 15:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04381C433C7;
	Tue,  8 Aug 2023 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691510296;
	bh=dsivP5QK/puytThT6Z/o/BL2ZSnYkylTLjGfbpcLdi8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=d17bUPYC0qX1htLiPTAVikoi1UP+fA2yaPvY21PsAQSw0ijWbq0pjyxE/ftgcOnO8
	 +5+AATNiD0HGS1G3eTlJ+pir22Qsd7VJfQmN2yuaKQ5umSTU9A5QY6nOH2TqpZEclT
	 /awiJwvHAeB1JL3Y2IDDaZmbeT9DGUVBCbTOxvgLhqx0Z9CKCQobd4NSid9TCvoV2R
	 1cWGhjSsK04Pn3ROuChrr9YujNXmderX6Ph2zwBAMiExbnMLaZdUKjYmZJHrEi4ciD
	 Pw1El4upEKm94OHpcZNQXkPlGA+Db9npE3jqi9vE1OB7kRjSC9YGFyNpRgo2v3zFgh
	 n4siK90AThEcQ==
Date: Tue, 8 Aug 2023 10:58:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: Re: [PATCH v2 1/2] PCI: Add pci_find_next_dvsec_capability to find
 next Designated VSEC
Message-ID: <20230808155814.GA313884@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808040858.183568-2-wangxiongfeng2@huawei.com>
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
Cc: ben.widawsky@intel.com, ajd@linux.ibm.com, arnd@arndb.de, jonathan.cameron@huawei.com, yangyingliang@huawei.com, linux-pci@vger.kernel.org, fbarrat@linux.ibm.com, npiggin@gmail.com, david.e.box@linux.intel.com, gregkh@linuxfoundation.org, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't re-post just for this, but if you do repost, add "()" after the
function name in the subject line, as you did for the 2/2 patch.

On Tue, Aug 08, 2023 at 12:08:57PM +0800, Xiongfeng Wang wrote:
> Some devices may have several DVSEC (Designated Vendor-Specific Extended
> Capability) entries with the same DVSEC ID. Add
> pci_find_next_dvsec_capability() to find them all.
