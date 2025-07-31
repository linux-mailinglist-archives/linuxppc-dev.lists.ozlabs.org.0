Return-Path: <linuxppc-dev+bounces-10484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F1B171B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 15:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bt8Rt1J5Wz306l;
	Thu, 31 Jul 2025 23:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753967066;
	cv=none; b=TpFqcVHUDonzzM5S59V0sUfutg0wgchTP4OAT5fBiyDnjX5Ze41FQxTKy8EiD3FRoQpeg91os47K3DqgRjYRynGNkp90c7rPExHfudGE2ewT3ZoDTaqiX6e7RWbikoCvY2S+KzCkVd43GPrqymrLHYjTJ+7dfOSmw2f1Zbgibp6EOuPAwlQMhB9e5w3cYc6fmjiqPwxmMvzLYIqsFlxJ39E+CfxCMh+1KlhIw/lEeLsFqakpkw+q+y2HC1myxl7GmF3QZAu6nlTR0aPiTOPNfN5wOEnaW73an7RxcTtIt2yjmO7WRAZD4Dn4Ff2WaiGrNOw3rIorYK/3a3/2l6F4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753967066; c=relaxed/relaxed;
	bh=M4V6ZHHxANPDdKSzISEDs3dw5OilYoM6fJTfSAEctfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJv4tnHS2DkHwmmZAHLxGLKJzIy1QH6YQ9cf/mkxgG78hvFhoVwdcCoS2ax1r32vXZ061J9L4ihNDRZo4i4N5+OGbN4AlSujmGncOYuUNLD0In8eWGmDFc5/+4+2lctV5vLG58No0BBHAZjOCCTMER1fNd12MT8PaUutOS0uTLN29yYT5KAf0lHqXF2MZ0zhyRKXIZTV66+rKF8Cpoc/SrkgSjinEbK+h8MKSm/VTZuWjDKUxwyeTw7EQ9XkzKqHDWU0EQTVygoOF85dlBrFaFTLeARoJOTz7u5wbzDXi6G1QPnJkA2BCSRsjfAXUvotQQDzJCFCWdmGD6ORzYoDjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bt8Rs2zk9z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 23:04:25 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id C0D832C06E34;
	Thu, 31 Jul 2025 15:04:22 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A42CD2A060E; Thu, 31 Jul 2025 15:04:22 +0200 (CEST)
Date: Thu, 31 Jul 2025 15:04:22 +0200
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
Subject: Re: [PATCH v3 1/2] PCI/AER: Fix missing uevent on recovery when a
 reset is requested
Message-ID: <aItp1uUeYBsv0z_-@wunner.de>
References: <20250730-add_err_uevents-v3-0-540b158c070f@linux.ibm.com>
 <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
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
In-Reply-To: <20250730-add_err_uevents-v3-1-540b158c070f@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 01:20:57PM +0200, Niklas Schnelle wrote:
> Since commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery
> status for udev") AER uses the result of error_detected() as parameter
> to pci_uevent_ers(). As pci_uevent_ers() however does not handle
> PCI_ERS_RESULT_NEED_RESET this results in a missing uevent for the
> beginning of recovery if drivers request a reset. Fix this by treating
> PCI_ERS_RESULT_NEED_RESET as beginning recovery.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7b42d97e99d3 ("PCI/ERR: Always report current recovery status for udev")
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Reviewed-by: Lukas Wunner <lukas@wunner.de>

