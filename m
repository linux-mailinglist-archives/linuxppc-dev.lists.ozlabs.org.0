Return-Path: <linuxppc-dev+bounces-10475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF020B16795
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 22:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bskJq2JXkz2yRn;
	Thu, 31 Jul 2025 06:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753907211;
	cv=none; b=Xqm2O1ATeXdWOdyTfrxxZlLhzelxRHlzdl9zsxAuQAMQr2r1y65kv9vvVF9Q5WfU31fKjYIrxgtNh6FXJgMfuLeEVV/es2lKBwOHVM1tpE28GY+QdNcLHdOt6nAuywvewLdVB3bX2SXLHzR9L63cRDLQGPGgTVtPEsjakpckMKPkUMMRaGAVCD9fH+9W+bjSxzlu2sTyf8VXXDudEKqj9Rm8N97+lNs1Xep1PfFZjq4AOgOk6ncK4QKH4UiVNVv9Xa2YIWnv9ZPNzQJ+CvUBUl2HVd9odyTKkY6Bo9t4+WdDj7vDFN6wwVqR1M0FIu6IVaiTp1Kfgv/XNW8zzdmDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753907211; c=relaxed/relaxed;
	bh=dA3FcLj4urnzGTAfs8pIM3VQHnHXYbqCF2+v4gZQ3Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaD/deQkxKoR6w3UjhLfPoadtHw14HBnEjvlckpiMYPVaif9+YXxJUFtf252wA1RvET3jA2fkw2DzDRt4AOxyrFTQl1Jk/JdSWskHT/wXbYERoTB6HwGg6uUYDjy7K7CF0/hqdytL6I1S0wDng1xfsU1Gga3ycHXAiSmt0uubcJU/fnnqBOgGr7kO/VQlnluIXJuSG2wc0sVo1IOdl6OIjxSUvQPhXsVjASgRLU0uyNbRsSOKi7TCpSfxFi2nNr7QZfNK9tu9TjffuFYzE45YnN9RGF3PD1XanFJJUTqA+e0N3iwcTYXMdHzZIjjFCzLUz1aE9KRHUkiRY2hqkbxCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 158 seconds by postgrey-1.37 at boromir; Thu, 31 Jul 2025 06:26:50 AEST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bskJp3myvz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 06:26:50 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id B8A482C02AD6;
	Wed, 30 Jul 2025 22:26:47 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 9FCEB467C41; Wed, 30 Jul 2025 22:26:47 +0200 (CEST)
Date: Wed, 30 Jul 2025 22:26:47 +0200
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
Subject: Re: [PATCH v3 2/2] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI
 recovery
Message-ID: <aIqAB5P1wOA8bpC_@wunner.de>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
 <20250730-add_err_uevents-v3-2-540b158c070f@linux.ibm.com>
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
In-Reply-To: <20250730-add_err_uevents-v3-2-540b158c070f@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 01:20:58PM +0200, Niklas Schnelle wrote:
> Issue uevents during PCI recovery using pci_uevent_ers() as done by EEH
> and AER PCIe recovery routines.
> 
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

