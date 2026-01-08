Return-Path: <linuxppc-dev+bounces-15409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9FD01C23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 10:11:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmzfz572Gz2yGb;
	Thu, 08 Jan 2026 20:11:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767863499;
	cv=none; b=anethFTiUtmElubftxoLYfnleP/JuBPjOJZR4tqi1POrGL3k1TNJK/VMQGE/bh6eCr0apTvHhKosbw0Un0duRKXR/ePGSeWa7Wx/TgJ3/EDFQnwqcgM8aZf5dfkFNekVOokRJZng3TW79skP73mxRk4cn+hZ0t6o7zaUzFUT+ToXFVCsBS1+wvWHO5JF6HaUFRDae3S03BtgJKdMCjoIIQ5s4aC/oKTTE+24cXr32CG/srjcyhPXVXBfsa0wryWrEv5mGCk00D/IsR7o1ZF0sJ1h64lIQBPm9B3ahf/tiSRymhKl2IqrKxElK3NLsgzCXAmCjEpSRQHi9ylps0ConQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767863499; c=relaxed/relaxed;
	bh=MniwPNQNaIY3DtcITzcYtIOTE8zKcRoCOy8bA93j8+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0meCkYhviVpgufBsmzhCHpNfN+q16hmQsNP2tikKclzIzavNr6S0CGLLjKHFwxCavQujFlVCV6U8xu/r+wE9duFt8rluq47sPugiqJaes4f8RdMhKxWkIM2iAnQE2wjQuDBDkfvdEN6/tvj0fiUdrghwXRsqBFOUTMc3RZcUBy7LFncJ+ygM6npIy+04h1n6gdu3BjhcOBVOulAXS4PWeqr1cQaMqsGWWFZK8t9aPZ/Ca4AlrsYRLRC766/ptunLftV8PUVEbM613Nemua2dTrt9y6Ezk2Z+NRQWB7YRpE4vQRaxLCWPmDIK8qW5lx7B1tNzzZqNphDMYkr1FMITg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X3y7hVJl; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X3y7hVJl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmzfy1TbYz2yG7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 20:11:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B98EE43DFA;
	Thu,  8 Jan 2026 09:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0EBC116C6;
	Thu,  8 Jan 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767863465;
	bh=brQlqAxdFJ5PNSMKJaLHNe5XLsvQOGfR1Xqoi37Edzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3y7hVJlHu0gq3HvGzBssXAqiCqlb74605jyeVO8oyECFZfwFIIIYfyKwnMmzNhCK
	 SNo/UM2rOO3QH1re2HqG/k7JOWym7sKcHZijYpevRw5XjQj/wsITRBHoay437R3Eja
	 wuNu08XO+TYea/sd3woNhx4hWuL8en5NCvjHgJyY=
Date: Thu, 8 Jan 2026 10:11:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Dave Jiang <dave.jiang@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Message-ID: <2026010852-parabola-circulate-e4ec@gregkh>
References: <20260108081904.2881-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108081904.2881-1-atharvatiwarilinuxdev@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 08:18:53AM +0000, Atharva Tiwari wrote:
> Changes since v1:
> 	Transferred log

This goes below the --- line please.

thanks,

greg k-h

