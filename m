Return-Path: <linuxppc-dev+bounces-10715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21106B1D6C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 13:34:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byQ7H2zScz2xck;
	Thu,  7 Aug 2025 21:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754566491;
	cv=none; b=RmufyeB3pxov1igQBxDB4N/4iwSIjxcCwnu6kx5n+DswhwHKYemuoivJHstv6jHiDcn9t/s89k0ro/nvRXU3P9XuVvYTcrCZipnmHHcgzHeZ+dNhwTwO1vCDAdAX0yi/TEtxMcMChEkYxMWUuLoSD/f7Kvm0K4JhQVfyY6VbpGXT5Pw9dcwB86Q/L0/CWCMsNn07ZZXYc+jHFJb4JvhRSx7EegcpFP43UMC6Qcmsk/y0OYFeigYKF4/21pdAyengCOGYQCc4b3DIu6QIQgkAkca9FQRvOnO3URxBya7b2sXcGKsTUrJD9wPyuLBsgdwAfmAjI4PMkebDekwoKtHQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754566491; c=relaxed/relaxed;
	bh=G6vZA4wmQaLjgQfEsmiovY05d3mgMfUQwi8NEhL89MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxmHXtu8DDH6sjkEhAD/KdDXLqTPB9LolhQbNGu0PV55jyrqJgTx1mdI2McIv3dcRGMCvI5A5JCsgzvNhTa6i8tE2t1c4PBb43qRT9NXxsNN2VwY4IBKmM+TxzKajqcktWqOPyrjtBpQ6BO2wc9/eStDiNraIARz0miCQ4OIw9M2g0inxKn0NPZ8ugiu57IAj8o3g0h5QTubvENgB5zmL5nt52PFQgkWaguYIYZLD3FESi4IAN86Z9yNa4bOecow816WNrtgrqTACXjIbrmFHbRFGYuiawPLIgd4geDaLC9bQ9V+GwR/ZOJppAvW1dNuDpyKhoV+1w44E5tV4p2/eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byQ7G3SPVz2xcG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 21:34:48 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id B89B52C02AF7;
	Thu,  7 Aug 2025 13:34:43 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A174D48BAC8; Thu,  7 Aug 2025 13:34:43 +0200 (CEST)
Date: Thu, 7 Aug 2025 13:34:43 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Sinan Kaya <okaya@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v4 2/3] powerpc/eeh: Use result of error_detected() in
 uevent
Message-ID: <aJSPU6bF-DRNN1ZT@wunner.de>
References: <20250807-add_err_uevents-v4-0-c624bfd8638d@linux.ibm.com>
 <20250807-add_err_uevents-v4-2-c624bfd8638d@linux.ibm.com>
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
In-Reply-To: <20250807-add_err_uevents-v4-2-c624bfd8638d@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 07, 2025 at 12:15:32PM +0200, Niklas Schnelle wrote:
> With pci_uevent_ers() handling PCI_ERS_RESULT_NEED_RESET the result of
> error_detected() can be used in pci_uevent_ers() even if drivers request
> a reset. This aligns EEH's behavior with both AER.

I guess the sentence is supposed to end with "and s390"?

I would have recounted the history a bit, e.g.:

Ever since uevent support was added for AER and EEH with commit
856e1eb9bdd4 ("PCI/AER: Add uevents in AER and EEH error/resume"), it
reported PCI_ERS_RESULT_NONE as the result of ->error_detected() to
user space.

Commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery status for
udev") subsequently amended AER to report the actual return value of
->error_detected().

Make the same change to EEH to align it with AER (and s390 error
recovery).

> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Link: https://lore.kernel.org/linux-pci/aIp6LiKJor9KLVpv@wunner.de/
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

