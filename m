Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E11BA545DA5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 09:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKCSW5pF8z3cDt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZ5pqO33;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZ5pqO33;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKCRt5MCfz3000
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 17:35:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E36FDB831CF;
	Fri, 10 Jun 2022 07:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCF4C34114;
	Fri, 10 Jun 2022 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654846532;
	bh=uTbaZzKG7C/xctt/sOZ6EpBYH3dQrKSYHH0fK1iFLK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZ5pqO33Ns/B9uSn8GR3qtAfNcd+gbzjbG/Ls3JBJpOHVh3jglilpPPz9xIU/gVUp
	 8AvD7t4f9u8Au3yiYBNEsOyh2jhR1p50nVhaeQEpANfpqCkgWRM/N9OTphYgBuS8Mr
	 BsBWfcPDeENDI2jliRbaIwxWepYS1b069mEGxw6cOVsrC+ifJhNTeoSkp75EHQKI4E
	 fDKAMSmlrhxrTg2DZXy8VR0E8LmgQv/jtKSCWsfUhICcpu2R/o0a9nipk/ElUjOlxS
	 F3Dl7WhSUWEib39ncLEQx/2TW/2AClfTKqsrkotx31Mt4mBBzn6+pf3ffY3dVmnTxP
	 N8wfWJzPGmZPg==
Received: by pali.im (Postfix)
	id 902131D32; Fri, 10 Jun 2022 09:35:29 +0200 (CEST)
Date: Fri, 10 Jun 2022 09:35:29 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for
 PCI domain
Message-ID: <20220610073529.n263gub3pv7jej7a@pali>
References: <20220504175718.29011-1-pali@kernel.org>
 <87edzxc6r7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edzxc6r7.fsf@mpe.ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 10 June 2022 17:33:32 Michael Ellerman wrote:
> If you have scripts that are looking for certain devices they can use
> the vendor/device fields in sysfs to find the actual devices they want,
> not just whatever happens to be at 0000:01:00.0.

This does not work if you have more cards with same vendor+device ids in system.
